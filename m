From: Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v4 09/15] pci: Consolidate pci_iomap* and pci_iomap*wc
Date: Wed,  4 Aug 2021 17:52:12 -0700
Message-ID: <20210805005218.2912076-10-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>, Andi Kleen <ak@linux.intel.com>, Kirill Shutemov <kirill.shutemov@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org

From: Andi Kleen <ak@linux.intel.com>

pci_iomap* and pci_iomap*wc are currently duplicated code, except
that the _wc variant does not support IO ports. Replace them
with a common helper and a callback for the mapping. I used
wrappers for the maps because some architectures implement ioremap
and friends with macros.

This will allow to add more variants without excessive code
duplications. This patch should have no behavior change.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 lib/pci_iomap.c | 81 +++++++++++++++++++++++++++----------------------
 1 file changed, 44 insertions(+), 37 deletions(-)

diff --git a/lib/pci_iomap.c b/lib/pci_iomap.c
index 2d3eb1cb73b8..6251c3f651c6 100644
--- a/lib/pci_iomap.c
+++ b/lib/pci_iomap.c
@@ -10,6 +10,46 @@
 #include <linux/export.h>
 
 #ifdef CONFIG_PCI
+
+/*
+ * Callback wrappers because some architectures define ioremap et.al.
+ * as macros.
+ */
+static void __iomem *map_ioremap(phys_addr_t addr, size_t size)
+{
+	return ioremap(addr, size);
+}
+
+static void __iomem *map_ioremap_wc(phys_addr_t addr, size_t size)
+{
+	return ioremap_wc(addr, size);
+}
+
+static void __iomem *pci_iomap_range_map(struct pci_dev *dev,
+					 int bar,
+					 unsigned long offset,
+					 unsigned long maxlen,
+					 void __iomem *(*mapm)(phys_addr_t,
+							       size_t))
+{
+	resource_size_t start = pci_resource_start(dev, bar);
+	resource_size_t len = pci_resource_len(dev, bar);
+	unsigned long flags = pci_resource_flags(dev, bar);
+
+	if (len <= offset || !start)
+		return NULL;
+	len -= offset;
+	start += offset;
+	if (maxlen && len > maxlen)
+		len = maxlen;
+	if (flags & IORESOURCE_IO)
+		return __pci_ioport_map(dev, start, len);
+	if (flags & IORESOURCE_MEM)
+		return mapm(start, len);
+	/* What? */
+	return NULL;
+}
+
 /**
  * pci_iomap_range - create a virtual mapping cookie for a PCI BAR
  * @dev: PCI device that owns the BAR
@@ -30,22 +70,8 @@ void __iomem *pci_iomap_range(struct pci_dev *dev,
 			      unsigned long offset,
 			      unsigned long maxlen)
 {
-	resource_size_t start = pci_resource_start(dev, bar);
-	resource_size_t len = pci_resource_len(dev, bar);
-	unsigned long flags = pci_resource_flags(dev, bar);
-
-	if (len <= offset || !start)
-		return NULL;
-	len -= offset;
-	start += offset;
-	if (maxlen && len > maxlen)
-		len = maxlen;
-	if (flags & IORESOURCE_IO)
-		return __pci_ioport_map(dev, start, len);
-	if (flags & IORESOURCE_MEM)
-		return ioremap(start, len);
-	/* What? */
-	return NULL;
+	return pci_iomap_range_map(dev, bar, offset, maxlen,
+				   map_ioremap);
 }
 EXPORT_SYMBOL(pci_iomap_range);
 
@@ -70,27 +96,8 @@ void __iomem *pci_iomap_wc_range(struct pci_dev *dev,
 				 unsigned long offset,
 				 unsigned long maxlen)
 {
-	resource_size_t start = pci_resource_start(dev, bar);
-	resource_size_t len = pci_resource_len(dev, bar);
-	unsigned long flags = pci_resource_flags(dev, bar);
-
-
-	if (flags & IORESOURCE_IO)
-		return NULL;
-
-	if (len <= offset || !start)
-		return NULL;
-
-	len -= offset;
-	start += offset;
-	if (maxlen && len > maxlen)
-		len = maxlen;
-
-	if (flags & IORESOURCE_MEM)
-		return ioremap_wc(start, len);
-
-	/* What? */
-	return NULL;
+	return pci_iomap_range_map(dev, bar, offset, maxlen,
+				   map_ioremap_wc);
 }
 EXPORT_SYMBOL_GPL(pci_iomap_wc_range);
 
-- 
2.25.1

