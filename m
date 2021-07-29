From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v3 09/21] MIPS/jazzdma: return error code from jazz_dma_map_sg()
Date: Thu, 29 Jul 2021 14:15:27 -0600
Message-ID: <20210729201539.5602-10-logang@deltatee.com>
References: <20210729201539.5602-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=pjSijkDDmu3vPdSgTQKQdclfdyX/CqsmmRRmSWCrGaw=; b=cjgxYy/V4mokMS26RvA0y5hAiA
        e5AuokLjTiEWPZ1wtZmzEF2/AjYWGVTq7UuSoyz33iWz4wFh6JWY3+gaqjxN/uaYzWgDN90NJbk6S
        jGNNEV37c2AtpkXo8os38qhGWUEL9DmdLjrM+jhEyJZuL/hWdHyWmAa1nyx5jjPZPvvnfteOU8nvT
        SFzkV/q/iTjtcmPXkWw9wI3RF0d51GVXBwR5owV0qIhLmjvIGYZoMsAZsfBuH66LL1M6DbJv8aMpa
        aVNco/kwUkGc2RR9/C8e2SVixYS9FCaqVsXHs+VNiAfyClEYBPIi4fLYwbWEh0Hg9lvB1O4V/L1R9
        tDqSO1xg==;
In-Reply-To: <20210729201539.5602-1-logang@deltatee.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

vdma_alloc() may fail for different reasons, but since it only supports
indicating an error via a return of DMA_MAPPING_ERROR, we coalesce the
different reasons into -EIO as is documented on dma_map_sgtable().

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/jazz/jazzdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/jazz/jazzdma.c b/arch/mips/jazz/jazzdma.c
index 461457b28982..eabddb89d221 100644
--- a/arch/mips/jazz/jazzdma.c
+++ b/arch/mips/jazz/jazzdma.c
@@ -552,7 +552,7 @@ static int jazz_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 				dir);
 		sg->dma_address = vdma_alloc(sg_phys(sg), sg->length);
 		if (sg->dma_address == DMA_MAPPING_ERROR)
-			return 0;
+			return -EIO;
 		sg_dma_len(sg) = sg->length;
 	}
 
-- 
2.20.1

