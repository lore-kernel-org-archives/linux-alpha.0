Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4E73783AA
	for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 20:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781296416; cv=none; b=QUqUU+Les0HQX1nA6fe1mtmhOuVoOgCK6PRCkk88BxYagXTf3pxpYiTOu+/z1UqwK/9fdgblNexDrM7lAL+pjuZmxRNFiQRT4b1AR+c+zc3lsgEZdT+ArhZGWMUA0HvizUEy/zRnAXggUYvQgE7vrmYk4rY/VmSvD9+JuvlQD8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781296416; c=relaxed/simple;
	bh=MpoYLm89NwQfFVLcVWDxpeVcVoeEF0xclyotqVr5Rxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNUq2x0Sy75dj6pPM4Vg3WF1wNWBKjwCu/dBwjjvgH8LMoyugkt8k8tb81vDvNxu4zlaBN75Jh7XtZMs+iIVoGkggzpxz5RAkGjKjD84mkw81vsMTOpWGMq43wuWdCUwNsHhePocJQumyxlCaj+1/R30LK86pMHK31sb4YCIKdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rt4973FW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rt4973FW"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa7a70c0aaso1288539e87.0
        for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 13:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781296412; x=1781901212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQQxn5OhfgSm5EhkEn0SlT3jwEgnlZIRODQEX4dc9n8=;
        b=Rt4973FWvpad+VPdkTY6XQHCABFxo8IwwPzARmgXsMB7EkTUYVyNHmvbCnwokbwLlT
         TFtJmYmcAH2tMGJEXqWHZXqjq4hDc1Xwj9zR094uzVwJorie4jBwNrM2IIFR1KlxJGIQ
         kpb/4w+q+uGP3+nVXpWnvme20f48RTFdQUZr3f4UojXYjNv2it4qsQqGCbPplTBjl+Ko
         trBwClQyWOX16Eu9iEipOLIarTJJmqeJ8GhDtIsJdVnAGME0uks0GZczxf85IxrT45bm
         cqj4a3+YoqlPSDynxczhFzx6UN6Vm+MuOtdFRWIXUkYfwkdooclDppmSQeL5lUQ6g77g
         uirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781296412; x=1781901212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PQQxn5OhfgSm5EhkEn0SlT3jwEgnlZIRODQEX4dc9n8=;
        b=W9XY5ZKAKrJkAl1yf6HgTxRKvn8uj9oBO7/qyAi+o6IjC5bYmi8YfLA3RIn78JURqs
         9m0NEQ6EpKauNreD3wo/IrNcoe9UZwoqIgFLx3A6R6GHC7wSjrMSkeyh8xLQbWr/C5o6
         hhMPyg7zQ7vZAkKf4IMpwFOOxj0S3oer5AL89GTzI8PzznPeY9qn04KUBoRrLOPeXXp/
         hDYSpK4aEsPbVaFBTDLsn9gz5uZlYTTMWWL8owXGBXX4G7qLYlCyf20H/RXAaIZAepyF
         uE+Cj7w+m3IScV0ISapObFk5WlqDHkF9kwFeiRTN1l656/5Gu9GKC7YPHmFYX3tvNHeG
         b9vQ==
X-Forwarded-Encrypted: i=1; AFNElJ9kVDJv63l2KXI4ahYgB0Z1xL2+JIjOYhyNCqhDzUY+fH70r7yDRmL9VyWiXDVjggrOAiIZvm0qKVoU3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0YDTwMEkcZyBtzFO1t1pNURgM4L3ss4QC3UarbyKkgKlCUSa6
	y/CrMkHtgMeajthnIDFD0+0qYg1n4o3F92pSI6vaAuxWYVLo48WIFFc1
X-Gm-Gg: Acq92OGtvxtJCYQeGzXyD7KQILFAboeGr/sEtLjTOwK9MMZnnU7AOzG+1DhQNVgb2FR
	5FxCnEdeTIGRVMMoSCi4cq+Vy7uekJxwnm7uYgva1dlmae9i2Gxmvrn9189YVrsMwE05OlKJSZP
	Xj1gVOQfmAW15/HeTaeQgpDBowa1VPH64ABCNYjzQO+Zikvyejta5VrQStrkTFZTTYL0KcAvLke
	Y3RmyBQxtfIz8Y7fN/otZ8hiutp5bm1xW4IyCyUQr7ZW2+DpLVouPUiy89Bb5T+vv7um8dBtGxg
	dglRKEn1gbG7aboH6+UrPCuVEJjHmlWxrIBjOB1viYtZeGQbO9/SzNKg9hbIdY7zeroXNOGBiuW
	XE6X4lfcWuqYv6dp1jR54H/eOm3uGFD6bYC9skaXLsZmMtqvggfvDGlcT4Kq/fj/++c822yexCX
	3Bfcz1fkcGtcqzZPafx00IxUOGH/GnNANqfN4RKH9OH6ciesBMWwfku2pK2eWi67dCutkWTn6UI
	BnZTf/yc1HMV/H3KLmpz5qnn3ogdVay
