Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739098;
	b=SU0k3nBTg/rVcctxCRxD4/hIkeaxPAeL0KKU+ErqwBcD/ZJGvmtAisYpvjPLwI2V3Q8h
	 bgTXnXCeB5iyn3wAGfDKDD0MsZDxUr1YBTu4kSqMfXpBC9S4Bnns+POEANorVPgEpJDKL
	 MLGttD8a5s1IZNy3j33uImMdxx2KjeSEqybNijYYhHb1DU+qiQc/9a/11ddhT0/Pz9fsI
	 wymd+SQ7E0k4MfVe+DM1aD51Fhy0DlCZb0m2d+/vg0emua1wJDkFbIWcj15UDwk9cL/cF
	 NdQ9356Rrg43f00NN0gW1Nxe7zycaXq4LZPiJhU7SjtkpAgHiSVEKXyDXEYOVrJoYiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dm9ePAdwTgqDyhmZBdfRQC0uQmjTicoUXjhAVnrQHGQ=;
	b=qC8PDKovpYWC5u+Bral5K2es7qIP0XYK+MEmwrtxagCOCMjgx5NyWa2m9CF+nZY6GDXF
	 BnxKN5261Y3+jRhDO81GrvNt4kHEEB8ulelfrHNb9is9DtGrSq/OWvX97GXIpSns1/sCN
	 WE570/r5II+B2JAgxBTBSi250rAoUe2KUqzFPqM7SFLXA8Z6X3c+IkVoUmkJsQLijLFG0
	 cqofRRX8Mx6gytcEAKMMMnncqYFPwraC5cruQsHlmzIY9eq4FuHeU9aIwEKNaJFdHNwEx
	 P9oooVpghon1PqQjXKU9yLY4E+6j7T2yuaHz16V63N1KhVLOcPxq2xKPx8MVKbibENg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yIvHXUks;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB19E606A338
	for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 10:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB19E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yIvHXUks
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so24274191fa.3
        for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 02:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794739096; x=1795343896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dm9ePAdwTgqDyhmZBdfRQC0uQmjTicoUXjhAVnrQHGQ=;
        b=yIvHXUksCtGG93KMJYaPLmlW6MYv5D2vIXzEzLKh9XBN03bnBZq1lHdFB/K4PjTsTz
         l4Unt4Wbj+1BMBe0pMpriGardCoa8T9zfNuyaUcpShMwctWjggRrWDWFn11bL4vwvoib
         utDQ52Z5rN/fg/AefmoebuJbO5dJI0C/qD6kZiNO446FBdoV9sIWEBuzVo8Xo4KckBoW
         BtYtEZ+YHb50ujKda7C7dC1gVolAZwJ4Hf7zHzNdqI+Ar5iag33spyfSCDhT8ut8cuqP
         NaK31BPd3g2xAXtgQ8wM8wcgiHNLqw/9eQlz7uY7eJqjZQZj7Y0xDODj/slODqj2fRGr
         1L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739096; x=1795343896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dm9ePAdwTgqDyhmZBdfRQC0uQmjTicoUXjhAVnrQHGQ=;
        b=PWuAe7KgNOU4svfIgd9+dfYJZeZrWigOGAk4RMhmAGcOexsyBylSEiy2Y1shs2xhY5
         4adtgaIH4W9zYzcv9M4/kn8DbOLLzeDoKJRfDSzx3eVdFru3wadbxWxNujAMaRm2SaV0
         pZO4YRD5ISKnjnQsievCAWzWYY3DhTNcvohx3Lo4A147KTnGtUyl4QVqyp6VTgRyVhQ+
         xQ80Z4oOg4GYdMFuIRbmfGaEMQIfbDco8YWvwfX0wYHcFGx2Xdjkn4sva4uTDM8imSZP
         7r92ci8MTYLOXJ0gt0UVQwpPLAvAZ86L70CJsz0nRYiTsG5Gdn8fn6e7LqjyVPyk19Go
         /uPg==
