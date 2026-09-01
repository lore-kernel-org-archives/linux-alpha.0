Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FBA481244
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277923; cv=none; b=RdB3VPseOinO4dZZavwEFqvOI8hTkDI8DwRDOGGK4dcdqNojbkuNfmdBWy910IS54plGd0c8wlS6rVEh6BkQ+lgr7kPBy+YSx3doOFWh7D3gDgoMFUV5gSbgVgPdnKszdSmMPuo++IXulmzX7X5L2jR5P6Ru9El1OpKyVYEMuv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277923; c=relaxed/simple;
	bh=IrmQJrQjYW+syS3MPKmmU1lmLYVrnTHLsRqpvL2AFm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZyrb4js4kxijGpjieXGYJ1lzMCheJZ29AsHXunXSak0y1PA2C82qEM7Qf6SpjGMmNdXInoqe+LDr4+dPmcVKHsn+9ugESUNLL7/maVq7rVDXZpHXnsI9Ig91JTy10UoM1ct5Z44UhXx/EBJgcB4JIptrXq8hGP5R1B3t0U8Wl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfuozS14; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfuozS14"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66c711b7f2aso4699769d50.3
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277921; x=1788882721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5IKO4hnaZLZeyuDf2VX90nf4DpZe8sYuTvGzkkGTBlw=;
        b=GfuozS14Z76blgr+lSTuzavO7jVik06zqKWyLsSQFQDJvtZd29pnfYjk2yggB+bJ/T
         AmQZih8BVYSvpZQN8rK/jNy0ubN8jXxx4AVAGkH0lMCuelAJayywzZfQkaSrKRvKcmoq
         zlIKSzqXoj4i75Sjzhi4q7MkUlZVOhrosIkJF7tdgxSqZJwYlx4O6DV/d9ohYL8aI8W1
         hEYsTAQhM4xAVWEDjWAVk1EXzxCjWgJSfRk+WM/CMBe/7qM15Mla8Q40gLSv1am+PElZ
         yjBens9XdzxvIEt/KuV13pwyyUiytF6M989/lJEULc5t8tQEjlN0wOO7L5LQ3b1Ls4Kr
         GFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277921; x=1788882721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5IKO4hnaZLZeyuDf2VX90nf4DpZe8sYuTvGzkkGTBlw=;
        b=VwZFJvA6eQ38C91oJFGzqsayJu4dMIQSM2QEqM6jPz7vlmguxJfBU7SxJGPSoLna5A
         S5gA9flkv4m+SpURV6EqWpJizRLHThnHUniC9x7AixuxIWHwY9KNDUPErK72ghI50TTf
         H5lfSOiHHPVffg47m+5/tmwjNDQ79+K7QP4VAcKPWsqLSq2AZgJml8iThrCGuN1CW1vw
         yke37+SwlaSB+6hSUfgyLb1+Px0LPM2K+bzZS3QCBLbHsvQYZznxSFi404ZFaqHpWu3W
         pEBO9tpOgxlrBFN/2HgSZqRPAIQt1dks5NDD7r6E4EyNrNkr8hJlnX/tNOEnL/WsMJn3
         V9kg==
X-Gm-Message-State: AFuF++n+UeWm+NtuysHtf71y4Nu3QxmJA14Nim+eF41nwMNvIp/ci7e2
	e05v5mT+En289UmFL9Z0Zah4NGxwJmCaJkXqwgyprSClNXYKSzNIK7sgR3hxXw==
