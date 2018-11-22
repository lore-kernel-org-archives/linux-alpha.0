From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 15/24] ia64/sba_iommu: remove the mapping_error dma_map_ops method
Date: Thu, 22 Nov 2018 15:03:11 +0100
Message-ID: <20181122140320.24080-16-hch@lst.de>
References: <20181122140320.24080-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=y8IXpz+vHV4sV1EV60laUHrf3VrBs0t8ze9bOFO9F9A=; b=Mn4Zow4drf5CR+YPou85ikSi8B
        nA4GgccHKkLxhdumTjdHme1lbKoP6IChc8sYTvNuXD63gRlDGnRFIub8O/sJNmCRtyAj9Tl+DD7L9
        kVfKeEvcqBWInFPFZnpZcIksUMXjlrcAIi+BcSKvrw1HMBBAsiq8J3Mal+eZ4aTXenWSOrc1PxggH
        hyerC44cgG42jGH6aAP1aAWcmyw8t6QN2Uoe3K4YCbz3iVcWCRjezpDkz+42z5RAcg397BRwkPTzo
        K7KUBv33SWdDWZ+UpZRlrfuRUxo3Bq6OR2M2Yk7q0BBH2N8f1s0QdUvvWBcOxlryh9PfbewzC+QtY
    
In-Reply-To: <20181122140320.24080-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: iommu@lists.linux-foundation.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jon Mason <jdmason@kudzu.us>, Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org

Return DMA_MAPPING_ERROR instead of 0 on a dma mapping failure and let
the core dma-mapping code handle the rest.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/ia64/hp/common/sba_iommu.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/ia64/hp/common/sba_iommu.c b/arch/ia64/hp/common/sba_iommu.c
index b953282d4704..0316af2cb426 100644
--- a/arch/ia64/hp/common/sba_iommu.c
+++ b/arch/ia64/hp/common/sba_iommu.c
@@ -974,7 +974,7 @@ static dma_addr_t sba_map_page(struct device *dev, struct page *page,
 
 	pide = sba_alloc_range(ioc, dev, size);
 	if (pide < 0)
-		return 0;
+		return DMA_MAPPING_ERROR;
 
 	iovp = (dma_addr_t) pide << iovp_shift;
 
@@ -2151,11 +2151,6 @@ static int sba_dma_supported (struct device *dev, u64 mask)
 	return ((mask & 0xFFFFFFFFUL) == 0xFFFFFFFFUL);
 }
 
-static int sba_dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
-{
-	return 0;
-}
-
 __setup("nosbagart", nosbagart);
 
 static int __init
@@ -2189,7 +2184,6 @@ const struct dma_map_ops sba_dma_ops = {
 	.map_sg			= sba_map_sg_attrs,
 	.unmap_sg		= sba_unmap_sg_attrs,
 	.dma_supported		= sba_dma_supported,
-	.mapping_error		= sba_dma_mapping_error,
 };
 
 void sba_dma_init(void)
-- 
2.19.1

