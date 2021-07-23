From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v2 20/21] dma-mapping: return error code from dma_dummy_map_sg()
Date: Fri, 23 Jul 2021 11:50:07 -0600
Message-ID: <20210723175008.22410-21-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=x3KSnhFQmhq0kDAcj69QIXa3ZhZHzFN2nEhizdLNjiI=; b=M3qmRbqsKCC+FKzgIYDrT251SH
        Nzml0wv2K48qt2sJXjzM1DxP/eDRfrPjJ9bdzaj0HtsiKgS7pahyju0brznWg3AUJX+JatcVTcM4g
        0wsnuMo5aYzvw314Ri5RUkrtzSp9HF/aXGG5ksmYAYRZ5BAnS1pC0gSFfSU2XiRUXllDLfF/3xgcP
        YUj9pjNTYWDHh8iHeimXsNZzv//XPnvhiWZXPpnRGhPZv18QuImLyc5EfuRCj99XGEoFia3P4JxFW
        zRK7JfICPO6TzZ/eLMEo6IcVqpEkBhDIJpDj5PqWbAxQ3M83go6+8pynIzl/aD4Jy3LIvtXsBIgDO
        p3nGybYg==;
In-Reply-To: <20210723175008.22410-1-logang@deltatee.com>
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

