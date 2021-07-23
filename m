From: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 13/21] s390/pci: don't set failed sg dma_address to
 DMA_MAPPING_ERROR
Date: Fri, 23 Jul 2021 11:50:00 -0600
Message-ID: <20210723175008.22410-14-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=L1b4mN92m3Z8Ycv5Au7RT1T/xTKMMtHSrAAz+sZBHZU=; b=ET8ruOrMt3mmCeZ34jiXdc2TdL
 gFJFpX62wDhFZJ9SERcczOaoRys/OxEHMCG+YxY/vdigNN+Bqg8A/qJpFlYbeMDLFpZVJDUwikAzf
 yr9BFCVPd7X9cpY5TCkShv5wTt4zgBUQrOT62bMiG+G1Af0QQZyVO+d273RRMPLYo8UVHCBOTNwf7
 MotCCWFSeBPff/nYUPd/EdwmTSVfczc4BNdfkMRWbxNlqMFoOXvAeTF7z2v7KpBUr5jmp6IuvR+sB
 Aa5GXzh+uyr3Vs8hJxtW+bE2p8twj6yYWiruPrNas2TjMzD6+2Ck7YfPlxTAU7zAEjbP/ZOLOhrLW
 XY/zW0Xw==;
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
Cc: Vasily Gorbik <gor-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Niklas Schnelle <schnelle-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Heiko Carstens <hca-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Martin Oliveira <martin.oliveira-N4T0u6BTIXMybS5Ee8rs3A@public.gmane.org>, Stephen Bates <sbates-pv7U853sEMVWk0Htik3J/w@public.gmane.org>, Christian Borntraeger <borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Gerald Schaefer <gerald.schaefer-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>

Setting the ->dma_address to DMA_MAPPING_ERROR is not part of
the ->map_sg calling convention, so remove it.

Link: https://lore.kernel.org/linux-mips/20210716063241.GC13345-jcswGhMUV9g@public.gmane.org/
Suggested-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Signed-off-by: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Cc: Niklas Schnelle <schnelle-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
Cc: Gerald Schaefer <gerald.schaefer-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
Cc: Heiko Carstens <hca-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
Cc: Vasily Gorbik <gor-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
Cc: Christian Borntraeger <borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
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
