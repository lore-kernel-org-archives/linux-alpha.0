From: ebiederm@xmission.com (Eric W. Biederman)
Subject: [PATCH 2/2] alpha/ptrace: Add missing switch_stack frames
Date: Wed, 16 Jun 2021 13:32:50 -0500
Message-ID: <87eed1ek31.fsf_-_@disp2133>
References: <87sg1p30a1.fsf@disp2133>
        <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
        <87pmwsytb3.fsf@disp2133>
        <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
        <87sg1lwhvm.fsf@disp2133>
        <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
        <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
        <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
        <87eed4v2dc.fsf@disp2133>
        <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
        <87fsxjorgs.fsf@disp2133> <87zgvqor7d.fsf_-_@disp2133>
        <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
        <87mtrpg47k.fsf@disp2133> <87pmwlek8d.fsf_-_@disp2133>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <87pmwlek8d.fsf_-_@disp2133> (Eric W. Biederman's message of
        "Wed, 16 Jun 2021 13:29:38 -0500")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>


With the introduction of PTRACE_EVENT_XXX flags during the 2.5
development cycle it became possible for ptrace to write arbitrary
data to alpha kernel stack frames because it was assumed that wherever
ptrace_stop was called both a pt_regs and a switch_stack were saved
upon the stack.

The introduction of TIF_ALLREGS_SAVED removed the assumption that
switch_stack was saved on the kernel thread by transforming the
problem into a lesser bug where the access simply don't work.

Saving struct switch_stack has to happen on the lowest level of the
stack on alpha because it contains caller saved registers, which will
be saved by the C code in arbitrary locations on the stack if the data
is not saved immediately.

Update kernel threads to save a full set of userspace registers on
the stack so that io_uring threads can be ptraced.

Update fork, vfork, clone, exit, exit_group, execve, and execveat to
save all of the userspace registers when the are called as there are
known PTRACE_EVENT_XXX ptrace stop points in those functions where
registers can be manipulated.

The switch_stack frames serve double duty in fork, vfork, and clone,
as both the the childs inputs to alpha_switch_to, and the parents
saved copy of the registers for debuggers to modify.  This changes
marks the the frame is present in the parent, and clears
TIF_ALLREGS_SAVED in the child as alpha_switch_to will consume the
switch_stack when the child is started.

Cc: stable@vger.kernel.org
Inspired-by: Linus Torvalds <torvalds@linux-foundation.org>
Fixes: dbe1bdbb39db ("io_uring: handle signals for IO threads like a normal thread")
Fixes: 45c1a159b85b ("Add PTRACE_O_TRACEVFORKDONE and PTRACE_O_TRACEEXIT facilities.")
Fixes: a0691b116f6a ("Add new ptrace event tracing mechanism")
History-tree: https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git
Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
---
 arch/alpha/kernel/entry.S              | 24 +++++++++++++++++-------
 arch/alpha/kernel/process.c            |  3 +++
 arch/alpha/kernel/syscalls/syscall.tbl |  8 ++++----
 3 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index c1edf54dc035..f29a40e2daf1 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -801,13 +801,18 @@ ret_from_fork:
 	.align 4
 	.globl	ret_from_kernel_thread
 	.ent	ret_from_kernel_thread
+	.cfi_startproc
 ret_from_kernel_thread:
 	mov	$17, $16
 	jsr	$26, schedule_tail
+	/* PF_IO_WORKER threads can be ptraced */
+	SAVE_SWITCH_STACK
 	mov	$9, $27
 	mov	$10, $16
 	jsr	$26, ($9)
+	RESTORE_SWITCH_STACK
 	br	$31, ret_to_user
+	.cfi_endproc
 .end ret_from_kernel_thread
 
 
@@ -816,23 +821,28 @@ ret_from_kernel_thread:
  * have to play switch_stack games.
  */
 
-.macro	fork_like name
+.macro	allregs name
 	.align	4
 	.globl	alpha_\name
 	.ent	alpha_\name
+	.cfi_startproc
 alpha_\name:
 	.prologue 0
-	bsr	$1, do_switch_stack
+	SAVE_SWITCH_STACK
 	jsr	$26, sys_\name
-	ldq	$26, 56($sp)
-	lda	$sp, SWITCH_STACK_SIZE($sp)
+	RESTORE_SWITCH_STACK
 	ret
+	.cfi_endproc
 .end	alpha_\name
 .endm
 
-fork_like fork
-fork_like vfork
-fork_like clone
+allregs fork
+allregs vfork
+allregs clone
+allregs exit
+allregs exit_group
+allregs execve
+allregs execveat
 
 .macro	sigreturn_like name
 	.align	4
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 5112ab996394..3bf480468a89 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -249,6 +249,9 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 	childti->pcb.ksp = (unsigned long) childstack;
 	childti->pcb.flags = 1;	/* set FEN, clear everything else */
 
+	/* In the child the registers are consumed by alpha_switch_to */
+	clear_ti_thread_flag(childti, TIF_ALLREGS_SAVED);
+
 	if (unlikely(p->flags & (PF_KTHREAD | PF_IO_WORKER))) {
 		/* kernel thread */
 		memset(childstack, 0,
diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index 3000a2e8ee21..5f85f3c11ed4 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -8,7 +8,7 @@
 # The <abi> is always "common" for this file
 #
 0	common	osf_syscall			alpha_syscall_zero
-1	common	exit				sys_exit
+1	common	exit				alpha_exit
 2	common	fork				alpha_fork
 3	common	read				sys_read
 4	common	write				sys_write
@@ -65,7 +65,7 @@
 56	common	osf_revoke			sys_ni_syscall
 57	common	symlink				sys_symlink
 58	common	readlink			sys_readlink
-59	common	execve				sys_execve
+59	common	execve				alpha_execve
 60	common	umask				sys_umask
 61	common	chroot				sys_chroot
 62	common	osf_old_fstat			sys_ni_syscall
@@ -333,7 +333,7 @@
 400	common	io_getevents			sys_io_getevents
 401	common	io_submit			sys_io_submit
 402	common	io_cancel			sys_io_cancel
-405	common	exit_group			sys_exit_group
+405	common	exit_group			alpha_exit_group
 406	common	lookup_dcookie			sys_lookup_dcookie
 407	common	epoll_create			sys_epoll_create
 408	common	epoll_ctl			sys_epoll_ctl
@@ -441,7 +441,7 @@
 510	common	renameat2			sys_renameat2
 511	common	getrandom			sys_getrandom
 512	common	memfd_create			sys_memfd_create
-513	common	execveat			sys_execveat
+513	common	execveat			alpha_execveat
 514	common	seccomp				sys_seccomp
 515	common	bpf				sys_bpf
 516	common	userfaultfd			sys_userfaultfd
-- 
2.20.1

