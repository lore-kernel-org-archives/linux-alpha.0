From: Yijing Wang <wangyijing@huawei.com>
Subject: [PATCH v3 23/30] PCI/mvebu: Use pci_common_init_dev() to simplify code
Date: Thu, 26 Feb 2015 09:29:40 +0800
Message-ID: <1424914187-21027-24-git-send-email-wangyijing@huawei.com>
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
Cc: linux-ia64@vger.kernel.org, linux-pci@vger.kernel.org, Yijing Wang <wangyijing@huawei.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, Rusty Russell <rusty@rustcorp.com.au>, linux-m68k@lists.linux-m68k.org, Thomas Gleixner <tglx@linutronix.de>, Yinghai Lu <yinghai@kernel.org>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Liviu Dudau <liviu@dudau.co.uk>, Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, linux-alpha@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Mvebu_pcie_scan_bus() is not necessary, we could use
pci_common_init_dev() instead of pci_common_init(),
and pass the device pointer as the parent. Then
pci_scan_root_bus() will be called to scan the pci busses.

Signed-off-by: Yijing Wang <wangyijing@huawei.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
CC: Jason Cooper <jason@lakedaemon.net>
---
 drivers/pci/host/pci-mvebu.c |   18 +-----------------
 1 files changed, 1 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/host/pci-mvebu.c b/drivers/pci/host/pci-mvebu.c
index 1309cfb..d5a2b70 100644
--- a/drivers/pci/host/pci-mvebu.c
+++ b/drivers/pci/host/pci-mvebu.c
@@ -750,21 +750,6 @@ static int mvebu_pcie_setup(int nr, struct pci_sys_data *sys)
 	return 1;
 }
 
-static struct pci_bus *mvebu_pcie_scan_bus(int nr, struct pci_sys_data *sys)
-{
-	struct mvebu_pcie *pcie = sys_to_pcie(sys);
-	struct pci_bus *bus;
-
-	bus = pci_create_root_bus(&pcie->pdev->dev, sys->busnr,
-				  &mvebu_pcie_ops, sys, &sys->resources);
-	if (!bus)
-		return NULL;
-
-	pci_scan_child_bus(bus);
-
-	return bus;
-}
-
 static resource_size_t mvebu_pcie_align_resource(struct pci_dev *dev,
 						 const struct resource *res,
 						 resource_size_t start,
@@ -808,12 +793,11 @@ static void mvebu_pcie_enable(struct mvebu_pcie *pcie)
 	hw.nr_controllers = 1;
 	hw.private_data   = (void **)&pcie;
 	hw.setup          = mvebu_pcie_setup;
-	hw.scan           = mvebu_pcie_scan_bus;
 	hw.map_irq        = of_irq_parse_and_map_pci;
 	hw.ops            = &mvebu_pcie_ops;
 	hw.align_resource = mvebu_pcie_align_resource;
 
-	pci_common_init(&hw);
+	pci_common_init_dev(&pcie->pdev->dev, &hw);
 }
 
 /*
-- 
1.7.1
