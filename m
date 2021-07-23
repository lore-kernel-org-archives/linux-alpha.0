From: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 08/21] ia64/sba_iommu: return error code from
 sba_map_sg_attrs()
Date: Fri, 23 Jul 2021 11:49:55 -0600
Message-ID: <20210723175008.22410-9-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=GqC6MNUep++aB8fDrjh2DnNmBSYDqSi9PqIeeLTquj0=; b=lZbqhlYojMDTC61acH6COEDa82
 KR35lDGt5LaHTcn+pvR+vpgnA43hQ7AZrRhWdg+la8vReBTvoNH/vEAXWztSraEGY05DkL24ACtme
 Bcz3zbGWOeM1226wPJ3MV/d18qZ29cw5QFUKHYHY6YDD0HR6PyM9cMwymZl4hFCaPse8HwgQHmW9h
 ugiZPCPhQUxiATZCAy3FMKZIkGsEDhllkY+0c7IqVxWupfCbbYjpTb+fftfITgSXMJ2m4HZlVPqDD
 meE1TkV1nr5omqhpdjfX9L8EsUv84pJnShJplThugFTXcMMMygbBGqNrGLazrRcBmCW303z4DtoKV
 5udqRChA==;
In-Reply-To: <20210723175008.22410-1-logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org
Cc: Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>, Niklas Schnelle <schnelle-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Martin Oliveira <martin.oliveira-N4T0u6BTIXMybS5Ee8rs3A@public.gmane.org>, Stephen Bates <sbates-pv7U853sEMVWk0Htik3J/w@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>

From: Martin Oliveira <martin.oliveira-N4T0u6BTIXMybS5Ee8rs3A@public.gmane.org>

The .map_sg() op now expects an error code instead of zero on failure.

In the case of a dma_mapping_error() return -EIO as the actual cause
is opaque here.

sba_coalesce_chunks() may only presently fail if sba_alloc_range()
fails, which in turn only fails if the iommu is out of mapping
resources, hence a -ENOMEM is used in that case.

Signed-off-by: Martin Oliveira <martin.oliveira-N4T0u6BTIXMybS5Ee8rs3A@public.gmane.org>
Signed-off-by: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: Niklas Schnelle <schnelle-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
Cc: Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>
---
 arch/ia64/hp/common/sba_iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/ia64/hp/common/sba_iommu.c b/arch/ia64/hp/common/sba_iommu.c
index 9148ddbf02e5..430c166b68cd 100644
--- a/arch/ia64/hp/common/sba_iommu.c
+++ b/arch/ia64/hp/common/sba_iommu.c
@@ -1458,8 +1458,8 @@ static int sba_map_sg_attrs(struct device *dev, struct scatterlist *sglist,
 		sglist->dma_length = sglist->length;
 		sglist->dma_address = sba_map_page(dev, sg_page(sglist),
 				sglist->offset, sglist->length, dir, attrs);
-		if (dma_mapping_error(dev, sglist->dma_address))
-			return 0;
+		if(dma_mapping_error(dev, sglist->dma_address))
+			return -EIO;
 		return 1;
 	}
 
@@ -1486,7 +1486,7 @@ static int sba_map_sg_attrs(struct device *dev, struct scatterlist *sglist,
 	coalesced = sba_coalesce_chunks(ioc, dev, sglist, nents);
 	if (coalesced < 0) {
 		sba_unmap_sg_attrs(dev, sglist, nents, dir, attrs);
-		return 0;
+		return -ENOMEM;
 	}
 
 	/*
-- 
2.20.1