X-Forwarded-Encrypted: i=1; AL+hErHSRMBC63MJcIB+6ABIQ0YLdF+T7Dvl4iy7LDwaeL+TqeAFBssF8YzDC0OyBhhNimMChniIG/Ah3RVf1w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+eFHBbLr7Be+QH/Zw7i5VTUl6xXQdBkTE8WADfgu6a7MK0f4TF
	5gZXfMF3D0zNeLKRxhkHMjq66DwU1pHDQryun2Ito3EybkPYc0cZ0sDB
X-Gm-Gg: AYBFou0JNSWtoxPH2THJjwEdnLXWL6ZDb2DGPfHA0QupPZAVkFCIe4tMNOljTM3srT0
	IyNZ8kjz+qDCEUevhg3+5cPvA3f7Iw0LpUstdawQWjowionYmMA8Er8C6t7rQ9HYKZTOUJelbCK
	opHZSyvrtu02ii/QlGO3igqYHfhzzE3uXJ1c80czXce6ZJTXvYv4CGDfum+fMoBp5z48UC3myiY
	O4eVFef52QFwCjvGpvuvAeNH4sIcqUbv7Uk+Z4QAYoJAyLR4bno7QOQLnzccpGgfxyFOv3XvRRp
	vIe4cBHedITn5/W5qZ83YuPRTexx1V0XNK80HO5GdyMPQCdbplk1FtISZnYEyV686kh+/+5LNk3
	/MSC64PwyS2qVcjvk9DuU0IfW0uvb+xAh+CssxIOHcpDCqnHssYI2O1/ogAzibmsr7IJ8pxaXrC
	TEjCQAltpmRdQ3W9bae7/FrMH9p00EGp+oYsBvQ/QfR+p2651sNO6BUaHCOCzXwRJaimRQrO+S1
	ZM6rN6M4Qm+sTRW1J8LZ5gTZxAlECkKAElis0f27dhqFdsX2Pr4EUUxoy8DPbZkUKELAFqN1l7g
	yVb1UVqglYOeJbXlzpxbdKlrcfeWi+o6Xtdlpa6xRfp4oqqgZnyyqssrAeD7/fODP2iPTKA=
X-Received: by 2002:a05:651c:983:b0:3a3:749e:319d with SMTP id 38308e7fff4ca-3ae2b508d40mr20659161fa.17.1794739095852;
        Sun, 15 Nov 2026 02:38:15 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17135649asm2304491e87.77.2026.11.15.02.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:38:15 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v3 2/2] alpha: enable contiguous memory allocation for coherent DMA
Date: Sun, 15 Nov 2026 11:37:43 +0100
Message-ID: <20261115103809.1288167-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115103809.1288167-1-linmag7@gmail.com>
References: <20261115103809.1288167-1-linmag7@gmail.com>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select HAVE_DMA_CONTIGUOUS and reserve a default CMA area after the
machine has initialized its DMA windows. Prefer top-down placement
below the direct-map and usable RAM limits. Skip the default reservation
when no direct-map window exists. Explicit cma= ranges retain their
generic override semantics; top-down placement is a preference, not a
hard lower bound excluding the first 16 MiB.

Use dma_alloc_contiguous(), which rejects non-blocking callers, before
falling back to alloc_pages_exact(). Pair both paths with
dma_free_contiguous(), whose buddy fallback uses free_pages_exact().
Skip CMA on the GFP_DMA retry after a mapping failure so it cannot
return the same unsuitable CMA pages. Retain zeroing for CMA memory.

Round the size up to a page boundary in both allocation and free. CMA
allocates size >> PAGE_SHIFT pages, so an unaligned size could otherwise
allocate too few pages and overrun the allocation during zeroing. Keep
the mapping and unmapping lengths consistent with the aligned size.

With CONFIG_DMA_CMA=y, the default CMA_SIZE_MBYTES setting reserves
16 MiB without a cma= argument. cma=0 disables the default area.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 .../io/dma-contiguous/arch-support.txt        |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/kernel/pci_iommu.c                 | 19 +++++++++++++------
 arch/alpha/kernel/setup.c                     | 15 +++++++++++++++
 4 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/Documentation/features/io/dma-contiguous/arch-support.txt b/Documentation/features/io/dma-contiguous/arch-support.txt
