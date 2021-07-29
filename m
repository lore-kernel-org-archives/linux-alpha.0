From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v3 21/21] dma-mapping: Disallow .map_sg operations from returning zero on error
Date: Thu, 29 Jul 2021 14:15:39 -0600
Message-ID: <20210729201539.5602-22-logang@deltatee.com>
References: <20210729201539.5602-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=X/PGh6GTfJ6ZdtihVioh5gR+sLDdDHokoaBTKsSS/Sc=; b=Cl0pwajPUF0MbvvK+bH3m8G15c
        iHGMTRHjC70auqPKPrfU/+fnjiDq8xpUMiFyYl3bcXjcpeMj0bAqbgfhD+GY9+ktWOOjLziknbBpV
        eOrDDhbu2P6PbvlVWSvYgPEnlp2BricnQaa43UTkbJu+XUYXR7je7h3vqOKBtF35iiPZChQvy2Y6T
        SQk28+qNruG/mX+ypm5KCA5pmv+A8RtK+979e9bCfNDpbieX0+q4/AvvQXFkzgOrHSbjqtMqcmzC3
        ChuWTdKg/GFTa5IPAkYTKqDInd6tjgcT2Sy8uBUU77cbYGKw3nkXhBa/lC9mrNgps7kOEZnUPfeL7
        SViD+cFQ==;
In-Reply-To: <20210729201539.5602-1-logang@deltatee.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>

Now that all the .map_sg operations have been converted to returning
proper error codes, drop the code to handle a zero return value,
add a warning if a zero is returned.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 kernel/dma/mapping.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 9f0bb56eb9aa..cbcbdc877458 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -196,8 +196,8 @@ static int __dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
 
 	if (ents > 0)
 		debug_dma_map_sg(dev, sg, nents, ents, dir);
-	else if (WARN_ON_ONCE(ents != -EINVAL && ents != -ENOMEM &&
-			      ents != -EIO && ents != 0))
+	else if (WARN_ON_ONCE((ents != -EINVAL && ents != -ENOMEM &&
+			       ents != -EIO) || ents == 0))
 		return -EIO;
 
 	return ents;
@@ -262,9 +262,7 @@ int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
 	int nents;
 
 	nents = __dma_map_sg_attrs(dev, sgt->sgl, sgt->orig_nents, dir, attrs);
-	if (nents == 0)
-		return -EIO;
-	else if (nents < 0)
+	if (nents < 0)
 		return nents;
 
 	sgt->nents = nents;
-- 
2.20.1

