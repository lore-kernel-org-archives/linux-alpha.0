From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: getxpid() parent lookup is broken
Date: Tue, 29 May 2012 15:18:39 +0100
Message-ID: <20120529141839.GA23641@ZenIV.linux.org.uk>
References: <1285475695.2697.202.camel@localhost>
 <CAEdQ38Ht3bVH1C=xngKtKxHAu2ZJo2n223zQu+Oo=khwm6NdeQ@mail.gmail.com>
 <20120529140943.GS11775@ZenIV.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120529140943.GS11775@ZenIV.linux.org.uk>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, linux-alpha@vger.kernel.org, Tobias Klausmann <klausman@gentoo.org>, Michael Cree <mcree@orcon.net.nz>

On Tue, May 29, 2012 at 03:09:43PM +0100, Al Viro wrote:
> On Tue, May 29, 2012 at 12:55:10AM -0400, Matt Turner wrote:
> 
> > I recently looked at this gentoo bug --
> > https://bugs.gentoo.org/show_bug.cgi?id=405829 and then came across
> > this email and the two patches. They seem possibly related.
> > 
> > It looks like Al said he thought he had a better way of fixing the
> > problem, but then I'm not sure if his patches surfaced or not.
> > 
> > Also possibly related, Tobias and Michael have seen some RCU stalls
> > with recent kernels. Looks like getxpid needs an update?
> 
> Umm...  Let me see if I can find it...  Here:
[snip]

BTW, there's another completely untested patch bouncing around in the local
tree - takes kernel_execve() out of entry.S

diff --git a/arch/alpha/kernel/alpha_ksyms.c b/arch/alpha/kernel/alpha_ksyms.c
index d96e742..b77b813 100644
--- a/arch/alpha/kernel/alpha_ksyms.c
+++ b/arch/alpha/kernel/alpha_ksyms.c
@@ -52,7 +52,6 @@ EXPORT_SYMBOL(alpha_write_fp_reg_s);
 
 /* entry.S */
 EXPORT_SYMBOL(kernel_thread);
-EXPORT_SYMBOL(kernel_execve);
 
 /* Networking helper routines. */
 EXPORT_SYMBOL(csum_tcpudp_magic);
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 4074645..a8c9db8 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -663,58 +663,6 @@ kernel_thread:
 	br	ret_to_kernel
 .end kernel_thread
 
-/*
- * kernel_execve(path, argv, envp)
- */
-	.align	4
-	.globl	kernel_execve
-	.ent	kernel_execve
-kernel_execve:
-	/* We can be called from a module.  */
-	ldgp	$gp, 0($27)
-	lda	$sp, -(32+SIZEOF_PT_REGS+8)($sp)
-	.frame	$sp, 32+SIZEOF_PT_REGS+8, $26, 0
-	stq	$26, 0($sp)
-	stq	$16, 8($sp)
-	stq	$17, 16($sp)
-	stq	$18, 24($sp)
-	.prologue 1
-
-	lda	$16, 32($sp)
-	lda	$17, 0
-	lda	$18, SIZEOF_PT_REGS
-	bsr	$26, memset		!samegp
-
-	/* Avoid the HAE being gratuitously wrong, which would cause us
-	   to do the whole turn off interrupts thing and restore it.  */
-	ldq	$2, alpha_mv+HAE_CACHE
-	stq	$2, 152+32($sp)
-
-	ldq	$16, 8($sp)
-	ldq	$17, 16($sp)
-	ldq	$18, 24($sp)
-	lda	$19, 32($sp)
-	bsr	$26, do_execve		!samegp
-
-	ldq	$26, 0($sp)
-	bne	$0, 1f			/* error! */
-
-	/* Move the temporary pt_regs struct from its current location
-	   to the top of the kernel stack frame.  See copy_thread for
-	   details for a normal process.  */
-	lda	$16, 0x4000 - SIZEOF_PT_REGS($8)
-	lda	$17, 32($sp)
-	lda	$18, SIZEOF_PT_REGS
-	bsr	$26, memmove		!samegp
-
-	/* Take that over as our new stack frame and visit userland!  */
-	lda	$sp, 0x4000 - SIZEOF_PT_REGS($8)
-	br	$31, ret_from_sys_call
-
-1:	lda	$sp, 32+SIZEOF_PT_REGS+8($sp)
-	ret
-.end kernel_execve
-
 
 /*
  * Special system calls.  Most of these are special in that they either
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 153d3fc..d6fde98 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -455,3 +455,22 @@ get_wchan(struct task_struct *p)
 	}
 	return pc;
 }
+
+int kernel_execve(const char *path, const char *const argv[], const char *const envp[])
+{
+	/* Avoid the HAE being gratuitously wrong, which would cause us
+	   to do the whole turn off interrupts thing and restore it.  */
+	struct pt_regs regs = {.hae = alpha_mv.hae_cache};
+	int err = do_execve(path, argv, envp, &regs);
+	if (!err) {
+		struct pt_regs *p = current_pt_regs();
+		/* copy regs to normal position and off to userland we go... */
+		*p = regs;
+		__asm__ __volatile__ (
+			"mov	%0, $sp;"
+			"br	$31, ret_from_sys_call"
+			: : "r"(p));
+	}
+	return err;
+}
+EXPORT_SYMBOL(kernel_execve);
