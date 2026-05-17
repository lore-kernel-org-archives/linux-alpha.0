Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9EF31F9AD
	for <linux-alpha@vger.kernel.org>; Sun, 17 May 2026 21:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779054012; cv=none; b=NyqRvz3m7zBj276M3vVRcGiMDd5elP0zqhqZ6weKwxEdn+diTuMydwUnvukfXkPQ7vlYsDzHpuYR29+Z/nMh1liOR1BHIdkAODh2Gn/EfNc/sllAavjKxuelIMBOMEyUKv4ucg1FAnKP6qP4BoQjaiCenL2SaVAIl19p8bgJ+UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779054012; c=relaxed/simple;
	bh=OeW1Tq5ib65YfcgaRKyfCUETSHjLbYZg7diBythuaoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QVQKnIAvPeeVcpMV9tc6UvUM7Un0CbCc+xj9BFOFsvzwYbz8o1ePp9qxhHGcBBiytGXZckYPxWs2h4+WhY5RjZKsV5vWhqiSQCLBodDmP+WJVtV+UOPYWhEH6Gv2b6UY4AGXqT6wKFmIgdmkKN7kcqdoWkw3BCvhcmKYFUpsNfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oVIgs9oD; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oVIgs9oD"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a8dc2606a0so1749945e87.2
        for <linux-alpha@vger.kernel.org>; Sun, 17 May 2026 14:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779054007; x=1779658807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqwt2J6l0ZWPmkw65w0oYYHsmnLHukO+G7CDsx/E9qs=;
        b=oVIgs9oDUb6RggoKrW0BGVc5qcjfs2O022/dQkeHn4iT8q0Wc92E7oh7kaKcxQzYcO
         sH+xfQIy/0kj9CLSSAeQcZd33zjZKXkegmA9NHFRbxGahI5z+cnuncFOn6o+OQX8yM76
         s+6oadSUHsGK1BZig/vdNUd086u/GeZygbp9Z1Y/W+t0tvrT+px2trNyOU0TjMpvc0xr
         OFSSXP5nFz7cqyB/Mp3pR0WIy2k3WZ4KVWDEvmufHILE9sOlrClUnvNIAXwY4o3hUtL0
         4P627e+ZDFSmv0mJ0LhnEtEvfSJcGOroKdddUODz4+9NW/nto9t3/GhVFbw190XZ+G7J
         NA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779054007; x=1779658807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eqwt2J6l0ZWPmkw65w0oYYHsmnLHukO+G7CDsx/E9qs=;
        b=T+5zcouhFn81kd1buN7vfWn8MuEHaPiYa/SGcPpJjxf38w3sdZBP4+73+eahLXcvD/
         mcOEmQHwnnesonyKJw+LM+eS7+8leUvCP1J1UIzhrYmNNGBd76RlfV7uTOjdsauChcRf
         g5FypY1HX54hIbaRefWX7yKcgZ9migLn6jXkCZcim+w244iTZ33qi8wZmwvPQEPeWhSe
         RFSZ68l1yAUwb3m8kpvRgGdOnjCo84xOivuOxKYEAGVsS2ebvObk6ZWhRw1uA6siHOx3
         K12pYNmVFyyYIi18THH764pFOpMsmMuKaej7bneT9BdcsU8+u3fkUfnqx7RMsxEXsVdN
         DjUA==
X-Forwarded-Encrypted: i=1; AFNElJ85SaNocco0C6Yfu4iIh1g0NHARRA558JjvCCj61sWzpPZ5ZXBCHg023yXf+1Zlod1Z7U9BwY38QE5zZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ0380VOEAihOTahrisooakxlV4k99RB3EJw6SKv2jIOYU13Wh
	Ir5z2qFj1m5nVJepuQ+hilV3c5LlFDUDgywHJKiq1+mXrv5qZmmzaBua
X-Gm-Gg: Acq92OHL4KLnbivG/lPD8CVVzQIAMjgYIj305LVcX2cibRODqyGzl9IF4KHAd2Ak7c4
	2sQq47fHxjg/4sJg/oiFd3N+UJYLQf5lZEg/9/3ZcLlr66cGzmcIK/44HvSDtSGqST+q/VUFZ9+
	HkFSSX1t8SvWLuZczuNV3QHMrkffVn5zoFJByjz42in3HqCMsW8u/3uQiV7zuga/t3m80dGth4V
	4mGTQxtBKRLp819lb1k8S58KWEX76+I5qaTj3lr5oRXx8gpOyvEBcIx12OpUPPcmeFpbifyV+bo
	DRkpJ6MdTolPMQSpmlR+3NTzCVANDOXxJx4mpQc8vOWdVwfmtXvWw7fkNEL3sNuZ44Dj8L8NuQ6
	AnfxBam81C+ilNPzmdonSSdguqxb4Zy7TF7tdlchi+RJCM78sWS3G7SkV8GFPe/3JKNXKJnH6ry
	sbVpRQ7e4ROYp+rWruG45qJnkVpJxJnIzI5DvIkXjcEmNnh/C2s2rY5Ml9LSCe0I6exjuOhfB6G
	gxIsIFNs3dz9TeBjMQbBzhNYXzUQC702g0=
X-Received: by 2002:a05:6512:691:b0:5a8:5288:28f with SMTP id 2adb3069b0e04-5aa0e7390c4mr3354132e87.28.1779054006941;
        Sun, 17 May 2026 14:40:06 -0700 (PDT)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91c1558f3sm2890076e87.77.2026.05.17.14.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 14:40:06 -0700 (PDT)
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
Subject: [PATCH 6/8] alpha: use raw spinlocks for low-level platform locks
Date: Sun, 17 May 2026 23:36:15 +0200
Message-ID: <20260517213919.347523-7-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260517213919.347523-1-linmag7@gmail.com>
References: <20260517213919.347523-1-linmag7@gmail.com>
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

