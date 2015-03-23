From: Yijing Wang <wangyijing@huawei.com>
Subject: [PATCH v7 02/31] PCI: Remove deprecated pci_scan_bus_parented()
Date: Mon, 23 Mar 2015 20:40:28 +0800
Message-ID: <1427114457-16687-3-git-send-email-wangyijing@huawei.com>
References: <1427114457-16687-1-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1427114457-16687-1-git-send-email-wangyijing@huawei.com>
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
Cc: Liviu Dudau <liviu@dudau.co.uk>, Rusty Russell <rusty@rustcorp.com.au>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, linux-pci@vger.kernel.org, x86@kernel.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-alpha@vger.kernel.org, Tony Luck <tony.luck@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Yijing Wang <wangyijing@huawei.com>, linux-ia64@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Yinghai Lu <yinghai@kernel.org>, Jiang Liu <jiang.liu@linux.intel.com>, linux-arm-kernel@lists.infradead.org

No one uses pci_scan_bus_parented() any more,
remove it.

Signed-off-by: Yijing Wang <wangyijing@huawei.com>
---
 drivers/pci/probe.c |   19 -------------------
 include/linux/pci.h |    2 --
 2 files changed, 0 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 8ef0375..699a238 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2091,25 +2091,6 @@ struct pci_bus *pci_scan_root_bus(struct device *parent, int bus,
 }
 EXPORT_SYMBOL(pci_scan_root_bus);
 
-/* Deprecated; use pci_scan_root_bus() instead */
-struct pci_bus *pci_scan_bus_parented(struct device *parent,
-		int bus, struct pci_ops *ops, void *sysdata)
-{
-	LIST_HEAD(resources);
-	struct pci_bus *b;
-
-	pci_add_resource(&resources, &ioport_resource);
-	pci_add_resource(&resources, &iomem_resource);
-	pci_add_resource(&resources, &busn_resource);
-	b = pci_create_root_bus(parent, bus, ops, sysdata, &resources);
-	if (b)
-		pci_scan_child_bus(b);
-	else
-		pci_free_resource_list(&resources);
-	return b;
-}
-EXPORT_SYMBOL(pci_scan_bus_parented);
-
 struct pci_bus *pci_scan_bus(int bus, struct pci_ops *ops,
 					void *sysdata)
 {
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 211e9da..36effb8 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -769,8 +769,6 @@ void pcibios_bus_to_resource(struct pci_bus *bus, struct resource *res,
 void pcibios_scan_specific_bus(int busn);
 struct pci_bus *pci_find_bus(int domain, int busnr);
 void pci_bus_add_devices(const struct pci_bus *bus);
-struct pci_bus *pci_scan_bus_parented(struct device *parent, int bus,
-				      struct pci_ops *ops, void *sysdata);
 struct pci_bus *pci_scan_bus(int bus, struct pci_ops *ops, void *sysdata);
 struct pci_bus *pci_create_root_bus(struct device *parent, int bus,
 				    struct pci_ops *ops, void *sysdata,
-- 
1.7.1
