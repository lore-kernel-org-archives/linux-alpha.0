From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v3 13/21] s390/pci: don't set failed sg dma_address to DMA_MAPPING_ERROR
Date: Thu, 29 Jul 2021 14:15:31 -0600
Message-ID: <20210729201539.5602-14-logang@deltatee.com>
References: <20210729201539.5602-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=L1b4mN92m3Z8Ycv5Au7RT1T/xTKMMtHSrAAz+sZBHZU=; b=Yj+EfoToDFg3xLZFeqHmnxyGd9
        I8aMI3Jlv85Ch+tEVbiyS6aUWs464pVtFPGP+OXRJxvkExa0PoCQRDg+lV7Fk0JIhpD0NETAsfw10
        tLOH/M9r8Ub14QsZbv+FteYeM8tnk+pO0soR3rt6npJZtle118bFbihsbeEw1/qTqyL3Jj0+ssWkd
        /TunTkau8y0A1ZMEypKJseIZ5QAPKVyjV4AIwSGMhlZy2xcbjewcGgNwriRczL1ST5M/sjnHzYFIY
        1rCC7PpMqyL5QT4J0+Ejnmrq7VFLTiQkPLu8YmlokEQmZBpS7OD/0bB7rUHDJhDj50jKzeAryGM3N
        uZyfmAxw==;
In-Reply-To: <20210729201539.5602-1-logang@deltatee.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>

Setting the ->dma_address to DMA_MAPPING_ERROR is not part of
the ->map_sg calling convention, so remove it.

Link: https://lore.kernel.org/linux-mips/20210716063241.GC13345@lst.de/
Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
---
 arch/s390/pci/pci_dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/s390/pci/pci_dma.c b/arch/s390/pci/pci_dma.c
index c78b02012764..be48e5b5bfcf 100644
--- a/arch/s390/pci/pci_dma.c
+++ b/arch/s390/pci/pci_dma.c
@@ -492,7 +492,6 @@ static int s390_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	for (i = 1; i < nr_elements; i++) {
 		s = sg_next(s);
 
-		s->dma_address = DMA_MAPPING_ERROR;
 		s->dma_length = 0;
 
 		if (s->offset || (size & ~PAGE_MASK) ||
-- 
2.20.1

