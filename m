From: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 7/7] alpha: lazy FPU switching
Date: Sat, 25 Sep 2021 02:55:48 +0000
Message-ID: <20210925025548.1694143-7-viro@zeniv.linux.org.uk>
References: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk>
 <20210925025548.1694143-1-viro@zeniv.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20210925025548.1694143-1-viro@zeniv.linux.org.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>

	On each context switch we save the FPU registers on stack
of old process and restore FPU registers from the stack of new one.
That allows us to avoid doing that each time we enter/leave the
kernel mode; however, that can get suboptimal in some cases.

	For one thing, we don't need to bother saving anything
for kernel threads.  For another, if between entering and leaving
the kernel a thread gives CPU up more than once, it will do
useless work, saving the same values every time, only to discard
the saved copy as soon as it returns from switch_to().

	Alternative solution:

* move the array we save into from switch_stack to thread_info
* have a (thread-synchronous) flag set when we save them
* do *NOT* save/restore them in do_switch_stack()/undo_switch_stack().
* restore on the exit to user mode (and clear the flag) if the flag had
been set.
* on context switch, entry to fork()/clone()/vfork() and on entry into
straced syscall save (and set the flag) if the flag had not been set.
* have copy_thread() set the flag for child, so they would be restored
once the child returns to userland.
* save (again, conditionally and setting the flag) before do_signal(),
use the saved data in setup_sigcontext()
* have restore_sigcontext() set the flag and copy from sigframe to
save area.
* teach ptrace to look for FPU registers in thread_info instead of
switch_stack.
* teach isolated accesses to FPU registers (rdfpcr, wrfpcr, etc.)
to check the flag (under preempt_disable()) and work with the save area
if it's been set.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/include/asm/fpu.h         |  60 +++++++-----
 arch/alpha/include/asm/switch_to.h   |   1 +
 arch/alpha/include/asm/thread_info.h |  15 +++
 arch/alpha/include/uapi/asm/ptrace.h |   2 +
 arch/alpha/kernel/asm-offsets.c      |   2 +
 arch/alpha/kernel/entry.S            | 184 +++++++++++++++++++++--------------
 arch/alpha/kernel/process.c          |   5 +-
 arch/alpha/kernel/ptrace.c           |  18 ++--
 arch/alpha/kernel/signal.c           |  20 ++--
 arch/alpha/lib/fpreg.c               |  41 ++++++--
 10 files changed, 229 insertions(+), 119 deletions(-)

diff --git a/arch/alpha/include/asm/fpu.h b/arch/alpha/include/asm/fpu.h
index b9691405e56b3..4de001bf2811a 100644
--- a/arch/alpha/include/asm/fpu.h
+++ b/arch/alpha/include/asm/fpu.h
@@ -15,21 +15,27 @@ rdfpcr(void)
 {
 	unsigned long tmp, ret;
 
+	preempt_disable();
+	if (current_thread_info()->status & TS_SAVED_FP) {
+		ret = current_thread_info()->fp[31];
+	} else {
 #if defined(CONFIG_ALPHA_EV6) || defined(CONFIG_ALPHA_EV67)
-	__asm__ __volatile__ (
-		"ftoit $f0,%0\n\t"
-		"mf_fpcr $f0\n\t"
-		"ftoit $f0,%1\n\t"
-		"itoft %0,$f0"
-		: "=r"(tmp), "=r"(ret));
+		__asm__ __volatile__ (
+			"ftoit $f0,%0\n\t"
+			"mf_fpcr $f0\n\t"
+			"ftoit $f0,%1\n\t"
+			"itoft %0,$f0"
+			: "=r"(tmp), "=r"(ret));
 #else
-	__asm__ __volatile__ (
-		"stt $f0,%0\n\t"
-		"mf_fpcr $f0\n\t"
-		"stt $f0,%1\n\t"
-		"ldt $f0,%0"
-		: "=m"(tmp), "=m"(ret));
+		__asm__ __volatile__ (
+			"stt $f0,%0\n\t"
+			"mf_fpcr $f0\n\t"
+			"stt $f0,%1\n\t"
+			"ldt $f0,%0"
+			: "=m"(tmp), "=m"(ret));
 #endif
+	}
+	preempt_enable();
 
 	return ret;
 }
