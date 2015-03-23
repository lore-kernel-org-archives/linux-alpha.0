From: Yijing Wang <wangyijing@huawei.com>
Subject: [PATCH v7 13/31] PCI: Move pcibios_root_bridge_prepare() to
 pci_create_host_bridge()
Date: Mon, 23 Mar 2015 20:40:39 +0800
Message-ID: <1427114457-16687-14-git-send-email-wangyijing@huawei.com>
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

Move pcibios_root_bridge_prepare() to pci_create_host_bridge().

Signed-off-by: Yijing Wang <wangyijing@huawei.com>
---
 drivers/pci/host-bridge.c |   16 +++++++++++++---
 drivers/pci/probe.c       |    3 ---
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/host-bridge.c b/drivers/pci/host-bridge.c
index b0ed8da..87c4fc5 100644
--- a/drivers/pci/host-bridge.c
+++ b/drivers/pci/host-bridge.c
@@ -92,9 +92,7 @@ struct pci_host_bridge *pci_create_host_bridge(
 			pr_warn("pci host bridge pci%04x:%02x exist\n",
 					host->domain, bus);
 			mutex_unlock(&pci_host_mutex);
-			pci_free_resource_list(&host->windows);
-			kfree(host);
-			return NULL;
+			goto free_res;
 		}
 	}
 	list_add_tail(&host->list, &pci_host_bridge_list);
@@ -105,6 +103,10 @@ struct pci_host_bridge *pci_create_host_bridge(
 	dev_set_name(&host->dev, "pci%04x:%02x",
 			host->domain, bus);
 
+	error = pcibios_root_bridge_prepare(host);
+	if (error)
+		goto list_del;
+
 	error = device_register(&host->dev);
 	if (error) {
 		put_device(&host->dev);
@@ -112,6 +114,14 @@ struct pci_host_bridge *pci_create_host_bridge(
 	}
 
 	return host;
+list_del:
+	mutex_lock(&pci_host_mutex);
+	list_del(&host->list);
+	mutex_unlock(&pci_host_mutex);
+free_res:
+	pci_free_resource_list(&host->windows);
+	kfree(host);
+	return NULL;
 }
 
 void pci_free_host_bridge(struct pci_host_bridge *host)
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 418a426..ee17d9a 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1893,9 +1893,6 @@ static struct pci_bus *__pci_create_root_bus(
 
 	bridge->bus = b;
 	b->bridge = get_device(&bridge->dev);
-	error = pcibios_root_bridge_prepare(bridge);
-	if (error)
-		goto put_dev;
 
 	pcibios_set_root_bus_speed(bridge);
 	device_enable_async_suspend(b->bridge);
-- 
1.7.1
