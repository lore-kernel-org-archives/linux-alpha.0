Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AA737475E
	for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 20:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781296414; cv=none; b=FWHxHBIcAaJP7MCuVu9HoPJ0Mc/oYtBX7k7+fBDJxNr405IxqYXDPjc39mKhPrhMBit3Pp2NAJOznZeA7ittniVt343rzZanR/1thKsRjox8+nH15bP7XA0PqS2sf0aFVFgUjXhziMpNsvVu9WDnrbGOOU8UBRAWUnBu7T+k5nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781296414; c=relaxed/simple;
	bh=v9HK/jw7rJmQKRYABciYH/IJybyaWe8RLw2Y9KRYLY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rf/DgfOr22oDw/ZlwUjYKSae/aZBZE5pCkEwMvJGbnRHavQrDtTlT73WzrlPlIipZoC6NHZ80VgGEAdVaYixes9LptexkOktj55r7QcUrMdunXkHzn53zgbEgFs5jiUrjLpuiHuEorffj1tcSqMflwi4t9ciAHB2PC3mg7NvhcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KA6y9wlC; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KA6y9wlC"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39677245e15so11820251fa.1
        for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 13:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781296411; x=1781901211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/dwkCwiuAGNj+oABoDkmXgpJE7bqFjDFwXw6/g3UIg=;
        b=KA6y9wlC5x2ja7zq5/xrrFea07TGVBFWYq2uNB4GVIG9lSD+LLTyL5z+L58vmehWxg
         xF3ME78fhF421ZrEEbPojfsvNA68ouEeE8U5IYfL8rhk+5tbiLsS5ISymeepwajGajdM
         0da68aeGY9GAbFsumUuQU8En1dyVbMSEG8b/EcxGCO+lvvlldR9L+BZOkDRU+ygzAcaM
         6owW8rponHOQRRwiieltFxH5RuMXf6RGgFtA85eQo3nPBGhHRuSUSn4Yldk+QWAOPi8k
         TKuDfvdhbtufzBdx2S+pwIT5nQCIpcExf+eCRj3fSUZtCT0YtBIEWsPMtCiam26IBMXP
         Loig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781296411; x=1781901211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j/dwkCwiuAGNj+oABoDkmXgpJE7bqFjDFwXw6/g3UIg=;
        b=H0cB8Y6xsS9t2SmPEjHvFQ1eX918XWud3zeZUd5ux4WFgWAis+XRvveC7rW/FBf6K3
         PMKcfeNf40V44wELqGjckE+I5JWYw1y86ATIVxKXVfKBGmXCcYtUITMVW9inw5/xcj7L
         vY8EcKwIsPvVABtzKwzl4LT6s7s9h10cbo+VH4J2g8vLOQec3wRKQzcohr/XlwF1ldj/
         YVag4DCycs0KdTxQSM4x4kwAmP1Fny+vU4XPlyLb9j0YSie720UycbxpIJ5zS98nveqx
         MlCxBjExt93I05K93yj1GAMr5Vvo4Kpzy4VDyWBq6KKspU2WCJQ+RIARpFBGp+w32iqt
         NhQw==
X-Forwarded-Encrypted: i=1; AFNElJ9p2PCidWSYD5UyAB9uvO0+9AomdPu3FjP4DZaRV6qrobusXK/Dso4vvY0qRP3YIFyl/vLi5/9YEziSxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFDFOf9WNy3sekQelGJFU1xBkzmaFz72PJE2NH3+42kQDjHRvi
	YehAsJ6Fdsdq4oKd/293Ra6S2gKcNAla8s7HQ9k3CQQxxa3GPmOq9rL7
