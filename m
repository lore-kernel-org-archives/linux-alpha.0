From: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 05/21] alpha: return error code from alpha_pci_map_sg()
Date: Fri, 23 Jul 2021 11:49:52 -0600
Message-ID: <20210723175008.22410-6-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=3+NKDp2q/0zHzVVwq3INd+w6NURPV4dE2hTg9/0ITMI=; b=p5v2Ta39J/FMFArdqmG9hSG4dJ
 GVRjnEedIhEO1h1r5PxFM08gIBm2nd5NToaIWZ7khZNaAntYnBCZUWT0JxZdoSW9l1fdwLGQfi0X3
 lbubJp9G7o8oDw/JDXbE/idqJCA1fHd/koaMSZyJUWEIAXuMnTNHuyqeQmpH1vtLOBamcAC/zV6XL
 5FI4jeQ2Z+mEOnsWyzTxTyD6b5+Udusu7tJ0clJtv+ZswVDDZVA5y4XKO2x7PSA1AXTf4tKdtp/JU
 4AxOqYl9AObVsclV8wS/PiUkaSSPgigS2efnAtBdAJWeCeYgFhDY5hULZaNiPuGhFkfmEfLJZJnwf
 1AX9mNhw==;
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
Cc: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Martin Oliveira <martin.oliveira-N4T0u6BTIXMybS5Ee8rs3A@public.gmane.org>, Stephen Bates <sbates-pv7U853sEMVWk0Htik3J/w@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>, Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>

From: Martin Oliveira <martin.oliveira-N4T0u6BTIXMybS5Ee8rs3A@public.gmane.org>

The .map_sg() op now expects an error code instead of zero on failure.

pci_map_single_1() can fail for different reasons, but since the only
supported type of error return is DMA_MAPPING_ERROR, we coalesce those
errors into EIO.

ENOMEM is returned when no page tables can be allocated.

Signed-off-by: Martin Oliveira <martin.oliveira-N4T0u6BTIXMybS5Ee8rs3A@public.gmane.org>
Signed-off-by: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Cc: Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>
Cc: Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>
Cc: Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/alpha/kernel/pci_iommu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 35d7b3096d6e..21f9ac101324 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -649,7 +649,9 @@ static int alpha_pci_map_sg(struct device *dev, struct scatterlist *sg,
 		sg->dma_address
 		  = pci_map_single_1(pdev, SG_ENT_VIRT_ADDRESS(sg),
 				     sg->length, dac_allowed);
-		return sg->dma_address != DMA_MAPPING_ERROR;
+		if (sg->dma_address == DMA_MAPPING_ERROR)
+			return -EIO;
+		return 1;
 	}
 
 	start = sg;
@@ -685,8 +687,10 @@ static int alpha_pci_map_sg(struct device *dev, struct scatterlist *sg,
 	if (out < end)
 		out->dma_length = 0;
 
-	if (out - start == 0)
+	if (out - start == 0) {
 		printk(KERN_WARNING "pci_map_sg failed: no entries?\n");
+		return -ENOMEM;
+	}
 	DBGA("pci_map_sg: %ld entries\n", out - start);
 
 	return out - start;
@@ -699,7 +703,7 @@ static int alpha_pci_map_sg(struct device *dev, struct scatterlist *sg,
 	   entries.  Unmap them now.  */
 	if (out > start)
 		pci_unmap_sg(pdev, start, out - start, dir);
-	return 0;
+	return -ENOMEM;
 }
 
 /* Unmap a set of streaming mode DMA translations.  Again, cpu read
-- 
2.20.1
