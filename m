From: Morten Holst Larsen <m-larsen@post6.tele.dk>
Subject: [PATCH] Fix de2104x driver failing to readout MAC address correctly
Date: Thu, 10 Jun 2010 10:48:12 +0200
Message-ID: <E1OMdQq-00036t-RU@mhlnet.dk>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

Fix de2104x driver failing to readout MAC address correctly

This patch fixes a missing read memory barrier that is needed for the 
driver to readout the MAC address correctly from the on-board ROM.
Also it replaces the use of the deprecated functions readl()/writel().

Signed-off-by: Morten H. Larsen <m-larsen@post6.tele.dk>
----
diff -uNr a/drivers/net/tulip/de2104x.c b/drivers/net/tulip/de2104x.c
--- a/drivers/net/tulip/de2104x.c	2010-06-06 05:43:24.000000000 +0200
+++ b/drivers/net/tulip/de2104x.c	2010-06-07 15:45:35.000000000 +0200
@@ -367,8 +367,8 @@
 static u16 t21041_csr15[] = { 0x0008, 0x0006, 0x000E, 0x0008, 0x0008, };
 
 
-#define dr32(reg)		readl(de->regs + (reg))
-#define dw32(reg,val)		writel((val), de->regs + (reg))
+#define dr32(reg)	ioread32(de->regs + (reg))
+#define dw32(reg, val)	iowrite32((val), de->regs + (reg))
 
 
 static void de_rx_err_acct (struct de_private *de, unsigned rx_tail,
@@ -1706,6 +1706,7 @@
 		int value, boguscnt = 100000;
 		do {
 			value = dr32(ROMCmd);
+			rmb();
 		} while (value < 0 && --boguscnt > 0);
 		de->dev->dev_addr[i] = value;
 		udelay(1);

