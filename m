From: Sasha Levin <sasha.levin@oracle.com>
Subject: [PATCH] alpha: use BUG_ON where possible
Date: Thu,  8 Nov 2012 15:23:04 -0500
Message-ID: <1352406191-14303-2-git-send-email-sasha.levin@oracle.com>
References: <1352406191-14303-1-git-send-email-sasha.levin@oracle.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1352406191-14303-1-git-send-email-sasha.levin@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Sasha Levin <sasha.levin@oracle.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jiri Kosina <jkosina@suse.cz>, Marek Szyprowski <m.szyprowski@samsung.com>, Joe Perches <joe@perches.com>, linux-alpha@vger.kernel.org

Just use BUG_ON() instead of constructions such as:

	if (...)
		BUG()

A simplified version of the semantic patch that makes this transformation
is as follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e;
@@
- if (e) BUG();
+ BUG_ON(e);
// </smpl>

Signed-off-by: Sasha Levin <sasha.levin@oracle.com>
---
 arch/alpha/kernel/pci_iommu.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 3f844d2..a21d0ab 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -354,8 +354,7 @@ static dma_addr_t alpha_pci_map_page(struct device *dev, struct page *page,
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	int dac_allowed;
 
-	if (dir == PCI_DMA_NONE)
-		BUG();
+	BUG_ON(dir == PCI_DMA_NONE);
 
 	dac_allowed = pdev ? pci_dac_dma_supported(pdev, pdev->dma_mask) : 0; 
 	return pci_map_single_1(pdev, (char *)page_address(page) + offset, 
@@ -378,8 +377,7 @@ static void alpha_pci_unmap_page(struct device *dev, dma_addr_t dma_addr,
 	struct pci_iommu_arena *arena;
 	long dma_ofs, npages;
 
-	if (dir == PCI_DMA_NONE)
-		BUG();
+	BUG_ON(dir == PCI_DMA_NONE);
 
 	if (dma_addr >= __direct_map_base
 	    && dma_addr < __direct_map_base + __direct_map_size) {
@@ -662,8 +660,7 @@ static int alpha_pci_map_sg(struct device *dev, struct scatterlist *sg,
 	dma_addr_t max_dma;
 	int dac_allowed;
 
-	if (dir == PCI_DMA_NONE)
-		BUG();
+	BUG_ON(dir == PCI_DMA_NONE);
 
 	dac_allowed = dev ? pci_dac_dma_supported(pdev, pdev->dma_mask) : 0;
 
@@ -742,8 +739,7 @@ static void alpha_pci_unmap_sg(struct device *dev, struct scatterlist *sg,
 	dma_addr_t max_dma;
 	dma_addr_t fbeg, fend;
 
-	if (dir == PCI_DMA_NONE)
-		BUG();
+	BUG_ON(dir == PCI_DMA_NONE);
 
 	if (! alpha_mv.mv_pci_tbi)
 		return;
-- 
1.7.10.4