X-Gm-Gg: Acq92OGWISszMCJWT4GAzpXoA7BrmM8+2f2ZuItsZrVMfkavBRg2H3j0OVMYFWnJCMh
	tHFLYgMemzw27+NggInEFh4cHw55PU2vSgItEo9LdZEikOi8q33g2+LXcrLZHEBui/HrK+2qMP8
	3NNpUP1Lj+mmXIKRzgLZeu+yO0+AuJsAvmGq+QH9uP7x6tygYx4qJy0LkHiGIGOMk5EI/PZ0pyC
	X+yt+6Oap8RLdZcihNYiTx4Lp2L8Bs2TKC4z+iEXi9NAwlWIo321/nIe1XAnKEC2p1lVIdIOUwd
	GItfAEB8wCdFX5lHKRYRYm9FniSHsWbcDn6SKPxEIAnR4Kx2Xw0CyMoaJOAlQjQiuErA/eH38cb
	A/wjejXkP8C999YWSr9S+msTazNxxooinl0OI5X3WBpAoY9P0ISivSWnC9I/XOLZIhb9ofZ6sIj
	0Hjgn0MbmdGECyoorcQZImNoQkQC23YcOocYFq9mRFJT+9JqGGTpgbBU1cexq3Cw0TWmoMfeReb
	e69bOwm5wJTi5Yyry+UFIBchBZNo1T7
X-Received: by 2002:a05:6512:3d0b:b0:5aa:8824:156e with SMTP id 2adb3069b0e04-5ad2db895a9mr1404902e87.46.1781296410635;
        Fri, 12 Jun 2026 13:33:30 -0700 (PDT)
Received: from buildhost.darklands.se (h-37-123-143-144.NA.cust.bahnhof.se. [37.123.143.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161e70sm788949e87.5.2026.06.12.13.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:33:29 -0700 (PDT)
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
Subject: [PATCH v3 6/8] alpha: use raw spinlocks for low-level platform locks
Date: Fri, 12 Jun 2026 22:26:54 +0200
Message-ID: <20260612203006.2265557-7-linmag7@gmail.com>
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

Some Alpha platform locks are used as low-level hardware serialization
locks in interrupt-controller and chipset access paths. These paths can
run while IRQ state is being changed or while lockdep is tracking that
state, so regular spinlock instrumentation is not appropriate once
lockdep is enabled.

Convert the affected Tsunami and Rawhide platform locks to
raw_spinlock_t. This keeps the locks as simple hardware serialization
locks and avoids lockdep recursion or IRQ-state mismatches when
CONFIG_PROVE_LOCKING is enabled.

This is a preparatory change for enabling lockdep hardirq state tracking
on Alpha.

Reviewed-by: Matt Turner <mattst88@gmail.com>
Tested-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/irq_i8259.c   | 19 +++++++++++------
 arch/alpha/kernel/sys_dp264.c   | 38 ++++++++++++++++++++++-----------
 arch/alpha/kernel/sys_rawhide.c | 17 +++++++++------
 3 files changed, 47 insertions(+), 27 deletions(-)

diff --git a/arch/alpha/kernel/irq_i8259.c b/arch/alpha/kernel/irq_i8259.c
index 29c6c477ac35..28f7b0680564 100644
--- a/arch/alpha/kernel/irq_i8259.c
+++ b/arch/alpha/kernel/irq_i8259.c
@@ -22,7 +22,7 @@
 
 /* Note mask bit is true for DISABLED irqs.  */
 static unsigned int cached_irq_mask = 0xffff;
-static DEFINE_SPINLOCK(i8259_irq_lock);
+static DEFINE_RAW_SPINLOCK(i8259_irq_lock);
 
 static inline void
 i8259_update_irq_hw(unsigned int irq, unsigned long mask)
@@ -36,9 +36,11 @@ i8259_update_irq_hw(unsigned int irq, unsigned long mask)
 inline void
 i8259a_enable_irq(struct irq_data *d)
 {
-	spin_lock(&i8259_irq_lock);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&i8259_irq_lock, flags);
 	i8259_update_irq_hw(d->irq, cached_irq_mask &= ~(1 << d->irq));
-	spin_unlock(&i8259_irq_lock);
+	raw_spin_unlock_irqrestore(&i8259_irq_lock, flags);
 }
 
 static inline void
@@ -50,17 +52,20 @@ __i8259a_disable_irq(unsigned int irq)
 void
 i8259a_disable_irq(struct irq_data *d)
 {
-	spin_lock(&i8259_irq_lock);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&i8259_irq_lock, flags);
 	__i8259a_disable_irq(d->irq);
-	spin_unlock(&i8259_irq_lock);
+	raw_spin_unlock_irqrestore(&i8259_irq_lock, flags);
 }
 
 void
 i8259a_mask_and_ack_irq(struct irq_data *d)
 {
 	unsigned int irq = d->irq;
+	unsigned long flags;
 
-	spin_lock(&i8259_irq_lock);
+	raw_spin_lock_irqsave(&i8259_irq_lock, flags);
 	__i8259a_disable_irq(irq);
 
 	/* Ack the interrupt making it the lowest priority.  */
@@ -69,7 +74,7 @@ i8259a_mask_and_ack_irq(struct irq_data *d)
 		irq = 2;
 	}
 	outb(0xE0 | irq, 0x20);			/* ack the master */
