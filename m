From: Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Date: Wed,  4 Aug 2021 17:52:14 -0700
Message-ID: <20210805005218.2912076-12-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>, Andi Kleen <ak@linux.intel.com>, Kirill Shutemov <kirill.shutemov@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org

From: Andi Kleen <ak@linux.intel.com>

Add a new variant of pci_iomap for mapping all PCI resources
of a devices as shared memory with a hypervisor in a confidential
guest.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 include/asm-generic/pci_iomap.h |  6 +++++
 lib/pci_iomap.c                 | 46 +++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/include/asm-generic/pci_iomap.h b/include/asm-generic/pci_iomap.h
index d4f16dcc2ed7..0178ddd7ad88 100644
--- a/include/asm-generic/pci_iomap.h
+++ b/include/asm-generic/pci_iomap.h
@@ -18,6 +18,12 @@ extern void __iomem *pci_iomap_range(struct pci_dev *dev, int bar,
 extern void __iomem *pci_iomap_wc_range(struct pci_dev *dev, int bar,
 					unsigned long offset,
 					unsigned long maxlen);
+extern void __iomem *pci_iomap_shared(struct pci_dev *dev, int bar,
+				      unsigned long max);
+extern void __iomem *pci_iomap_shared_range(struct pci_dev *dev, int bar,
+					    unsigned long offset,
+					    unsigned long maxlen);
+
 /* Create a virtual mapping cookie for a port on a given PCI device.
  * Do not call this directly, it exists to make it easier for architectures
  * to override */
diff --git a/lib/pci_iomap.c b/lib/pci_iomap.c
index 6251c3f651c6..b04e8689eab3 100644
--- a/lib/pci_iomap.c
+++ b/lib/pci_iomap.c
@@ -25,6 +25,11 @@ static void __iomem *map_ioremap_wc(phys_addr_t addr, size_t size)
 	return ioremap_wc(addr, size);
 }
 
+static void __iomem *map_ioremap_shared(phys_addr_t addr, size_t size)
+{
+	return ioremap_shared(addr, size);
+}
+
 static void __iomem *pci_iomap_range_map(struct pci_dev *dev,
 					 int bar,
 					 unsigned long offset,
@@ -101,6 +106,47 @@ void __iomem *pci_iomap_wc_range(struct pci_dev *dev,
 }
 EXPORT_SYMBOL_GPL(pci_iomap_wc_range);
 
+/**
+ * pci_iomap_shared_range - create a virtual shared mapping cookie for a
+ *                          PCI BAR
+ * @dev: PCI device that owns the BAR
+ * @bar: BAR number
+ * @offset: map memory at the given offset in BAR
+ * @maxlen: max length of the memory to map
+ *
+ * Remap a pci device's resources shared in a confidential guest.
+ * For more details see pci_iomap_range's documentation.
+ *
+ * @maxlen specifies the maximum length to map. To get access to
+ * the complete BAR from offset to the end, pass %0 here.
+ */
+void __iomem *pci_iomap_shared_range(struct pci_dev *dev, int bar,
+				     unsigned long offset, unsigned long maxlen)
+{
+	return pci_iomap_range_map(dev, bar, offset, maxlen,
+				   map_ioremap_shared);
+}
+EXPORT_SYMBOL_GPL(pci_iomap_shared_range);
+
+/**
+ * pci_iomap_shared - create a virtual shared mapping cookie for a PCI BAR
+ * @dev: PCI device that owns the BAR
+ * @bar: BAR number
+ * @maxlen: length of the memory to map
+ *
+ * See pci_iomap for details. This function creates a shared mapping
+ * with the host for confidential hosts.
+ *
+ * @maxlen specifies the maximum length to map. To get access to the
+ * complete BAR without checking for its length first, pass %0 here.
+ */
+void __iomem *pci_iomap_shared(struct pci_dev *dev, int bar,
+			       unsigned long maxlen)
+{
+	return pci_iomap_shared_range(dev, bar, 0, maxlen);
+}
+EXPORT_SYMBOL_GPL(pci_iomap_shared);
+
 /**
  * pci_iomap - create a virtual mapping cookie for a PCI BAR
  * @dev: PCI device that owns the BAR
-- 
2.25.1

