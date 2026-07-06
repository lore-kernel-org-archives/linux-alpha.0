Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074452EEE7D
	for <linux-alpha@vger.kernel.org>; Mon,  6 Jul 2026 17:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357239; cv=none; b=bxQIo/S+/4mk7BHIOHLE0BZ+nbqm94bCLFIKwOwz0fLZ6+unKZW6Gxk03iCxbt43lYkX7bDBSJY/5crLFBEVRC/AQmJCwLiw2J7em58Rr8/KWfZ5pf0u7157keiEq1BJyrV9hnBFsVEulVGvyEAnHAPvEi3H4QK/VKCKscRTuo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357239; c=relaxed/simple;
	bh=v9HK/jw7rJmQKRYABciYH/IJybyaWe8RLw2Y9KRYLY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rzfrSEh6sezbny6sN+lkmg12wj0m7Bk+wOugAneI3a+ntt9/bl7GlJPPtvtFwnGgIQD8J61fBqkSFGy2ZnfAsgYPDCzsADtqI5l04TOL6wn/kE+LfN3i33ogzETxnn5o4lAEKBPf0yO/1/kvLYWrtjzm/cU77lL/GxmCOYI8pVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADXB8XUq; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADXB8XUq"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb6d00883so2698888e87.1
        for <linux-alpha@vger.kernel.org>; Mon, 06 Jul 2026 10:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783357235; x=1783962035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/dwkCwiuAGNj+oABoDkmXgpJE7bqFjDFwXw6/g3UIg=;
        b=ADXB8XUqDRYOd52IMqhLmRjs2q9FM05vCL/a4Cs2zrLN8/8np5QxZ7nhr2hwQtoPHV
         pfhc6uaV3i5k8E5z1JrKrlkPcjlCIuVlN67GC6s/aefS2/6i+FDeyTc2cNWVI9MXB4xa
         TDUdINg/GAbXMc90mgQ4Wvmh7Jg1LbTr5fVaFEyERjoNbK9SBnBp3Ffz7SHvllUdHeYh
         mgbgWt12u17X3AxzwdHukX1dJqkellmuGTQFMIgEvCVMgX03+6EasDpMO8SQka9Tci3E
         TU7wy+TMWU03bCfadYhOfFdR6CeFwFVJj84NFEzLTK8GAGL3MVULgud8G1PSF1nRgPK8
         EmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357235; x=1783962035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j/dwkCwiuAGNj+oABoDkmXgpJE7bqFjDFwXw6/g3UIg=;
        b=d9YK3T4BR+7UnVjHwCVzwxUMWqSI9NS9FiFu/ZS86sTU7Puvg4nCKY9jiNxWGhrbyj
         tCQXheTUQvVcDfBcDoar/fM8Rms59t09GK6Ez4sDwsjjNbZblO/kZzSdamHMm07n/cUR
         fcTBaPpBIBzygMOFYZVhqfuq8Ot/4L9YEW8YAb4JxgDDKEaD3STCsqs6753gn2ZbZVBe
         1qw8BLDJvVk3K9L0K0aS9WFea3MhwDUskV9Eygg8KDWOaOY0JQTiDXjjUCX6z8o6HaCC
         eEwuAQNDXZirPPnNi4yjCRYBW3VD0MwuJz4uj+zHaPYNw+C1MWYky3T4hK9tLLmfShYG
         AhMA==
X-Forwarded-Encrypted: i=1; AHgh+RovTv0iWDFS63zj6XbWFzvdv+tL5+3WbfYgFVrW7pHqTEgc8jEEaBWeZd8NVDAOFguwReuO6zbKEUovrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLRJDAwZbwpm0SYo5BFLldiitQhnZJT0hamzKA4FhUIhJ+sSMv
	k4EHiRpb12gzun6rjHX/7udQj/3y3+gVaN9dNp0LN1RlQcGpotmqcmtO
X-Gm-Gg: AfdE7cnghZ6XpGDlo9XS105PtZUy7ricxHVpSI69wSYOJHS9wCeJb0bV5/KPtLms5P+
	M4t+4wpigX1TVUh9lOxgi68gl2b+9uuLwV8UEf2+dvQ1YY2wvHTWwxfq7rxySLQCLUbjCIirOcV
	VrUdMrsMPOj1Ht4yNWh9dzJeBbZ0ye3HsAUaI3xxHLzy2/NIFkQBH4vJTcpTWWi7FcYdVeuNgxb
	fMf81ii6/UQvY3gsWlJ1u2rNgrqNDdq2X8Ba18SlA2hAquG/bW+NPv89WQC0M17qT4NgjA0A6/J
	RkCpM2xEdy3pjgMvLlQ66yEFSVhcknEPKfNz9ju51HfbKCV1uiaAvhtuHn2fEbiU+WSswI4lvUk
	VMf6RXEk9VS+ideYQH0RgfKDpm5WZEhTt0mHCeX0dwxPWQ8CteZ7Oor7Z428OXjWagIn00RCNlM
	+RNB4dcBGaBEhr5xYKZ5d5WOY/kXf7SsQVAL3gR7eJjgrBoaoSGZ1KO96RfT67bmy2Tzxcyucyr
	MNYx1T47vJm7E0LvcoX18bS/js=
X-Received: by 2002:a05:6512:2159:b0:5ae:c636:78 with SMTP id 2adb3069b0e04-5b007c4d1cfmr251782e87.53.1783357235033;
        Mon, 06 Jul 2026 10:00:35 -0700 (PDT)
Received: from buildhost.darklands.se (h-158-174-102-211.A469.priv.bahnhof.se. [158.174.102.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bfd1fsm2961021e87.55.2026.07.06.10.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:00:34 -0700 (PDT)
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
Subject: [PATCH v4 5/7] alpha: use raw spinlocks for low-level platform locks
Date: Mon,  6 Jul 2026 18:56:46 +0200
Message-ID: <20260706170019.2941459-6-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706170019.2941459-1-linmag7@gmail.com>
References: <20260706170019.2941459-1-linmag7@gmail.com>
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

