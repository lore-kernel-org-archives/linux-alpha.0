Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798636;
	b=k+deQm6spbpekNrClYo0b4KG8hEzz5u5HgCtSoLlYm8Afp3r6/1980RB14zFb9rf0xWW
	 CAxLKnlJYjbAn/XYltHH/d/RzEHUbAKpGK0a0wSqJV2G6pO/hgpp8mA25SDPCKOetSWbp
	 +0km81etxGMy1iI/SlS+lRheFOPi4xnF0GlNJgZRPp4y9uKYiFlRavqncMlC3cjuGR+np
	 nvFR7RzusbyQ1Rp1xtJXYQUHoeVjusnC3U1FJ7ZeNoDSLLuO4UMODulTyyGdrq2waCvUE
	 H48EUOgOoETIYNzdTYtMJPgV7FnSrz7y+gqvUJtu46BxcjEMoQe1OR7rCCXWe63UDnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2Ua/bbBhiBpwOqFmN+8H2DJaeVPS+kvwmr+FcD0EhAg=;
	b=lM+r9fS6FEX/debnz5Y97zU5JNPXSdaHBdS+ySnRWCZw/l3TGlhbRlK2AQOfWt0mn5HS
	 U3DBr3krl13vj0jUTnIVpxdQwULma9euJRSN+j/Yqqj/CoIGeS5WdAaVdyTIgH0w8O/ea
	 slw/JXR+/qUw+dmzx+XCqQo4BiON85AUTOXE9xSIf0o9J3FgEn55nXaLTA/e4hpA6HR0R
	 vuQRxvcUXK99DoxjmA9tiJ6akSQ4BdJ/aoXEvb4kAgIH+x6vnkZfaJKAemwcIfTOR1nlU
	 sLWgs3iCnbXyus8QLpO6h31RZiiX3vL7BJI//QOy2Axh5dRPB00pgSXvkI65qVvWx9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Vr/egv5p";
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FB7606A686
	for <linux-alpha@vger.kernel.org>; Fri, 27 Nov 2026 16:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71FB7606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vr/egv5p
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3adfcafaabbso77436811fa.3
        for <linux-alpha@vger.kernel.org>; Fri, 27 Nov 2026 08:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798633; x=1796403433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ua/bbBhiBpwOqFmN+8H2DJaeVPS+kvwmr+FcD0EhAg=;
        b=Vr/egv5piUaccOKckDsRGs7H6hBXOwrPmOCTzKnH1MTngUNxv32RrO0g/lYoID9stu
         rw0TNZKjeusxJjvjVa18oQf3hVNAa5H82Jl4bwknNG3acyLL4+tPUiBwTT2sKjffbJMN
         a1cmPK0Hcx+U9PG7RRxyhqd2EUdvMZZdPbQD8MbbHrJjHevNWlyIcYtIawXSk1ldH/Kj
         OQhXidNsAcqTgnIWHsTX9C3OsOhUI4cQGRqYt7Km960i6Pt9/Xs8beIMwPgdRkFe1YPW
         C1BziZt1mpmt8wF88oL3anOEe8btlJ3op9SUanK+nlGSvSdQ/JZSCSKi2NCsfYhrExvc
         kEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798633; x=1796403433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Ua/bbBhiBpwOqFmN+8H2DJaeVPS+kvwmr+FcD0EhAg=;
        b=Df6wd6jNnVaCaBKf/tFDozbFIMgF+CsRAlzKtSvUWqwCe5VluvJHbQTL6RRgAgINHs
         jcW8wni9BDDBd0eNvG1lrpFDmtkuh351LGzCwMw+5uy7ITpWNKmsbxxhFJI+fddIkLyv
         b/1/bkoWMC699B1kLwLA2Yn5/p+GugcuCEop8O7NUuN691HQNtCu9+m80ReO4jh6tjFh
         4gRiVIk+qAmAGnaJmOzmep/zM+1IX5PXS/MdxWV38AtLNllq3Xpy8TRFGxHRHT0vidIf
         I8dRoP+qtHk93QmtdhQ4xN6fCIjEoL9F86zxYZ+ctDiwL54YD7X6bd4U4vDORKTcK5M9
         l8rg==
X-Forwarded-Encrypted: i=1; AL+hErFXkS6jI1MSlea/3m0BQqtfOzYoP08LahavAVIEptokLer0JXSzPAodvza937ovaRNkFsTUSO3HoHT2Vw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+g54TDVsr9z8Ug6SdkmSToyMmEyxWt44NuY0JWfD95aS4RH+l1
	KIQ93a0gB9bYvdIkd3s6VDTkTZdIsvk8XCbFRaxajf05jbqlyQ9CtQFF
