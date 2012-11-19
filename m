From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 269/493] alpha: remove use of __devinit
Date: Mon, 19 Nov 2012 13:23:38 -0500
Message-ID: <1353349642-3677-269-git-send-email-wfp5p@virginia.edu>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: linux-alpha@vger.kernel.org

CONFIG_HOTPLUG is going away as an option so __devinit is no longer
needed.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
Cc: linux-alpha@vger.kernel.org 
---
 arch/alpha/include/asm/parport.h |  4 ++--
 arch/alpha/kernel/pci.c          | 12 +++++-------
 arch/alpha/kernel/smp.c          |  6 ++----
 arch/alpha/kernel/sys_titan.c    |  3 +--
 4 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/arch/alpha/include/asm/parport.h b/arch/alpha/include/asm/parport.h
index c5ee7cb..6abd0af 100644
--- a/arch/alpha/include/asm/parport.h
+++ b/arch/alpha/include/asm/parport.h
@@ -9,8 +9,8 @@
 #ifndef _ASM_AXP_PARPORT_H
 #define _ASM_AXP_PARPORT_H 1
 
-static int __devinit parport_pc_find_isa_ports (int autoirq, int autodma);
-static int __devinit parport_pc_find_nonpci_ports (int autoirq, int autodma)
+static int parport_pc_find_isa_ports (int autoirq, int autodma);
+static int parport_pc_find_nonpci_ports (int autoirq, int autodma)
 {
 	return parport_pc_find_isa_ports (autoirq, autodma);
 }
diff --git a/arch/alpha/kernel/pci.c b/arch/alpha/kernel/pci.c
index ef75714..edb4e00 100644
--- a/arch/alpha/kernel/pci.c
+++ b/arch/alpha/kernel/pci.c
@@ -59,13 +59,13 @@ struct pci_controller *pci_isa_hose;
  * Quirks.
  */
 
-static void __devinit quirk_isa_bridge(struct pci_dev *dev)
+static void quirk_isa_bridge(struct pci_dev *dev)
 {
 	dev->class = PCI_CLASS_BRIDGE_ISA << 8;
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82378, quirk_isa_bridge);
 
-static void __devinit quirk_cypress(struct pci_dev *dev)
+static void quirk_cypress(struct pci_dev *dev)
 {
 	/* The Notorious Cy82C693 chip.  */
 
@@ -104,7 +104,7 @@ static void __devinit quirk_cypress(struct pci_dev *dev)
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_CONTAQ, PCI_DEVICE_ID_CONTAQ_82C693, quirk_cypress);
 
 /* Called for each device after PCI setup is done. */
-static void __devinit pcibios_fixup_final(struct pci_dev *dev)
+static void pcibios_fixup_final(struct pci_dev *dev)
 {
 	unsigned int class = dev->class >> 8;
 
@@ -198,8 +198,7 @@ subsys_initcall(pcibios_init);
 #ifdef ALPHA_RESTORE_SRM_SETUP
 static struct pdev_srm_saved_conf *srm_saved_configs;
 
-void __devinit
-pdev_save_srm_config(struct pci_dev *dev)
+void pdev_save_srm_config(struct pci_dev *dev)
 {
 	struct pdev_srm_saved_conf *tmp;
 	static int printed = 0;
@@ -241,8 +240,7 @@ pci_restore_srm_config(void)
 }
 #endif
 
-void __devinit
-pcibios_fixup_bus(struct pci_bus *bus)
+void pcibios_fixup_bus(struct pci_bus *bus)
 {
 	struct pci_dev *dev = bus->self;
 
diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index a41ad90..33d46b2 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -172,8 +172,7 @@ smp_callin(void)
 }
 
 /* Wait until hwrpb->txrdy is clear for cpu.  Return -1 on timeout.  */
-static int __devinit
-wait_for_txrdy (unsigned long cpumask)
+static int wait_for_txrdy (unsigned long cpumask)
 {
 	unsigned long timeout;
 
@@ -468,8 +467,7 @@ smp_prepare_cpus(unsigned int max_cpus)
 	smp_num_cpus = smp_num_probed;
 }
 
-void __devinit
-smp_prepare_boot_cpu(void)
+void smp_prepare_boot_cpu(void)
 {
 }
 
diff --git a/arch/alpha/kernel/sys_titan.c b/arch/alpha/kernel/sys_titan.c
index 2533db2..f9b1809 100644
--- a/arch/alpha/kernel/sys_titan.c
+++ b/arch/alpha/kernel/sys_titan.c
@@ -303,8 +303,7 @@ titan_late_init(void)
 
 }
 
-static int __devinit
-titan_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
+static int titan_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 {
 	u8 intline;
 	int irq;
-- 
1.8.0

