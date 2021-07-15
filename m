From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v1 02/16] dma-direct: Return appropriate error code from dma_direct_map_sg()
Date: Thu, 15 Jul 2021 10:45:30 -0600
Message-ID: <20210715164544.6827-3-logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=0So9SX+KFL5UGdS3JALTvYX2o53SL7VRdq+tjhsTXy0=; b=qqMKc5x7fyfRQyjp0HyOD1Z32b
        DzGFv9RbC3msHd0ahDXPw6wy/yg5LcJhCW0PDTt60LcgK0yaxWJRDYUVEm/BNElgrmC778Yy4Khxj
        aGJNkzEKcjYnH6edz8QuY+Tl8ve0CET9q0fadSAO5DDasNAoLugMijemySMaOpn9ulPDTRsV+Y6sH
        ukyJlT3fpoGKBhHlDl8EmUzR85XGF5eaXP1qG0RIxxvD17WUPvJycMMY1U/NB0pUxw6WhGIM2m2HT
        NoOWnt3ovvM0FRkgn+ygXT/NEfD/bqrFzfZTrmI0qK2wUhAUcbPNhILjW59tthQAwZmnqq++rIsqH
        kN3efVfw==;
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>

Now that the map_sg() op expects error codes instead of return zero on
error, convert dma_direct_map_sg() to return an error code. The
only error to return presently is EINVAL if a page could not
be mapped.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 kernel/dma/direct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index f737e3347059..803ee9321170 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -411,7 +411,7 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 
 out_unmap:
 	dma_direct_unmap_sg(dev, sgl, i, dir, attrs | DMA_ATTR_SKIP_CPU_SYNC);
-	return 0;
+	return -EINVAL;
 }
 
 dma_addr_t dma_direct_map_resource(struct device *dev, phys_addr_t paddr,
-- 
2.20.1

