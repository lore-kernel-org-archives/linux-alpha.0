Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2063ED3C1
	for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 14:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064634; cv=none; b=gXpgMD951aThVjFkFfglZigzosEoKXlwaWJ4LPWCao39WxH3sRM7JAmnCdQsuT5h8VXmzQNKnIEmjD918+nRP9cO8cI4W/AwM5CTANg+UzJ85NhhiLXZCG/m6kbWBU+WqHJIsZgMf2xJaHRcK0nR9NzOd6FIVowo4b34z7Bnmco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064634; c=relaxed/simple;
	bh=rstuAOpzPRL3H4jqrx/1JVpnPt5XUiL8d1ntp57R1fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WEtKUhyD2cJNEbGE67ha9wHcLFN7kMzrqT4LDiPmj8Fsd2ZszWjDfxvdlF0WMURe1A+dhTtdnFORTL3cftjhAeHMhMtw/zq06Rf3E/Xkk43D0PyvHokcGHwuhKyiPNE48mQ9PbNd2JEBjWxtTX0ym4EbBxS3O4kvdqGgvRBRqlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9KELAIk; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9KELAIk"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa2d5a1d51so6981794e87.3
        for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 07:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780064630; x=1780669430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a86MAytxrH2fF3O6D6kt7FPeAwppSxDYFF7ddN+lZOs=;
        b=P9KELAIkDmFyzObeutWWGVWCNg9FNUNEQY0v8XUaln9aYXR/PyqK6FdQ287P70mxq5
         QoHA2bQgrj9mxN1lUw9R8m1aFD5CLLzTbaLtb7hk7/uU19yGeVfWkYhRtnFQRaOTLGMs
         GjOUNr0mImwhP/DK9+urbraC31LSBe3BeY0sd/vlbmNooxCu70lZNeoPKHokUW3NB2Dv
         GMTkFdjO39HiyvLoNyN0gQcCy2g0hzfVHFsWBsB8CiuuQOVdE7ogmnCCotstUjjTTioY
         Micegk1BprQnDFSh7ku1dfOXUUk0MNplHHZf3Q0D+wpNNjw6/zZgsqDS1ihHvfyM9zAR
         +xSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064630; x=1780669430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a86MAytxrH2fF3O6D6kt7FPeAwppSxDYFF7ddN+lZOs=;
        b=Fs6uYEg9UrRGcQzJqiLAFGt0C9L+GcsBHrxlpFbyDJztLzPco9XIICBuJipA8EpPXU
         v3y84qgojudUa6DDiXF2id6mC2BNb5psttevlAJvIKlBquXcZ2FBiyFKK8yReqkusabQ
         /emS1naWkoURr378tsoyNJ8tno5EDgTD5B5jHGvTFCTwqPqr4gs7p/1nh//X9Hm85wyi
         gJpuBluy1GGPmUanuNPefUYHw8TPtVhGFgNCPDealTjtkHdmqARRavOoYAFnlcTBt7N6
         ze65PnOKTB7+7nUT2KCQCRen2U+ZrhV2dim/qFCwjbRspMHKqHt/xI1N4+JLrap4HUZh
         6RGg==
X-Forwarded-Encrypted: i=1; AFNElJ8X4LsoiOvNh3YckhdF34K2Utj+m2VLzCLLHA559SGgmxTLF99DI44+N0gyUWdECbccuHUCk/kBPn6NKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD5UGBj3cW0U47OjwarkHhbE41s9gjjUnkNThxj0HQPWjXy/IX
	FqtcyMnQrGWWKX7ST1+/w5gTwv2C3bu3vc+G4GsCKa8UuLBLom8kQ2b7
X-Gm-Gg: Acq92OEhf7dYoENQM0qYRkBLtLJ2qYWvLFOWS4oL7HdoZWn6oRlfQiK4CaAZewJk183
	g6f2D8dQLK6cYO//TljEvzPzSplketRfMAiYik/zEjBWisnXdxO7uBBw1LVJMD9mgQSwE2DB6xL
	vTRMdj8c8HIVSh0VUIYPC7a/hhBwxRmQXnpOkISkREJ3N7FCMre2KirSHaRcRcIWTxp/IHkXvLl
	PM9VZrHyrZonbITnQtUzs/KzgYS04phIi8R7BjcdYaJoWgO0Zb7Kt2athr8FPndDp75kqMbH6+D
	/r9LjjIS12xm9f597aN9ER4x+g8h/7tWyIhpR8/E/UKLMsKI1mHPn/Uc9CfNQ4vhCgn6lu+jGe3
	G/y72/TsrGFPhufNQxAoeIQA9EnXFL7mubTpTkv4D0tZsED3onKMQIv0ddviLCPJc3Th7KYLbkM
	utt4L+oLpzhxwGvfBY27nmTTsn3eBbOsg/nmEnGgrMZ16z+BZf+6RhFvz7ar/LXOfdQASMSJ2DA
	S2WSC5FL+FqnnbgIR23slA/pQVUgZ9HItABMRLaa9hkZQ==
X-Received: by 2002:a05:6512:2345:b0:5aa:10e2:29ab with SMTP id 2adb3069b0e04-5aa607ccf24mr16499e87.18.1780064629470;
        Fri, 29 May 2026 07:23:49 -0700 (PDT)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b0687e2sm310433e87.6.2026.05.29.07.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:23:49 -0700 (PDT)
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
Subject: [PATCH v2 7/8] alpha: enable lockdep hardirq state tracking
Date: Fri, 29 May 2026 16:22:03 +0200
Message-ID: <20260529142322.1362438-8-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142322.1362438-1-linmag7@gmail.com>
References: <20260529142322.1362438-1-linmag7@gmail.com>
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

