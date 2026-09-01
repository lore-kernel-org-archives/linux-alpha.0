Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831B748167E
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277927; cv=none; b=h/YQ4FUeFyG5tmKst2yk8p5cWbDoxZS/4mTeyPsGvMk6CIS+Y8dx5DcJzTEzZhKf9cAw5UFCQ3TLu8cylcTMqSeNl1ZSnRg2/OIaRtraGZvl9gBmAP1nZwRFDIGLZjY5ACs8U8fUeONEtKnBC3JFWCVNF33zJ7lTh7s/f3nPpds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277927; c=relaxed/simple;
	bh=ZgKtfM9fsh/fqAvYqv8WG02V6LNUZLl52whaO2YCpZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=faAAkCjaH8xfgop+Q3Foa5ThvQzj2KF7FNtyohbuVtsYdzJgZOwI9094LLd2lKs7QxPiHzWNAWShpmTaZFF/rhHhsUixdrfLiHfRV2wwy04Ejyo0Mu7Bypgq5Xb8Ijz9IAfZP1oT6VvGWUDJ7t0N7HZx0+jo2pgxi2Y75XzBFVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qmkpK3PA; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qmkpK3PA"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-85aeb506b78so1086267b3.3
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277924; x=1788882724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBZzGlKg73PGfaOMsDMRjFaZI1Y78yV95xgVDSNSIcA=;
        b=qmkpK3PAeOM9Kgu2TowDmYDQYFA8LQ3qIFiH43brlFwx3MgeQfbVADYYQ+tv6JD4pL
         kwk8wQnAFnLVkGgLmmZIusWNZ7yoidW+HqHqlkP/8KN/knutSPtCr40/X22GKGsSjzfU
         RXcfbCdp04AcFFSeM3L4ZahrOyrq26kzD+W/2cSPCHI92zcMqjwWyBASl8VKr+NfYnDw
         Ar+TPD5JPbpdBy2HL2oUZMM8/0L+FJrj32w3FYjZ50Hp7f0pR4F5Ks7cJvVpNfxrMkjx
         gotcosqHipWGpmfrhkZzi4nkFdBGbu39XNVziwK44kkhHQXaAZw5eHIkJCVxJ/M+ABkE
         RRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277924; x=1788882724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nBZzGlKg73PGfaOMsDMRjFaZI1Y78yV95xgVDSNSIcA=;
        b=ktiMi3sE7XZyyEmt2PK8adej6UUxXxSpEXq+hc+tumhQhZHbCN5aQbmR4LzNh6rbJS
         Sr2pQjmHsj8Xf8VGw+zIeWhbH/AFBfoSxdsMG9YNb0+LBwBwaY49Q4FIXzwc2ef4yt5O
         qNlE5X7gJJDPGOdajoUI/ICTPQO7czEe0QvlEuwW+40v4JNhEYMvXA+r2qSaznXj/Jlw
         SnPVdi7qurMzJTyuqMxbYOa+ZOBLmvZiIkl6WxLtO2ZS9LkFcDuFOn6ZOmRKJt5F7iwt
         4P0BOYEiVAL7j7ayzgxFfSbTzMKE1WmAZ0N80+w6Dke2BDg7BrYhPdBFbAhgwckWxCWJ
         sLrA==
X-Gm-Message-State: AFuF++nuCWCqPwM+iFGLYYrzZdllcHuCp2yQ1O0npiVSxvZxed9zTz5h
	B9eg42/RQQId/EXrhwqbygK3VFTA/ZcjvlDj3SVEYIGOilWB+JLERmucViPUBw==
