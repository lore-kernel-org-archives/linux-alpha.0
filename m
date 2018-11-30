From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 18/23] iommu/intel: small map_page cleanup
Date: Fri, 30 Nov 2018 14:22:26 +0100
Message-ID: <20181130132231.16512-19-hch@lst.de>
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
        bh=QOdsrc/faqsZxnU8wIA40QZooNAmBFxTGNTU9fzg/4E=; b=V/EM1xYN3rmZMWR+v1LC70Xb0f
        Y8zhSJdnLRfLfm6hJkATYs/RrIRQeyjZsWsbCbek89q2hBMpdfp/3f8k4BEcg2SIdxqNTQ7FlShn7
        eK04xBXeWEHDGgCFoz1E25+fNb2wqjm86TQfSse9X+5EAQwCbZmk1dMibOOp99Sv2qkSY8LfNnG/V
        6Pz/hlms5hjSjko8yiy3SVpKN97J4dL99cOVCikEB0nAOx8prEWQff57xXXOvSt0sI571ib+8Lb7d
        6FUS4cZUeryqDZ1LZ+mD3+qaxUx3Q9g5/i6jydq5gFhhijf8/9mFPpZI2VmoUR4sMbHQTq7tFFsqa
    
In-Reply-To: <20181130132231.16512-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: iommu@lists.linux-foundation.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jon Mason <jdmason@kudzu.us>, Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org

Pass the page + offset to the low-level __iommu_map_single helper
(which gets renamed to fit the new calling conventions) as both
callers have the page at hand.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/intel-iommu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 41a4b8808802..66b4444398ae 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -3597,9 +3597,11 @@ static int iommu_no_mapping(struct device *dev)
 	return 0;
 }
 
-static dma_addr_t __intel_map_single(struct device *dev, phys_addr_t paddr,
-				     size_t size, int dir, u64 dma_mask)
+static dma_addr_t __intel_map_page(struct device *dev, struct page *page,
+				   unsigned long offset, size_t size, int dir,
+				   u64 dma_mask)
 {
+	phys_addr_t paddr = page_to_phys(page) + offset;
 	struct dmar_domain *domain;
 	phys_addr_t start_paddr;
 	unsigned long iova_pfn;
@@ -3661,8 +3663,7 @@ static dma_addr_t intel_map_page(struct device *dev, struct page *page,
 				 enum dma_data_direction dir,
 				 unsigned long attrs)
 {
-	return __intel_map_single(dev, page_to_phys(page) + offset, size,
-				  dir, *dev->dma_mask);
+	return __intel_map_page(dev, page, offset, size, dir, *dev->dma_mask);
 }
 
 static void intel_unmap(struct device *dev, dma_addr_t dev_addr, size_t size)
@@ -3753,9 +3754,8 @@ static void *intel_alloc_coherent(struct device *dev, size_t size,
 		return NULL;
 	memset(page_address(page), 0, size);
 
-	*dma_handle = __intel_map_single(dev, page_to_phys(page), size,
-					 DMA_BIDIRECTIONAL,
-					 dev->coherent_dma_mask);
+	*dma_handle = __intel_map_page(dev, page, 0, size, DMA_BIDIRECTIONAL,
+				       dev->coherent_dma_mask);
 	if (*dma_handle)
 		return page_address(page);
 	if (!dma_release_from_contiguous(dev, page, size >> PAGE_SHIFT))
-- 
2.19.1

