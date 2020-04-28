From: Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] alpha: remove unneeded semicolon in sys_eiger.c
Date: Tue, 28 Apr 2020 14:32:25 +0800
Message-ID: <20200428063225.24882-1-yanaijie@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Yan <yanaijie@huawei.com>

Fix the following coccicheck warning:

arch/alpha/kernel/sys_eiger.c:179:2-3: Unneeded semicolon

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 arch/alpha/kernel/sys_eiger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/sys_eiger.c b/arch/alpha/kernel/sys_eiger.c
index 016f79251141..7e852c08cef2 100644
--- a/arch/alpha/kernel/sys_eiger.c
+++ b/arch/alpha/kernel/sys_eiger.c
@@ -176,7 +176,7 @@ eiger_swizzle(struct pci_dev *dev, u8 *pinp)
 	   case 0x03: bridge_count = 2; break; /* 2 */
 	   case 0x07: bridge_count = 3; break; /* 3 */
 	   case 0x0f: bridge_count = 4; break; /* 4 */
-	};
+	}
 
 	slot = PCI_SLOT(dev->devfn);
 	while (dev->bus->self) {
-- 
2.21.1

