Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F338F7D
	for <linux-alpha@vger.kernel.org>; Fri,  3 Apr 2026 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228642; cv=none; b=Ylqv+CRxLe1KnWg0aAYnXLYzkj+Bsia8jh35205v4jjoCYdj9ATXg1tfsvadtIm7195FOOJxBoz26MERWVVaVaMsyw0G/afn4PjC/erZuVnn7DkDWs5CiG7IZlM/lttN4KfmK0zdDhXyaqe8xA6jlK1Ate/U0xEEg4l+/1SKvAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228642; c=relaxed/simple;
	bh=6kxY+JG5TxkzQqjFSkDAuoKyhVGSdH/dv9kjFVeZatc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lZsrIg+8qldZOW4ohpFMsj3zRK4JrymYH7pgcSs8LW6qLh+rQ3iRbfXTVRbpx9F2Yk5fQcBv2HwDd5L+mPmdNOD5amrce70u1Riukplspfk8Rgg1ArXH5uCBUlxbmLe61PqvuGJQxqEMnFwXjys9DIv9rAIOdeoktT8cQp8yLxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/b75FH7; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/b75FH7"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-797ab169454so32312167b3.3
        for <linux-alpha@vger.kernel.org>; Fri, 03 Apr 2026 08:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228640; x=1775833440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2fvoeZziZfh1mXsRZ8yiOQc1WiJLbCbPxji8m7HtyAA=;
        b=Z/b75FH73ZOqv8Ea7YPM4SQhieSBuZAOA/z5rOA9p3qLw62aPs5IH9V1wRezdRYWTy
         6Oa2SIevDCNBeQ1nHjryai8HwmmpJU32vByScdb4FmUf2ACdtflea3Uen3AMh/HWTpyP
         PSEqPUHTWsvznQazxTOe7cvwvx6J96lpoRUgvlOgLJZPkspAUYl76Bbmzk5r5Nn/dm8L
         3OEl6uW9CiOu6HvJ0A3xB0HtpM3NBhUtrAEI6sH3F7O00ogAQIyDZbvrzRitICtHQj+p
         voRkxCEz08abxovrEy70sM3Vzw/H+edMwvCM1OBLz4YOfeiz3gRpI+AsK7zVUlG9ZsYm
         VZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228640; x=1775833440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fvoeZziZfh1mXsRZ8yiOQc1WiJLbCbPxji8m7HtyAA=;
        b=Yql2ZgMJtPK/iDhthiwjq7GlqC0AgLEG6iF00XA1EujxvalAUw8vYNwDHuQrTcYbcT
         Rt+8+xQWxSdIjntbkYRsip8N1dNd7JJgzBzYawgxAu91Rw8KV8rGUCMqkis08Gw9U/LG
         sI2PUWXKFTMg0Nac3uMzlr4YMWZt0qlQlaPg3XyMSF0weU57iafh7P7Pu/QVKabgNH47
         7iQlOpCbbaKXKN7D0xmzHMI6il1W1gAA7uuk4Mu69QGqZLNNxDaEAmss8o4ozKxq0dlw
         v3mhdPLXcxhaztvvORZ2oqmr4UwQr5po/P8IGk7IzypAU0dbP3de4oQ5YzlJmBwQBWXr
         h86Q==
X-Gm-Message-State: AOJu0YwFdkd5XfPyBdJu5xtk4gpdS7IbjFu7xqOfSNoYCXAcy1pZJYIC
	VSKPWNEhJFdJWC3nBTZM2COFf+l60+d2oull4hhYd8mNSWkSLk/5dp3b
