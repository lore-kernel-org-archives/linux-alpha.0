From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v2 02/21] dma-direct: Return appropriate error code from dma_direct_map_sg()
Date: Fri, 23 Jul 2021 11:49:49 -0600
Message-ID: <20210723175008.22410-3-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=BqE/2wCCjH4FvfGKjQ09Cv01+9Px9vk9cMsrkFQoCn0=; b=I0NqDGyFiHeU4vQIrAHeYz9/OX
        RnbsqrIWWArueD4reUWEXhXjdCxttxJixLpASD8WyFe9J/cv5ALJGHTdtEm6rCwvD6eoT0PfxJzsr
        pcY28iGg92alpdU6jVLWb/XcJgUHIs3QrSGvqLxCQlTa9o9xJY06Nj7nHY8vPpcwinKgjHdFtNIq2
        FA2Za3AhlhPpxgT0kGWLvtBXvp55hycTfrI6RyTL4xPeplXhvfYGbCzgbF54Qc25rW+h9eSFC7wgi
        mF4zGD5pQcmZnzHMpGu/QiTAdDpsHWqS6g1Zw2GAPcveTb8Yqm0bB4pmSZdV192zGGh9aaF0WUgVz
        tsjKiQ7g==;
In-Reply-To: <20210723175008.22410-1-logang@deltatee.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>

Now that the map_sg() op expects error codes instead of return zero on
error, convert dma_direct_map_sg() to return an error code. Per the
documentation for dma_map_sgtable(), -EIO is returned due to an
DMA_MAPPING_ERROR with unknown cause.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 kernel/dma/direct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index f737e3347059..f33ceb68aef2 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -411,7 +411,7 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 
 out_unmap:
 	dma_direct_unmap_sg(dev, sgl, i, dir, attrs | DMA_ATTR_SKIP_CPU_SYNC);
-	return 0;
+	return -EIO;
 }
 
 dma_addr_t dma_direct_map_resource(struct device *dev, phys_addr_t paddr,
-- 
2.20.1

