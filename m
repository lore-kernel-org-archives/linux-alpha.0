From: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 15/21] sparc/iommu: don't set failed sg dma_address to
 DMA_MAPPING_ERROR
Date: Fri, 23 Jul 2021 11:50:02 -0600
Message-ID: <20210723175008.22410-16-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=bIO3ta0XzvPdSC9DXOQ0qCnsFUls6Qbnvb3IRvewUpc=; b=NaEPoynxmqm+74+W4WfQKoN6qm
 SNW5RRrTrL/wt6hyzxOW65ZZpHGkxZrXIqCDCUz02YoKsofBfKkpd+lnvjSqxmcOptyoR10whIzm0
 XWr2JhyL1SUUyH4FBuMZqL/X+yarEWhUPsHVkBq/D1qa+0FdVwSupSJnXgLHTpuVhKVvYSSqzED7w
 rLOjLxJD43P3nqIwx3v+p93qHDuUbBpaWRxZ3rfvdFa6Y0rxonPaN8t+H7AiqAk7+x58ScH3xxWyz
 Ex6P89kM7NZdT1QuJKuIQf0fpnMCMgaZdJAGSCvjdfafRIoEEp6q1tBr3HbtT1Aztv6DU5LT2MpvF
 vIKHHARw==;
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
Cc: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Niklas Schnelle <schnelle-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Martin Oliveira <martin.oliveira-N4T0u6BTIXMybS5Ee8rs3A@public.gmane.org>, Stephen Bates <sbates-pv7U853sEMVWk0Htik3J/w@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>

Setting the ->dma_address to DMA_MAPPING_ERROR is not part of
the ->map_sg calling convention, so remove it.

Link: https://lore.kernel.org/linux-mips/20210716063241.GC13345-jcswGhMUV9g@public.gmane.org/
Suggested-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Signed-off-by: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Cc: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: Niklas Schnelle <schnelle-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
---
 arch/sparc/kernel/iommu.c     | 2 --
 arch/sparc/kernel/pci_sun4v.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
index 0589acd34201..da0363692528 100644
--- a/arch/sparc/kernel/iommu.c
+++ b/arch/sparc/kernel/iommu.c
@@ -546,7 +546,6 @@ static int dma_4u_map_sg(struct device *dev, struct scatterlist *sglist,
 
 	if (outcount < incount) {
 		outs = sg_next(outs);
-		outs->dma_address = DMA_MAPPING_ERROR;
 		outs->dma_length = 0;
 	}
 
@@ -572,7 +571,6 @@ static int dma_4u_map_sg(struct device *dev, struct scatterlist *sglist,
 			iommu_tbl_range_free(&iommu->tbl, vaddr, npages,
 					     IOMMU_ERROR_CODE);
 
-			s->dma_address = DMA_MAPPING_ERROR;
 			s->dma_length = 0;
 		}
 		if (s == outs)
diff --git a/arch/sparc/kernel/pci_sun4v.c b/arch/sparc/kernel/pci_sun4v.c
index d90e80fa5705..384480971805 100644
--- a/arch/sparc/kernel/pci_sun4v.c
+++ b/arch/sparc/kernel/pci_sun4v.c
@@ -594,7 +594,6 @@ static int dma_4v_map_sg(struct device *dev, struct scatterlist *sglist,
 
 	if (outcount < incount) {
 		outs = sg_next(outs);
-		outs->dma_address = DMA_MAPPING_ERROR;
 		outs->dma_length = 0;
 	}
 
@@ -611,7 +610,6 @@ static int dma_4v_map_sg(struct device *dev, struct scatterlist *sglist,
 			iommu_tbl_range_free(tbl, vaddr, npages,
 					     IOMMU_ERROR_CODE);
 			/* XXX demap? XXX */
-			s->dma_address = DMA_MAPPING_ERROR;
 			s->dma_length = 0;
 		}
 		if (s == outs)
-- 
2.20.1
