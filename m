From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v3 08/21] ia64/sba_iommu: return error code from sba_map_sg_attrs()
Date: Thu, 29 Jul 2021 14:15:26 -0600
Message-ID: <20210729201539.5602-9-logang@deltatee.com>
References: <20210729201539.5602-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=GqC6MNUep++aB8fDrjh2DnNmBSYDqSi9PqIeeLTquj0=; b=LLuvoQ8LNAwGPJjD/wLm0mrBAc
        xbD2+YBAeaE8xLVuws8WYIhL865lolO439JWs4hG29ZMaZpyZ+/QfwlE8/VZHUNSnaJ4EV23A8ctj
        hBOiZWYwKfZzlxtiQoJZQy9oH8VQN3kDLCN/8H9lSdQuAaHzAnK09o+g7cDqTvNHza10473jXozWE
        DTFPruGncU75bJs/v9ACnBlhkrufLVZBPsmKQaQdFQyjBb8z/CiIdvmeiY2Q/Ug5u8U8xT0uOeG1h
        uUoO6EnXb+visuhNQGbpE4OFCgf3TAnhFoUwDzwTIHFqZG5EOc/o1Vp6UCWa6z1e5NVKsw9vKKRLu
        4D8Tq1Sw==;
In-Reply-To: <20210729201539.5602-1-logang@deltatee.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>, Michael Ellerman <mpe@ellerman.id.au>, Niklas Schnelle <schnelle@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

In the case of a dma_mapping_error() return -EIO as the actual cause
is opaque here.

sba_coalesce_chunks() may only presently fail if sba_alloc_range()
fails, which in turn only fails if the iommu is out of mapping
resources, hence a -ENOMEM is used in that case.

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/ia64/hp/common/sba_iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/ia64/hp/common/sba_iommu.c b/arch/ia64/hp/common/sba_iommu.c
index 9148ddbf02e5..430c166b68cd 100644
--- a/arch/ia64/hp/common/sba_iommu.c
+++ b/arch/ia64/hp/common/sba_iommu.c
@@ -1458,8 +1458,8 @@ static int sba_map_sg_attrs(struct device *dev, struct scatterlist *sglist,
 		sglist->dma_length = sglist->length;
 		sglist->dma_address = sba_map_page(dev, sg_page(sglist),
 				sglist->offset, sglist->length, dir, attrs);
-		if (dma_mapping_error(dev, sglist->dma_address))
-			return 0;
+		if(dma_mapping_error(dev, sglist->dma_address))
+			return -EIO;
 		return 1;
 	}
 
@@ -1486,7 +1486,7 @@ static int sba_map_sg_attrs(struct device *dev, struct scatterlist *sglist,
 	coalesced = sba_coalesce_chunks(ioc, dev, sglist, nents);
 	if (coalesced < 0) {
 		sba_unmap_sg_attrs(dev, sglist, nents, dir, attrs);
-		return 0;
+		return -ENOMEM;
 	}
 
 	/*
-- 
2.20.1

