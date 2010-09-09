From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 1/3] Fix call to replaced SuperIO functions
Date: Thu,  9 Sep 2010 00:08:31 -0400
Message-ID: <1284005311-15698-1-git-send-email-mattst88@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:from:to:cc:subject
         :date:message-id:x-mailer;
        bh=NnNO7/2CD44CXKO9URixzbEHu4llfgU4QT7YdYHliU4=;
        b=Wnfdr02M74z2ZpcwtA4sx3OA1kIB4/tOnJwcy3iNOwlN373t0VeF2pmtii4kbDE477
         hXVlHfRopwzDb5gbxIMR0PAVQU8urTXXpRoH0zznMLf3KLaThiHQzJYYvCA5x+crFNvP
         D6hmvOt+FyJnCkkxbGIsuNQ3Ae8plZJvYG34U=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stable@kernel.org
Cc: linux-alpha@vger.kernel.org, "Morten H. Larsen" <m-larsen@post6.tele.dk>, Matt Turner <mattst88@gmail.com>

From: Morten H. Larsen <m-larsen@post6.tele.dk>

This patch fixes the failure to compile Alpha Generic because of
previously overlooked calls to ns87312_enable_ide(). The function has
been replaced by newer SuperIO code.

Tested-by: Michael Cree <mcree@orcon.net.nz>
Signed-off-by: Morten H. Larsen <m-larsen@post6.tele.dk>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
This is a build fix for a regression introduced by 932e0c201d28a728e25d3b64.
It therefore only applies to 2.6.35-stable.

 arch/alpha/kernel/proto.h         |    3 ---
 arch/alpha/kernel/sys_cabriolet.c |   19 ++++++++++++++++---
 arch/alpha/kernel/sys_takara.c    |   11 +++++++++--
 3 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
index 3d2627e..d3e52d3 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -156,9 +156,6 @@ extern void SMC669_Init(int);
 /* es1888.c */
 extern void es1888_init(void);
 
-/* ns87312.c */
-extern void ns87312_enable_ide(long ide_base);
-
 /* ../lib/fpreg.c */
 extern void alpha_write_fp_reg (unsigned long reg, unsigned long val);
 extern unsigned long alpha_read_fp_reg (unsigned long reg);
diff --git a/arch/alpha/kernel/sys_cabriolet.c b/arch/alpha/kernel/sys_cabriolet.c
index affd0f3..14c8898 100644
--- a/arch/alpha/kernel/sys_cabriolet.c
+++ b/arch/alpha/kernel/sys_cabriolet.c
@@ -33,7 +33,7 @@
 #include "irq_impl.h"
 #include "pci_impl.h"
 #include "machvec_impl.h"
-
+#include "pc873xx.h"
 
 /* Note mask bit is true for DISABLED irqs.  */
 static unsigned long cached_irq_mask = ~0UL;
@@ -236,17 +236,30 @@ cabriolet_map_irq(struct pci_dev *dev, u8 slot, u8 pin)
 }
 
 static inline void __init
+cabriolet_enable_ide(void)
+{
+	if (pc873xx_probe() == -1) {
+		printk(KERN_ERR "Probing for PC873xx Super IO chip failed.\n");
+	 } else {
+		printk(KERN_INFO "Found %s Super IO chip at 0x%x\n",
+			pc873xx_get_model(), pc873xx_get_base());
+
+		pc873xx_enable_ide();
+	}
+}
+
+static inline void __init
 cabriolet_init_pci(void)
 {
 	common_init_pci();
-	ns87312_enable_ide(0x398);
+	cabriolet_enable_ide();
 }
 
 static inline void __init
 cia_cab_init_pci(void)
 {
 	cia_init_pci();
-	ns87312_enable_ide(0x398);
+	cabriolet_enable_ide();
 }
 
 /*
diff --git a/arch/alpha/kernel/sys_takara.c b/arch/alpha/kernel/sys_takara.c
index 2304648..4da596b 100644
--- a/arch/alpha/kernel/sys_takara.c
+++ b/arch/alpha/kernel/sys_takara.c
@@ -29,7 +29,7 @@
 #include "irq_impl.h"
 #include "pci_impl.h"
 #include "machvec_impl.h"
-
+#include "pc873xx.h"
 
 /* Note mask bit is true for DISABLED irqs.  */
 static unsigned long cached_irq_mask[2] = { -1, -1 };
@@ -264,7 +264,14 @@ takara_init_pci(void)
 		alpha_mv.pci_map_irq = takara_map_irq_srm;
 
 	cia_init_pci();
-	ns87312_enable_ide(0x26e);
+
+	if (pc873xx_probe() == -1) {
+		printk(KERN_ERR "Probing for PC873xx Super IO chip failed.\n");
+	} else {
+		printk(KERN_INFO "Found %s Super IO chip at 0x%x\n",
+			pc873xx_get_model(), pc873xx_get_base());
+		pc873xx_enable_ide();
+	}
 }
 
 
-- 
1.7.1