@@ -39,21 +45,27 @@ wrfpcr(unsigned long val)
 {
 	unsigned long tmp;
 
+	preempt_disable();
+	if (current_thread_info()->status & TS_SAVED_FP) {
+		current_thread_info()->fp[31] = val;
+	} else {
 #if defined(CONFIG_ALPHA_EV6) || defined(CONFIG_ALPHA_EV67)
-	__asm__ __volatile__ (
-		"ftoit $f0,%0\n\t"
-		"itoft %1,$f0\n\t"
-		"mt_fpcr $f0\n\t"
-		"itoft %0,$f0"
-		: "=&r"(tmp) : "r"(val));
+		__asm__ __volatile__ (
+			"ftoit $f0,%0\n\t"
+			"itoft %1,$f0\n\t"
+			"mt_fpcr $f0\n\t"
+			"itoft %0,$f0"
+			: "=&r"(tmp) : "r"(val));
 #else
-	__asm__ __volatile__ (
-		"stt $f0,%0\n\t"
-		"ldt $f0,%1\n\t"
-		"mt_fpcr $f0\n\t"
-		"ldt $f0,%0"
-		: "=m"(tmp) : "m"(val));
+		__asm__ __volatile__ (
+			"stt $f0,%0\n\t"
+			"ldt $f0,%1\n\t"
+			"mt_fpcr $f0\n\t"
+			"ldt $f0,%0"
+			: "=m"(tmp) : "m"(val));
 #endif
+	}
+	preempt_enable();
 }
 
 static inline unsigned long
diff --git a/arch/alpha/include/asm/switch_to.h b/arch/alpha/include/asm/switch_to.h
index 762b7f975310c..32863581a2975 100644
--- a/arch/alpha/include/asm/switch_to.h
+++ b/arch/alpha/include/asm/switch_to.h
@@ -8,6 +8,7 @@ extern struct task_struct *alpha_switch_to(unsigned long, struct task_struct *);
 
 #define switch_to(P,N,L)						 \
   do {									 \
+    save_fpu();								 \
     (L) = alpha_switch_to(virt_to_phys(&task_thread_info(N)->pcb), (P)); \
     check_mmu_context();						 \
   } while (0)
diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index 9b99fece40af9..58faec89cc881 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -27,6 +27,7 @@ struct thread_info {
 	int bpt_nsaved;
 	unsigned long bpt_addr[2];		/* breakpoint handling  */
 	unsigned int bpt_insn[2];
+	unsigned long fp[32];
 };
 
 /*
@@ -83,6 +84,8 @@ register struct thread_info *__current_thread_info __asm__("$8");
 #define TS_UAC_NOFIX		0x0002	/* ! flags as they match          */
 #define TS_UAC_SIGBUS		0x0004	/* ! userspace part of 'osf_sysinfo' */
 
+#define TS_SAVED_FP		0x0008
+
 #define SET_UNALIGN_CTL(task,value)	({				\
 	__u32 status = task_thread_info(task)->status & ~UAC_BITMASK;	\
 	if (value & PR_UNALIGN_NOPRINT)					\
@@ -106,5 +109,17 @@ register struct thread_info *__current_thread_info __asm__("$8");
 	put_user(res, (int __user *)(value));				\
 	})
 
+#ifndef __ASSEMBLY__
+extern void __save_fpu(void);
+
+static inline void save_fpu(void)
+{
+	if (!(current_thread_info()->status & TS_SAVED_FP)) {
+		current_thread_info()->status |= TS_SAVED_FP;
+		__save_fpu();
+	}
+}
+#endif
+
 #endif /* __KERNEL__ */
 #endif /* _ALPHA_THREAD_INFO_H */
diff --git a/arch/alpha/include/uapi/asm/ptrace.h b/arch/alpha/include/uapi/asm/ptrace.h
index c29194181025f..5ca45934fcbb8 100644
--- a/arch/alpha/include/uapi/asm/ptrace.h
+++ b/arch/alpha/include/uapi/asm/ptrace.h
@@ -64,7 +64,9 @@ struct switch_stack {
 	unsigned long r14;
 	unsigned long r15;
 	unsigned long r26;
+#ifndef __KERNEL__
 	unsigned long fp[32];	/* fp[31] is fpcr */
+#endif
 };
 
 