-	spin_unlock(&i8259_irq_lock);
+	raw_spin_unlock_irqrestore(&i8259_irq_lock, flags);
 }
 
 struct irq_chip i8259a_irq_type = {
diff --git a/arch/alpha/kernel/sys_dp264.c b/arch/alpha/kernel/sys_dp264.c
index 9fb445d7dca5..0a2d319bb1c8 100644
--- a/arch/alpha/kernel/sys_dp264.c
+++ b/arch/alpha/kernel/sys_dp264.c
@@ -41,7 +41,7 @@ static unsigned long cached_irq_mask;
 /* dp264 boards handle at max four CPUs */
 static unsigned long cpu_irq_affinity[4] = { 0UL, 0UL, 0UL, 0UL };
 
-DEFINE_SPINLOCK(dp264_irq_lock);
+static DEFINE_RAW_SPINLOCK(dp264_irq_lock);
 
 static void
 tsunami_update_irq_hw(unsigned long mask)
@@ -99,37 +99,45 @@ tsunami_update_irq_hw(unsigned long mask)
 static void
 dp264_enable_irq(struct irq_data *d)
 {
-	spin_lock(&dp264_irq_lock);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&dp264_irq_lock, flags);
 	cached_irq_mask |= 1UL << d->irq;
 	tsunami_update_irq_hw(cached_irq_mask);
-	spin_unlock(&dp264_irq_lock);
+	raw_spin_unlock_irqrestore(&dp264_irq_lock, flags);
 }
 
 static void
 dp264_disable_irq(struct irq_data *d)
 {
-	spin_lock(&dp264_irq_lock);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&dp264_irq_lock, flags);
 	cached_irq_mask &= ~(1UL << d->irq);
 	tsunami_update_irq_hw(cached_irq_mask);
-	spin_unlock(&dp264_irq_lock);
+	raw_spin_unlock_irqrestore(&dp264_irq_lock, flags);
 }
 
 static void
 clipper_enable_irq(struct irq_data *d)
 {
-	spin_lock(&dp264_irq_lock);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&dp264_irq_lock, flags);
 	cached_irq_mask |= 1UL << (d->irq - 16);
 	tsunami_update_irq_hw(cached_irq_mask);
-	spin_unlock(&dp264_irq_lock);
+	raw_spin_unlock_irqrestore(&dp264_irq_lock, flags);
 }
 
 static void
 clipper_disable_irq(struct irq_data *d)
 {
-	spin_lock(&dp264_irq_lock);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&dp264_irq_lock, flags);
 	cached_irq_mask &= ~(1UL << (d->irq - 16));
 	tsunami_update_irq_hw(cached_irq_mask);
-	spin_unlock(&dp264_irq_lock);
+	raw_spin_unlock_irqrestore(&dp264_irq_lock, flags);
 }
 
 static void
@@ -151,10 +159,12 @@ static int
 dp264_set_affinity(struct irq_data *d, const struct cpumask *affinity,
 		   bool force)
 {
-	spin_lock(&dp264_irq_lock);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&dp264_irq_lock, flags);
 	cpu_set_irq_affinity(d->irq, *affinity);
 	tsunami_update_irq_hw(cached_irq_mask);
-	spin_unlock(&dp264_irq_lock);
+	raw_spin_unlock_irqrestore(&dp264_irq_lock, flags);
 
 	return 0;
 }
