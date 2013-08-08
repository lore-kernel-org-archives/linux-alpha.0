From: Yijing Wang <wangyijing@huawei.com>
Subject: [PATCH 15/16] alpha: clean up unnecessary MSI/MSI-X capability find
Date: Thu, 8 Aug 2013 21:13:54 +0800
Message-ID: <1375967634-29088-1-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: Hanjun Guo <guohanjun@huawei.com>, jiang.liu@huawei.com, Yijing Wang <wangyijing@huawei.com>, Phil Carmody <pc+lkml@asdf.org>, linux-alpha@vger.kernel.org

PCI core will initialize device MSI/MSI-X capability in
pci_msi_init_pci_dev(). So device driver should use
pci_dev->msi_cap/msix_cap to determine whether the device
support MSI/MSI-X instead of using
pci_find_capability(pci_dev, PCI_CAP_ID_MSI/MSIX).
Access to PCIe device config space again will consume more time.

Signed-off-by: Yijing Wang <wangyijing@huawei.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Phil Carmody <pc+lkml@asdf.org>
Cc: linux-alpha@vger.kernel.org
---
 arch/alpha/kernel/sys_marvel.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/kernel/sys_marvel.c b/arch/alpha/kernel/sys_marvel.c
index c92e389..3326d3a 100644
--- a/arch/alpha/kernel/sys_marvel.c
+++ b/arch/alpha/kernel/sys_marvel.c
@@ -332,7 +332,7 @@ marvel_map_irq(const struct pci_dev *cdev, u8 slot, u8 pin)
 	pci_read_config_byte(dev, PCI_INTERRUPT_LINE, &intline);
 	irq = intline;
 
-	msi_loc = pci_find_capability(dev, PCI_CAP_ID_MSI);
+	msi_loc = dev->msi_cap;
 	msg_ctl = 0;
 	if (msi_loc) 
 		pci_read_config_word(dev, msi_loc + PCI_MSI_FLAGS, &msg_ctl);
-- 
1.7.1