X-Gm-Gg: AeBDiesiZbfRfTEWJmLxc31oyQZRLMKGfYS7mXfEjaTKXVMFCX3F9bH8fDIMAqc2R3l
	Sj5bayQKx1HiqEGRY1wERVQG9GkRmQbPOr2jp1QXMiF9AiZVw+QChoUoLBSBQmqE6d5i0nA5lJY
	Hy0muEg2z9gZpH+eBosupT2coaZ9UXhWqt5FAJrnaRp2uQSGPjPUpgZ6o8InAkGxqNLRblG2t70
	lmiCuKtCrFTTBRxfvcvgd96cKWeOQB0S/jBmCaXqvsPXpo3jZ2eBKQ6rJUtUegsMW+VfsMAHoFt
	X0SAP0fzHDwPTKXqUWXP+u4THQBcJB8XTF1z1qFlVfIj6AdjMM7pd6gtO2KCaTL7FsUC8Y5g6sX
	0h+jzBZakgUM3sCHQPLeJUA08xbWi21Pvhjvj+frpgKIlHRVGI8M+pVU+0e5rpTX8EFse8g+qi6
	8Py554yy8eco3gXUc/9Qs=
X-Received: by 2002:a05:690c:660e:b0:7a4:80ce:8275 with SMTP id 00721157ae682-7a4d566b496mr34629777b3.35.1775228639761;
        Fri, 03 Apr 2026 08:03:59 -0700 (PDT)
Received: from localhost ([76.195.202.134])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-7a36ea2c42dsm22723137b3.17.2026.04.03.08.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:03:59 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: marvel: Fix lock ordering in init_io7_irqs()
Date: Fri,  3 Apr 2026 11:03:56 -0400
Message-ID: <20260403150357.489571-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.52.0
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

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/sys_marvel.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git ./arch/alpha/kernel/sys_marvel.c ./arch/alpha/kernel/sys_marvel.c
index 1f99b03effc2..d0bdd5e6cfd7 100644
--- ./arch/alpha/kernel/sys_marvel.c
+++ ./arch/alpha/kernel/sys_marvel.c
@@ -263,6 +263,18 @@ init_io7_irqs(struct io7 *io7,
 	 */
 	printk("  Interrupts reported to CPU at PE %u\n", boot_cpuid);
 
+	/* Set up the lsi irqs.  */
+	for (i = 0; i < 128; ++i) {
+		irq_set_chip_and_handler(base + i, lsi_ops, handle_level_irq);
+		irq_set_status_flags(i, IRQ_LEVEL);
+	}
+
+	/* Set up the msi irqs.  */
+	for (i = 128; i < (128 + 512); ++i) {
+		irq_set_chip_and_handler(base + i, msi_ops, handle_level_irq);
+		irq_set_status_flags(i, IRQ_LEVEL);
+	}
+
 	raw_spin_lock(&io7->irq_lock);
 
 	/* set up the error irqs */
@@ -272,26 +284,13 @@ init_io7_irqs(struct io7 *io7,
 	io7_redirect_irq(io7, &io7->csrs->STV_CTL.csr, boot_cpuid);
 	io7_redirect_irq(io7, &io7->csrs->HEI_CTL.csr, boot_cpuid);
 
-	/* Set up the lsi irqs.  */
-	for (i = 0; i < 128; ++i) {
-		irq_set_chip_and_handler(base + i, lsi_ops, handle_level_irq);
-		irq_set_status_flags(i, IRQ_LEVEL);
-	}
-
 	/* Disable the implemented irqs in hardware.  */
-	for (i = 0; i < 0x60; ++i) 
+	for (i = 0; i < 0x60; ++i)
 		init_one_io7_lsi(io7, i, boot_cpuid);
 
 	init_one_io7_lsi(io7, 0x74, boot_cpuid);
 	init_one_io7_lsi(io7, 0x75, boot_cpuid);
 
-
-	/* Set up the msi irqs.  */
-	for (i = 128; i < (128 + 512); ++i) {
-		irq_set_chip_and_handler(base + i, msi_ops, handle_level_irq);
-		irq_set_status_flags(i, IRQ_LEVEL);
-	}
-
 	for (i = 0; i < 16; ++i)
 		init_one_io7_msi(io7, i, boot_cpuid);
 
-- 
2.52.0

