From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v2 04/21] dma-iommu: Return error code from iommu_dma_map_sg()
Date: Fri, 23 Jul 2021 11:49:51 -0600
Message-ID: <20210723175008.22410-5-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=/XA9bvLAJiET8xClVyx9hB75GctlP2ewYMlZJlt3uAE=; b=HVJMNHeBGjTuQRAX0PgDaC3zF2
        h4cFnFeAvCNXzd9WB8YAG3qqGAv0WBWLbO2yY4NNajXtkYGAXSYNnPhoG7Lsjp3jXRGUtxG+C5tQn
        AO0Nyq1daI9kQFtb2tSUAzZkClLvu/2QNdTDESutu8/SuROXeaEliD8I20+iQ0Q2iu0v3EYLv9M04
        tvI2zgmfI0S1vEJQafhJJMTcn12/OuRwVgbR0rnxIWvsOK7Ab18O80JLZOjNRvrRT/6OZ8cEUdjVI
        0CnvcX+WKT1/RPsKegdoIVUqcHKgcZAEo1DdIxORDEfwRA67XH368HFyGiw2MOs512nK27QI9tO6q
        7PJ3h2zw==;
In-Reply-To: <20210723175008.22410-1-logang@deltatee.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>

Return appropriate error codes EINVAL or ENOMEM from
iommup_dma_map_sg(). If lower level code returns ENOMEM, then we
return it, other errors are coalesced into EINVAL.

iommu_dma_map_sg_swiotlb() returns -EIO as its an unknown error
from a call that returns DMA_MAPPING_ERROR.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
---
 drivers/iommu/dma-iommu.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 98ba927aee1a..d9aaed080e68 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -972,7 +972,7 @@ static int iommu_dma_map_sg_swiotlb(struct device *dev, struct scatterlist *sg,
 
 out_unmap:
 	iommu_dma_unmap_sg_swiotlb(dev, sg, i, dir, attrs | DMA_ATTR_SKIP_CPU_SYNC);
-	return 0;
+	return -EIO;
 }
 
 /*
@@ -993,11 +993,13 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	dma_addr_t iova;
 	size_t iova_len = 0;
 	unsigned long mask = dma_get_seg_boundary(dev);
+	ssize_t ret;
 	int i;
 
-	if (static_branch_unlikely(&iommu_deferred_attach_enabled) &&
-	    iommu_deferred_attach(dev, domain))
-		return 0;
+	if (static_branch_unlikely(&iommu_deferred_attach_enabled)) {
+		ret = iommu_deferred_attach(dev, domain);
+		goto out;
+	}
 
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 		iommu_dma_sync_sg_for_device(dev, sg, nents, dir);
@@ -1045,14 +1047,17 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	}
 
 	iova = iommu_dma_alloc_iova(domain, iova_len, dma_get_mask(dev), dev);
-	if (!iova)
+	if (!iova) {
+		ret = -ENOMEM;
 		goto out_restore_sg;
+	}
 
 	/*
 	 * We'll leave any physical concatenation to the IOMMU driver's
 	 * implementation - it knows better than we do.
 	 */
-	if (iommu_map_sg_atomic(domain, iova, sg, nents, prot) < iova_len)
+	ret = iommu_map_sg_atomic(domain, iova, sg, nents, prot);
+	if (ret < iova_len)
 		goto out_free_iova;
 
 	return __finalise_sg(dev, sg, nents, iova);
@@ -1061,7 +1066,11 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	iommu_dma_free_iova(cookie, iova, iova_len, NULL);
 out_restore_sg:
 	__invalidate_sg(sg, nents);
-	return 0;
+out:
+	if (ret == -ENOMEM)
+		return ret;
+	else
+		return -EINVAL;
 }
 
 static void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
-- 
2.20.1