X-Received: by 2002:a05:6512:4153:b0:5aa:719c:a21c with SMTP id 2adb3069b0e04-5ad2db42907mr1008985e87.20.1781296411769;
        Fri, 12 Jun 2026 13:33:31 -0700 (PDT)
Received: from buildhost.darklands.se (h-37-123-143-144.NA.cust.bahnhof.se. [37.123.143.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161e70sm788949e87.5.2026.06.12.13.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:33:31 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	macro@orcam.me.uk,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v3 7/8] alpha: enable lockdep hardirq state tracking
Date: Fri, 12 Jun 2026 22:26:55 +0200
Message-ID: <20260612203006.2265557-8-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612203006.2265557-1-linmag7@gmail.com>
References: <20260612203006.2265557-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alpha masks interrupts through the PAL IPL state, so lockdep cannot infer
hardirq state transitions from generic code alone. Add explicit
hardirq on/off annotations to the low-level entry and return paths so
lockdep's IRQ state follows the hardware IPL state.

Annotate the PAL IPL transitions and the shared return-to-user/kernel
paths where interrupts become enabled or disabled.  With the preceding
irqflags, raw-lock, sysfs, and ftrace return-address preparations in
place, select LOCKDEP_SUPPORT and TRACE_IRQFLAGS_SUPPORT for Alpha.

This keeps CONFIG_PROVE_LOCKING usable on Alpha instead of disabling
debug_locks due to IRQ-state mismatches.

Reviewed-by: Matt Turner <mattst88@gmail.com>
Tested-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 .../features/locking/lockdep/arch-support.txt |  2 +-
 arch/alpha/Kconfig                            |  5 ++
 arch/alpha/kernel/entry.S                     | 17 ++++-
 arch/alpha/kernel/irq_alpha.c                 | 74 ++++++++++++++-----
 arch/alpha/kernel/proto.h                     |  4 +
 arch/alpha/kernel/signal.c                    |  9 +++
 6 files changed, 91 insertions(+), 20 deletions(-)

diff --git a/Documentation/features/locking/lockdep/arch-support.txt b/Documentation/features/locking/lockdep/arch-support.txt
index b6b00469f7d0..87a534c89636 100644
--- a/Documentation/features/locking/lockdep/arch-support.txt
+++ b/Documentation/features/locking/lockdep/arch-support.txt
@@ -6,7 +6,7 @@
     -----------------------
     |         arch |status|
     -----------------------
-    |       alpha: | TODO |
+    |       alpha: |  ok  |
     |         arc: |  ok  |
     |         arm: |  ok  |
     |       arm64: |  ok  |
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 7ac435c56845..e53ef2d88463 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -45,6 +45,8 @@ config ALPHA
 	select MMU_GATHER_RCU_TABLE_FREE
 	select SPARSEMEM_EXTREME if SPARSEMEM
 	select ZONE_DMA
+	select TRACE_IRQFLAGS_SUPPORT
+	select ARCH_WANT_FRAME_POINTERS
 	help
 	  The Alpha is a 64-bit general-purpose processor designed and
 	  marketed by the Digital Equipment Corporation of blessed memory,
@@ -84,6 +86,9 @@ config AUDIT_ARCH
 config STACKTRACE_SUPPORT
 	def_bool y
 
+config LOCKDEP_SUPPORT
+	def_bool y
+
 menu "System setup"
 
 choice
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 449092a31eef..9f2608de2544 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -93,6 +93,19 @@
 4:
 .endm
 
+.macro LOCKDEP_HARDIRQS_ON_RESTORE
+#ifdef CONFIG_PROVE_LOCKING
+	/* a0 = saved PS */
+	ldq	$16, SP_OFF($sp)
+
+	/* a1 = callsite IP for lockdep */
+	lda	$17, 1f
+
+	jsr	$26, lockdep_on_restore
+	ldgp	$gp, 0($26)
+1:
+#endif
+.endm
 
 /*
  * This defines the normal kernel pt-regs layout.
@@ -427,6 +440,7 @@ CFI_START_OSF_FRAME entUna
 	.cfi_restore	$28
 	.cfi_restore	$29
 	.cfi_adjust_cfa_offset	-256
+	LOCKDEP_HARDIRQS_ON_RESTORE
 	call_pal PAL_rti
 
 	.align	4
@@ -577,6 +591,7 @@ restore_all:
 	bne	$3, restore_fpu
 restore_other:
 	.cfi_remember_state
+	LOCKDEP_HARDIRQS_ON_RESTORE
 	RESTORE_ALL
 	call_pal PAL_rti
 
@@ -622,7 +637,7 @@ $work_resched:
 	 * or got through work_notifysig already.  Either case means no syscall
 	 * restarts for us, so let $18 and $19 burn.
 	 */
-	jsr	$26, schedule
+	jsr	$26, alpha_schedule_user_work
 	mov	0, $18
 	br	ret_to_user
 
diff --git a/arch/alpha/kernel/irq_alpha.c b/arch/alpha/kernel/irq_alpha.c
index d17e44c99df9..736294d3dd51 100644
--- a/arch/alpha/kernel/irq_alpha.c
+++ b/arch/alpha/kernel/irq_alpha.c
@@ -41,7 +41,7 @@ EXPORT_SYMBOL(perf_irq);
  * The main interrupt entry point.
  */
 
-asmlinkage void 
+asmlinkage void
 do_entInt(unsigned long type, unsigned long vector,
 	  unsigned long la_ptr, struct pt_regs *regs)
 {
@@ -54,40 +54,78 @@ do_entInt(unsigned long type, unsigned long vector,
 	 * (namely LX164).
 	 */
 	local_irq_disable();
+	old_regs = set_irq_regs(regs);
+
 	switch (type) {
 	case 0:
 #ifdef CONFIG_SMP
+		irq_enter();
 		handle_ipi(regs);
-		return;
+		irq_exit();
+		break;
 #else
 		irq_err_count++;
-		printk(KERN_CRIT "Interprocessor interrupt? "
-		       "You must be kidding!\n");
-#endif
+		pr_crit("Interprocessor interrupt? You must be kidding!\n");
 		break;
+#endif
 	case 1:
-		old_regs = set_irq_regs(regs);
+		/* handle_irq() already does irq_enter()/irq_exit() */
 		handle_irq(RTC_IRQ);
-		set_irq_regs(old_regs);
-		return;
+		break;
 	case 2:
-		old_regs = set_irq_regs(regs);
+		irq_enter();
 		alpha_mv.machine_check(vector, la_ptr);
-		set_irq_regs(old_regs);
-		return;
+		irq_exit();
+		break;
 	case 3:
-		old_regs = set_irq_regs(regs);
+		irq_enter();
 		alpha_mv.device_interrupt(vector);
-		set_irq_regs(old_regs);
-		return;
+		irq_exit();
+		break;
 	case 4:
+		irq_enter();
 		perf_irq(la_ptr, regs);
-		return;
+		irq_exit();
+		break;
 	default:
-		printk(KERN_CRIT "Hardware intr %ld %lx? Huh?\n",
-		       type, vector);
+		pr_crit("Hardware intr %lu %lx? Huh?\n", type, vector);
+		pr_crit("PC = %016lx PS=%04lx\n", regs->pc, regs->ps);
+		break;
 	}
-	printk(KERN_CRIT "PC = %016lx PS=%04lx\n", regs->pc, regs->ps);
+
+	set_irq_regs(old_regs);
+
+	/*
+	 * Intentionally no local_irq_enable(): Alpha historically avoids
+	 * enabling at IPL0 here due to PAL/RTI issues (LX164/MILO note).
+	 */
+}
+
+void notrace lockdep_on_restore(unsigned long ps,
+				unsigned long ip)
+{
+#ifdef CONFIG_PROVE_LOCKING
+	/* Restoring IPL==7 means interrupts remain disabled. */
+	if ((ps & 7) == 7)
+		return;
+
+	/*
+	 * If hardware IRQs are already enabled here, then emitting a
+	 * hardirqs-on transition is redundant.
+	 */
+	if (!irqs_disabled())
+		return;
+
+	/*
+	 * Only emit the transition if lockdep currently believes
+	 * hardirqs are off.
+	 */
+	if (lockdep_hardirqs_enabled())
+		return;
+
+	lockdep_hardirqs_on_prepare();
+	lockdep_hardirqs_on(ip);
+#endif
 }
 
 void __init
diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
index a8bc3ead776b..9b262ef09a3a 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -173,6 +173,7 @@ extern void do_sigreturn(struct sigcontext __user *);
 struct rt_sigframe;
 extern void do_rt_sigreturn(struct rt_sigframe __user *);
 extern void do_work_pending(struct pt_regs *, unsigned long, unsigned long, unsigned long);
+extern void alpha_schedule_user_work(void);
 
 /* traps.c */
 extern void dik_show_regs(struct pt_regs *regs, unsigned long *r9_15);
@@ -185,6 +186,9 @@ struct allregs;
 extern void do_entUna(void *, unsigned long, unsigned long, struct allregs *);
 extern void do_entUnaUser(void __user *, unsigned long, unsigned long, struct pt_regs *);
 
+/* irq_alpha.c */
+extern void notrace lockdep_on_restore(unsigned long ps, unsigned long ip);
+
 /* sys_titan.c */
 extern void titan_dispatch_irqs(u64);
 
diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index e62d1d461b1f..ce40a49b8496 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -41,6 +41,14 @@ asmlinkage void ret_from_sys_call(void);
  * The OSF/1 sigprocmask calling sequence is different from the
  * C sigprocmask() sequence..
  */
+
+asmlinkage void alpha_schedule_user_work(void)
+{
+	local_irq_enable();
+	schedule();
+	local_irq_disable();
+}
+
 SYSCALL_DEFINE2(osf_sigprocmask, int, how, unsigned long, newmask)
 {
 	sigset_t oldmask;
@@ -525,6 +533,7 @@ do_work_pending(struct pt_regs *regs, unsigned long thread_flags,
 {
 	do {
 		if (thread_flags & _TIF_NEED_RESCHED) {
+			local_irq_enable();
 			schedule();
 		} else {
 			local_irq_enable();
-- 
2.53.0

