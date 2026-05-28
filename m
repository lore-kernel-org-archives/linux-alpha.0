Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCF635E1DA
	for <linux-alpha@vger.kernel.org>; Thu, 28 May 2026 23:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780009529; cv=none; b=FmIkYmgiyJN0g76+p/eboZvuHD5v2z2CGQvuhpyNTIeLXid/wjUqFnLjPfUa7KRz08pxvYFu6FClf2aW2wSpA9m1sXhOUbkLnZ5aHi+F6JoTwsa3nD939Kgqwek9zWdUjOXPi40CMkllXlVlT7O3bf7dZi8vsgV00vogcFU7PDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780009529; c=relaxed/simple;
	bh=Xg2im5Hkp/43fZS92x7APxylnjOyO9JjrcVqTNEe9dU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vCxY5FfDiZA9/r+WuVvViW9DQEl9Jl6AMWSYr3EBpf7wvQAZBXfaZjTcENV4nWVx4q4kxdRrb7XlLfBbWEPBtV+CEkoa+cpSncE4dfi9N/xAfLCWl2wCcjPZutjKEjgt4HLOp4cl0HmmP8V7f1CDZ1t0bcgjXt/7K1oYHY0ilJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k34oXTWO; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k34oXTWO"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7de68222e96so67367b3.2
        for <linux-alpha@vger.kernel.org>; Thu, 28 May 2026 16:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780009527; x=1780614327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n67LtAkr/SxQ2OZ3lCmEnLtOrexGe+CGUrE5BVYjjNY=;
        b=k34oXTWOEzb1gEyjLITOrWj6EsQiyYcCcSdKLgscNiLZp+u1Hi/CbwnoSfE3nLHMOO
         M7qEK3fzIU1VYbn63xTYw4txAZXu9imf4EC81jN//MBs4QYXDvUGFtOcLrQ1JLiTv920
         JyLuyvD1qAtW1O1huBER13JRhHQLqwkm1Bbv1y5zWdy4Q6AkJCTXoz8XR6OPxlD81FA4
         xe0qHheNgr9/iHizv4E1roSsCO0Xa3err2OKDDCTKIfy+33InH3PxjIw5qL8YsAH3w4k
         Tmpmoplpo+e3Kr3sioJMicXWnJzEKfotLJGBsFbh6HaXklz+UxZV7Szcj1/qZesKUhn7
         vftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780009527; x=1780614327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n67LtAkr/SxQ2OZ3lCmEnLtOrexGe+CGUrE5BVYjjNY=;
        b=rsU8LOoSb6qppneCY1Kd28CqqhOdfYOHXdLfTPfvoyVisFf7wm2QTQfLEqF783T/7E
         k6mgjrbt4jy4yu78hiCq0+xHEk6pqQsO/uSlrvwH1v0xTzvY/KY1+JYCEnhq8HbedxdR
         d/MuDsf0vT2n1RrutBLAe9IkCPIXjliNKGjKItTvfT8Vx2aKzEkW7j4qbBRzo4CH3J+n
         T3VkKUBJj5yxxz8CGd4mpFBgP/37qZHBarKr/HlAEz30UZ0BIwAyRu7t2Th3tVNHCmGZ
         knV3Lx2scbV+dKJPzZ7xEjWIWG0ZjU5S55ArFdppYiQ7mMGDQIXpAm+0Yv72LhKIyDq7
         7X5w==
X-Gm-Message-State: AOJu0Ywr0voclmANZFGFobe7lzQILHSnk4DOjNzS66GHnsM/zfJZ/XxM
	4SMKZjY/NLMwvyBBI0oeG/BBI0EFND0YF7Me8cMfoJGKN4L2TmPTZDuzANQaWzFK
X-Gm-Gg: Acq92OEGa/rIg9yerBQBNGFdljtEEjXVBZoHronvXEFxBC9Aixvt+lN8vTA3TGdtfr2
	znbSNWIv86CSPwdZ/2nHIM9RvaC/xaDVQkWNc7P+k7Wyikpdut02ZlYe1e42tcocdhWq81kgECo
	qKhgBinGXAPgj9+Ga6NB1dYEk3NPj9Hyrc2q7xgPFuFtUQdKx0JJP69hIvH3Yv1ckx9jQP5gm98
	L+2STnCknfDdatFeQue8C9/uGct55I/P6KdLFjrNf26pnFBOXPh0WELE5VpUIGcw++gLkKgZs/7
	B4U6YsqK5MeuGwQumXXRNCLZCuydwrrXj2125GmvK9zgX9gbB1zGWpxaf4+AGHUhtqHHIwUQqd8
	WeHCsfy4aWLQNaMh2vkXmhJuyySQ7w7DlnBV08DZ8H/yh5PLit7P8DrCW6X3BuNUzQe+kfjYSux
	srNfutYtO8mNWr1NsoO4OEZ0RuBfPdrl1Neb/sw1x88oikFSQG6itnY9n2KzDKMMrEcmUJAaUoC
	ncPgAe9GZBxAQ==
