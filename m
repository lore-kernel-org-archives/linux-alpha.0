From: Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v2 21/21] dma-mapping: Disallow .map_sg operations from returning zero on error
Date: Fri, 23 Jul 2021 11:50:08 -0600
Message-ID: <20210723175008.22410-22-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=HKCVUstwA/z3wuW2EGad6Fa2PQLjmM0RyJDS41E8gEg=; b=ceE3xNa5zKwrpv+KSzmE7LfjqN
        0q/StfTaFLC89OIPsL5+enoCQ8wyl6/6i4jsEFiR43MEKekW1TRVGs6gbFQAw05b52z+Gg/B/HERs
        9OhcoIjeIB26sAHv5+uTd3D/NbWNNXUPnOUr95+mHUB34EmPY7Fko/92+5UiQVxjDeY5a2hCXho37
        WUkvAUx9LUDaBn28taATIaM4Whds0u2lS0PSsUSwfkqXp0M+8yje3Gmj75OuBqwto3/1QVzP9VFof
        dxz4o8gHrETaFZyTg9X6dGaLxMEevxwctrUYwYEcmWkRnf+9VN8ernNXHxdpFxwYPEua/aErYGkeC
        VaCk22FA==;
In-Reply-To: <20210723175008.22410-1-logang@deltatee.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>

Now that all the .map_sg operations have been converted to returning
proper error codes, drop the code to handle a zero return value,
add a warning if a zero is returned and update the comment for the
map_sg operation.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 kernel/dma/mapping.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index b8dc8b1cb402..86a8a421344a 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -194,6 +194,9 @@ static int __dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
 	else
 		ents = ops->map_sg(dev, sg, nents, dir, attrs);
 
+	if (WARN_ON_ONCE(ents == 0))
+		return -EIO;
+
 	if (ents > 0)
 		debug_dma_map_sg(dev, sg, nents, ents, dir);
 
@@ -259,9 +262,7 @@ int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
 	int nents;
 
 	nents = __dma_map_sg_attrs(dev, sgt->sgl, sgt->orig_nents, dir, attrs);
-	if (nents == 0)
-		return -EIO;
-	else if (nents < 0) {
+	if (nents < 0) {
 		if (WARN_ON_ONCE(nents != -EINVAL && nents != -ENOMEM &&
 				 nents != -EIO))
 			return -EIO;
-- 
2.20.1

