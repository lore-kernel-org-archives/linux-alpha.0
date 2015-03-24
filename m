From: Yijing Wang <wangyijing@huawei.com>
Subject: [PATCH v8 27/30] PCI: Rename __pci_create_root_bus() to
 pci_create_root_bus()
Date: Tue, 24 Mar 2015 11:34:21 +0800
Message-ID: <1427168064-8657-28-git-send-email-wangyijing@huawei.com>
References: <1427168064-8657-1-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1427168064-8657-1-git-send-email-wangyijing@huawei.com>
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

Now no one use pci_create_root_bus(), we could remove it
and rename __pci_create_root_bus() to pci_create_root_bus().

Signed-off-by: wangyijing@huawei.com
---
 drivers/pci/probe.c |   35 +++++++++--------------------------
 include/linux/pci.h |    3 ---
 2 files changed, 9 insertions(+), 29 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 7796bf8..cb0237f 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1852,7 +1852,7 @@ void __weak pcibios_remove_bus(struct pci_bus *bus)
 {
 }
 
-static struct pci_bus *__pci_create_root_bus(
+static struct pci_bus *pci_create_root_bus(
 		struct pci_host_bridge *bridge, struct pci_ops *ops)
 {
 	int error;
@@ -1937,24 +1937,6 @@ put_dev:
 	return NULL;
 }
 
-struct pci_bus *pci_create_root_bus(struct device *parent,
-		int domain, int bus, struct pci_ops *ops, void *sysdata,
-		struct list_head *resources)
-{
-	struct pci_host_bridge *host;
-
-	host = pci_create_host_bridge(parent, domain, bus,
-			sysdata, resources, NULL);
-	if (!host)
-		return NULL;
-
-	host->bus = __pci_create_root_bus(host, ops);
-	if (!host->bus)
-		pci_free_host_bridge(host);
-
-	return host->bus;
-}
-
 int pci_bus_insert_busn_res(struct pci_bus *b, int bus, int bus_max)
 {
 	struct resource *res = &b->busn_res;
@@ -2030,7 +2012,7 @@ static struct pci_bus *__pci_scan_root_bus(
 	struct pci_bus *b;
 	int max;
 
-	b = __pci_create_root_bus(host, ops);
+	b = pci_create_root_bus(host, ops);
 	if (!b)
 		return NULL;
 
@@ -2093,19 +2075,20 @@ struct pci_bus *pci_scan_bus(int domain, int bus,
 		struct pci_ops *ops, void *sysdata)
 {
 	LIST_HEAD(resources);
-	struct pci_bus *b;
+	struct pci_host_bridge *host;
 
 	pci_add_resource(&resources, &ioport_resource);
 	pci_add_resource(&resources, &iomem_resource);
 	pci_add_resource(&resources, &busn_resource);
-	b = pci_create_root_bus(NULL, domain, bus, ops, sysdata,
-			&resources);
-	if (b) {
-		pci_scan_child_bus(b);
+	host = pci_create_host_bridge(NULL, domain, bus, sysdata,
+			&resources, NULL);
+	if (host) {
+		__pci_scan_root_bus(host, ops);
+		return host->bus;
 	} else {
 		pci_free_resource_list(&resources);
 	}
-	return b;
+	return NULL;
 }
 EXPORT_SYMBOL(pci_scan_bus);
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 61e0853..62333ff 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -782,9 +782,6 @@ struct pci_bus *pci_find_bus(int domain, int busnr);
 void pci_bus_add_devices(const struct pci_bus *bus);
 struct pci_bus *pci_scan_bus(int domain, int bus, struct pci_ops *ops,
 					void *sysdata);
-struct pci_bus *pci_create_root_bus(struct device *parent, int domain, int bus,
-				    struct pci_ops *ops, void *sysdata,
-				    struct list_head *resources);
 int pci_bus_insert_busn_res(struct pci_bus *b, int bus, int busmax);
 int pci_bus_update_busn_res_end(struct pci_bus *b, int busmax);
 void pci_bus_release_busn_res(struct pci_bus *b);
-- 
1.7.1
