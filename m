From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] sparc: Remove usage of the deprecated "pci-dma-compat.h" API
Date: Sun, 29 Aug 2021 11:43:43 +0200
Message-ID: <18ab2b83b05b50a00ef673e320c8ddc0d19f099a.1630230112.git.christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, arnd@arndb.de
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In [1], Christoph Hellwig has proposed to remove the wrappers in
include/linux/pci-dma-compat.h.

Some reasons why this API should be removed have been given by Julia
Lawall in [2].

A coccinelle script has been used to perform the needed transformation
Only relevant parts are given below.

@@ @@
-    PCI_DMA_BIDIRECTIONAL
+    DMA_BIDIRECTIONAL

@@ @@
-    PCI_DMA_NONE
+    DMA_NONE

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_single(e1, e2, e3, e4)
+    dma_unmap_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_sg(e1, e2, e3, e4)
+    dma_unmap_sg(&e1->dev, e2, e3, e4)


[1]: https://lore.kernel.org/kernel-janitors/20200421081257.GA131897@infradead.org/
[2]: https://lore.kernel.org/kernel-janitors/alpine.DEB.2.22.394.2007120902170.2424@hadrien/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
It has *not* been compile tested. However the modifications are done with
coccinelle without any other modification.
---
 arch/alpha/kernel/pci_iommu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 21f9ac101324..e83a02ed5267 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -333,7 +333,7 @@ static dma_addr_t alpha_pci_map_page(struct device *dev, struct page *page,
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	int dac_allowed;
 
-	BUG_ON(dir == PCI_DMA_NONE);
+	BUG_ON(dir == DMA_NONE);
 
 	dac_allowed = pdev ? pci_dac_dma_supported(pdev, pdev->dma_mask) : 0; 
 	return pci_map_single_1(pdev, (char *)page_address(page) + offset, 
@@ -356,7 +356,7 @@ static void alpha_pci_unmap_page(struct device *dev, dma_addr_t dma_addr,
 	struct pci_iommu_arena *arena;
 	long dma_ofs, npages;
 
-	BUG_ON(dir == PCI_DMA_NONE);
+	BUG_ON(dir == DMA_NONE);
 
 	if (dma_addr >= __direct_map_base
 	    && dma_addr < __direct_map_base + __direct_map_size) {
@@ -460,7 +460,7 @@ static void alpha_pci_free_coherent(struct device *dev, size_t size,
 				    unsigned long attrs)
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
-	pci_unmap_single(pdev, dma_addr, size, PCI_DMA_BIDIRECTIONAL);
+	dma_unmap_single(&pdev->dev, dma_addr, size, DMA_BIDIRECTIONAL);
 	free_pages((unsigned long)cpu_addr, get_order(size));
 
 	DBGA2("pci_free_consistent: [%llx,%zx] from %ps\n",
@@ -639,7 +639,7 @@ static int alpha_pci_map_sg(struct device *dev, struct scatterlist *sg,
 	dma_addr_t max_dma;
 	int dac_allowed;
 
-	BUG_ON(dir == PCI_DMA_NONE);
+	BUG_ON(dir == DMA_NONE);
 
 	dac_allowed = dev ? pci_dac_dma_supported(pdev, pdev->dma_mask) : 0;
 
@@ -702,7 +702,7 @@ static int alpha_pci_map_sg(struct device *dev, struct scatterlist *sg,
 	/* Some allocation failed while mapping the scatterlist
 	   entries.  Unmap them now.  */
 	if (out > start)
-		pci_unmap_sg(pdev, start, out - start, dir);
+		dma_unmap_sg(&pdev->dev, start, out - start, dir);
 	return -ENOMEM;
 }
 
@@ -722,7 +722,7 @@ static void alpha_pci_unmap_sg(struct device *dev, struct scatterlist *sg,
 	dma_addr_t max_dma;
 	dma_addr_t fbeg, fend;
 
-	BUG_ON(dir == PCI_DMA_NONE);
+	BUG_ON(dir == DMA_NONE);
 
 	if (! alpha_mv.mv_pci_tbi)
 		return;
-- 
2.30.2

