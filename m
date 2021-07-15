From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v1 04/16] dma-iommu: Return error code from iommu_dma_map_sg()
Date: Thu, 15 Jul 2021 10:45:32 -0600
Message-ID: <20210715164544.6827-5-logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Cc:To:From:content-disposition;
	bh=uu4aeN6jLZDDSmgkCHoBLJNdbMQcxeI5DFxw3zZTSL0=; b=gyTcP6BppoSR64QEvT/6KtgUd4
	Cqacpd6zTCyD395IziWLZMvonIdoJpuFag5HZmfxDEthN0GdLzlhj32QyIroM8uAQZdE22g12YATi
	H/jKwIc1CJgKU96vcbzADV+HUKkeUUeUFk+I0FiduEZUx5pgGdOEotFQCunQ0YeFwOqFZM2XWMQhU
	0S8xCAMxaVx0Uzm+K7FrDJH4ongykXe/b91PI7moGdLy+Crm9NdgjqolQDFXGbGxivk1uQzDkzKdX
	a8WiPtvsM8g1Ej+a/P2jxuyWh9XeVk+p/okqS8f0rUiHP3ocghhh/0BeqR8n09yHS2+/br3O+Kb2h
	Jn8Vn66A==;
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>

Pass through appropriate error codes from iommu_dma_map_sg() now that
the error code will be passed through dma_map_sgtable().

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
---
 drivers/iommu/dma-iommu.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 98ba927aee1a..9d35e9994306 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -972,7 +972,7 @@ static int iommu_dma_map_sg_swiotlb(struct device *dev, struct scatterlist *sg,
 
 out_unmap:
 	iommu_dma_unmap_sg_swiotlb(dev, sg, i, dir, attrs | DMA_ATTR_SKIP_CPU_SYNC);
-	return 0;
+	return -EINVAL;
 }
 
 /*
@@ -993,11 +993,14 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
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
+		if (ret)
+			return ret;
+	}
 
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 		iommu_dma_sync_sg_for_device(dev, sg, nents, dir);
@@ -1045,14 +1048,17 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
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
@@ -1061,7 +1067,7 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	iommu_dma_free_iova(cookie, iova, iova_len, NULL);
 out_restore_sg:
 	__invalidate_sg(sg, nents);
-	return 0;
+	return ret;
 }
 
 static void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
-- 
2.20.1