X-Gm-Gg: AR+sD10ZM0SqrF1zymKTftbMlUNjJ6/55DZrdqXVnafUTbdqitkpoGtEfr4B4TR97Xi
	SuEGsZNLNAFgJpcvsF0pKR9r4ea4SVouO60R7ZcL1ZEHfJAwYznihEPTywSWwQTpx3NdI3ZfVKF
	pHzHjz8dU55/L6+wgQQNHCwn7mP8nsMu8iXQSsJassMzNeUDIa3uqd9WVItVH2RHgCPunp/Yvpy
	mF7aJ7CIMzgBq3Md0BrJ7bJPuneEW6V3f4wS5rLpFvLQUHIdgs8iONA+uzUax7CRA9mMqVHRXfe
	gQ7vAVnL4J6aYlIAX+LtZ+vUh/QGBmxC/40/+MGUDOjUmEnw2eZFUrmnOlFm1tA1pVIQS06li+O
	uaRG3mDfV6rUILXPEM9ApwZlH+yExX2k81+P2PpWyq0eU1+wpp4hTN8qz9KLSGGD7FTEjKXT8Wo
	+ayyKADqLSbOUN9ae0MQ2UNJeX5jx3irCp6St/b9BwnxfwWMjrBntKFqCT/EG7FMkMnB4M+WZrI
	MO+y50+fwKBwSCaqr/8J38oHBv2VsM1zPsFcr12gaER7B1cw60=
X-Received: by 2002:a05:690e:158a:20b0:66d:2c09:fb70 with SMTP id 956f58d0204a3-66f87256fc5mr2971313d50.0.1788277921001;
        Tue, 01 Sep 2026 08:52:01 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ed163bcsm8657591d50.16.2026.09.01.08.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:59 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 23/24] alpha: select SPARSE_IRQ
Date: Tue,  1 Sep 2026 11:50:36 -0400
Message-ID: <def73d988ac3cee7f6454637902a296648c25d0b.1788277742.git.mattst88@gmail.com>
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

NR_IRQS on Alpha is sized for the largest configuration each platform
supports, and for Marvel that is 32 PIDs, or 32784 interrupts.  Without
SPARSE_IRQ that becomes a static irq_desc[] array of 12.6 MB in .data,
carried by every Marvel and every generic kernel regardless of how many
interrupts the machine actually has.  A real ES47 uses 87 of them.

That is not just wasted memory, it constrains where the kernel can be
loaded.  The image links at a fixed 0xfffffc0001010000, just above the
console's low memory reservation, and with memory striping enabled the
console leaves only about 16 MB of usable low memory before the rest is
relocated to an interleaved aperture.  A 12.6 MB array of mostly unused
interrupt descriptors is the difference between fitting and not.

Alpha already goes through irq_to_desc() rather than indexing irq_desc[]
directly, so nothing stands in the way.  The platforms do wire up their
interrupts by number, though, which needs the descriptors to exist by
then, so provide arch_probe_nr_irqs() returning the machine vector's
count instead of taking the NR_IRQS_LEGACY default.  Without it every
interrupt above 15 would have no descriptor and the handler setup would
be silently dropped.

Tested on an ES47 (Marvel, 2 EV7z): boots with all device interrupts
working, and .data drops by 12.6 MB, from 15.7 MB to 3.1 MB.
---
 arch/alpha/Kconfig            |  1 +
 arch/alpha/kernel/irq_alpha.c | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 74d13a29b8a9..06c3e55f01f2 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -62,6 +62,7 @@ config ALPHA
 	select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
 	select MMU_GATHER_NO_RANGE
 	select MMU_GATHER_RCU_TABLE_FREE
+	select SPARSE_IRQ
 	select SPARSEMEM_EXTREME if SPARSEMEM
 	select SYSCTL_EXCEPTION_TRACE
 	select ZONE_DMA
diff --git ./arch/alpha/kernel/irq_alpha.c ./arch/alpha/kernel/irq_alpha.c
index 1b799aafb7dc..3274568d6d52 100644
--- ./arch/alpha/kernel/irq_alpha.c
+++ ./arch/alpha/kernel/irq_alpha.c
@@ -148,6 +148,19 @@ common_init_isa_dma(void)
 	outb(0, DMA2_CLR_MASK_REG);
 }
 
+/*
+ * The platforms wire up their interrupts by calling into the generic irq
+ * code with fixed interrupt numbers, so the descriptors have to exist by
+ * then.  Preallocate the machine's full complement rather than take the
+ * NR_IRQS_LEGACY default, which would leave everything above IRQ 15
+ * without a descriptor and silently drop the handler setup.
+ */
+int __init
+arch_probe_nr_irqs(void)
+{
+	return alpha_mv.nr_irqs;
+}
+
 void __init
 init_IRQ(void)
 {
-- 
2.54.0

