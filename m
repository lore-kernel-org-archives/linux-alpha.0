From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v1 13/16] xen: swiotlb: return error code from xen_swiotlb_map_sg()
Date: Thu, 15 Jul 2021 10:45:41 -0600
Message-ID: <20210715164544.6827-14-logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=v712SqpSEckB3f7bRn5BvRO69pOYG6tOz5ojT8LD73A=; b=ZaXCnoVebjGK2r9ONanYW8xyoE
        d/aBn+IIZsuZoEFaEqgbPSqT+vKCb9iPs53KbB9p5heckwbq9FJLYYzsPbEZwjA/oSwzmCwNan9H3
        d9wymXNRdMM7Ogi/JqBqg/zX+rqVe5ZWliU1yjk6OjAaFLsf+VzCAITHxjm0E3UUFPmqwThLi5jAB
        +1kSzs8ggjovcct44c4uh2C7M19dmwFVCr4t5dmJeG4ve17QFBYfsX2vNPY2R80TryX7yClClbhiB
        Mm7YL8s8QqWa6kWxFLWxSs34EoLz8X9XKPkRNOdD7KpEJAmkkZzyIplL0KzNfjb9/FjQ6XGMfEGyq
        3OcuabnQ==;
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

xen_swiotlb_map_sg() may only fail if xen_swiotlb_map_page() fails, but
xen_swiotlb_map_page() only supports returning errors as
DMA_MAPPING_ERROR. So coalesce all errors into EINVAL.

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
 drivers/xen/swiotlb-xen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 24d11861ac7d..b5707127c9d7 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -509,7 +509,7 @@ xen_swiotlb_map_sg(struct device *dev, struct scatterlist *sgl, int nelems,
 out_unmap:
 	xen_swiotlb_unmap_sg(dev, sgl, i, dir, attrs | DMA_ATTR_SKIP_CPU_SYNC);
 	sg_dma_len(sgl) = 0;
-	return 0;
+	return -EINVAL;
 }
 
 static void
-- 
2.20.1

