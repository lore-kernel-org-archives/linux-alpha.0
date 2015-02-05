From: Pierre Chevalier <pierrechevalier83@gmail.com>
Subject: [PATCH] arch: alpha: kernel: remove deprecated call to pci_get_slot
Date: Thu,  5 Feb 2015 21:17:55 +0000
Message-ID: <1423171075-23058-1-git-send-email-pierrechevalier83@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=mzOZlinsHXqYvY66ExFTKOKHbJgqITNj5yDGFTij9i4=;
        b=zD619pZizvwuAm30hD37UkViAKP7eypduBtnO1RNmom+6JNukJ3LjfowET8Hb2/HJj
         mf1eG0IBIdNhB6v5AcWpM2gdup8BTUFGlW72WR51p/N6tWgawjDEtw7fTeZyQvpaCZy3
         wvJ+X7Isbu1zf9O35T1ZutpQ2CBR5dwpWj4b7Y3b/zXYtSGM2xw2tGh/RNCzz+ogntqE
         Nl+4bEJqU3zZrThWSPFDcNkPWCMe8gZZxMT3f5hE3IqDUVPm5tbReD0RYg0s6z6EhWhN
         LvFjbfUU4adWasSGeFJu36EaCjbq5tVqtQjVrbSgysH5s5aoLtVyxgGzY7b2qGqnLA4/
         2Y0A==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Pierre Chevalier <pierrechevalier83@gmail.com>

According to Documentation/PCI/pci.txt, pci_get_slot has been
superseded by pci_get_domain_bus_and_slot.

Signed-off-by: Pierre Chevalier <pierrechevalier83@gmail.com>
---
 arch/alpha/kernel/sys_miata.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/sys_miata.c b/arch/alpha/kernel/sys_miata.c
index d5b9776..7b98b40 100644
--- a/arch/alpha/kernel/sys_miata.c
+++ b/arch/alpha/kernel/sys_miata.c
@@ -182,7 +182,8 @@ miata_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 
 	if((slot == 7) && (PCI_FUNC(dev->devfn) == 3)) {
 		u8 irq=0;
-		struct pci_dev *pdev = pci_get_slot(dev->bus, dev->devfn & ~7);
+		struct pci_dev *pdev =
+			pci_get_domain_bus_and_slot(dev->bus, dev->devfn & ~7);
 		if(pdev == NULL || pci_read_config_byte(pdev, 0x40,&irq) != PCIBIOS_SUCCESSFUL) {
 			pci_dev_put(pdev);
 			return -1;
-- 
2.2.2

