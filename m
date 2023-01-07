From: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH] alpha: fix FEN fault handling
Date: Sat, 7 Jan 2023 00:59:29 +0000
Message-ID: <Y7jD8XDZGnQkTvMI@ZenIV>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=AqW0MiKJDzcQWypSmFaeIye4cnxqlSKPzLx3ofGTx1w=; b=C1duj2FbsZAbWXnupQD72vTpZ/
        wDd3t7wflYdtqDTy7YnbpcCNF8ykFROaXmgvAR2QMZhIP/tLxkS8pu03jyvS4nlTxiWh5KMBuppCl
        viKycqV7kINE0ca9pmP1GJof52pCrWtkZvGKKI/bGyhluWPHGa//VWWI8jHk/rvpZWNcRD9+AxaRo
        OPISI+/MX+VMwTkuqzzqvkN83ufR4/lJuj0B5EBy0OZvu1wsL3KBC6+vOFuK3Lv8Fbk1swMxzKm2j
        QN3oMx/s6R7AWs8pFlrW411PLNmimqt6LOVUQB96a2UyV2uV4v4QLzuzIBKFnI3yS7QIKzqz7i7mv
        0hOAuNIA==;
Content-Disposition: inline
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>, linux-kernel@vger.kernel.org

Type 3 instruction fault (FPU insn with FPU disabled) is handled
by quietly enabling FPU and returning.  Which is fine, except that
we need to do that both for fault in userland and in the kernel;
the latter *can* legitimately happen - all it takes is this:

.global _start
_start:
	call_pal 0xae
	lda $0, 0
	ldq $0, 0($0)

- call_pal CLRFEN to clear "FPU enabled" flag and arrange for
a signal delivery (SIGSEGV in this case).

Fixed by moving the handling of type 3 into the common part of
do_entIF(), before we check for kernel vs. user mode.

Incidentally, check for kernel mode is unidiomatic; the normal
way to do that is !user_mode(regs).  The difference is that
the open-coded variant treats any of bits 63..3 of regs->ps being
set as "it's user mode" while the normal approach is to check just
the bit 3.  PS is a 4-bit register and regs->ps always will have
bits 63..4 clear, so the open-code variant here is actually equivalent
to !user_mode(regs).  Harder to follow, though...

Reproducer above will crash any box where CLRFEN is not ignored by
PAL (== any actual hardware, AFAICS; PAL used in qemu doesn't
bother implementing that crap).

Cc: stable@vger.kernel.org # all way back...
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
index 8a66fe544c69..d9a67b370e04 100644
--- a/arch/alpha/kernel/traps.c
+++ b/arch/alpha/kernel/traps.c
@@ -233,7 +233,21 @@ do_entIF(unsigned long type, struct pt_regs *regs)
 {
 	int signo, code;
 
-	if ((regs->ps & ~IPL_MAX) == 0) {
+	if (type == 3) { /* FEN fault */
+		/* Irritating users can call PAL_clrfen to disable the
+		   FPU for the process.  The kernel will then trap in
+		   do_switch_stack and undo_switch_stack when we try
+		   to save and restore the FP registers.
+
+		   Given that GCC by default generates code that uses the
+		   FP registers, PAL_clrfen is not useful except for DoS
+		   attacks.  So turn the bleeding FPU back on and be done
+		   with it.  */
+		current_thread_info()->pcb.flags |= 1;
+		__reload_thread(&current_thread_info()->pcb);
+		return;
+	}
+	if (!user_mode(regs)) {
 		if (type == 1) {
 			const unsigned int *data
 			  = (const unsigned int *) regs->pc;
@@ -366,20 +380,6 @@ do_entIF(unsigned long type, struct pt_regs *regs)
 		}
 		break;
 
-	      case 3: /* FEN fault */
-		/* Irritating users can call PAL_clrfen to disable the
-		   FPU for the process.  The kernel will then trap in
-		   do_switch_stack and undo_switch_stack when we try
-		   to save and restore the FP registers.
-
-		   Given that GCC by default generates code that uses the
-		   FP registers, PAL_clrfen is not useful except for DoS
-		   attacks.  So turn the bleeding FPU back on and be done
-		   with it.  */
-		current_thread_info()->pcb.flags |= 1;
-		__reload_thread(&current_thread_info()->pcb);
-		return;
-
 	      case 5: /* illoc */
 	      default: /* unexpected instruction-fault type */
 		      ;
