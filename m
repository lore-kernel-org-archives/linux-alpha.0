Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562FC377EA7
	for <linux-alpha@vger.kernel.org>; Mon, 24 Aug 2026 18:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787595115; cv=none; b=Ziv2usaAD9QEFlpkRpNxS5Ueyu4voGpfJo45qKhuVT1zNdSOE3YGlGUpvlc+wIN1DdT23Zd6a0O1BR2Q5C8oP6KIXDYEYkR2l5NVok75rmkhIvxNZ2V3yhtVwffHN39iS5SFzvpYHRYzSni53kGn75zx9e822IqnlyRHqmv2dUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787595115; c=relaxed/simple;
	bh=vgC/Nw6YHaADZa/IxWdXFcfTV8pok/WBDkFchgUIjKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cY0Mia8fIlUvn2No93KCd00h1K1SskznYbvyz+QIbIyLUM7sjrfx3Se16s0rzkQtaUaYXBcWFfITn7kH+fd2VkBuKiziJ9SyP9jfseRK8SPHtqU8/MlM+8yxUGwyuw4smKu6me7dCv40jBmLrso/Nj1BgXLm6qjigI7eMSH/tE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnsPyuIy; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnsPyuIy"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a36982a875so5770421a12.0
        for <linux-alpha@vger.kernel.org>; Mon, 24 Aug 2026 11:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787595113; x=1788199913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0mwy+LUPZKf1Yv1+uPQ52eOzsbkTlYKsOl/zfBams6E=;
        b=EnsPyuIyA4w4d6nuiac9IYyKmpXf8kh1vZDi7pe9gQQKu6GIGhAQzZC17QyMvIXXIp
         N3PycUxxtMJMF8uFzytRW1mYcJxRJsITukVR10TPJvBqap71kuzQnkFxREl6YDtB8aMh
         IRZioZcLAoIfi953EidgddHr8D23KSYYmN1My5/qnG34kTJNDdSNm0McE5Em4nZMAXEc
         JT26bWtdV48SKjoY8kOnOd/9WZITpldR2hjZGJ57+48G0RZlWqNIraaLXwaFtzOTkdwS
         8tW/Kkaovw3FhEknEh93N76/9+IKFl3Edzu2EaB5u2gXXWgi8fLVsS8KgZ2bFWeJCVe8
         Y85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787595113; x=1788199913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0mwy+LUPZKf1Yv1+uPQ52eOzsbkTlYKsOl/zfBams6E=;
        b=kI9ilpYl3GY0tHAXSpEv05Wp/PeZJBUTMoJw3AmJlnycybEx86Dss/220T3snFy5sU
         XSfePQkEzW5Ffy93NUkr3UZJ9hT9jwcHJhu/C+8mCSp1KYYHyYCZXSzRPVlQeSUT6vD/
         ztQqrWIhwZ9se6ZB9fEL8oMVPPAbFJ7IaSOhr20bR9671LD2BBDZiA9f3UtusVzB4DWF
         Y4E2+9ytFvBVKNYVzHRbdPBhFQWkuek+ZXsEWu1/K38Q8rov+iOvzjTOKoYmGpq3T5Zz
         M4mHdVtWamRNNYWkAtWx8+sjZc106OxuTz5sNan3oKJ5uhM4Q7gohrQ74e9yOlx+XaKW
         V31Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqkn3q7fo5fAuelxm6mog/gWT0yBG9TJghWGfLLYrYxM0saFtyOI/1xMAt7SghdjLQgkN5qhBsE7CDqRw==@vger.kernel.org
X-Gm-Message-State: AFuF++n4Icps8OiFPPespdUt5QUsLwIVNJpXE/a0shM4lmVmwu4VCX4y
	MGC7bC8IoZjwCestfw3j39qBQTZfZfmNlXaAez8xuzNIy8Q0qSWxl28p