diff --git a/arch/alpha/kernel/asm-offsets.c b/arch/alpha/kernel/asm-offsets.c
index 2e125e5c1508c..b121294bee266 100644
--- a/arch/alpha/kernel/asm-offsets.c
+++ b/arch/alpha/kernel/asm-offsets.c
@@ -17,6 +17,8 @@ void foo(void)
 	DEFINE(TI_TASK, offsetof(struct thread_info, task));
 	DEFINE(TI_FLAGS, offsetof(struct thread_info, flags));
 	DEFINE(TI_CPU, offsetof(struct thread_info, cpu));
+	DEFINE(TI_FP, offsetof(struct thread_info, fp));
+	DEFINE(TI_STATUS, offsetof(struct thread_info, status));
 	BLANK();
 
         DEFINE(TASK_BLOCKED, offsetof(struct task_struct, blocked));
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index a6207c47f0894..397254fb93cfe 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -17,7 +17,7 @@
 
 /* Stack offsets.  */
 #define SP_OFF			184
-#define SWITCH_STACK_SIZE	320
+#define SWITCH_STACK_SIZE	64
 
 .macro	CFI_START_OSF_FRAME	func
 	.align	4
@@ -159,7 +159,6 @@
 	.cfi_rel_offset	$13, 32
 	.cfi_rel_offset	$14, 40
 	.cfi_rel_offset	$15, 48
-	/* We don't really care about the FP registers for debugging.  */
 .endm
 
 .macro	UNDO_SWITCH_STACK
@@ -498,6 +497,10 @@ ret_to_user:
 	and	$17, _TIF_WORK_MASK, $2
 	bne	$2, work_pending
 restore_all:
+	ldl	$2, TI_STATUS($8)
+	and	$2, TS_SAVED_FP, $3
+	bne	$3, restore_fpu
+restore_other:
 	.cfi_remember_state
 	RESTORE_ALL
 	call_pal PAL_rti
@@ -506,7 +509,7 @@ ret_to_kernel:
 	.cfi_restore_state
 	lda	$16, 7
 	call_pal PAL_swpipl
-	br restore_all
+	br restore_other
 
 	.align 3
 $syscall_error:
@@ -570,6 +573,14 @@ $work_notifysig:
 	.type	strace, @function
 strace:
 	/* set up signal stack, call syscall_trace */
+	// NB: if anyone adds preemption, this block will need to be protected
+	ldl	$1, TI_STATUS($8)
+	and	$1, TS_SAVED_FP, $3
+	or	$1, TS_SAVED_FP, $2
+	bne	$3, 1f
+	stl	$2, TI_STATUS($8)
+	jsr	$26, __save_fpu
+1:
 	DO_SWITCH_STACK
 	jsr	$26, syscall_trace_enter /* returns the syscall number */
 	UNDO_SWITCH_STACK
@@ -649,40 +660,6 @@ do_switch_stack:
 	stq	$14, 40($sp)
 	stq	$15, 48($sp)
 	stq	$26, 56($sp)
-	stt	$f0, 64($sp)
-	stt	$f1, 72($sp)
-	stt	$f2, 80($sp)
-	stt	$f3, 88($sp)
-	stt	$f4, 96($sp)
-	stt	$f5, 104($sp)
-	stt	$f6, 112($sp)
-	stt	$f7, 120($sp)
-	stt	$f8, 128($sp)
-	stt	$f9, 136($sp)
-	stt	$f10, 144($sp)
-	stt	$f11, 152($sp)
-	stt	$f12, 160($sp)
-	stt	$f13, 168($sp)
-	stt	$f14, 176($sp)
-	stt	$f15, 184($sp)
-	stt	$f16, 192($sp)
-	stt	$f17, 200($sp)
-	stt	$f18, 208($sp)
-	stt	$f19, 216($sp)
-	stt	$f20, 224($sp)
-	stt	$f21, 232($sp)
-	stt	$f22, 240($sp)
-	stt	$f23, 248($sp)
-	stt	$f24, 256($sp)
-	stt	$f25, 264($sp)
-	stt	$f26, 272($sp)
-	stt	$f27, 280($sp)
-	mf_fpcr	$f0		# get fpcr
-	stt	$f28, 288($sp)
-	stt	$f29, 296($sp)
-	stt	$f30, 304($sp)
-	stt	$f0, 312($sp)	# save fpcr in slot of $f31
-	ldt	$f0, 64($sp)	# dont let "do_switch_stack" change fp state.
 	ret	$31, ($1), 1
 	.cfi_endproc
 	.size	do_switch_stack, .-do_switch_stack
