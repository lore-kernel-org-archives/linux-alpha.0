From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 11/24] parisc/sba_iommu: remove the mapping_error dma_map_ops method
Date: Thu, 22 Nov 2018 15:03:07 +0100
Message-ID: <20181122140320.24080-12-hch@lst.de>
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
        bh=y70DZ2fm3EDwoGaOi1zf4filovpEWIC1jIMmvTH5Sw4=; b=PMWEBKt/ZL7bRjq4JpWVFKdr+E
        yYcQu55JgoG0MAUdbLMcmPkwn9ZgNF6dEh04w0ZMAHfE+fl+S7IdZ0ZgPWj1fICGGdmxI4KRw9mrO
        FX2zfl8OMY9QkcRO+tbZyAF0D3LNZi+YjTKS/nga6PL47rwCQclj2iFIPmVrMaWu7QbL3bAxFOw/q
        VQL0ci0MDVBaqhfaSHKafyox+ahcGq6i0QyQtwTkLe96KT7xqPGMDYqs2vT7dR4CHSf1cl9Tsr8wb
        Loqfr9IS5DkCgpCxspcJzZ1EEZg5B9s2TKXakqxFEa8QgiI49ON7s+M5x+4tvQ9DqXpmh8tAypHXX
    
In-Reply-To: <20181122140320.24080-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: iommu@lists.linux-foundation.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jon Mason <jdmason@kudzu.us>, Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org

The SBA iommu code already returns (~(dma_addr_t)0x0) on mapping
failures, so we can switch over to returning DMA_MAPPING_ERROR and let
the core dma-mapping code handle the rest.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/parisc/sba_iommu.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index c1e599a429af..452d306ce5cb 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -93,8 +93,6 @@
 
 #define DEFAULT_DMA_HINT_REG	0
 
-#define SBA_MAPPING_ERROR    (~(dma_addr_t)0)
-
 struct sba_device *sba_list;
 EXPORT_SYMBOL_GPL(sba_list);
 
@@ -725,7 +723,7 @@ sba_map_single(struct device *dev, void *addr, size_t size,
 
 	ioc = GET_IOC(dev);
 	if (!ioc)
-		return SBA_MAPPING_ERROR;
+		return DMA_MAPPING_ERROR;
 
 	/* save offset bits */
 	offset = ((dma_addr_t) (long) addr) & ~IOVP_MASK;
@@ -1080,11 +1078,6 @@ sba_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents,
 
 }
 
-static int sba_mapping_error(struct device *dev, dma_addr_t dma_addr)
-{
-	return dma_addr == SBA_MAPPING_ERROR;
-}
-
 static const struct dma_map_ops sba_ops = {
 	.dma_supported =	sba_dma_supported,
 	.alloc =		sba_alloc,
@@ -1093,7 +1086,6 @@ static const struct dma_map_ops sba_ops = {
 	.unmap_page =		sba_unmap_page,
 	.map_sg =		sba_map_sg,
 	.unmap_sg =		sba_unmap_sg,
-	.mapping_error =	sba_mapping_error,
 };
 
 
-- 
2.19.1