X-Gm-Gg: AR+sD13u1bq1j6U0i6GGs4ZTn87pAK0Cn6WxVLjdhIQwb+jFvX+W7jLDXgkOhMXzn0B
	jn6og1a9vcfkP8EeoJdimf8NI0p24WyxgXrVrbk6ZXe+7LbxrmpBI5G1q79GrAlI28QSvJ3q2Hz
	pfmSL00Ifc0mI5/N8mN8WrrpCPBVDohEky/dNydDrBSI/CM0oT9UvuUUdBEEKHtxfJvVHj4n/QO
	VFaOi6QJuaSujnEuFVq66DQ4ll4Y8dCHJXsLP9WeJQ0iT7hx6yJNoKE2N3gQqW5k31BIIrkKcxY
	L+6jiR/YmRnsQleW9YgC4bB5YxQ4TtMaWkIJ8FXskPf3s/onEBjykMrZmLmGIO8VlF1osFs2gBl
	gb6E8wDfyynECz71g/UIygXACzXg/QwlFoCsftt41eyRxRjkqAFv0Nm4BVMVSAW+2Saa43wzl8W
	5oft2fKm+mO+BKFh3V9Ib3GMPtUFm2d2OTjAv7uIVCA01MEaJI2dJfA5bm+oQqT2YrRIstPOZ2G
	TELLVTDHIHrq7DI0VvlvlFd1wHbEeQ=
X-Received: by 2002:a05:6402:249f:b0:6a3:ebe1:c2c2 with SMTP id 4fb4d7f45d1cf-6a42f14dfacmr34920988a12.2.1787595112494;
        Mon, 24 Aug 2026 11:11:52 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59dd550bcsm10586910a12.0.2026.08.24.11.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:11:52 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: Magnus Lindholm <linmag7@gmail.com>,
	Maciej Rozycki <macro@orcam.me.uk>
Subject: [PATCH v2 1/2] alpha: respect dev->bus_dma_limit as the effective DMA address ceiling
Date: Mon, 24 Aug 2026 19:36:53 +0200
Message-ID: <20260824181126.3559638-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824181126.3559638-1-linmag7@gmail.com>
References: <20260824181126.3559638-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Alpha PCI DMA-mapping code has no way for platform code to cap a
device's addressable range below what it claims via dma_set_mask(),
even though dev->bus_dma_limit exists precisely for an upstream bridge
or bus to impose exactly that kind of constraint. Wire it in as the
effective upper bound everywhere an address range gets checked or a
DMA window gets selected:

 - pci_map_single_1() and sg_fill() already bound-check the direct-map
   window against max_dma; make max_dma itself
   min_not_zero(dma_mask, bus_dma_limit), and add the same
   paddr + dac_offset + size - 1 <= max_dma check to their DAC paths,
   which previously had no bound check at all beyond the bitmask test
   in pci_dac_dma_supported().
 - alpha_pci_map_sg()'s no-IOMMU fallback path (no alpha_mv.mv_pci_tbi)
   picks up the same ceiling instead of unconditionally using -1.
 - sg_fill() gains an explicit failure return when there is no IOMMU
   arena and the direct/DAC paths didn't apply. Previously this relied
   on max_dma = -1 making the (unchecked) DAC branch always succeed
   whenever dac_allowed was true; now that DAC has a real bound check,
   that combination is reachable and must not fall through into
   iommu_arena_alloc() with a NULL arena. Mirrors the DMA_MAPPING_ERROR
   return pci_map_single_1() already gives for the same situation.

DAC capability itself is unchanged: pci_dac_dma_supported() still
determines whether a device's DMA mask can address the DAC bit at all
(a capability question). bus_dma_limit is enforced separately, at each
mapping site, against the resulting address.

dev->bus_dma_limit is a numeric upper bound on the end address of a
transfer (see dma_capable() in include/linux/dma-direct.h), not
another bitmask to AND against.

bus_dma_limit defaults to 0 and min_not_zero() ignores a zero operand,
so all of this is a no-op until something actually sets bus_dma_limit
on a device - no behaviour change by itself.

