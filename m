From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 08/23] parisc/ccio: remove the mapping_error dma_map_ops method
Date: Fri, 30 Nov 2018 14:22:16 +0100
Message-ID: <20181130132231.16512-9-hch@lst.de>
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
        bh=UlTvCVuSLDW9AZDoMxHDIcPbv1chhpRBuQVATQStN/w=; b=TaY9OlxuHy38PAPrdIgq9qN78j
        MjsG4ecFnmOhtOM90l3CgWUT88khKSIFQK2u5jAJw6LOcVnvR0gqGTBt2KVExQ5e6ghiDz+KTblL/
        XyjdesR0GXQCE0/Y9x3F3cnuIUOfXzuIZp6fNULYdiKHWP7l6oSSktJ+QxsYoFzLNvTsv9PMrojjC
        Pr05lng/aeiX9pvIFWw4vvxqqnPL9AkwyYQEV0igacOpOaYWIewmH4h9Cz1cvQWkRlNutZRvDUk2W
        +LNHH6fjq7+UJuD4PNBiXqKdK/ayBTThwbJgh9Y9/t+vKwZ5To9gcMQSXyYqfhlC38rtWa8G8dj+A
    
In-Reply-To: <20181130132231.16512-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: iommu@lists.linux-foundation.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jon Mason <jdmason@kudzu.us>, Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org

The CCIO iommu code already returns (~(dma_addr_t)0x0) on mapping
failures, so we can switch over to returning DMA_MAPPING_ERROR and let
the core dma-mapping code handle the rest.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/parisc/ccio-dma.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index 701a7d6a74d5..714aac72df0e 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -110,8 +110,6 @@
 #define CMD_TLB_DIRECT_WRITE 35         /* IO_COMMAND for I/O TLB Writes     */
 #define CMD_TLB_PURGE        33         /* IO_COMMAND to Purge I/O TLB entry */
 
-#define CCIO_MAPPING_ERROR    (~(dma_addr_t)0)
-
 struct ioa_registers {
         /* Runway Supervisory Set */
         int32_t    unused1[12];
@@ -740,7 +738,7 @@ ccio_map_single(struct device *dev, void *addr, size_t size,
 	BUG_ON(!dev);
 	ioc = GET_IOC(dev);
 	if (!ioc)
-		return CCIO_MAPPING_ERROR;
+		return DMA_MAPPING_ERROR;
 
 	BUG_ON(size <= 0);
 
@@ -1021,11 +1019,6 @@ ccio_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents,
 	DBG_RUN_SG("%s() DONE (nents %d)\n", __func__, nents);
 }
 
-static int ccio_mapping_error(struct device *dev, dma_addr_t dma_addr)
-{
-	return dma_addr == CCIO_MAPPING_ERROR;
-}
-
 static const struct dma_map_ops ccio_ops = {
 	.dma_supported =	ccio_dma_supported,
 	.alloc =		ccio_alloc,
@@ -1034,7 +1027,6 @@ static const struct dma_map_ops ccio_ops = {
 	.unmap_page =		ccio_unmap_page,
 	.map_sg = 		ccio_map_sg,
 	.unmap_sg = 		ccio_unmap_sg,
-	.mapping_error =	ccio_mapping_error,
 };
 
 #ifdef CONFIG_PROC_FS
-- 
2.19.1