index 3c6ce35d704f..6cd205a991f6 100644
--- a/Documentation/features/io/dma-contiguous/arch-support.txt
+++ b/Documentation/features/io/dma-contiguous/arch-support.txt
@@ -6,7 +6,7 @@
     -----------------------
     |         arch |status|
     -----------------------
-    |       alpha: | TODO |
+    |       alpha: |  ok  |
     |         arc: | TODO |
     |         arm: |  ok  |
     |       arm64: |  ok  |
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 6ccb2d230326..cddc1f3af209 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -30,6 +30,7 @@ config ALPHA
 	select HAVE_ARCH_COMPILER_H
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_KMEMLEAK
+	select HAVE_DMA_CONTIGUOUS
 	select HAVE_GUP_FAST
 	select HAVE_KERNEL_BZIP2
 	select HAVE_KERNEL_GZIP
diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 955b6ca61627..19aa5c05de2b 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -408,15 +408,20 @@ static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	void *cpu_addr;
-	long order = get_order(size);
+	struct page *page;
 
+	size = PAGE_ALIGN(size);
 	gfp &= ~GFP_DMA;
 
 try_again:
-	cpu_addr = (void *)__get_free_pages(gfp | __GFP_ZERO, order);
+	/* A low-memory retry must not return the same unsuitable CMA pages. */
+	page = (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev, size, gfp);
+	if (page)
+		cpu_addr = page_address(page);
+	else
+		cpu_addr = alloc_pages_exact(size, gfp | __GFP_ZERO);
 	if (! cpu_addr) {
-		printk(KERN_INFO "pci_alloc_consistent: "
-		       "get_free_pages failed from %ps\n",
+		pr_info("pci_alloc_consistent: allocation failed from %ps\n",
 			__builtin_return_address(0));
 		/* ??? Really atomic allocation?  Otherwise we could play
 		   with vmalloc and sg if we can't find contiguous memory.  */
@@ -426,7 +431,7 @@ static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 
 	*dma_addrp = pci_map_single_1(pdev, virt_to_phys(cpu_addr), size, 0);
 	if (*dma_addrp == DMA_MAPPING_ERROR) {
-		free_pages((unsigned long)cpu_addr, order);
+		dma_free_contiguous(dev, virt_to_page(cpu_addr), size);
 		if (alpha_mv.mv_pci_tbi || (gfp & GFP_DMA))
 			return NULL;
 		/* The address doesn't fit required mask and we
@@ -452,8 +457,10 @@ static void alpha_pci_free_coherent(struct device *dev, size_t size,
 				    unsigned long attrs)
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
+
+	size = PAGE_ALIGN(size);
 	dma_unmap_single(&pdev->dev, dma_addr, size, DMA_BIDIRECTIONAL);
-	free_pages((unsigned long)cpu_addr, get_order(size));
+	dma_free_contiguous(dev, virt_to_page(cpu_addr), size);
 
 	DBGA2("pci_free_consistent: [%llx,%zx] from %ps\n",
 	      dma_addr, size, __builtin_return_address(0));
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index f21a7c8f5213..f40a87b30a7c 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -31,6 +31,7 @@
 #include <linux/panic_notifier.h>
 #include <linux/platform_device.h>
 #include <linux/memblock.h>
+#include <linux/dma-map-ops.h>
 #include <linux/pci.h>
 #include <linux/seq_file.h>
 #include <linux/root_dev.h>
@@ -584,6 +585,20 @@ setup_arch(char **cmdline_p)
 	jump_label_init();
 	parse_early_param();
 
+	/*
+	 * Prefer higher memory within the direct-map window, rather than
+	 * consuming scarce low memory with a bottom-up CMA reservation.
+	 * Explicit cma= ranges retain the generic command-line semantics.
+	 */
+	if (__direct_map_size) {
+		bool bottom_up = memblock_bottom_up();
+
+		memblock_set_bottom_up(false);
+		dma_contiguous_reserve(min_t(phys_addr_t, __direct_map_size,
+					     PFN_PHYS(max_low_pfn)));
+		memblock_set_bottom_up(bottom_up);
+	}
+
 	/* Reserve standard resources.  */
 	reserve_std_resources();
 
-- 
2.43.0

