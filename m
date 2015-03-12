From: Scott Wood <scottwood@freescale.com>
Subject: [PATCH 07/22] alpha: %pF is only for function pointers
Date: Wed, 11 Mar 2015 22:13:42 -0500
Message-ID: <1426130037-17956-7-git-send-email-scottwood@freescale.com>
References: <1426130037-17956-1-git-send-email-scottwood@freescale.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426130037-17956-1-git-send-email-scottwood@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org, linux-kernel@vger.kernel.org
Cc: Scott Wood <scottwood@freescale.com>, linux-alpha@vger.kernel.org

Use %pS for actual addresses, otherwise you'll get bad output
on arches like ppc64 where %pF expects a function descriptor.  Even on
other architectures, refrain from setting a bad example that people
copy.

Signed-off-by: Scott Wood <scottwood@freescale.com>
Cc: linux-alpha@vger.kernel.org
---
 arch/alpha/kernel/pci_iommu.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index eddee77..2cd2804 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -236,7 +236,7 @@ static int pci_dac_dma_supported(struct pci_dev *dev, u64 mask)
 		ok = 0;
 
 	/* If both conditions above are met, we are fine. */
-	DBGA("pci_dac_dma_supported %s from %pf\n",
+	DBGA("pci_dac_dma_supported %s from %ps\n",
 	     ok ? "yes" : "no", __builtin_return_address(0));
 
 	return ok;
@@ -268,7 +268,7 @@ pci_map_single_1(struct pci_dev *pdev, void *cpu_addr, size_t size,
 	    && paddr + size <= __direct_map_size) {
 		ret = paddr + __direct_map_base;
 
-		DBGA2("pci_map_single: [%p,%zx] -> direct %llx from %pf\n",
+		DBGA2("pci_map_single: [%p,%zx] -> direct %llx from %ps\n",
 		      cpu_addr, size, ret, __builtin_return_address(0));
 
 		return ret;
@@ -279,7 +279,7 @@ pci_map_single_1(struct pci_dev *pdev, void *cpu_addr, size_t size,
 	if (dac_allowed) {
 		ret = paddr + alpha_mv.pci_dac_offset;
 
-		DBGA2("pci_map_single: [%p,%zx] -> DAC %llx from %pf\n",
+		DBGA2("pci_map_single: [%p,%zx] -> DAC %llx from %ps\n",
 		      cpu_addr, size, ret, __builtin_return_address(0));
 
 		return ret;
@@ -316,7 +316,7 @@ pci_map_single_1(struct pci_dev *pdev, void *cpu_addr, size_t size,
 	ret = arena->dma_base + dma_ofs * PAGE_SIZE;
 	ret += (unsigned long)cpu_addr & ~PAGE_MASK;
 
-	DBGA2("pci_map_single: [%p,%zx] np %ld -> sg %llx from %pf\n",
+	DBGA2("pci_map_single: [%p,%zx] np %ld -> sg %llx from %ps\n",
 	      cpu_addr, size, npages, ret, __builtin_return_address(0));
 
 	return ret;
@@ -383,14 +383,14 @@ static void alpha_pci_unmap_page(struct device *dev, dma_addr_t dma_addr,
 	    && dma_addr < __direct_map_base + __direct_map_size) {
 		/* Nothing to do.  */
 
-		DBGA2("pci_unmap_single: direct [%llx,%zx] from %pf\n",
+		DBGA2("pci_unmap_single: direct [%llx,%zx] from %ps\n",
 		      dma_addr, size, __builtin_return_address(0));
 
 		return;
 	}
 
 	if (dma_addr > 0xffffffff) {
-		DBGA2("pci64_unmap_single: DAC [%llx,%zx] from %pf\n",
+		DBGA2("pci64_unmap_single: DAC [%llx,%zx] from %ps\n",
 		      dma_addr, size, __builtin_return_address(0));
 		return;
 	}
@@ -422,7 +422,7 @@ static void alpha_pci_unmap_page(struct device *dev, dma_addr_t dma_addr,
 
 	spin_unlock_irqrestore(&arena->lock, flags);
 
-	DBGA2("pci_unmap_single: sg [%llx,%zx] np %ld from %pf\n",
+	DBGA2("pci_unmap_single: sg [%llx,%zx] np %ld from %ps\n",
 	      dma_addr, size, npages, __builtin_return_address(0));
 }
 
@@ -445,7 +445,7 @@ try_again:
 	cpu_addr = (void *)__get_free_pages(gfp, order);
 	if (! cpu_addr) {
 		printk(KERN_INFO "pci_alloc_consistent: "
-		       "get_free_pages failed from %pf\n",
+		       "get_free_pages failed from %ps\n",
 			__builtin_return_address(0));
 		/* ??? Really atomic allocation?  Otherwise we could play
 		   with vmalloc and sg if we can't find contiguous memory.  */
@@ -464,7 +464,7 @@ try_again:
 		goto try_again;
 	}
 
-	DBGA2("pci_alloc_consistent: %zx -> [%p,%llx] from %pf\n",
+	DBGA2("pci_alloc_consistent: %zx -> [%p,%llx] from %ps\n",
 	      size, cpu_addr, *dma_addrp, __builtin_return_address(0));
 
 	return cpu_addr;
@@ -484,7 +484,7 @@ static void alpha_pci_free_coherent(struct device *dev, size_t size,
 	pci_unmap_single(pdev, dma_addr, size, PCI_DMA_BIDIRECTIONAL);
 	free_pages((unsigned long)cpu_addr, get_order(size));
 
-	DBGA2("pci_free_consistent: [%llx,%zx] from %pf\n",
+	DBGA2("pci_free_consistent: [%llx,%zx] from %ps\n",
 	      dma_addr, size, __builtin_return_address(0));
 }
 
-- 
2.1.0
