From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v1 12/16] parisc: return error code from .map_sg() ops
Date: Thu, 15 Jul 2021 10:45:40 -0600
Message-ID: <20210715164544.6827-13-logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=Vh7idcp8uIAqCBUcnPlWtiOoHOTF3pKwZ9tjpJkyjBs=; b=JmcSAn2rvRQc5C7MrFSRK9pBrk
        GKVkxj+CKC5t4mYSimezSqrTpkyQiLqjRkiysuOkTo5xv4HNant2pQCww+QjxcAxV5QVqv7kQibHD
        Igtt3UtSYyGJX35W1Sy5JkYpSPmiKIkvOm4QY3kby4ft+qBjcTzrrx+eHWsugiQnsKU99QFdtUWjo
        RGKbXIpbYgM6wfJnEYPQ7nnjxKkVRl/NgOjCCDAKbeBnXVJUhW2sh6RcwENC4KOjVMf/8vOqW2Ffe
        ln4bBhV7KnL2jLL1wwfCDO+4ND4q58CbobKSfyeYQnG+t1VZ+BqxBrACk2rRQb5uSnYDIb7pF4f8K
        8EuQ8rFA==;
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/parisc/ccio-dma.c  | 2 +-
 drivers/parisc/sba_iommu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index b5f9ee81a46c..a3a5cfda3d93 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -918,7 +918,7 @@ ccio_map_sg(struct device *dev, struct scatterlist *sglist, int nents,
 	BUG_ON(!dev);
 	ioc = GET_IOC(dev);
 	if (!ioc)
-		return 0;
+		return -ENODEV;
 	
 	DBG_RUN_SG("%s() START %d entries\n", __func__, nents);
 
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index dce4cdf786cd..9a6671a230ee 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -947,7 +947,7 @@ sba_map_sg(struct device *dev, struct scatterlist *sglist, int nents,
 
 	ioc = GET_IOC(dev);
 	if (!ioc)
-		return 0;
+		return -ENODEV;
 
 	/* Fast path single entry scatterlists. */
 	if (nents == 1) {
-- 
2.20.1