@@ -163,10 +173,12 @@ static int
 clipper_set_affinity(struct irq_data *d, const struct cpumask *affinity,
 		     bool force)
 {
-	spin_lock(&dp264_irq_lock);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&dp264_irq_lock, flags);
 	cpu_set_irq_affinity(d->irq - 16, *affinity);
 	tsunami_update_irq_hw(cached_irq_mask);
-	spin_unlock(&dp264_irq_lock);
+	raw_spin_unlock_irqrestore(&dp264_irq_lock, flags);
 
 	return 0;
 }
diff --git a/arch/alpha/kernel/sys_rawhide.c b/arch/alpha/kernel/sys_rawhide.c
index b5846ffdadce..b4a08890dce9 100644
--- a/arch/alpha/kernel/sys_rawhide.c
+++ b/arch/alpha/kernel/sys_rawhide.c
@@ -41,7 +41,7 @@ static unsigned int hose_irq_masks[4] = {
 	0xff0000, 0xfe0000, 0xff0000, 0xff0000
 };
 static unsigned int cached_irq_masks[4];
-DEFINE_SPINLOCK(rawhide_irq_lock);
+DEFINE_RAW_SPINLOCK(rawhide_irq_lock);
 
 static inline void
 rawhide_update_irq_hw(int hose, int mask)
@@ -59,6 +59,7 @@ rawhide_enable_irq(struct irq_data *d)
 {
 	unsigned int mask, hose;
 	unsigned int irq = d->irq;
+	unsigned long flags;
 
 	irq -= 16;
 	hose = irq / 24;
@@ -68,11 +69,11 @@ rawhide_enable_irq(struct irq_data *d)
 	irq -= hose * 24;
 	mask = 1 << irq;
 
-	spin_lock(&rawhide_irq_lock);
+	raw_spin_lock_irqsave(&rawhide_irq_lock, flags);
 	mask |= cached_irq_masks[hose];
 	cached_irq_masks[hose] = mask;
 	rawhide_update_irq_hw(hose, mask);
-	spin_unlock(&rawhide_irq_lock);
+	raw_spin_unlock_irqrestore(&rawhide_irq_lock, flags);
 }
 
 static void 
@@ -80,6 +81,7 @@ rawhide_disable_irq(struct irq_data *d)
 {
 	unsigned int mask, hose;
 	unsigned int irq = d->irq;
+	unsigned long flags;
 
 	irq -= 16;
 	hose = irq / 24;
@@ -89,11 +91,11 @@ rawhide_disable_irq(struct irq_data *d)
 	irq -= hose * 24;
 	mask = ~(1 << irq) | hose_irq_masks[hose];
 
-	spin_lock(&rawhide_irq_lock);
+	raw_spin_lock_irqsave(&rawhide_irq_lock, flags);
 	mask &= cached_irq_masks[hose];
 	cached_irq_masks[hose] = mask;
 	rawhide_update_irq_hw(hose, mask);
-	spin_unlock(&rawhide_irq_lock);
+	raw_spin_unlock_irqrestore(&rawhide_irq_lock, flags);
 }
 
 static void
@@ -101,6 +103,7 @@ rawhide_mask_and_ack_irq(struct irq_data *d)
 {
 	unsigned int mask, mask1, hose;
 	unsigned int irq = d->irq;
+	unsigned long flags;
 
 	irq -= 16;
 	hose = irq / 24;
@@ -111,7 +114,7 @@ rawhide_mask_and_ack_irq(struct irq_data *d)
 	mask1 = 1 << irq;
 	mask = ~mask1 | hose_irq_masks[hose];
 
-	spin_lock(&rawhide_irq_lock);
+	raw_spin_lock_irqsave(&rawhide_irq_lock, flags);
 
 	mask &= cached_irq_masks[hose];
 	cached_irq_masks[hose] = mask;
@@ -120,7 +123,7 @@ rawhide_mask_and_ack_irq(struct irq_data *d)
 	/* Clear the interrupt.  */
 	*(vuip)MCPCIA_INT_REQ(MCPCIA_HOSE2MID(hose)) = mask1;
 
-	spin_unlock(&rawhide_irq_lock);
+	raw_spin_unlock_irqrestore(&rawhide_irq_lock, flags);
 }
 
 static struct irq_chip rawhide_irq_type = {
-- 
2.53.0

