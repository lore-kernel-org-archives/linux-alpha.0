From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCHv2 RFC (repost) 12/16] tile: switch to GENERIC_PCI_IOMAP
Date: Wed, 21 Dec 2011 18:30:07 +0200
Message-ID: <e1640e60e2762b7171a1523698745a0d4a91ab0c.1324484752.git.mst@redhat.com>
References: <cover.1324484752.git.mst@redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1324484752.git.mst@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

tile now has working stubs for ioport_map and ioremap
such that the generic pci_iomap will DTRT: cast to
pointer on memory and return NULL and log message on IO map.

Switch it over to GENERIC_PCI_IOMAP.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Chris Metcalf <cmetcalf@tilera.com>
---
 arch/tile/Kconfig           |    1 +
 arch/tile/include/asm/pci.h |    2 +-
 arch/tile/kernel/pci.c      |   21 ---------------------
 3 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/arch/tile/Kconfig b/arch/tile/Kconfig
index 70a0de4..11270ca 100644
--- a/arch/tile/Kconfig
+++ b/arch/tile/Kconfig
@@ -321,6 +321,7 @@ config PCI
 	bool "PCI support"
 	default y
 	select PCI_DOMAINS
+	select GENERIC_PCI_IOMAP
 	---help---
 	  Enable PCI root complex support, so PCIe endpoint devices can
 	  be attached to the Tile chip.  Many, but not all, PCI devices
diff --git a/arch/tile/include/asm/pci.h b/arch/tile/include/asm/pci.h
index 7f03cef..1d25fea 100644
--- a/arch/tile/include/asm/pci.h
+++ b/arch/tile/include/asm/pci.h
@@ -16,6 +16,7 @@
 #define _ASM_TILE_PCI_H
 
 #include <linux/pci.h>
+#include <asm-generic/pci_iomap.h>
 
 /*
  * Structure of a PCI controller (host bridge)
@@ -49,7 +50,6 @@ struct pci_controller {
 int __devinit tile_pci_init(void);
 int __devinit pcibios_init(void);
 
-void __iomem *pci_iomap(struct pci_dev *dev, int bar, unsigned long max);
 static inline void pci_iounmap(struct pci_dev *dev, void __iomem *addr) {}
 
 void __devinit pcibios_fixup_bus(struct pci_bus *bus);
diff --git a/arch/tile/kernel/pci.c b/arch/tile/kernel/pci.c
index 9d610d3..2556793 100644
--- a/arch/tile/kernel/pci.c
+++ b/arch/tile/kernel/pci.c
@@ -466,27 +466,6 @@ int pcibios_enable_device(struct pci_dev *dev, int mask)
 	return 0;
 }
 
-void __iomem *pci_iomap(struct pci_dev *dev, int bar, unsigned long max)
-{
-	unsigned long start = pci_resource_start(dev, bar);
-	unsigned long len = pci_resource_len(dev, bar);
-	unsigned long flags = pci_resource_flags(dev, bar);
-
-	if (!len)
-		return NULL;
-	if (max && len > max)
-		len = max;
-
-	if (!(flags & IORESOURCE_MEM)) {
-		pr_info("PCI: Trying to map invalid resource %#lx\n", flags);
-		start = 0;
-	}
-
-	return (void __iomem *)start;
-}
-EXPORT_SYMBOL(pci_iomap);
-
-
 /****************************************************************
  *
  * Tile PCI config space read/write routines
-- 
1.7.8.382.g3daff

