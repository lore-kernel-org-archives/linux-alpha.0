Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576E4246BA4
	for <linux-alpha@vger.kernel.org>; Fri, 24 Oct 2025 03:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761277629; cv=none; b=iUr0uSq0Pzgqs2yJVovSZIVEOmY2QyRrf6NRsxhEfyG3/lJAhYdtSMoYWa2G0kgu46w7fSaPWXPT5lsImi4ZxoQ/76lGbhHRevMPTmXH6op6vRXiP4Ky8DGmpQ7ol/D9u3cowCFGBNmKx/xlYMkCKehV90ht+WFWP5Q0CA7Bgc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761277629; c=relaxed/simple;
	bh=9cWnLkrLXqaPsJRM99oxt4vPCd7XWVuiMbIdFRMWzT8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=na3MGCv8bUJEtUf2FeV3FKfDZ3WPfUa+JbLRdmyWTf3Qft+l9KE/XQQRAwfXSCiANoLzHBm8nzkot1t3phA4b7vsG7+1Z5xZhyWBnwzNH5EKK9A7Io4hjV3mTe4fDeDQEU/V0H4XZiifzvrliylTb3wqdrgOW4O2jQpxmvhSjjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyrt/D0z; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyrt/D0z"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-938de0df471so138704839f.2
        for <linux-alpha@vger.kernel.org>; Thu, 23 Oct 2025 20:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761277625; x=1761882425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BTRPcVehq1ZOZm7xL/IWpW023usBfc4VwA4QLz9tUds=;
        b=fyrt/D0zKKYB9AptfigPT9jUudDFhTxLRm/s44slHYhf48evjWiZG/hsyH1pWiUeBB
         XrXer/sh/2uVAoUhVBD6B+Qb1DeoB9NEU1mkQg2h9EtGb/CzTJelN809Wb13SXOXy068
         LO+LmrXtvALpqff3aYIrVoxGYup2/MSqlWwokwqyRiJjfhsslCRt/yu1FtP02ujhVzTP
         0PKceafYEoSIxfI6BRp/5sioUMfyI48g/ReCOPYDduTf9kZ4j8xC66do3M6GW5WFuCpe
         v6cVIJiA8SPdozJLbr9RJottJFQBahM5zlSzRJQdZoq5IhtQUAycWpPlxaCaGFWKd9MS
         Avqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761277625; x=1761882425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTRPcVehq1ZOZm7xL/IWpW023usBfc4VwA4QLz9tUds=;
        b=mbfwalQYJDTp31EEDLI8mmjWvOLT92O04rw/t+RfVFU+H2A91K4EJL4t1upKKz8is8
         bnXaifg3Nfh5K28fVeUIBA4iiEAr0GoopkW+JLH1jQUu3wfjAplxxbca/lUmUZf71fDC
         tUDhtDH33nnpkcWHl/ovDuHL06uyXNLSkph6xRAMTsryjAZSvPd9ISf5IC6E7Mh6J753
         6OW3gHuYj0uKXnElROjg/ktFlGRBi5b5Igp9/YFvgbDrVK3xBmKaEVRKUgnUc6RWQfy9
         pgHoMBWG0Gp+t4QUiFSlK57XhVzXsl/SA9vLGAAURMM37u2d/GOxYt7+NtFEVU2EhYoA
         twFA==
X-Gm-Message-State: AOJu0YwbImjC8js4iFDdnCZNYCZztnH7oEcr11F2WLRQaa88pfnsW9/Z
	TLB8iqSSjzwVRBPsyHNTaCl8I11Lpwcs7F/p5G1bEVURDLKKt8+tKn8J
X-Gm-Gg: ASbGncsXvS3nu1I/n9bLuTcC8foDwazM0WCW2CZgQoZqvhQluY3cgxKOiXmIxT1lX8I
	H+TSHlL4H/Ck+9fwFHIFhtEgowvH02+SD8fK/6LJRFUgLPumu+hjje1YnkSvJitKTuD7I88/AAq
	c0EyJ0W7j+gKgXligokI85So4bYi4sFxmArxStkZeQnd/wUgscsf/7ShpebKlnj1u+8XZykm5tb
	nfnITi+JDyBeiMKTEKl1P2iDSuejHE+fhXPm340vjK/XPPpLywcrVq2Yu5YnAaVK/b2157/pnJS
	OEqfLPns6/G1cuCkAnRl0K/xXO4xoJldeXa8XJs2rD95qNiVsqFnVF0DRTwNVCNEFxvRXKx0b40
	JzJ7aYeCjLGh6aYjUAX6M+ZxzWvMqX0JVM5585lduDdpMNccrAYYDYMQBt0WqBPNfKHLL0bS/QD
	Cq0mRkzTKEEwsV39/Hw0DSURc5Zw53/Sb4rxptg0ZKcCzEtd+Z/d5dTq9ZbF07h9mXkNq/DtGRY
	Z6wxp8dExP7lm4=
