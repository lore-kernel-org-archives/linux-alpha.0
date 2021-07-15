From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v1 08/16] MIPS/jazzdma: return error code from jazz_dma_map_sg()
Date: Thu, 15 Jul 2021 10:45:36 -0600
Message-ID: <20210715164544.6827-9-logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=9b2AxuIBWP2rX2JFr1XI1eezzTEXnwjOp4q66fJ74+c=; b=VCPgoVUtOm1WHuYxUHm4B1Cez8
        mgKPoApw/BVoyttnimQ9wao0paXUXJOoWTAeKzNKD0b0O+PN9rIuu9MsL7D1WqhjVospH7QSfnqgj
        tTtiY2untOl16Pf7pL3yLEXYv6FxLsiAJ5ZsMsouM+77PPl6NvU9bLajRizBa52UjsZUcwOV8FZ4M
        2S6UZiOc8TCY4kwYOpVtUj9vcMBY8wlOdOt0ijVuZXzMwmGJLwtdBOqLxWpKTNem65sdax/XiI4NB
        43PpGNCFhqXYOTFcO5eqUIoab7HGZEhnpz9t86SRNmXYO4aEoyDeVnz1VOxnsMe9SZs6AtMd7Nu8A
        RQrbtdcw==;
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

vdma_alloc() may fail for different reasons, but since it only supports
indicating an error via a return of DMA_MAPPING_ERROR, we coalesce the
different reasons into -EINVAL.

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/jazz/jazzdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/jazz/jazzdma.c b/arch/mips/jazz/jazzdma.c
index 461457b28982..3b99743435db 100644
--- a/arch/mips/jazz/jazzdma.c
+++ b/arch/mips/jazz/jazzdma.c
@@ -552,7 +552,7 @@ static int jazz_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 				dir);
 		sg->dma_address = vdma_alloc(sg_phys(sg), sg->length);
 		if (sg->dma_address == DMA_MAPPING_ERROR)
-			return 0;
+			return -EINVAL;
 		sg_dma_len(sg) = sg->length;
 	}

--
2.20.1
