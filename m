From: Morten Holst Larsen <m-larsen@post6.tele.dk>
Subject: [PATCH] Fix call to replaced SuperIO functions
Date: Sat, 31 Jul 2010 14:40:41 +0200
Message-ID: <E1OfBMn-00058R-O4@mhlnet.dk>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

Fix call to replaced SuperIO functions

This patch fixes the failure to compile Alpha Generic because of 
previously overlooked calls to ns87312_enable_ide(). The function has 
been replaced by newer SuperIO code.

Signed-off-by: Morten H. Larsen <m-larsen@post6.tele.dk>
----
diff -uNr a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
--- a/arch/alpha/kernel/proto.h	2010-07-22 21:13:38.000000000 +0200
+++ b/arch/alpha/kernel/proto.h	2010-07-30 10:02:42.000000000 +0200
@@ -156,9 +156,6 @@
 /* es1888.c */
 extern void es1888_init(void);
 
-/* ns87312.c */
-extern void ns87312_enable_ide(long ide_base);
-
 /* ../lib/fpreg.c */
 extern void alpha_write_fp_reg (unsigned long reg, unsigned long val);
 extern unsigned long alpha_read_fp_reg (unsigned long reg);
diff -uNr a/arch/alpha/kernel/sys_cabriolet.c b/arch/alpha/kernel/sys_cabriolet.c
--- a/arch/alpha/kernel/sys_cabriolet.c	2010-07-22 21:13:38.000000000 +0200
+++ b/arch/alpha/kernel/sys_cabriolet.c	2010-07-30 10:31:36.000000000 +0200
@@ -33,7 +33,7 @@
 #include "irq_impl.h"
 #include "pci_impl.h"
 #include "machvec_impl.h"
-
+#include "pc873xx.h"
 
 /* Note mask bit is true for DISABLED irqs.  */
 static unsigned long cached_irq_mask = ~0UL;
@@ -236,17 +236,30 @@
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
diff -uNr a/arch/alpha/kernel/sys_takara.c b/arch/alpha/kernel/sys_takara.c
--- a/arch/alpha/kernel/sys_takara.c	2010-07-22 21:13:38.000000000 +0200
+++ b/arch/alpha/kernel/sys_takara.c	2010-07-30 10:32:16.000000000 +0200
@@ -29,7 +29,7 @@
 #include "irq_impl.h"
 #include "pci_impl.h"
 #include "machvec_impl.h"
-
+#include "pc873xx.h"
 
 /* Note mask bit is true for DISABLED irqs.  */
 static unsigned long cached_irq_mask[2] = { -1, -1 };
@@ -264,7 +264,14 @@
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
 
 

