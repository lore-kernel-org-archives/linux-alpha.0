From: Stefan Knoblich <stkn@gentoo.org>
Subject: [PATCH] 2.6.10 - add missing dma_mapping_error
Date: Mon, 27 Dec 2004 02:43:12 +0100
Message-ID: <200412270243.13063.stkn@gentoo.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_xi2zBPjl5P1VNkg"
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org

--Boundary-00=_xi2zBPjl5P1VNkg
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

this patch adds dma_mapping_error to dma-mapping.h, it's needed to compile 
s-ata support (=libata and maybe other stuff).

stefan


--Boundary-00=_xi2zBPjl5P1VNkg
Content-Type: text/x-diff;
  charset="us-ascii";
  name="2.6.10-alpha-dma_mapping_error.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="2.6.10-alpha-dma_mapping_error.diff"

--- linux-2.6.10/include/asm-alpha/dma-mapping.h.orig	2004-12-26 20:45:25.139475104 +0100
+++ linux-2.6.10/include/asm-alpha/dma-mapping.h	2004-12-26 20:46:54.684862136 +0100
@@ -25,6 +25,8 @@
 		pci_unmap_sg(alpha_gendev_to_pci(dev), sg, nents, dir)
 #define dma_supported(dev, mask)			\
 		pci_dma_supported(alpha_gendev_to_pci(dev), mask)
+#define dma_mapping_error(addr)			\
+		pci_dma_mapping_error(addr)
 
 #else	/* no PCI - no IOMMU. */
 
@@ -43,6 +45,8 @@
 #define dma_unmap_page(dev, addr, size, dir)	do { } while (0)
 #define dma_unmap_sg(dev, sg, nents, dir)	do { } while (0)
 
+#define dma_mapping_error(addr)		(0)
+
 #endif	/* !CONFIG_PCI */
 
 #define dma_alloc_noncoherent(d, s, h, f)	dma_alloc_coherent(d, s, h, f)

--Boundary-00=_xi2zBPjl5P1VNkg--
