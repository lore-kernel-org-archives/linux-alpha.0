From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 14/23] ia64/sn: remove the mapping_error dma_map_ops method
Date: Fri, 30 Nov 2018 14:22:22 +0100
Message-ID: <20181130132231.16512-15-hch@lst.de>
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
        bh=SIFzBEc7j6qgeNt7BuWlURIi04w4uDKFXrRX3hXECw0=; b=dNl1ixhpVaTQyOBGJtLirB9eWC
        AvJWY1+pNZWMhcyb7HWymzY0F5n/x3uQdD6GhLa16w4MTf893b+OzlRzhkPusJgs78K6sDr0BjR3c
        tWaAA50erZmOjr4Hb/j0kaRHcVWSaUjlaxMblPY0k8GbVPAwxpACUx5SfjWMKallYFJ8z757PYeOj
        CAVtVdCNWeOwBxBtsz3el5wQc+vyTo1xDD2gXEbKvRmkYx3r6ny5PcYkYRjiFZ62h8CuceVeTazNI
        GZwTJjCJB5rUmZDwjMyf2LF9k3qMXBGxnTXDWaW3UpP7MEPQ7y2B4fajTEwtbaG4B1Jpj/gxMXAyy
    
In-Reply-To: <20181130132231.16512-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: iommu@lists.linux-foundation.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jon Mason <jdmason@kudzu.us>, Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org

Return DMA_MAPPING_ERROR instead of 0 on a dma mapping failure and let
the core dma-mapping code handle the rest.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/ia64/sn/pci/pci_dma.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/ia64/sn/pci/pci_dma.c b/arch/ia64/sn/pci/pci_dma.c
index 4ce4ee4ef9f2..b7d42e4edc1f 100644
--- a/arch/ia64/sn/pci/pci_dma.c
+++ b/arch/ia64/sn/pci/pci_dma.c
@@ -196,7 +196,7 @@ static dma_addr_t sn_dma_map_page(struct device *dev, struct page *page,
 
 	if (!dma_addr) {
 		printk(KERN_ERR "%s: out of ATEs\n", __func__);
-		return 0;
+		return DMA_MAPPING_ERROR;
 	}
 	return dma_addr;
 }
@@ -314,11 +314,6 @@ static int sn_dma_map_sg(struct device *dev, struct scatterlist *sgl,
 	return nhwentries;
 }
 
-static int sn_dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
-{
-	return 0;
-}
-
 static u64 sn_dma_get_required_mask(struct device *dev)
 {
 	return DMA_BIT_MASK(64);
@@ -441,7 +436,6 @@ static struct dma_map_ops sn_dma_ops = {
 	.unmap_page		= sn_dma_unmap_page,
 	.map_sg			= sn_dma_map_sg,
 	.unmap_sg		= sn_dma_unmap_sg,
-	.mapping_error		= sn_dma_mapping_error,
 	.dma_supported		= sn_dma_supported,
 	.get_required_mask	= sn_dma_get_required_mask,
 };
-- 
2.19.1

