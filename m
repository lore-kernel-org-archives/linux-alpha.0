From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: getxpid() parent lookup is broken
Date: Tue, 29 May 2012 15:09:43 +0100
Message-ID: <20120529140943.GS11775@ZenIV.linux.org.uk>
References: <1285475695.2697.202.camel@localhost>
 <CAEdQ38Ht3bVH1C=xngKtKxHAu2ZJo2n223zQu+Oo=khwm6NdeQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEdQ38Ht3bVH1C=xngKtKxHAu2ZJo2n223zQu+Oo=khwm6NdeQ@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, linux-alpha@vger.kernel.org, Tobias Klausmann <klausman@gentoo.org>, Michael Cree <mcree@orcon.net.nz>

On Tue, May 29, 2012 at 12:55:10AM -0400, Matt Turner wrote:

> I recently looked at this gentoo bug --
> https://bugs.gentoo.org/show_bug.cgi?id=405829 and then came across
> this email and the two patches. They seem possibly related.
> 
> It looks like Al said he thought he had a better way of fixing the
> problem, but then I'm not sure if his patches surfaced or not.
> 
> Also possibly related, Tobias and Michael have seen some RCU stalls
> with recent kernels. Looks like getxpid needs an update?

Umm...  Let me see if I can find it...  Here:

alpha: take a bunch of syscalls into osf_sys.c
    
