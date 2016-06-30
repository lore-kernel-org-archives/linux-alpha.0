From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v5 02/44] alpha: dma-mapping: Use unsigned long for dma_attrs
Date: Thu, 30 Jun 2016 10:25:29 +0200
Message-ID: <1467275171-6298-2-git-send-email-k.kozlowski@samsung.com>
References: <1467275019-30789-1-git-send-email-k.kozlowski@samsung.com>
 <1467275171-6298-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1467275171-6298-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, hch@infradead.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/alpha/include/asm/dma-mapping.h |  2 --
 arch/alpha/kernel/pci-noop.c         |  2 +-
 arch/alpha/kernel/pci_iommu.c        | 12 ++++++------
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/alpha/include/asm/dma-mapping.h b/arch/alpha/include/asm/dma-mapping.h
index 3c3451f58ff4..c63b6ac19ee5 100644
--- a/arch/alpha/include/asm/dma-mapping.h
+++ b/arch/alpha/include/asm/dma-mapping.h
@@ -1,8 +1,6 @@
 #ifndef _ALPHA_DMA_MAPPING_H
 #define _ALPHA_DMA_MAPPING_H
 
-#include <linux/dma-attrs.h>
-
 extern struct dma_map_ops *dma_ops;
 
 static inline struct dma_map_ops *get_dma_ops(struct device *dev)
diff --git a/arch/alpha/kernel/pci-noop.c b/arch/alpha/kernel/pci-noop.c
index 8e735b5e56bd..bb152e21e5ae 100644
--- a/arch/alpha/kernel/pci-noop.c
+++ b/arch/alpha/kernel/pci-noop.c
@@ -109,7 +109,7 @@ sys_pciconfig_write(unsigned long bus, unsigned long dfn,
 
 static void *alpha_noop_alloc_coherent(struct device *dev, size_t size,
 				       dma_addr_t *dma_handle, gfp_t gfp,
-				       struct dma_attrs *attrs)
+				       unsigned long attrs)
 {
 	void *ret;
 
diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 8969bf2dfe3a..451fc9cdd323 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -349,7 +349,7 @@ static struct pci_dev *alpha_gendev_to_pci(struct device *dev)
 static dma_addr_t alpha_pci_map_page(struct device *dev, struct page *page,
 				     unsigned long offset, size_t size,
 				     enum dma_data_direction dir,
-				     struct dma_attrs *attrs)
+				     unsigned long attrs)
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	int dac_allowed;
@@ -369,7 +369,7 @@ static dma_addr_t alpha_pci_map_page(struct device *dev, struct page *page,
 
 static void alpha_pci_unmap_page(struct device *dev, dma_addr_t dma_addr,
 				 size_t size, enum dma_data_direction dir,
-				 struct dma_attrs *attrs)
+				 unsigned long attrs)
 {
 	unsigned long flags;
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
@@ -433,7 +433,7 @@ static void alpha_pci_unmap_page(struct device *dev, dma_addr_t dma_addr,
 
 static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 				      dma_addr_t *dma_addrp, gfp_t gfp,
-				      struct dma_attrs *attrs)
+				      unsigned long attrs)
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	void *cpu_addr;
@@ -478,7 +478,7 @@ try_again:
 
 static void alpha_pci_free_coherent(struct device *dev, size_t size,
 				    void *cpu_addr, dma_addr_t dma_addr,
-				    struct dma_attrs *attrs)
+				    unsigned long attrs)
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	pci_unmap_single(pdev, dma_addr, size, PCI_DMA_BIDIRECTIONAL);
@@ -651,7 +651,7 @@ sg_fill(struct device *dev, struct scatterlist *leader, struct scatterlist *end,
 
 static int alpha_pci_map_sg(struct device *dev, struct scatterlist *sg,
 			    int nents, enum dma_data_direction dir,
-			    struct dma_attrs *attrs)
+			    unsigned long attrs)
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	struct scatterlist *start, *end, *out;
@@ -729,7 +729,7 @@ static int alpha_pci_map_sg(struct device *dev, struct scatterlist *sg,
 
 static void alpha_pci_unmap_sg(struct device *dev, struct scatterlist *sg,
 			       int nents, enum dma_data_direction dir,
-			       struct dma_attrs *attrs)
+			       unsigned long attrs)
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	unsigned long flags;
-- 
1.9.1

