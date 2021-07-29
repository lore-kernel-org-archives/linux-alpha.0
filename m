From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v3 20/21] dma-mapping: return error code from dma_dummy_map_sg()
Date: Thu, 29 Jul 2021 14:15:38 -0600
Message-ID: <20210729201539.5602-21-logang@deltatee.com>
References: <20210729201539.5602-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=x3KSnhFQmhq0kDAcj69QIXa3ZhZHzFN2nEhizdLNjiI=; b=sANr7BcTE+BYenm6+gpWCnWZgt
        a1vbMDbMOWdqeSnuy6+gCxsg3ykH4e1tLmv3LHu7BCfCZ5kPtdlKqdN3HC1+rCC/ooIH2ImcJXDlN
        8jKSQ1+r/37FUAT5WVcD/FO6jV8chXBoPy/We7DjNh3Dzic0CwdMDdHXpDFXnRf1+vbyQg8ubpjAK
        37wuuawNneI5QWW6HQDMGTSF5DYEgZKQuMBRdaaJwPxbPiGRXYpiqEQjOFAaAmvaMZsXdtPzSOaZ1
        ANO+o3NlbiOZsQSea15Ytm6BS2LVHdEvR81DRul4WITMxI1iS66PVfZhi0EzJbq5dw5zcX1Q8AZ1l
        /ucxZeDQ==;
In-Reply-To: <20210729201539.5602-1-logang@deltatee.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

The only errno to return is -EINVAL in the case when DMA is not
supported.

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 kernel/dma/dummy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/dummy.c b/kernel/dma/dummy.c
index eacd4c5b10bf..b492d59ac77e 100644
--- a/kernel/dma/dummy.c
+++ b/kernel/dma/dummy.c
@@ -22,7 +22,7 @@ static int dma_dummy_map_sg(struct device *dev, struct scatterlist *sgl,
 		int nelems, enum dma_data_direction dir,
 		unsigned long attrs)
 {
-	return 0;
+	return -EINVAL;
 }
 
 static int dma_dummy_supported(struct device *hwdev, u64 mask)
-- 
2.20.1

