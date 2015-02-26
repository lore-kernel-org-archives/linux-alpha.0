From: Yijing Wang <wangyijing@huawei.com>
Subject: [PATCH v4 15/30] PCI/IA64: Refine pci_acpi_scan_root() with generic
 pci_host_bridge
Date: Thu, 26 Feb 2015 16:12:09 +0800
Message-ID: <1424938344-4017-16-git-send-email-wangyijing@huawei.com>
References: <1424938344-4017-1-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1424938344-4017-1-git-send-email-wangyijing@huawei.com>
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
Cc: linux-ia64@vger.kernel.org, linux-pci@vger.kernel.org, Yijing Wang <wangyijing@huawei.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Fenghua Yu <fenghua.yu@intel.com>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, Rusty Russell <rusty@rustcorp.com.au>, linux-m68k@lists.linux-m68k.org, Thomas Gleixner <tglx@linutronix.de>, Yinghai Lu <yinghai@kernel.org>, Yijing Wang <wangyijing0307@gmail.com>, Liviu Dudau <liviu@dudau.co.uk>, Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, linux-alpha@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

From: Yijing Wang <wangyijing0307@gmail.com>

Signed-off-by: Yijing Wang <wangyijing@huawei.com>
CC: Tony Luck <tony.luck@intel.com>
CC: Fenghua Yu <fenghua.yu@intel.com>
CC: linux-ia64@vger.kernel.org
---
 arch/ia64/pci/pci.c |   34 ++++++++++++++++++----------------
 1 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/arch/ia64/pci/pci.c b/arch/ia64/pci/pci.c
index e4cda61..dc5354d 100644
--- a/arch/ia64/pci/pci.c
+++ b/arch/ia64/pci/pci.c
@@ -420,6 +420,18 @@ probe_pci_root_info(struct pci_root_info *info, struct acpi_device *device,
 	return 0;
 }
 
+static int pci_host_bridge_prepare(struct pci_host_bridge *bridge)
+{
+	struct pci_controller *controller = bridge->bus->sysdata;
+
+	ACPI_COMPANION_SET(&bridge->dev, controller->companion);
+	return 0;
+}
+
+static struct pci_host_bridge_ops phb_ops = {
+	.phb_prepare = pci_host_bridge_prepare,
+};
+
 struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
 {
 	struct acpi_device *device = root->device;
@@ -428,7 +440,7 @@ struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
 	struct pci_controller *controller;
 	struct pci_root_info *info = NULL;
 	int busnum = root->secondary.start;
-	struct pci_bus *pbus;
+	struct pci_host_bridge *host;
 	int ret;
 
 	controller = alloc_pci_controller(domain);
@@ -465,26 +477,16 @@ struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
 	 * should handle the case here, but it appears that IA64 hasn't
 	 * such quirk. So we just ignore the case now.
 	 */
-	pbus = pci_create_root_bus(NULL, PCI_DOMBUS(domain, bus), 
-			&pci_root_ops, controller, &info->resources);
-	if (!pbus) {
+	host = pci_scan_root_bridge(NULL, PCI_DOMBUS(domain, bus), 
+			&pci_root_ops, controller, &info->resources, &phb_ops);
+	if (!host) {
 		pci_free_resource_list(&info->resources);
 		__release_pci_root_info(info);
 		return NULL;
 	}
 
-	pci_set_host_bridge_release(to_pci_host_bridge(pbus->bridge),
-			release_pci_root_info, info);
-	pci_scan_child_bus(pbus);
-	return pbus;
-}
-
-int pcibios_root_bridge_prepare(struct pci_host_bridge *bridge)
-{
-	struct pci_controller *controller = bridge->bus->sysdata;
-
-	ACPI_COMPANION_SET(&bridge->dev, controller->companion);
-	return 0;
+	pci_set_host_bridge_release(host, release_pci_root_info, info);
+	return host->bus;
 }
 
 void pcibios_fixup_device_resources(struct pci_dev *dev)
-- 
1.7.1