New helper: current_thread_info().  Allows to do a bunch of odd syscalls in C.
While we are at it, there had never been a reason to do osf_getpriority() in
assembler.  We also get "namespace"-aware (read: consistent with getuid(2),
etc.) behaviour from getx?id() syscalls now.
    
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptrace.h
index fd698a1..b87755a 100644
--- a/arch/alpha/include/asm/ptrace.h
+++ b/arch/alpha/include/asm/ptrace.h
@@ -76,7 +76,10 @@ struct switch_stack {
 #define task_pt_regs(task) \
   ((struct pt_regs *) (task_stack_page(task) + 2*PAGE_SIZE) - 1)
 
-#define force_successful_syscall_return() (task_pt_regs(current)->r0 = 0)
+#define current_pt_regs() \
+  ((struct pt_regs *) ((char *)current_thread_info() + 2*PAGE_SIZE) - 1)
+
+#define force_successful_syscall_return() (current_pt_regs()->r0 = 0)
 
 #endif
 
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 6d159ce..22b0c4d 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -797,115 +797,6 @@ sys_rt_sigreturn:
 .end sys_rt_sigreturn
 
 	.align	4
-	.globl	sys_sethae
-	.ent	sys_sethae
-sys_sethae:
-	.prologue 0
-	stq	$16, 152($sp)
-	ret
-.end sys_sethae
-
-	.align	4
-	.globl	osf_getpriority
-	.ent	osf_getpriority
-osf_getpriority:
-	lda	$sp, -16($sp)
-	stq	$26, 0($sp)
-	.prologue 0
-
-	jsr	$26, sys_getpriority
-
-	ldq	$26, 0($sp)
-	blt	$0, 1f
-
-	/* Return value is the unbiased priority, i.e. 20 - prio.
-	   This does result in negative return values, so signal
-	   no error by writing into the R0 slot.  */
-	lda	$1, 20
-	stq	$31, 16($sp)
-	subl	$1, $0, $0
-	unop
-
-1:	lda	$sp, 16($sp)
-	ret
-.end osf_getpriority
-
-	.align	4
-	.globl	sys_getxuid
-	.ent	sys_getxuid
-sys_getxuid:
-	.prologue 0
-	ldq	$2, TI_TASK($8)
-	ldq	$3, TASK_CRED($2)
-	ldl	$0, CRED_UID($3)
-	ldl	$1, CRED_EUID($3)
-	stq	$1, 80($sp)
-	ret
-.end sys_getxuid
-
-	.align	4
-	.globl	sys_getxgid
-	.ent	sys_getxgid
-sys_getxgid:
-	.prologue 0
-	ldq	$2, TI_TASK($8)
-	ldq	$3, TASK_CRED($2)
-	ldl	$0, CRED_GID($3)
-	ldl	$1, CRED_EGID($3)
-	stq	$1, 80($sp)
-	ret
-.end sys_getxgid
-
-	.align	4
-	.globl	sys_getxpid
-	.ent	sys_getxpid
-sys_getxpid:
-	.prologue 0
-	ldq	$2, TI_TASK($8)
-
-	/* See linux/kernel/timer.c sys_getppid for discussion
-	   about this loop.  */
-	ldq	$3, TASK_GROUP_LEADER($2)
-	ldq	$4, TASK_REAL_PARENT($3)
-	ldl	$0, TASK_TGID($2)
-1:	ldl	$1, TASK_TGID($4)
-#ifdef CONFIG_SMP
-	mov	$4, $5
-	mb
-	ldq	$3, TASK_GROUP_LEADER($2)
-	ldq	$4, TASK_REAL_PARENT($3)
-	cmpeq	$4, $5, $5
-	beq	$5, 1b
-#endif
-	stq	$1, 80($sp)
-	ret
-.end sys_getxpid
-
-	.align	4
-	.globl	sys_alpha_pipe
-	.ent	sys_alpha_pipe
-sys_alpha_pipe:
-	lda	$sp, -16($sp)
-	stq	$26, 0($sp)
-	.prologue 0
-
-	mov	$31, $17
-	lda	$16, 8($sp)
-	jsr	$26, do_pipe_flags
-
-	ldq	$26, 0($sp)
-	bne	$0, 1f
-
-	/* The return values are in $0 and $20.  */
-	ldl	$1, 12($sp)
-	ldl	$0, 8($sp)
-
-	stq	$1, 80+16($sp)
-1:	lda	$sp, 16($sp)
-	ret
-.end sys_alpha_pipe
-
-	.align	4
 	.globl	sys_execve
 	.ent	sys_execve
 sys_execve:
diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 49ee319..3c4e16a 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1238,3 +1238,52 @@ SYSCALL_DEFINE3(osf_writev, unsigned long, fd,
 }
 
 #endif
+
+SYSCALL_DEFINE2(osf_getpriority, int, which, int, who)
+{
+	int prio = sys_getpriority(which, who);
+	if (prio >= 0) {
+		/* Return value is the unbiased priority, i.e. 20 - prio.
+		   This does result in negative return values, so signal
+		   no error */
+		force_successful_syscall_return();
+		prio = 20 - prio;
+	}
+	return prio;
+}
+
+SYSCALL_DEFINE0(getxuid)
+{
+	current_pt_regs()->r20 = sys_geteuid();
+	return sys_getuid();
+}
+
+SYSCALL_DEFINE0(getxgid)
+{
+	current_pt_regs()->r20 = sys_getegid();
+	return sys_getgid();
+}
+
+SYSCALL_DEFINE0(getxpid)
+{
+	current_pt_regs()->r20 = sys_getppid();
+	return sys_getpid();
+}
+
+SYSCALL_DEFINE0(alpha_pipe)
+{
+	int fd[2];
+	int res = do_pipe_flags(fd, 0);
+	if (!res) {
+		/* The return values are in $0 and $20.  */
+		current_pt_regs()->r20 = fd[1];
+		res = fd[0];
+	}
+	return res;
+}
+
+SYSCALL_DEFINE1(sethae, unsigned long, val)
+{
+	current_pt_regs()->hae = val;
+	return 0;
+}
diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
index e534e1c..97c9030 100644
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@ -111,7 +111,7 @@ sys_call_table:
 	.quad sys_socket
 	.quad sys_connect
 	.quad sys_accept
-	.quad osf_getpriority			/* 100 */
+	.quad sys_osf_getpriority			/* 100 */
 	.quad sys_send
 	.quad sys_recv
 	.quad sys_sigreturn
diff --git a/kernel/timer.c b/kernel/timer.c
index 6ec7e7e..6885e5f 100644
--- a/kernel/timer.c
+++ b/kernel/timer.c
@@ -1394,13 +1394,6 @@ SYSCALL_DEFINE1(alarm, unsigned int, seconds)
 
 #endif
 
-#ifndef __alpha__
-
-/*
- * The Alpha uses getxpid, getxuid, and getxgid instead.  Maybe this
- * should be moved into arch/i386 instead?
- */
-
 /**
  * sys_getpid - return the thread group id of the current process
  *
@@ -1456,8 +1449,6 @@ SYSCALL_DEFINE0(getegid)
 	return from_kgid_munged(current_user_ns(), current_egid());
 }
 
-#endif
-
 static void process_timeout(unsigned long __data)
 {
 	wake_up_process((struct task_struct *)__data);
