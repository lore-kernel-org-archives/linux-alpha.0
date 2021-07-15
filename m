From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v1 15/16] dma-mapping: return error code from dma_dummy_map_sg()
Date: Thu, 15 Jul 2021 10:45:43 -0600
Message-ID: <20210715164544.6827-16-logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Cc:To:From:content-disposition;
	bh=5q5HrJN5z01eX+XAG2EfKItHnqLG5Bo1fOvwGUnV4O4=; b=oVKqj1qxGhVN9ixr6TLSsC4ZBO
	UTD1MZ1POYG3KI27eIMLMFxYbxzslShIpA6YWVrJkGi8+wWJ/wcVjvI1+Jf302nsbpn08IP0HnrjG
	oh9pK+zmvzVkSIE1LmiCYRQEMg/n7BKDDFN1GhirqNtUZZY85nV7dWg7yr93fsfot42jaRm2mqSn+
	wA3i/zh7pUzR0TP8bgsZsoHOwBQn2dWZ41mvNoesxsAdL31ytt8u53ohsynd3SOTknscoWtbi7kQX
	eUTXIk0RVW11sAtm1oHi0qiO2SdAZ7zV+zvHAQY6D/M0Zv5t6bRmqKI4wJIkqLx4KZbsVyYpCrClV
	/+yGg5Kg==;
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

The only errno to return is -ENODEV in the case when DMA is not
supported.

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 kernel/dma/dummy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/dummy.c b/kernel/dma/dummy.c
index eacd4c5b10bf..ae9abebed0c4 100644
--- a/kernel/dma/dummy.c
+++ b/kernel/dma/dummy.c
@@ -22,7 +22,7 @@ static int dma_dummy_map_sg(struct device *dev, struct scatterlist *sgl,
 		int nelems, enum dma_data_direction dir,
 		unsigned long attrs)
 {
-	return 0;
+	return -ENODEV;
 }
 
 static int dma_dummy_supported(struct device *hwdev, u64 mask)
-- 
2.20.1