X-Google-Smtp-Source: AGHT+IF4nK0dDcEQMxrByQtKSDL+Vtp/h2LVbn+x1BPoCFDYFALAcbNWnpX4PRVrQ+b7Q3SGYy2kzQ==
X-Received: by 2002:a05:6e02:3e04:b0:430:c394:15a3 with SMTP id e9e14a558f8ab-430c528d628mr363410005ab.22.1761277625271;
        Thu, 23 Oct 2025 20:47:05 -0700 (PDT)
Received: from abc-virtual-machine.localdomain (c-76-150-86-52.hsd1.il.comcast.net. [76.150.86.52])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb4e4bbefsm1712310173.5.2025.10.23.20.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 20:47:04 -0700 (PDT)
From: Yuhao Jiang <danisjiang@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	David Airlie <airlied@redhat.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	stable@vger.kernel.org,
	Yuhao Jiang <danisjiang@gmail.com>
Subject: [PATCH] agp/alpha: fix out-of-bounds write with negative pg_start
Date: Thu, 23 Oct 2025 22:47:01 -0500
Message-Id: <20251024034701.1673459-1-danisjiang@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code contains an out-of-bounds write vulnerability due to insufficient
bounds validation. Negative pg_start values and integer overflow in
pg_start+pg_count can bypass the existing bounds check.

For example, pg_start=-1 with page_count=1 produces a sum of 0, passing
the check `(pg_start + page_count) > num_entries`, but later writes to
ptes[-1]. Similarly, pg_start=LONG_MAX-5 with pg_count=10 overflows,
bypassing the check.

Fix by explicitly rejecting negative pg_start and detecting overflow in
alpha_core_agp_insert_memory, alpha_core_agp_remove_memory, iommu_release,
iommu_bind, and iommu_unbind.

Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Yuhao Jiang <danisjiang@gmail.com>
---
 arch/alpha/kernel/pci_iommu.c | 17 ++++++++++++++++-
 drivers/char/agp/alpha-agp.c  | 13 ++++++++++++-
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index dc91de50f906..b6293dc66d45 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -859,6 +859,11 @@ iommu_release(struct pci_iommu_arena *arena, long pg_start, long pg_count)
 
 	if (!arena) return -EINVAL;
 
+	if (pg_start < 0 || pg_start + pg_count > (arena->size >> PAGE_SHIFT))
+		return -EINVAL;
+	if (pg_start + pg_count < pg_start)
+		return -EINVAL;
+
 	ptes = arena->ptes;
 
 	/* Make sure they're all reserved first... */
@@ -879,7 +884,12 @@ iommu_bind(struct pci_iommu_arena *arena, long pg_start, long pg_count,
 	long i, j;
 
 	if (!arena) return -EINVAL;
-	
+
+	if (pg_start < 0 || pg_start + pg_count > (arena->size >> PAGE_SHIFT))
+		return -EINVAL;
+	if (pg_start + pg_count < pg_start)
+		return -EINVAL;
+
 	spin_lock_irqsave(&arena->lock, flags);
 
 	ptes = arena->ptes;
@@ -907,6 +917,11 @@ iommu_unbind(struct pci_iommu_arena *arena, long pg_start, long pg_count)
 
 	if (!arena) return -EINVAL;
 
+	if (pg_start < 0 || pg_start + pg_count > (arena->size >> PAGE_SHIFT))
+		return -EINVAL;
+	if (pg_start + pg_count < pg_start)
+		return -EINVAL;
+
 	p = arena->ptes + pg_start;
 	for(i = 0; i < pg_count; i++)
 		p[i] = IOMMU_RESERVED_PTE;
diff --git a/drivers/char/agp/alpha-agp.c b/drivers/char/agp/alpha-agp.c
index e1763ecb8111..e2ab959662f3 100644
--- a/drivers/char/agp/alpha-agp.c
+++ b/drivers/char/agp/alpha-agp.c
@@ -93,7 +93,9 @@ static int alpha_core_agp_insert_memory(struct agp_memory *mem, off_t pg_start,
 
 	temp = agp_bridge->current_size;
 	num_entries = A_SIZE_FIX(temp)->num_entries;
-	if ((pg_start + mem->page_count) > num_entries)
+	if (pg_start < 0 || (pg_start + mem->page_count) > num_entries)
+		return -EINVAL;
+	if ((pg_start + mem->page_count) < pg_start)
 		return -EINVAL;
 
 	status = agp->ops->bind(agp, pg_start, mem);
@@ -107,8 +109,17 @@ static int alpha_core_agp_remove_memory(struct agp_memory *mem, off_t pg_start,
 					int type)
 {
 	alpha_agp_info *agp = agp_bridge->dev_private_data;
+	int num_entries;
+	void *temp;
 	int status;
 
+	temp = agp_bridge->current_size;
+	num_entries = A_SIZE_FIX(temp)->num_entries;
+	if (pg_start < 0 || (pg_start + mem->page_count) > num_entries)
+		return -EINVAL;
+	if ((pg_start + mem->page_count) < pg_start)
+		return -EINVAL;
+
 	status = agp->ops->unbind(agp, pg_start, mem);
 	alpha_core_agp_tlbflush(mem);
 	return status;
-- 
2.34.1