X-Gm-Gg: AYBFou0s+2zOxlASB8RHoQcNE8zs0KD9SegPZpFTm7OvBMkgZkaGuBI56nHtOrsAaI5
	+G5TbJxsFRQ1rmhz3riZDHoiMy6su8/MtWk7v9kE5Ua8uI24Xw995ngejg34liRcQkRMNv2KKAB
	+bgUHfMmiWDEgusuZHl659YtDfhUBIk42D21V/wA9f2CV4luxriv5trxoOvIQo/DXLDarMAZF5Y
	+MmFgyu8jMIvEKG75ZZEqEX/BILHhHCvPjfGFH4kzI3XeW3Vj3v1m9ti1kC3xTCUydRJUfygxc0
	GbbVJzC+bKv3dpnjVuH592mPiaLFLNb/wxiseUODxK8mkW6CC9kDuu6n+khLmfmQeS/VBc7KI1j
	yRetoDeK9pp/YRtWZ/6rcufSTLv7zLvEV2Xe5wbMdHWhT3mh7lZTC4Ku4AMX8PVp6stnxJG9q2S
	Igt4og1Lx/UUKNCBd+Qaxsa7Y2taph4ODccXTtjU4SCEeeRIQEy15R9mjm/xGmVEpZZTuWXrFav
	nVwSn5iZrgyMHo5tZ4gFPh7t7eBkKjwOQK+IOim
X-Received: by 2002:a05:690e:1915:b0:66c:7bd2:35a9 with SMTP id 956f58d0204a3-66f875fe067mr3350458d50.45.1788277924158;
        Tue, 01 Sep 2026 08:52:04 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4eb569cdsm8656304d50.5.2026.09.01.08.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:52:01 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 24/24] alpha: add TRACE_IRQFLAGS_SUPPORT
Date: Tue,  1 Sep 2026 11:50:37 -0400
Message-ID: <b71c51ff7ca699ca6e667a55d9ebce58ef092c77.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instrument the entry/exit assembly to track hardirq state for lockdep.

TRACE_IRQS_OFF is called after SAVE_ALL at each exception/interrupt
entry point and at syscall entry.  TRACE_IRQS_ON is called at
restore_all before returning to userspace, where PAL_rti will restore
the user IPL (re-enabling interrupts).

The function call clobbers caller-saved registers, so the
TRACE_IRQS_OFF macro reloads $0 and $16-$18 from the pt_regs frame.
$8 (current_thread_info) is preserved because it is declared as a
global register variable.

Together with the previously added STACKTRACE_SUPPORT and
LOCKDEP_SUPPORT, this enables LOCK_DEBUGGING_SUPPORT on Alpha.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/entry.S | 54 +++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git ./arch/alpha/kernel/entry.S ./arch/alpha/kernel/entry.S
index 9f2608de2544..ed5df48503d0 100644
--- ./arch/alpha/kernel/entry.S
+++ ./arch/alpha/kernel/entry.S
@@ -241,6 +241,36 @@
 	.cfi_adjust_cfa_offset	-SWITCH_STACK_SIZE
 .endm
 
+/*
+ * Trace hardirq state changes for lockdep.  TRACE_IRQS_OFF is called
+ * after SAVE_ALL at each entry point where PALcode enters with IPL
+ * raised (interrupts disabled).  TRACE_IRQS_ON is called before
+ * returning to userspace, where PAL_rti will restore the user IPL.
+ *
+ * The function call clobbers caller-saved registers; $8 is preserved
+ * because it is declared as a global register variable for
+ * current_thread_info.  We reload $0 and $16-$18 from the pt_regs
+ * frame that SAVE_ALL created, since entry points pass those to their
+ * C handlers.
+ */
+.macro TRACE_IRQS_OFF
+#ifdef CONFIG_TRACE_IRQFLAGS
+	jsr	$26, trace_hardirqs_off
+	ldgp	$gp, 0($26)
+	ldq	$0, 0($sp)
+	ldq	$16, 160($sp)
+	ldq	$17, 168($sp)
+	ldq	$18, 176($sp)
+#endif
+.endm
+
+.macro TRACE_IRQS_ON
+#ifdef CONFIG_TRACE_IRQFLAGS
+	jsr	$26, trace_hardirqs_on
+	ldgp	$gp, 0($26)
+#endif
+.endm
+
 /*
  * Non-syscall kernel entry points.
  */
@@ -248,8 +278,9 @@
 CFI_START_OSF_FRAME entInt
 	SAVE_ALL
 	lda	$8, 0x3fff