@@ -701,48 +678,105 @@ undo_switch_stack:
 	ldq	$14, 40($sp)
 	ldq	$15, 48($sp)
 	ldq	$26, 56($sp)
-	ldt	$f30, 312($sp)	# get saved fpcr
-	ldt	$f0, 64($sp)
-	ldt	$f1, 72($sp)
-	ldt	$f2, 80($sp)
-	ldt	$f3, 88($sp)
-	mt_fpcr	$f30		# install saved fpcr
-	ldt	$f4, 96($sp)
-	ldt	$f5, 104($sp)
-	ldt	$f6, 112($sp)
-	ldt	$f7, 120($sp)
-	ldt	$f8, 128($sp)
-	ldt	$f9, 136($sp)
-	ldt	$f10, 144($sp)
-	ldt	$f11, 152($sp)
-	ldt	$f12, 160($sp)
-	ldt	$f13, 168($sp)
-	ldt	$f14, 176($sp)
-	ldt	$f15, 184($sp)
-	ldt	$f16, 192($sp)
-	ldt	$f17, 200($sp)
-	ldt	$f18, 208($sp)
-	ldt	$f19, 216($sp)
-	ldt	$f20, 224($sp)
-	ldt	$f21, 232($sp)
-	ldt	$f22, 240($sp)
-	ldt	$f23, 248($sp)
-	ldt	$f24, 256($sp)
-	ldt	$f25, 264($sp)
-	ldt	$f26, 272($sp)
-	ldt	$f27, 280($sp)
-	ldt	$f28, 288($sp)
-	ldt	$f29, 296($sp)
-	ldt	$f30, 304($sp)
 	lda	$sp, SWITCH_STACK_SIZE($sp)
 	ret	$31, ($1), 1
 	.cfi_endproc
 	.size	undo_switch_stack, .-undo_switch_stack
+
+	.align	4
+	.globl	__save_fpu
+	.type	__save_fpu, @function
+__save_fpu:
+.macro V n
+	stt	$f\n, \n * 8 + TI_FP($8)
+.endm
+	V 0
+	V 1
+	V 2
+	V 3
+	V 4
+	V 5
+	V 6
+	V 7
+	V 8
+	V 9
+	V 10
+	V 11
+	V 12
+	V 13
+	V 14
+	V 15
+	V 16
+	V 17
+	V 18
+	V 19
+	V 20
+	V 21
+	V 21
+	V 22
+	V 23
+	V 24
+	V 25
+	V 26
+	V 27
+	mf_fpcr	$f0		# get fpcr
+	V 28
+	V 29
+	V 30
+	stt	$f0, 31 * 8 + TI_FP($8)	# save fpcr in slot of $f31
+	ldt	$f0, TI_FP($8)	# don't let "__save_fpu" change fp state.
+	ret
+.purgem V
+	.size	__save_fpu, .-__save_fpu
+
+	.align	4
+restore_fpu:
+	bic	$2, TS_SAVED_FP, $2
+.macro V n
+	ldt	$f\n, \n * 8 + TI_FP($8)
+.endm
+	ldt	$f30, 31 * 8 + TI_FP($8)	# get saved fpcr
+	V 0
+	V 1
+	V 2
+	V 3
+	mt_fpcr	$f30		# install saved fpcr
+	V 4
+	V 5
+	V 6
+	V 7
+	V 8
+	V 9
+	V 10
+	V 11
+	V 12
+	V 13
+	V 14
+	V 15
+	V 16
+	V 17
+	V 18
+	V 19
+	V 20
+	V 21
+	V 21
+	V 22
+	V 23
+	V 24
+	V 25
+	V 26
+	V 27
+	V 28
+	V 29
+	V 30
+	stl $2, TI_STATUS($8)
+	br restore_other
+.purgem V
+
 
 /*
  * The meat of the context switch code.
  */
-
 	.align	4
 	.globl	alpha_switch_to
 	.type	alpha_switch_to, @function
