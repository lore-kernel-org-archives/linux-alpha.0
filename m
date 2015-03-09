From: Yijing Wang <wangyijing@huawei.com>
Subject: [PATCH v6 28/30] PCI: Export find_pci_host_bridge() and rename to
 pci_find_host_bridge()
Date: Mon, 9 Mar 2015 10:34:25 +0800
Message-ID: <1425868467-9667-29-git-send-email-wangyijing@huawei.com>
References: <1425868467-9667-1-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1425868467-9667-1-git-send-email-wangyijing@huawei.com>
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
Cc: linux-ia64@vger.kernel.org, linux-pci@vger.kernel.org, Yijing Wang <wangyijing@huawei.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, Rusty Russell <rusty@rustcorp.com.au>, linux-m68k@lists.linux-m68k.org, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Yinghai Lu <yinghai@kernel.org>, linux-arm-kernel@lists.infradead.org, Liviu Dudau <liviu@dudau.co.uk>, Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, linux-alpha@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Signed-off-by: Yijing Wang <wangyijing@huawei.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/host-bridge.c |    6 +++---
 drivers/pci/pci.h         |    2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/host-bridge.c b/drivers/pci/host-bridge.c
index bc1de59..51f0a82 100644
--- a/drivers/pci/host-bridge.c
+++ b/drivers/pci/host-bridge.c
@@ -103,7 +103,7 @@ static struct pci_bus *find_pci_root_bus(struct pci_bus *bus)
 	return bus;
 }
 
-static struct pci_host_bridge *find_pci_host_bridge(struct pci_bus *bus)
+struct pci_host_bridge *pci_find_host_bridge(struct pci_bus *bus)
 {
 	struct pci_bus *root_bus = find_pci_root_bus(bus);
 
@@ -121,7 +121,7 @@ void pci_set_host_bridge_release(struct pci_host_bridge *bridge,
 void pcibios_resource_to_bus(struct pci_bus *bus, struct pci_bus_region *region,
 			     struct resource *res)
 {
-	struct pci_host_bridge *bridge = find_pci_host_bridge(bus);
+	struct pci_host_bridge *bridge = pci_find_host_bridge(bus);
 	struct resource_entry *window;
 	resource_size_t offset = 0;
 
@@ -146,7 +146,7 @@ static bool region_contains(struct pci_bus_region *region1,
 void pcibios_bus_to_resource(struct pci_bus *bus, struct resource *res,
 			     struct pci_bus_region *region)
 {
-	struct pci_host_bridge *bridge = find_pci_host_bridge(bus);
+	struct pci_host_bridge *bridge = pci_find_host_bridge(bus);
 	struct resource_entry *window;
 	resource_size_t offset = 0;
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index a1dc9f2..45252dd 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -328,4 +328,6 @@ struct pci_host_bridge *pci_create_host_bridge(
 		void *sysdata, struct pci_host_bridge_ops *ops);
 
 void pci_free_host_bridge(struct pci_host_bridge *host);
+struct pci_host_bridge *pci_find_host_bridge(struct pci_bus *bus);
+
 #endif /* DRIVERS_PCI_H */
-- 
1.7.1