This is infrastructure for a following patch that uses bus_dma_limit to
work around a Tsunami/Typhoon-specific DAC issue; kept separate since
it's a generic, self-contained change with no policy attached.

Suggested-by: Maciej Rozycki <macro@orcam.me.uk>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/pci_iommu.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 955b6ca61627..6191dcd560bd 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -228,7 +228,8 @@ pci_map_single_1(struct pci_dev *pdev, phys_addr_t paddr, size_t size,
 		 int dac_allowed)
 {
 	struct pci_controller *hose = pdev ? pdev->sysdata : pci_isa_hose;
-	dma_addr_t max_dma = pdev ? pdev->dma_mask : ISA_DMA_MASK;
+	dma_addr_t max_dma = pdev ? min_not_zero(pdev->dma_mask,
+		pdev->dev.bus_dma_limit) : ISA_DMA_MASK;
 	unsigned long offset = offset_in_page(paddr);
 	struct pci_iommu_arena *arena;
 	long npages, dma_ofs, i;
@@ -250,7 +251,8 @@ pci_map_single_1(struct pci_dev *pdev, phys_addr_t paddr, size_t size,
 #endif
 
 	/* Next, use DAC if selected earlier.  */
-	if (dac_allowed) {
+	if (dac_allowed
+	    && paddr + alpha_mv.pci_dac_offset + size - 1 <= max_dma) {
 		ret = paddr + alpha_mv.pci_dac_offset;
 
 		DBGA2("pci_map_single: [%pa,%zx] -> DAC %llx from %ps\n",
@@ -549,7 +551,8 @@ sg_fill(struct device *dev, struct scatterlist *leader, struct scatterlist *end,
 #endif
 
 	/* If physically contiguous and DAC is available, use it.  */
-	if (leader->dma_address == 0 && dac_allowed) {
+	if (leader->dma_address == 0 && dac_allowed
+	    && paddr + alpha_mv.pci_dac_offset + size - 1 <= max_dma) {
 		out->dma_address = paddr + alpha_mv.pci_dac_offset;
 		out->dma_length = size;
 
@@ -559,6 +562,10 @@ sg_fill(struct device *dev, struct scatterlist *leader, struct scatterlist *end,
 		return 0;
 	}
 
+	/* No IOMMU and direct/DAC didn't fit: nothing left to try.  */
+	if (!arena)
+		return -1;
+
 	/* Otherwise, we'll use the iommu to make the pages virtually
 	   contiguous.  */
 
@@ -654,12 +661,14 @@ static int alpha_pci_map_sg(struct device *dev, struct scatterlist *sg,
 	/* Second, figure out where we're going to map things.  */
 	if (alpha_mv.mv_pci_tbi) {
 		hose = pdev ? pdev->sysdata : pci_isa_hose;
-		max_dma = pdev ? pdev->dma_mask : ISA_DMA_MASK;
+		max_dma = pdev ? min_not_zero(pdev->dma_mask,
+			pdev->dev.bus_dma_limit) : ISA_DMA_MASK;
 		arena = hose->sg_pci;
 		if (!arena || arena->dma_base + arena->size - 1 > max_dma)
 			arena = hose->sg_isa;
 	} else {
-		max_dma = -1;
+		max_dma = pdev ? min_not_zero(pdev->dma_mask,
+			pdev->dev.bus_dma_limit) : -1;
 		arena = NULL;
 		hose = NULL;
 	}
@@ -719,7 +728,8 @@ static void alpha_pci_unmap_sg(struct device *dev, struct scatterlist *sg,
 		return;
 
 	hose = pdev ? pdev->sysdata : pci_isa_hose;
-	max_dma = pdev ? pdev->dma_mask : ISA_DMA_MASK;
+	max_dma = pdev ? min_not_zero(pdev->dma_mask,
+		pdev->dev.bus_dma_limit) : ISA_DMA_MASK;
 	arena = hose->sg_pci;
 	if (!arena || arena->dma_base + arena->size - 1 > max_dma)
 		arena = hose->sg_isa;
-- 
2.53.0