@@ -798,6 +832,14 @@ ret_from_kernel_thread:
 	.ent	alpha_\name
 alpha_\name:
 	.prologue 0
+	// NB: if anyone adds preemption, this block will need to be protected
+	ldl	$1, TI_STATUS($8)
+	and	$1, TS_SAVED_FP, $3
+	or	$1, TS_SAVED_FP, $2
+	bne	$3, 1f
+	stl	$2, TI_STATUS($8)
+	jsr	$26, __save_fpu
+1:
 	bsr	$1, do_switch_stack
 	jsr	$26, sys_\name
 	ldq	$26, 56($sp)
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index a5123ea426ce5..e45df572d42cd 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -248,6 +248,7 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 	childstack = ((struct switch_stack *) childregs) - 1;
 	childti->pcb.ksp = (unsigned long) childstack;
 	childti->pcb.flags = 1;	/* set FEN, clear everything else */
+	childti->status |= TS_SAVED_FP;
 
 	if (unlikely(p->flags & (PF_KTHREAD | PF_IO_WORKER))) {
 		/* kernel thread */
@@ -257,6 +258,7 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 		childstack->r9 = usp;	/* function */
 		childstack->r10 = kthread_arg;
 		childregs->hae = alpha_mv.hae_cache;
+		memset(childti->fp, '\0', sizeof(childti->fp));
 		childti->pcb.usp = 0;
 		return 0;
 	}
@@ -340,8 +342,7 @@ EXPORT_SYMBOL(dump_elf_task);
 int
 dump_elf_task_fp(elf_fpreg_t *dest, struct task_struct *task)
 {
-	struct switch_stack *sw = (struct switch_stack *)task_pt_regs(task) - 1;
-	memcpy(dest, sw->fp, 32 * 8);
+	memcpy(dest, current_thread_info()->fp, 32 * 8);
 	return 1;
 }
 EXPORT_SYMBOL(dump_elf_task_fp);
diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
index 8c43212ae38e6..1abb03c912d96 100644
--- a/arch/alpha/kernel/ptrace.c
+++ b/arch/alpha/kernel/ptrace.c
@@ -79,6 +79,8 @@ enum {
  (PAGE_SIZE*2 - sizeof(struct pt_regs) - sizeof(struct switch_stack) \
   + offsetof(struct switch_stack, reg))
 
+#define FP_REG(reg) (offsetof(struct thread_info, reg))
+
 static int regoff[] = {
 	PT_REG(	   r0), PT_REG(	   r1), PT_REG(	   r2), PT_REG(	  r3),
 	PT_REG(	   r4), PT_REG(	   r5), PT_REG(	   r6), PT_REG(	  r7),
@@ -88,14 +90,14 @@ static int regoff[] = {
 	PT_REG(	  r20), PT_REG(	  r21), PT_REG(	  r22), PT_REG(	 r23),
 	PT_REG(	  r24), PT_REG(	  r25), PT_REG(	  r26), PT_REG(	 r27),
 	PT_REG(	  r28), PT_REG(	   gp),		   -1,		   -1,
-	SW_REG(fp[ 0]), SW_REG(fp[ 1]), SW_REG(fp[ 2]), SW_REG(fp[ 3]),
-	SW_REG(fp[ 4]), SW_REG(fp[ 5]), SW_REG(fp[ 6]), SW_REG(fp[ 7]),
-	SW_REG(fp[ 8]), SW_REG(fp[ 9]), SW_REG(fp[10]), SW_REG(fp[11]),
-	SW_REG(fp[12]), SW_REG(fp[13]), SW_REG(fp[14]), SW_REG(fp[15]),
-	SW_REG(fp[16]), SW_REG(fp[17]), SW_REG(fp[18]), SW_REG(fp[19]),
-	SW_REG(fp[20]), SW_REG(fp[21]), SW_REG(fp[22]), SW_REG(fp[23]),
-	SW_REG(fp[24]), SW_REG(fp[25]), SW_REG(fp[26]), SW_REG(fp[27]),
-	SW_REG(fp[28]), SW_REG(fp[29]), SW_REG(fp[30]), SW_REG(fp[31]),
+	FP_REG(fp[ 0]), FP_REG(fp[ 1]), FP_REG(fp[ 2]), FP_REG(fp[ 3]),
+	FP_REG(fp[ 4]), FP_REG(fp[ 5]), FP_REG(fp[ 6]), FP_REG(fp[ 7]),
+	FP_REG(fp[ 8]), FP_REG(fp[ 9]), FP_REG(fp[10]), FP_REG(fp[11]),
+	FP_REG(fp[12]), FP_REG(fp[13]), FP_REG(fp[14]), FP_REG(fp[15]),
+	FP_REG(fp[16]), FP_REG(fp[17]), FP_REG(fp[18]), FP_REG(fp[19]),
+	FP_REG(fp[20]), FP_REG(fp[21]), FP_REG(fp[22]), FP_REG(fp[23]),
+	FP_REG(fp[24]), FP_REG(fp[25]), FP_REG(fp[26]), FP_REG(fp[27]),
+	FP_REG(fp[28]), FP_REG(fp[29]), FP_REG(fp[30]), FP_REG(fp[31]),
 	PT_REG(	   pc)
 };
 
diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index bc077babafab5..6968b3a2273f0 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -150,9 +150,10 @@ restore_sigcontext(struct sigcontext __user *sc, struct pt_regs *regs)
 {
 	unsigned long usp;
 	struct switch_stack *sw = (struct switch_stack *)regs - 1;
-	long i, err = __get_user(regs->pc, &sc->sc_pc);
+	long err = __get_user(regs->pc, &sc->sc_pc);
 
 	current->restart_block.fn = do_no_restart_syscall;
+	current_thread_info()->status |= TS_SAVED_FP;
 
 	sw->r26 = (unsigned long) ret_from_sys_call;
 
@@ -189,9 +190,9 @@ restore_sigcontext(struct sigcontext __user *sc, struct pt_regs *regs)
 	err |= __get_user(usp, sc->sc_regs+30);
 	wrusp(usp);
 
-	for (i = 0; i < 31; i++)
-		err |= __get_user(sw->fp[i], sc->sc_fpregs+i);
-	err |= __get_user(sw->fp[31], &sc->sc_fpcr);
+	err |= __copy_from_user(current_thread_info()->fp,
+				sc->sc_fpregs, 31 * 8);
+	err |= __get_user(current_thread_info()->fp[31], &sc->sc_fpcr);
 
 	return err;
 }
@@ -272,7 +273,7 @@ setup_sigcontext(struct sigcontext __user *sc, struct pt_regs *regs,
 		 unsigned long mask, unsigned long sp)
 {
 	struct switch_stack *sw = (struct switch_stack *)regs - 1;
-	long i, err = 0;
+	long err = 0;
 
 	err |= __put_user(on_sig_stack((unsigned long)sc), &sc->sc_onstack);
 	err |= __put_user(mask, &sc->sc_mask);
@@ -312,10 +313,10 @@ setup_sigcontext(struct sigcontext __user *sc, struct pt_regs *regs,
 	err |= __put_user(sp, sc->sc_regs+30);
 	err |= __put_user(0, sc->sc_regs+31);
 
-	for (i = 0; i < 31; i++)
-		err |= __put_user(sw->fp[i], sc->sc_fpregs+i);
+	err |= __copy_to_user(sc->sc_fpregs,
+			      current_thread_info()->fp, 31 * 8);
 	err |= __put_user(0, sc->sc_fpregs+31);
-	err |= __put_user(sw->fp[31], &sc->sc_fpcr);
+	err |= __put_user(current_thread_info()->fp[31], &sc->sc_fpcr);
 
 	err |= __put_user(regs->trap_a0, &sc->sc_traparg_a0);
 	err |= __put_user(regs->trap_a1, &sc->sc_traparg_a1);
@@ -528,6 +529,9 @@ do_work_pending(struct pt_regs *regs, unsigned long thread_flags,
 		} else {
 			local_irq_enable();
 			if (thread_flags & (_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)) {
+				preempt_disable();
+				save_fpu();
+				preempt_enable();
 				do_signal(regs, r0, r19);
 				r0 = 0;
 			} else {
diff --git a/arch/alpha/lib/fpreg.c b/arch/alpha/lib/fpreg.c
index 34fea465645ba..41830c95fd8bc 100644
--- a/arch/alpha/lib/fpreg.c
+++ b/arch/alpha/lib/fpreg.c
@@ -7,6 +7,8 @@
 
 #include <linux/compiler.h>
 #include <linux/export.h>
+#include <linux/preempt.h>
+#include <asm/thread_info.h>
 
 #if defined(CONFIG_ALPHA_EV6) || defined(CONFIG_ALPHA_EV67)
 #define STT(reg,val)  asm volatile ("ftoit $f"#reg",%0" : "=r"(val));
@@ -19,7 +21,12 @@ alpha_read_fp_reg (unsigned long reg)
 {
 	unsigned long val;
 
-	switch (reg) {
+	if (unlikely(reg >= 32))
+		return 0;
+	preempt_enable();
+	if (current_thread_info()->status & TS_SAVED_FP)
+		val = current_thread_info()->fp[reg];
+	else switch (reg) {
 	      case  0: STT( 0, val); break;
 	      case  1: STT( 1, val); break;
 	      case  2: STT( 2, val); break;
@@ -52,8 +59,8 @@ alpha_read_fp_reg (unsigned long reg)
 	      case 29: STT(29, val); break;
 	      case 30: STT(30, val); break;
 	      case 31: STT(31, val); break;
-	      default: return 0;
 	}
+	preempt_enable();
 	return val;
 }
 EXPORT_SYMBOL(alpha_read_fp_reg);
@@ -67,7 +74,13 @@ EXPORT_SYMBOL(alpha_read_fp_reg);
 void
 alpha_write_fp_reg (unsigned long reg, unsigned long val)
 {
-	switch (reg) {
+	if (unlikely(reg >= 32))
+		return;
+
+	preempt_disable();
+	if (current_thread_info()->status & TS_SAVED_FP)
+		current_thread_info()->fp[reg] = val;
+	else switch (reg) {
 	      case  0: LDT( 0, val); break;
 	      case  1: LDT( 1, val); break;
 	      case  2: LDT( 2, val); break;
@@ -101,6 +114,7 @@ alpha_write_fp_reg (unsigned long reg, unsigned long val)
 	      case 30: LDT(30, val); break;
 	      case 31: LDT(31, val); break;
 	}
+	preempt_enable();
 }
 EXPORT_SYMBOL(alpha_write_fp_reg);
 
@@ -115,7 +129,14 @@ alpha_read_fp_reg_s (unsigned long reg)
 {
 	unsigned long val;
 
-	switch (reg) {
+	if (unlikely(reg >= 32))
+		return 0;
+
+	preempt_enable();
+	if (current_thread_info()->status & TS_SAVED_FP) {
+		LDT(0, current_thread_info()->fp[reg]);
+		STS(0, val);
+	} else switch (reg) {
 	      case  0: STS( 0, val); break;
 	      case  1: STS( 1, val); break;
 	      case  2: STS( 2, val); break;
@@ -148,8 +169,8 @@ alpha_read_fp_reg_s (unsigned long reg)
 	      case 29: STS(29, val); break;
 	      case 30: STS(30, val); break;
 	      case 31: STS(31, val); break;
-	      default: return 0;
 	}
+	preempt_enable();
 	return val;
 }
 EXPORT_SYMBOL(alpha_read_fp_reg_s);
@@ -163,7 +184,14 @@ EXPORT_SYMBOL(alpha_read_fp_reg_s);
 void
 alpha_write_fp_reg_s (unsigned long reg, unsigned long val)
 {
-	switch (reg) {
+	if (unlikely(reg >= 32))
+		return;
+
+	preempt_disable();
+	if (current_thread_info()->status & TS_SAVED_FP) {
+		LDS(0, val);
+		STT(0, current_thread_info()->fp[reg]);
+	} else switch (reg) {
 	      case  0: LDS( 0, val); break;
 	      case  1: LDS( 1, val); break;
 	      case  2: LDS( 2, val); break;
@@ -197,5 +225,6 @@ alpha_write_fp_reg_s (unsigned long reg, unsigned long val)
 	      case 30: LDS(30, val); break;
 	      case 31: LDS(31, val); break;
 	}
+	preempt_enable();
 }
 EXPORT_SYMBOL(alpha_write_fp_reg_s);
-- 
2.11.0

