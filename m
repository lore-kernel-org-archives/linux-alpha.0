Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650032;
	b=qJ/XRiJ/8lEgu3AcYvI/TPf02Cv8U6YBhasdVLqTWOFoslZ6DHewbokvr7VbnOxzNxzz
	 xujf8e701MmuNe4kqeaTgCumdTF24uCfYk7V/ncZHcE4z3vmD/0fL0moX58Xda/JprkzX
	 AVLAxNZ7pFFdKpMaoQPNeofbPGXYocp1gvKZwL7hwrsnqW7awOTHLhFcg2xW2yvEZV056
	 xJBdAnPACzDnOWAGUvCq31mUeQzd8k5zC31TALTA/u2b76ivt6DH5qPQ7oPGTWCDVFtYo
	 NfGbinHPzjCNtpyRL1GfhbY5N/rXlP/IrwLKuT1KC7ewGgopx0fQalmeVBOxGXXdktQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2cQLfnjZWUlV56UGF6ZhYs8eyIfa0Jm2sZsWqOlFJK4=;
	b=GnLo9R2d/nb8RMEsAlO1erdnqTPSOQnDjtr0B3A/KuXMi8bDPykKPxTlTg29gkEfxv+Z
	 7D+M4O4rZQCouKtYAcqAQfS3swvsPiIJNzDqnaQyTgIp0A566BLHSRjTFRprflITSnf9c
	 NPn+ITCG0h29g47iasgETMdcFXf7dNRtG5o2CuN4TwsqQFYiXeVmIVxG40IP+PAodIWHt
	 oFnjPl34/rp60K7YVDZhWf0ChBFAdA13ClZ195keB8tfVzfsKZJve8qPg3zE7Dl3TTbug
	 Wkv85z3xtu7AuRiT6aBdh+P+2mclTmuf+f+lwVS2XFa0HYlTQJPpLR9ABbKZ6kYUZoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QmQwx9u8;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1316606A33B
	for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 09:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1316606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QmQwx9u8
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50604721c8so362990766b.3
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 01:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794650030; x=1795254830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2cQLfnjZWUlV56UGF6ZhYs8eyIfa0Jm2sZsWqOlFJK4=;
        b=QmQwx9u8VwfkfsPjvQH3ZBNfSoRCW6ijA6pQhNGzam5Ezu2UvkhYs/il4ycOUWrEmy
         Ypc3nu0MEbVlEgpj7fT0dG9ktAO+OUfqkLNTgAIw/y6yg4I2ey7pTpTdXIG4y+4xD3vW
         2zL5c84XXp3/74Z87/nZtoNIcV1XpN3o3CqBdQkiZ4gTk23yMrLzukiJjV4w8qzDHh5+
         xySZsA0RrUOqIa6F2pDotLsTwnJbesym1VE26ntd45qPeFkA1uRZDTG43NwkHn7yO3yK
         zoKaib0ZLUHrUiy5kqPD0ztA4GM0RwK28GSIhFVvkTC/Ses1KbASsVI0da4BAdy6aNs8
         lC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650030; x=1795254830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2cQLfnjZWUlV56UGF6ZhYs8eyIfa0Jm2sZsWqOlFJK4=;
        b=VSRPzn3Is2aVSgVkQLHhB42i/xbel4DA5SuB8lf+wxjwZmbNg7hULUYCy/WBTAa/pO
         HfBupr7vyW2TD6hB3ZOhJNZP1YzIM5h8k2E5vt+Gd33DXAPjxHzNFsfGpxGTmkQJYUOS
         K1vfcB+ksJCIq3JucmtjKtP5Xv3kIEeGCRjXZGYVSU8KsY/g0ECheAJ3UXVxeCv7fkUY
         EZHxVUpPAqSFl0kHMKPtV+J4q+oVS5YmbYPoV5XWQHdZOyvCKdjaTXWUVoHBShzzeltu
         qslgyQkRp0p+0h5Ylu0UGbkeBjhBXV3F5s6WnPl2B6TySDcmBXutQQ0cBMXvWrfhx+2W
         U/og==
X-Forwarded-Encrypted: i=1; AL+hErElI/gs2nM2YB60f5jCvi0eqYUar+WREGqudkEmm/F2aez3tHypYgiCA8qVnLz5I0AokWJBhjc6Zrgtmw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/4kN+f2SAHLoBX2YP57iuUFYc1zI7kniGrODNyKzSxBUmtFBDF
	W0in0+lKceGibto78yIiolGwG8eDcoNXBg62N00PjZdRTll07p4TWMYi
