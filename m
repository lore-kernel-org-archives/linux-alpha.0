From: Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH 04/17] pci: sysfs: move declarations to linux/pci.h
Date: Thu, 10 Aug 2023 16:19:22 +0200
Message-ID: <20230810141947.1236730-5-arnd@kernel.org>
References: <20230810141947.1236730-1-arnd@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691677300;
        bh=ez3JL8BNfjOCxYcnwWUPckDUgraG8trVYo74A4xvgWg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ETdwqpKA+uHPxi/FhqBPMZ7sUPiTFHbZoWeRFm8cZL3k4ZWOEZxIKbHGeoqEM9+uJ
         ozwxxlFBZQfwTr/IUynyKDWO9lKvgYGwcq6ZOBTx8FSdQ2CbmznY+XZB43HvOkijdN
         0MszufkNCEmW+WmNsm3/64H+3zVxByHkWjDz1zVhLDr3v8a3Yzz9OH1d9xx7BP5y12
         dHyV7s7CR3eOHMA6/WvzNPPzdWNJeH1U7wx8KVXZulPtrykpBgUMFptJC+gNdifX/J
         yPxzjDm1Chvknde67QPWz68pYE5xvmp0fceBHZS9Q4mdmhW9qm7cPF3s+E5mJCIoOQ
         u7CNF5bdLbMHg==
In-Reply-To: <20230810141947.1236730-1-arnd@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Reinette Chatre <reinette.chatre@intel.com>, Ira Weiny <ira.weiny@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Sami Tolvanen <samitolvanen@google.com>, linux-alpha@vger.kernel.org, linux-pci@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

A couple of architectures build the __weak versions of
pci_create_resource_files() and pci_remove_resource_files() but don't
have prototypes for these, which causes warnings:

drivers/pci/pci-sysfs.c:1253:12: error: no previous prototype for 'pci_create_resource_files' [-Werror=missing-prototypes]
 1253 | int __weak pci_create_resource_files(struct pci_dev *dev) { return 0; }
drivers/pci/pci-sysfs.c:1254:13: error: no previous prototype for 'pci_remove_resource_files' [-Werror=missing-prototypes]
 1254 | void __weak pci_remove_resource_files(struct pci_dev *dev) { return; }

Move the prototypes from alpha architecture into the global header to
avoid these warnings for all of them.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/alpha/include/asm/pci.h | 3 ---
 include/linux/pci.h          | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/pci.h b/arch/alpha/include/asm/pci.h
index 6312656279d79..6c04fcbdc8ed2 100644
--- a/arch/alpha/include/asm/pci.h
+++ b/arch/alpha/include/asm/pci.h
@@ -88,7 +88,4 @@ extern void pci_adjust_legacy_attr(struct pci_bus *bus,
 				   enum pci_mmap_state mmap_type);
 #define HAVE_PCI_LEGACY	1
 
-extern int pci_create_resource_files(struct pci_dev *dev);
-extern void pci_remove_resource_files(struct pci_dev *dev);
-
 #endif /* __ALPHA_PCI_H */
diff --git a/include/linux/pci.h b/include/linux/pci.h
index eeb2e6f6130f4..198a399c4b792 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2260,6 +2260,11 @@ int pcibios_alloc_irq(struct pci_dev *dev);
 void pcibios_free_irq(struct pci_dev *dev);
 resource_size_t pcibios_default_alignment(void);
 
+#if !defined(HAVE_PCI_MMAP) && !defined(ARCH_GENERIC_PCI_MMAP_RESOURCE)
+extern int pci_create_resource_files(struct pci_dev *dev);
+extern void pci_remove_resource_files(struct pci_dev *dev);
+#endif
+
 #if defined(CONFIG_PCI_MMCONFIG) || defined(CONFIG_ACPI_MCFG)
 void __init pci_mmcfg_early_init(void);
 void __init pci_mmcfg_late_init(void);
-- 
2.39.2

