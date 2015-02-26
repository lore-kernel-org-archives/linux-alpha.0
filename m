From: Yijing Wang <wangyijing@huawei.com>
Subject: [PATCH v3 20/30] PCI/sparc: Use pci_scan_root_bridge() for simplicity
Date: Thu, 26 Feb 2015 09:29:37 +0800
Message-ID: <1424914187-21027-21-git-send-email-wangyijing@huawei.com>
References: <1424914187-21027-1-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1424914187-21027-1-git-send-email-wangyijing@huawei.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-ia64@vger.kernel.org, linux-pci@vger.kernel.org, Yijing Wang <wangyijing@huawei.com>, sparclinux@vger.kernel.org, Guan Xuetao <gxt@mprc.pku.edu.cn>, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, Rusty Russell <rusty@rustcorp.com.au>, linux-m68k@lists.linux-m68k.org, Thomas Gleixner <tglx@linutronix.de>, Yinghai Lu <yinghai@kernel.org>, linux-arm-kernel@lists.infradead.org, Liviu Dudau <liviu@dudau.co.uk>, Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, linux-alpha@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Now we could use pci_scan_root_bridge() to scan
pci buses, provide sparc specific pci_host_bridge_ops.

Signed-off-by: Yijing Wang <wangyijing@huawei.com>
CC: "David S. Miller" <davem@davemloft.net>
CC: sparclinux@vger.kernel.org
---
 arch/sparc/kernel/pci.c |   32 ++++++++++++++++++++++----------
 1 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
index 0af7c58..03e7376 100644
--- a/arch/sparc/kernel/pci.c
+++ b/arch/sparc/kernel/pci.c
@@ -650,12 +650,25 @@ static void pci_claim_bus_resources(struct pci_bus *bus)
 		pci_claim_bus_resources(child_bus);
 }
 
+static void pci_host_bridge_of_scan_bus(
+		struct pci_host_bridge *host)
+{
+	struct pci_pbm_info *pbm = dev_get_drvdata(&host->dev);
+	struct device_node *node = pbm->op->dev.of_node;
+
+	pci_of_scan_bus(pbm, node, host->bus);
+}
+
+static struct pci_host_bridge_ops phb_ops = {
+	.phb_of_scan_bus = pci_host_bridge_of_scan_bus,
+};
+
 struct pci_bus *pci_scan_one_pbm(struct pci_pbm_info *pbm,
 				 struct device *parent)
 {
 	LIST_HEAD(resources);
 	struct device_node *node = pbm->op->dev.of_node;
-	struct pci_bus *bus;
+	struct pci_host_bridge *host;
 
 	printk("PCI: Scanning PBM %s\n", node->full_name);
 
@@ -667,23 +680,22 @@ struct pci_bus *pci_scan_one_pbm(struct pci_pbm_info *pbm,
 	pbm->busn.end	= pbm->pci_last_busno;
 	pbm->busn.flags	= IORESOURCE_BUS;
 	pci_add_resource(&resources, &pbm->busn);
-	bus = pci_create_root_bus(parent, 
+	host = pci_scan_root_bridge(parent,
 			PCI_DOMBUS(pbm->index, pbm->pci_first_busno), 
-			pbm->pci_ops, pbm, &resources);
-	if (!bus) {
-		printk(KERN_ERR "Failed to create bus for %s\n",
+			pbm->pci_ops, pbm, &resources, &phb_ops);
+	if (!host) {
+		printk(KERN_ERR "Failed to create host bridge for %s\n",
 		       node->full_name);
 		pci_free_resource_list(&resources);
 		return NULL;
 	}
 
-	pci_of_scan_bus(pbm, node, bus);
-	pci_bus_add_devices(bus);
-	pci_bus_register_of_sysfs(bus);
+	pci_bus_add_devices(host->bus);
+	pci_bus_register_of_sysfs(host->bus);
 
-	pci_claim_bus_resources(bus);
+	pci_claim_bus_resources(host->bus);
 
-	return bus;
+	return host->bus;
 }
 
 void pcibios_fixup_bus(struct pci_bus *pbus)
-- 
1.7.1