X-Gm-Gg: AZFdTZfce84Iy8IPYP6emgGmfiY/lqC1C/rHGnth+jhXMiGHxTreMBDMLsiziEUAsTS
	OmNwg3It+RF84D0VNF9/MBs3T/R2YStKVw9jIoAz963D9RSQuDkskyj7qewnPD5e7mkxjdrfAr3
	gO3sT+epj5KxeiTLRj57bHEG3Rx0G1t/S16gOvP9FO0MdnuM0mUPMOzHXsneXrkhTrhXpf2ilqp
	bBcd/OO4i/NUaR7x9Qo6cm0J4lr5lRqON77ESJdQYCqNj1Vg146dOuazfKWbASTu1hgZL1a2utc
	3i4nNdNmyF1KlXkOqVVtZVuidMuFh4bXu8uMdbXf2F921XIIt20vLYTXUPO+0O78f0yA7Nq1Krs
	d3/odp3ufSfS1yN7gjDEn5KnwQZKfcHlv27gHBz0x5KQHdGjYNYmQ5b9nkyYxMP0C7DOXmINBEr
	bj6ZJxYHkykBEvakPbeeS1K3SJ1DQ9y2HXFRfgjNqpmWttgwaVxlHMNKrwPYfwhmMQu2EDR926O
	0YCx4f4GaHDMpzUPwUNfdT4NUh+/iFrFlkgcv0sUb/iipxVtYKBTRCt8sWV1k20P4LBJRh+/HOl
	L5wurmQMQXRm8HTfdL4uVK+tlkI9A46m9+LP6p70TQE9CIzMpvaSpuOGpUY/5M3AdPnftyw=
X-Received: by 2002:a05:6512:6618:b0:5c1:5a43:6291 with SMTP id 2adb3069b0e04-5c3411d0a32mr270887e87.20.1795798633460;
        Fri, 27 Nov 2026 08:57:13 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd04096asm6045081e87.47.2026.11.27.08.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:57:12 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	m.szyprowski@samsung.com,
	kuba@kernel.org,
	u.kleine-koenig@baylibre.com
Subject: [PATCH v4 2/2] alpha: enable contiguous memory allocation for coherent DMA
Date: Fri, 27 Nov 2026 17:55:50 +0100
Message-ID: <20261127165626.1352471-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127165626.1352471-1-linmag7@gmail.com>
References: <20261127165626.1352471-1-linmag7@gmail.com>
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
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 .../io/dma-contiguous/arch-support.txt        |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/kernel/pci_iommu.c                 | 20 +++++++++++++------
 arch/alpha/kernel/setup.c                     | 15 ++++++++++++++
 4 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/Documentation/features/io/dma-contiguous/arch-support.txt b/Documentation/features/io/dma-contiguous/arch-support.txt
index 3c6ce35d704f..6cd205a991f6 100644
--- a/Documentation/features/io/dma-contiguous/arch-support.txt
+++ b/Documentation/features/io/dma-contiguous/arch-support.txt
@@ -7,5 +7,5 @@
     |         arch |status|
     -----------------------
-    |       alpha: | TODO |
+    |       alpha: |  ok  |
     |         arc: | TODO |
     |         arm: |  ok  |
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index e7e7cb37d670..79700e350603 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -32,4 +32,5 @@ config ALPHA
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_KMEMLEAK
+	select HAVE_DMA_CONTIGUOUS
 	select HAVE_GUP_FAST
 	select HAVE_KERNEL_BZIP2
diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 955b6ca61627..6298618aa7e1 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -409,13 +409,19 @@ static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	void *cpu_addr;
-	long order = get_order(size);
+	struct page *page;
 
+	size = PAGE_ALIGN(size);
 	gfp &= ~GFP_DMA;
 
 try_again:
-	cpu_addr = (void *)__get_free_pages(gfp | __GFP_ZERO, order);
+	/* A low-memory retry must not return the same unsuitable CMA pages. */
+	page = (gfp & GFP_DMA) ? NULL :
+		dma_alloc_contiguous(dev, size, gfp, dev_to_node(dev));
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
@@ -427,5 +433,5 @@ static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 	*dma_addrp = pci_map_single_1(pdev, virt_to_phys(cpu_addr), size, 0);
 	if (*dma_addrp == DMA_MAPPING_ERROR) {
-		free_pages((unsigned long)cpu_addr, order);
+		dma_free_contiguous(dev, virt_to_page(cpu_addr), size);
 		if (alpha_mv.mv_pci_tbi || (gfp & GFP_DMA))
 			return NULL;
@@ -453,6 +459,8 @@ static void alpha_pci_free_coherent(struct device *dev, size_t size,
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
+
+	size = PAGE_ALIGN(size);
 	dma_unmap_single(&pdev->dev, dma_addr, size, DMA_BIDIRECTIONAL);
-	free_pages((unsigned long)cpu_addr, get_order(size));
+	dma_free_contiguous(dev, virt_to_page(cpu_addr), size);
 
 	DBGA2("pci_free_consistent: [%llx,%zx] from %ps\n",
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index f21a7c8f5213..f40a87b30a7c 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -32,4 +32,5 @@
 #include <linux/platform_device.h>
 #include <linux/memblock.h>
+#include <linux/dma-map-ops.h>
 #include <linux/pci.h>
 #include <linux/seq_file.h>
@@ -585,4 +586,18 @@ setup_arch(char **cmdline_p)
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

