From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 17/23] iommu: remove the mapping_error dma_map_ops method
Date: Fri, 30 Nov 2018 14:22:25 +0100
Message-ID: <20181130132231.16512-18-hch@lst.de>
References: <20181130132231.16512-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=e4mMgcXXcvLyz2AomeJXNZybJ85R0dp/1VHd9R03wIo=; b=kFFEsefAdzhsyvBsyeEINYwpyI
        Jrl8mhxxn70k4um295QT2J578+69tIufZAGnJE9eHv0rdKiZYWwjhrvretNU42WO44ENsNeA37Tn8
        0YrfKSEmyK5nTW8f081u0VOu8IsitYM7GUt8bcCRW50fX/3TX7HqAwEueTc/YyQ1rSxLugvqgLpiM
        CWo1vR1qolK+jSrFa71//42ptFUwAFapW8Lie4xeWyX+ll8jXuSSnwXU9hsszh/QBozR5cbwRczRA
        4BMWMvTWyplQoRKAq/M4picim9ORkRHgXAzzwMyr04RVZriZaM7yu1dCnjhda0B3C2arvNTWpcXca
    
In-Reply-To: <20181130132231.16512-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: iommu@lists.linux-foundation.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jon Mason <jdmason@kudzu.us>, Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org

Return DMA_MAPPING_ERROR instead of 0 on a dma mapping failure and let
the core dma-mapping code handle the rest.

Note that the existing code used AMD_IOMMU_MAPPING_ERROR to check from
a 0 return from the IOVA allocator, which is replaced with an explicit
0 as in the implementation and other users of that interface.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/amd_iommu.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 1167ff0416cf..c5d6c7c42b0a 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -55,8 +55,6 @@
 #include "amd_iommu_types.h"
 #include "irq_remapping.h"
 
-#define AMD_IOMMU_MAPPING_ERROR	0
-
 #define CMD_SET_TYPE(cmd, t) ((cmd)->data[1] |= ((t) << 28))
 
 #define LOOP_TIMEOUT	100000
@@ -2339,7 +2337,7 @@ static dma_addr_t __map_single(struct device *dev,
 	paddr &= PAGE_MASK;
 
 	address = dma_ops_alloc_iova(dev, dma_dom, pages, dma_mask);
-	if (address == AMD_IOMMU_MAPPING_ERROR)
+	if (!address)
 		goto out;
 
 	prot = dir2prot(direction);
@@ -2376,7 +2374,7 @@ static dma_addr_t __map_single(struct device *dev,
 
 	dma_ops_free_iova(dma_dom, address, pages);
 
-	return AMD_IOMMU_MAPPING_ERROR;
+	return DMA_MAPPING_ERROR;
 }
 
 /*
@@ -2427,7 +2425,7 @@ static dma_addr_t map_page(struct device *dev, struct page *page,
 	if (PTR_ERR(domain) == -EINVAL)
 		return (dma_addr_t)paddr;
 	else if (IS_ERR(domain))
-		return AMD_IOMMU_MAPPING_ERROR;
+		return DMA_MAPPING_ERROR;
 
 	dma_mask = *dev->dma_mask;
 	dma_dom = to_dma_ops_domain(domain);
@@ -2504,7 +2502,7 @@ static int map_sg(struct device *dev, struct scatterlist *sglist,
 	npages = sg_num_pages(dev, sglist, nelems);
 
 	address = dma_ops_alloc_iova(dev, dma_dom, npages, dma_mask);
-	if (address == AMD_IOMMU_MAPPING_ERROR)
+	if (address == DMA_MAPPING_ERROR)
 		goto out_err;
 
 	prot = dir2prot(direction);
@@ -2627,7 +2625,7 @@ static void *alloc_coherent(struct device *dev, size_t size,
 	*dma_addr = __map_single(dev, dma_dom, page_to_phys(page),
 				 size, DMA_BIDIRECTIONAL, dma_mask);
 
-	if (*dma_addr == AMD_IOMMU_MAPPING_ERROR)
+	if (*dma_addr == DMA_MAPPING_ERROR)
 		goto out_free;
 
 	return page_address(page);
@@ -2678,11 +2676,6 @@ static int amd_iommu_dma_supported(struct device *dev, u64 mask)
 	return check_device(dev);
 }
 
-static int amd_iommu_mapping_error(struct device *dev, dma_addr_t dma_addr)
-{
-	return dma_addr == AMD_IOMMU_MAPPING_ERROR;
-}
-
 static const struct dma_map_ops amd_iommu_dma_ops = {
 	.alloc		= alloc_coherent,
 	.free		= free_coherent,
@@ -2691,7 +2684,6 @@ static const struct dma_map_ops amd_iommu_dma_ops = {
 	.map_sg		= map_sg,
 	.unmap_sg	= unmap_sg,
 	.dma_supported	= amd_iommu_dma_supported,
-	.mapping_error	= amd_iommu_mapping_error,
 };
 
 static int init_reserved_iova_ranges(void)
-- 
2.19.1