X-Gm-Gg: AYBFou1W1DHUsJqfgFMtdjRczYqNF9K+8/mx1hb9d4zNPXWAQ3IvhPRJuXcCDvIVW4N
	qa14Jvu90Y3rwvQQujBITzzFh4RK6g3FdDWGp7Eb3vGmOb1+iT5jXgdRSc/R4EyvyZDF0d6WME3
	XSj/frHfeOBu4ImansdEjGaeclHQQArcuQamPzEGZ/XRmL75xsaBrB1yXYVLIJKUtYcag2wqna6
	7gMm5bJvfKxR+K3wIoCxfnnFst82SbyBxnN4MiDi9xyCuxP1zsR3pKn2lc466SyxnbX+ABuKUH3
	kOwQp9geb3s+JHBzwmFHBg0ZS5qppwqtk0l+ELdGO/fgCV+7nSfRjy1YN9PYYwR+fg9KDNHwYx3
	ltzJHknoma25Mc2cni8suVXZWhvv+bzXefVgnwLNuW2x6fjMy8C6hqjfNU/kA331+Hec5p054/N
	AdrNPqtxZ1/W5PqYs+fJFQb44qOZPutbEZNV/7wz4+NkCJzhAMsz1OR1RYbhWHC5DC0aJDWfdvE
	FxiQY5Xw+5HjmqoBAfohliSXJY/dV+15X1sj/W0ZpfaZVo8wBXE3rf5u4nA1yIBaOHtWkEnsA6g
	9j+JvWmo2YfshlGe/qOymDppqUyKfGz9RxQMpWvCTtlrz9OzLwN//K8XRhz9oNqVR1BzXas=
X-Received: by 2002:a17:906:4fd0:b0:c31:e958:408c with SMTP id a640c23a62f3a-c5096410456mr443648666b.38.1794650030384;
        Sat, 14 Nov 2026 01:53:50 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b236d4sm197311266b.18.2026.11.14.01.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:53:49 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v2 2/2] alpha: enable contiguous memory allocation for coherent DMA
Date: Sat, 14 Nov 2026 10:53:17 +0100
Message-ID: <20261114095335.1283016-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114095335.1283016-1-linmag7@gmail.com>
References: <20261114095335.1283016-1-linmag7@gmail.com>
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

With CONFIG_DMA_CMA=y, the default CMA_SIZE_MBYTES setting reserves
16 MiB without a cma= argument. cma=0 disables the default area.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 .../features/io/dma-contiguous/arch-support.txt   |  2 +-
 arch/alpha/Kconfig                                |  1 +
 arch/alpha/kernel/pci_iommu.c                     | 13 +++++++++----
 arch/alpha/kernel/setup.c                         | 15 +++++++++++++++
 4 files changed, 26 insertions(+), 5 deletions(-)

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
index 955b6ca61627..0337bcef26cb 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -408,12 +408,17 @@ static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	void *cpu_addr;
-	long order = get_order(size);
+	struct page *page;
 
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
 		printk(KERN_INFO "pci_alloc_consistent: "
 		       "get_free_pages failed from %ps\n",
@@ -426,7 +431,7 @@ static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 
 	*dma_addrp = pci_map_single_1(pdev, virt_to_phys(cpu_addr), size, 0);
 	if (*dma_addrp == DMA_MAPPING_ERROR) {
-		free_pages((unsigned long)cpu_addr, order);
+		dma_free_contiguous(dev, virt_to_page(cpu_addr), size);
 		if (alpha_mv.mv_pci_tbi || (gfp & GFP_DMA))
 			return NULL;
 		/* The address doesn't fit required mask and we
@@ -453,7 +458,7 @@ static void alpha_pci_free_coherent(struct device *dev, size_t size,
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	dma_unmap_single(&pdev->dev, dma_addr, size, DMA_BIDIRECTIONAL);
-	free_pages((unsigned long)cpu_addr, get_order(size));
+	dma_free_contiguous(dev, virt_to_page(cpu_addr), size);
 
 	DBGA2("pci_free_consistent: [%llx,%zx] from %ps\n",
 	      dma_addr, size, __builtin_return_address(0));
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index c7b7ebcc47b6..0cd94c9023c1 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -30,6 +30,7 @@
 #include <linux/panic_notifier.h>
 #include <linux/platform_device.h>
 #include <linux/memblock.h>
+#include <linux/dma-map-ops.h>
 #include <linux/pci.h>
 #include <linux/seq_file.h>
 #include <linux/root_dev.h>
@@ -582,6 +583,20 @@ setup_arch(char **cmdline_p)
 	/* Parse early options before reserving memory for DMA CMA. */
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

