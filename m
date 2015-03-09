From: Yijing Wang <wangyijing@huawei.com>
Subject: [PATCH v6 03/30] PCI: Export busn_resource to drivers/pci
Date: Mon, 9 Mar 2015 10:34:00 +0800
Message-ID: <1425868467-9667-4-git-send-email-wangyijing@huawei.com>
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
Cc: Liviu Dudau <liviu@dudau.co.uk>, Rusty Russell <rusty@rustcorp.com.au>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, linux-pci@vger.kernel.org, x86@kernel.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-alpha@vger.kernel.org, Tony Luck <tony.luck@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Yijing Wang <wangyijing@huawei.com>, linux-ia64@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Yinghai Lu <yinghai@kernel.org>, Jiang Liu <jiang.liu@linux.intel.com>, linux-arm-kernel@lists.infradead.org

Export out busn_resource. Xen pcifront module need it.

Signed-off-by: Yijing Wang <wangyijing@huawei.com>
---
 drivers/pci/pci.h   |    2 ++
 drivers/pci/probe.c |    3 ++-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 4091f82..eeacab9 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -10,6 +10,8 @@ bool pcie_cap_has_lnkctl(const struct pci_dev *dev);
 
 /* Functions internal to the PCI core code */
 
+extern struct resource busn_resource;
+
 int pci_create_sysfs_dev_files(struct pci_dev *pdev);
 void pci_remove_sysfs_dev_files(struct pci_dev *pdev);
 #if !defined(CONFIG_DMI) && !defined(CONFIG_ACPI)
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 8ef0375..b97ea81 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -17,12 +17,13 @@
 #define CARDBUS_LATENCY_TIMER	176	/* secondary latency timer */
 #define CARDBUS_RESERVE_BUSNR	3
 
-static struct resource busn_resource = {
+struct resource busn_resource = {
 	.name	= "PCI busn",
 	.start	= 0,
 	.end	= 255,
 	.flags	= IORESOURCE_BUS,
 };
+EXPORT_SYMBOL(busn_resource);
 
 /* Ugh.  Need to stop exporting this to modules. */
 LIST_HEAD(pci_root_buses);
-- 
1.7.1
