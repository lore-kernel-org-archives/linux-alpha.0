From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v1 07/16] ia64/sba_iommu: return error code from sba_map_sg_attrs()
Date: Thu, 15 Jul 2021 10:45:35 -0600
Message-ID: <20210715164544.6827-8-logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=yHZJDyrbtc2DNRkkLnCWk6LyCavHBAROxZPaBwPJV+w=; b=Uk9hmVlOMLTaHT5Tplw3GW15jH
        CeVS5nCeJY2tUo3aAcbZduCSQVDn0jptjFbmtnj3v5G8CraUuCNv7B/bA1lXnwAqLJwQNB2t23QL6
        GCZqhLMOwzqRH34G+Y5BBzb4NQhwdrGK5mOkNWXt9gAGnvdQqFYRscmaU6pWKWcE7qUt7wO4D80pe
        8/PNToWYD9qaWrwbmxJrGUcHjdK3p3BXVy4naPhfKpzb1aURkg8IXCH/NXXzv+OOVY95aZoB5qwfA
        QHHlGEKoZAnVNvL5MsmbOBHtpgrk0NyNnIEds8LB/+w6+0+ZS1RCVbWjm8vff/8qi0kFo6Sr+2pOL
        bwtGjm0w==;
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>, Michael Ellerman <mpe@ellerman.id.au>, Niklas Schnelle <schnelle@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

Propagate the return of dma_mapping_error() up, if it is an errno.

sba_coalesce_chunks() may only presently fail if sba_alloc_range()
fails, which in turn only fails if the iommu is out of mapping
resources, hence a -ENOMEM is used in that case.

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/ia64/hp/common/sba_iommu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/ia64/hp/common/sba_iommu.c b/arch/ia64/hp/common/sba_iommu.c
index 9148ddbf02e5..09dbe07a18c1 100644
--- a/arch/ia64/hp/common/sba_iommu.c
+++ b/arch/ia64/hp/common/sba_iommu.c
@@ -1431,7 +1431,7 @@ static int sba_map_sg_attrs(struct device *dev, struct scatterlist *sglist,
 			    unsigned long attrs)
 {
 	struct ioc *ioc;
-	int coalesced, filled = 0;
+	int coalesced, filled = 0, ret;
 #ifdef ASSERT_PDIR_SANITY
 	unsigned long flags;
 #endif
@@ -1458,8 +1458,9 @@ static int sba_map_sg_attrs(struct device *dev, struct scatterlist *sglist,
 		sglist->dma_length = sglist->length;
 		sglist->dma_address = sba_map_page(dev, sg_page(sglist),
 				sglist->offset, sglist->length, dir, attrs);
-		if (dma_mapping_error(dev, sglist->dma_address))
-			return 0;
+		ret = dma_mapping_error(dev, sglist->dma_address);
+		if (ret)
+			return ret;
 		return 1;
 	}
 
@@ -1486,7 +1487,7 @@ static int sba_map_sg_attrs(struct device *dev, struct scatterlist *sglist,
 	coalesced = sba_coalesce_chunks(ioc, dev, sglist, nents);
 	if (coalesced < 0) {
 		sba_unmap_sg_attrs(dev, sglist, nents, dir, attrs);
-		return 0;
+		return -ENOMEM;
 	}
 
 	/*
-- 
2.20.1