X-Received: by 2002:a05:690c:6984:b0:798:7879:1ab4 with SMTP id 00721157ae682-7de4c0f5e2emr2556137b3.37.1780009527167;
        Thu, 28 May 2026 16:05:27 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7de6e580c35sm22787b3.45.2026.05.28.16.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 16:05:26 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Matt Turner <mattst88@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] alpha: marvel: Fix lock ordering in init_io7_irqs()
Date: Thu, 28 May 2026 19:05:16 -0400
Message-ID: <20260528230516.1839694-2-mattst88@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528230516.1839694-1-mattst88@gmail.com>
References: <20260528230516.1839694-1-mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move irq_set_chip_and_handler() and irq_set_status_flags() calls
outside the io7->irq_lock raw spinlock.  These functions take
sparse_irq_lock, which is a mutex, and taking a sleeping lock while
holding a raw spinlock is invalid.  The raw spinlock only needs to
protect the hardware CSR accesses.

This fixes the following lockdep splat during boot:

  [ BUG: Invalid wait context ]
  swapper/0/0 is trying to lock:
  sparse_irq_lock{....}-{4:4}, at: irq_mark_irq
  other info that might help us debug this:
  context-{5:5}
  1 lock held by swapper/0/0:
   #0: &io7->irq_lock{....}-{2:2}, at: init_io7_irqs.constprop.0

Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/sys_marvel.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git ./arch/alpha/kernel/sys_marvel.c ./arch/alpha/kernel/sys_marvel.c
index bebeea3c286d..a37707e05e34 100644
--- ./arch/alpha/kernel/sys_marvel.c
+++ ./arch/alpha/kernel/sys_marvel.c
@@ -263,6 +263,18 @@ init_io7_irqs(struct io7 *io7,
 	 */
 	printk("  Interrupts reported to CPU at PE %u\n", boot_cpuid);
 
+	/* Set up the lsi irqs.  */
+	for (i = 0; i < 128; ++i) {
+		irq_set_chip_and_handler(base + i, lsi_ops, handle_level_irq);
+		irq_set_status_flags(base + i, IRQ_LEVEL);
+	}
+
+	/* Set up the msi irqs.  */
+	for (i = 128; i < (128 + 512); ++i) {
+		irq_set_chip_and_handler(base + i, msi_ops, handle_level_irq);
+		irq_set_status_flags(base + i, IRQ_LEVEL);
+	}
+
 	raw_spin_lock(&io7->irq_lock);
 
 	/* set up the error irqs */
@@ -272,12 +284,6 @@ init_io7_irqs(struct io7 *io7,
 	io7_redirect_irq(io7, &io7->csrs->STV_CTL.csr, boot_cpuid);
 	io7_redirect_irq(io7, &io7->csrs->HEI_CTL.csr, boot_cpuid);
 
-	/* Set up the lsi irqs.  */
-	for (i = 0; i < 128; ++i) {
-		irq_set_chip_and_handler(base + i, lsi_ops, handle_level_irq);
-		irq_set_status_flags(base + i, IRQ_LEVEL);
-	}
-
 	/* Disable the implemented irqs in hardware.  */
 	for (i = 0; i < 0x60; ++i) 
 		init_one_io7_lsi(io7, i, boot_cpuid);
@@ -285,13 +291,6 @@ init_io7_irqs(struct io7 *io7,
 	init_one_io7_lsi(io7, 0x74, boot_cpuid);
 	init_one_io7_lsi(io7, 0x75, boot_cpuid);
 
-
-	/* Set up the msi irqs.  */
-	for (i = 128; i < (128 + 512); ++i) {
-		irq_set_chip_and_handler(base + i, msi_ops, handle_level_irq);
-		irq_set_status_flags(base + i, IRQ_LEVEL);
-	}
-
 	for (i = 0; i < 16; ++i)
 		init_one_io7_msi(io7, i, boot_cpuid);
 
-- 
2.53.0

