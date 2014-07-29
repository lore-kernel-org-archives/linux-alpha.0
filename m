From: Richard Henderson <rth@twiddle.net>
Subject: Re: Bug: retry of clone() on Alpha can result in zeroed process thread
 pointer
Date: Tue, 29 Jul 2014 12:23:45 -1000
Message-ID: <53D81EF1.5030306@twiddle.net>
References: <20140723085244.GB4799@omega>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070807060202090505020408"
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type;
        bh=mOE9wxIbusj4MpZiPHcdx/ivPqiEEsfj8ZJ1fsWUChI=;
        b=qp2ox/bx3fQ3jeXDMKHZ2uWfS4VO1M3cqBycCWQPkF+ofJ50nUYft/go+HE6D3wg4s
         pqkiwLr0tL1JTKx6ZTPWFwbZE/C2knFNYRySi42X3wosZ1fsOiSSqtQVJPhV3jc9SdHp
         aQB91ROvpI1a9GfoUCWozzUpKHEnuP2KULK3ioWSN0SOn2PPUnggwnv8+PXJNGFNshsc
         lXuVoNHedDtZ8NisOUjNHiOyZw2Dpil/0iXQKaOCNh6Q5DmYSuXgmY6ZJ2VbiOshTvwV
         RG/BNIURoQvpb07SV4nZDrmPX2P63NronbTGN91HbO+61yMrm7Oty47eKm5Ur0rUHDSO
         j5Pw==
In-Reply-To: <20140723085244.GB4799@omega>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org

This is a multi-part message in MIME format.
--------------070807060202090505020408
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I don't think this will help, but it's worth a test, prior to totally
re-writing entry.S.  There's a chance of confusion of the value of regs->r0 if
there is in fact no error.


r~


--------------070807060202090505020408
Content-Type: text/plain; charset=UTF-8;
 name="z"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="z"

diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index 6cec288..5b855c8 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -452,30 +452,6 @@ handle_signal(struct ksignal *ksig, struct pt_regs *regs)
 	signal_setup_done(ret, ksig, 0);
 }
 
-static inline void
-syscall_restart(unsigned long r0, unsigned long r19,
-		struct pt_regs *regs, struct k_sigaction *ka)
-{
-	switch (regs->r0) {
-	case ERESTARTSYS:
-		if (!(ka->sa.sa_flags & SA_RESTART)) {
-		case ERESTARTNOHAND:
-			regs->r0 = EINTR;
-			break;
-		}
-		/* fallthrough */
-	case ERESTARTNOINTR:
-		regs->r0 = r0;	/* reset v0 and a3 and replay syscall */
-		regs->r19 = r19;
-		regs->pc -= 4;
-		break;
-	case ERESTART_RESTARTBLOCK:
-		regs->r0 = EINTR;
-		break;
-	}
-}
-
-
 /*
  * Note that 'init' is a special process: it doesn't get signals it doesn't
  * want to handle. Thus you cannot kill init even with a SIGKILL even by
@@ -499,13 +475,35 @@ do_signal(struct pt_regs *regs, unsigned long r0, unsigned long r19)
 	if (get_signal(&ksig)) {
 		/* ... so re-check the single stepping. */
 		single_stepping |= ptrace_cancel_bpt(current);
+
+		/* Are we coming from a syscall error?  */
+		if (r0 && regs->r19) {
+			switch (regs->r0) {
+			case ERESTARTSYS:
+				if (!(ksig.ka.sa.sa_flags & SA_RESTART)) {
+				case ERESTARTNOHAND:
+				case ERESTART_RESTARTBLOCK:
+					regs->r0 = EINTR;
+					regs->r19 = 1;
+					break;
+				}
+				/* fallthrough */
+			case ERESTARTNOINTR:
+				/* Reset v0 and a3 for syscall replay.  */
+				regs->r0 = r0;
+				regs->r19 = r19;
+				regs->pc -= 4;
+				break;
+			}
+		}
+
 		/* Whee!  Actually deliver the signal.  */
-		if (r0)
-			syscall_restart(r0, r19, regs, &ksig.ka);
 		handle_signal(&ksig, regs);
 	} else {
 		single_stepping |= ptrace_cancel_bpt(current);
-		if (r0) {
+
+		/* Are we coming from a syscall error?  */
+		if (r0 && regs->r19) {
 			switch (regs->r0) {
 			case ERESTARTNOHAND:
 			case ERESTARTSYS:
@@ -522,6 +520,7 @@ do_signal(struct pt_regs *regs, unsigned long r0, unsigned long r19)
 				break;
 			}
 		}
+
 		restore_saved_sigmask();
 	}
 	if (single_stepping)

--------------070807060202090505020408--