-	lda	$26, ret_from_sys_call
 	bic	$sp, $8, $8
+	TRACE_IRQS_OFF
+	lda	$26, ret_from_sys_call
 	mov	$sp, $19
 	jsr	$31, do_entInt
 CFI_END_OSF_FRAME entInt
@@ -257,14 +288,18 @@ CFI_END_OSF_FRAME entInt
 CFI_START_OSF_FRAME entArith
 	SAVE_ALL
 	lda	$8, 0x3fff
-	lda	$26, ret_from_sys_call
 	bic	$sp, $8, $8
+	TRACE_IRQS_OFF
+	lda	$26, ret_from_sys_call
 	mov	$sp, $18
 	jsr	$31, do_entArith
 CFI_END_OSF_FRAME entArith
 
 CFI_START_OSF_FRAME entMM
 	SAVE_ALL
+	lda	$8, 0x3fff
+	bic	$sp, $8, $8
+	TRACE_IRQS_OFF
 /* save $9 - $15 so the inline exception code can manipulate them.  */
 	subq	$sp, 64, $sp
 	.cfi_adjust_cfa_offset	64
@@ -284,8 +319,6 @@ CFI_START_OSF_FRAME entMM
 	.cfi_rel_offset	$15, 48
 	addq	$sp, 64, $19
 /* handle the fault */
-	lda	$8, 0x3fff
-	bic	$sp, $8, $8
 	jsr	$26, do_page_fault
 /* reload the registers after the exception code played.  */
 	ldq	$9, 0($sp)
@@ -311,8 +344,9 @@ CFI_END_OSF_FRAME entMM
 CFI_START_OSF_FRAME entIF
 	SAVE_ALL
 	lda	$8, 0x3fff
-	lda	$26, ret_from_sys_call
 	bic	$sp, $8, $8
+	TRACE_IRQS_OFF
+	lda	$26, ret_from_sys_call
 	mov	$sp, $17
 	jsr	$31, do_entIF
 CFI_END_OSF_FRAME entIF
@@ -451,6 +485,9 @@ entUnaUser:
 	.cfi_restore	$0
 	.cfi_adjust_cfa_offset	-256
 	SAVE_ALL		/* setup normal kernel stack */
+	lda	$8, 0x3fff
+	bic	$sp, $8, $8
+	TRACE_IRQS_OFF
 	lda	$sp, -64($sp)
 	.cfi_adjust_cfa_offset	64
 	stq	$9, 0($sp)
@@ -467,9 +504,7 @@ entUnaUser:
 	.cfi_rel_offset	$13, 32
 	.cfi_rel_offset	$14, 40
 	.cfi_rel_offset	$15, 48
-	lda	$8, 0x3fff
 	addq	$sp, 64, $19
-	bic	$sp, $8, $8
 	jsr	$26, do_entUnaUser
 	ldq	$9, 0($sp)
 	ldq	$10, 8($sp)
@@ -493,8 +528,9 @@ CFI_END_OSF_FRAME entUna
 CFI_START_OSF_FRAME entDbg
 	SAVE_ALL
 	lda	$8, 0x3fff
-	lda	$26, ret_from_sys_call
 	bic	$sp, $8, $8
+	TRACE_IRQS_OFF
+	lda	$26, ret_from_sys_call
 	mov	$sp, $16
 	jsr	$31, do_entDbg
 CFI_END_OSF_FRAME entDbg
@@ -543,6 +579,7 @@ entSys:
 
 	lda	$8, 0x3fff
 	bic	$sp, $8, $8
+	TRACE_IRQS_OFF
 	lda	$4, NR_syscalls($31)
 	stq	$16, SP_OFF+24($sp)
 	lda	$5, sys_call_table
@@ -586,6 +623,7 @@ ret_to_user:
 	and	$17, _TIF_WORK_MASK, $2
 	bne	$2, work_pending
 restore_all:
+	TRACE_IRQS_ON
 	ldl	$2, TI_STATUS($8)
 	and	$2, TS_SAVED_FP | TS_RESTORE_FP, $3
 	bne	$3, restore_fpu
-- 
2.54.0

