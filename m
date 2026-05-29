Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1333ECBDA
	for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064633; cv=none; b=XdaOWfL0NWRztzJC6YRj/ya1JU59bj6uiJdOL7qt31o5v1XbhJDyOx8iqU9RzuJRlGgaeKib1pusbdDvVR+Iu7qxferqQI0GTNtrSioiqmQJ1KmAbh76Rn97ZjwYbpct/RpsZSJakPFW32I+2B0kMEz2d85GEQ266nUTkRNZhG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064633; c=relaxed/simple;
	bh=OeW1Tq5ib65YfcgaRKyfCUETSHjLbYZg7diBythuaoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NC+J7HmuLElb0Gr9yuZZIfQSJp0EOY5KxBqxEmof1Pr7miDdcrRakBKNnYKYXFrKIBBOJCGFB5lEGufCc5PO7YrTQggVGy6+q2m3GPJD2L4aiTF3BMZBqoncoJpOibuDXJoup4WMpG4behuyoOrwY74C4TyH14X9KGKeeoqAI4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sZ3b0QKB; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sZ3b0QKB"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa2691db86so14900231e87.3
        for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 07:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780064629; x=1780669429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqwt2J6l0ZWPmkw65w0oYYHsmnLHukO+G7CDsx/E9qs=;
        b=sZ3b0QKBT5SmJFq83MhT0wiR8ABvNNHWOHPTSjGutftd7AkLnofGdzlfYlvho4Fq/k
         WbL/NuvtjYgpp07C4J1URmjJ6QAFmjHILWEPwS6WKdjks3uDM9OiwHW7+91psUslZjDL
         W/9tp5xuMdk4j43Cv8beOLT0V/JO6Hw0v/Z9OMmnQ98D/Py3HdcdPagKFj9KcYcLrcap
         AyXgHnOT9DsvS6PAtM+2cPwwSeMsxtGKGTSdEJECy7mRfipFeZlolSQmcaefkptIcFDk
         Aidr2OGDTo2NhigfF4JuHcDin0UausDjPV7xjXM+kkG6mcf8SUp6Oa+XxAncnoVeLPHC
         Sb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064629; x=1780669429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eqwt2J6l0ZWPmkw65w0oYYHsmnLHukO+G7CDsx/E9qs=;
        b=fjjpygjG3eOQpZx4CRVW3RW1cQVpgtX0Tbl5Vb2YoyLQyyGOIMOP9uyI5mlIcXOOFo
         QONVVUkrBqgaKXEn1RbyPMzFDcOwotP0h8RtROQ4SeuahUvFeStBqnJEKgMo36jCxZUn
         ig/gehQd22+uPOuhXfW+ABq/K3Pt2c+b5emVu/6777UB561LK7N5Sz/puMDTmPzFhUhb
         7fUVe9Qi7xYCxO/twttvj/FrJJxCPNHKYg8msepBZotr6JkWvkx/65tH5KEn/ydOTOE1
         zRjII2mcgD8Ps7Ry1uN2TInc7LOtz2g0ldI3i8u9HSs7o5PZwNHI/dkaUwXosEfcn5Ky
         O0lw==
X-Forwarded-Encrypted: i=1; AFNElJ/aKsPj8ghO4nfnmdjE0yQv0RRfwA/oAzh2DdiLt5eDDSYMQzgXZfBYaq/fKrSuehZUvYOwlYoIXK17mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/cgliyBh/K862Yqe1+DgNEriPLAZQ7WInZq8lXJZAleomOaYv
	crZIlmVJM/MR5I/efntrIahAP0GUCqCrTjF/sV0vPeIJM2dVPMw6AbSq
X-Gm-Gg: Acq92OGDifTTIERrWtAJgM70/739TvmJYCNeSV5mgh33sIaQejMb/3rpEEDymst9QMv
	Qplrpm6J78Rmu+qD36BSdnJuhZbhn0fFBd41sIjB6G08gXZRxVZpLz8b7sAFWhgj+nMk+ntQaDP
	ddohHO2kSXalcuL+CNUKqJtzfPMVnH9Ukis8m1dqpZGpnIe/AO9jGxpu3PtcWep4a+5ftyXavKo
	2dYUHffH88ST/oqNE87774QRuYoMmLaBK3uGAV6ExE2KqGuu9/J1eYGELFI4fulGQelbR2cZVDJ
	lHzJ+ODuaoxJ9k2fwCw9pquatL29r/3AyYDdveInSfedAdKU58p8vgEVeDGexQ/DHyjZy7zjJB1
	69S1wS2xL93/qAxTzx7S2YZ0MTE2Dctb30Sffh8eYUE/WX3dsSJbZJ9YPd5gMLTteAkqWhNyssn
	2g1DxruZTlv7cnotR+3FYedDpC4yAyiFIpRMPgA0ueq8Rx6nxTtuiBJTAFPtTbyBPxawRiY/8Jo
	Xbz+/lfPPqNC5c4TJohnMadRQ1zQBM7Igh6XyPJUVptBQ==
X-Received: by 2002:a05:6512:65d1:20b0:5a8:94c2:d49a with SMTP id 2adb3069b0e04-5aa6090338emr4326e87.27.1780064628626;
        Fri, 29 May 2026 07:23:48 -0700 (PDT)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b0687e2sm310433e87.6.2026.05.29.07.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:23:47 -0700 (PDT)
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
Subject: [PATCH v2 6/8] alpha: use raw spinlocks for low-level platform locks
Date: Fri, 29 May 2026 16:22:02 +0200
Message-ID: <20260529142322.1362438-7-linmag7@gmail.com>
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

