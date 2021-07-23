From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v2 17/21] xen: swiotlb: return error code from xen_swiotlb_map_sg()
Date: Fri, 23 Jul 2021 11:50:04 -0600
Message-ID: <20210723175008.22410-18-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=SvEzwpNxmVfyllnMOG86hKyCuFZgCTrDE53Ra6OCzdU=; b=AIGezHoGK3cvhuvpm9LgSCPFw+
        W39PIjEzRmI0X/NioqeEpNuXVb1zCbBKuFA4bT5I06t9NnL2eD+Akf2L/ak9iCisf4dW66hFmhAw6
        ftb1BEa7F5hkipqxWEWZ/Fj6HLGh6gRQ8WtphEiYPX9P7x1I0GEM1Xdd8XzTF6TlxjK7Us4SxGOi8
        tL4vIiFVWCnAvaZPy6kEYVkNAU7BNbN2Hsl/Lgw0seP4DnzQg5uV597ldlCZB5/GL32xRfD5KAyKz
        XBbHKprL3crIvNyGQ3V/IN9t/HbPBhcdFkUPCsJ13Du7CJo08M9AyGdHO5ZOYYNEUHRhNZVa0mEtQ
        zjT4+/FA==;
In-Reply-To: <20210723175008.22410-1-logang@deltatee.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

xen_swiotlb_map_sg() may only fail if xen_swiotlb_map_page() fails, but
xen_swiotlb_map_page() only supports returning errors as
DMA_MAPPING_ERROR. So coalesce all errors into EIO per the documentation
for dma_map_sgtable().

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
 drivers/xen/swiotlb-xen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 24d11861ac7d..85d58b720a24 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -509,7 +509,7 @@ xen_swiotlb_map_sg(struct device *dev, struct scatterlist *sgl, int nelems,
 out_unmap:
 	xen_swiotlb_unmap_sg(dev, sgl, i, dir, attrs | DMA_ATTR_SKIP_CPU_SYNC);
 	sg_dma_len(sgl) = 0;
-	return 0;
+	return -EIO;
 }
 
 static void
-- 
2.20.1

