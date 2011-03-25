From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 1/2] alpha: Convert to new irq function names
Date: Fri, 25 Mar 2011 21:40:47 -0000
Message-ID: <20110325214012.126691696@linutronix.de>
References: <20110325213858.436906458@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-namespace.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org

Scripted with coccinelle.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/irq.c           |    2 +-
 arch/alpha/kernel/irq_alpha.c     |    2 +-
 arch/alpha/kernel/irq_i8259.c     |    2 +-
 arch/alpha/kernel/irq_pyxis.c     |    2 +-
 arch/alpha/kernel/irq_srm.c       |    2 +-
 arch/alpha/kernel/sys_alcor.c     |    2 +-
 arch/alpha/kernel/sys_cabriolet.c |    4 ++--
 arch/alpha/kernel/sys_dp264.c     |    2 +-
 arch/alpha/kernel/sys_eb64p.c     |    2 +-
 arch/alpha/kernel/sys_eiger.c     |    2 +-
 arch/alpha/kernel/sys_jensen.c    |   10 +++++-----
 arch/alpha/kernel/sys_marvel.c    |    8 ++++----
 arch/alpha/kernel/sys_mikasa.c    |    3 ++-
 arch/alpha/kernel/sys_noritake.c  |    3 ++-
 arch/alpha/kernel/sys_rawhide.c   |    3 ++-
 arch/alpha/kernel/sys_rx164.c     |    2 +-
 arch/alpha/kernel/sys_sable.c     |    4 ++--
 arch/alpha/kernel/sys_takara.c    |    3 ++-
 arch/alpha/kernel/sys_titan.c     |    2 +-
 arch/alpha/kernel/sys_wildfire.c  |   12 ++++++------
 20 files changed, 38 insertions(+), 34 deletions(-)

Index: linux-2.6-tip/arch/alpha/kernel/irq.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/irq.c
+++ linux-2.6-tip/arch/alpha/kernel/irq.c
@@ -102,7 +102,7 @@ show_interrupts(struct seq_file *p, void
 		for_each_online_cpu(j)
 			seq_printf(p, "%10u ", kstat_irqs_cpu(irq, j));
 #endif
-		seq_printf(p, " %14s", get_irq_desc_chip(desc)->name);
+		seq_printf(p, " %14s", irq_desc_get_chip(desc)->name);
 		seq_printf(p, "  %c%s",
 			(action->flags & IRQF_DISABLED)?'+':' ',
 			action->name);
Index: linux-2.6-tip/arch/alpha/kernel/irq_alpha.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/irq_alpha.c
+++ linux-2.6-tip/arch/alpha/kernel/irq_alpha.c
@@ -228,7 +228,7 @@ struct irqaction timer_irqaction = {
 void __init
 init_rtc_irq(void)
 {
-	set_irq_chip_and_handler_name(RTC_IRQ, &no_irq_chip,
+	irq_set_chip_and_handler_name(RTC_IRQ, &no_irq_chip,
 				      handle_simple_irq, "RTC");
 	setup_irq(RTC_IRQ, &timer_irqaction);
 }
Index: linux-2.6-tip/arch/alpha/kernel/irq_i8259.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/irq_i8259.c
+++ linux-2.6-tip/arch/alpha/kernel/irq_i8259.c
@@ -92,7 +92,7 @@ init_i8259a_irqs(void)
 	outb(0xff, 0xA1);	/* mask all of 8259A-2 */
 
 	for (i = 0; i < 16; i++) {
-		set_irq_chip_and_handler(i, &i8259a_irq_type, handle_level_irq);
+		irq_set_chip_and_handler(i, &i8259a_irq_type, handle_level_irq);
 	}
 
 	setup_irq(2, &cascade);
Index: linux-2.6-tip/arch/alpha/kernel/irq_pyxis.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/irq_pyxis.c
+++ linux-2.6-tip/arch/alpha/kernel/irq_pyxis.c
@@ -102,7 +102,7 @@ init_pyxis_irqs(unsigned long ignore_mas
 	for (i = 16; i < 48; ++i) {
 		if ((ignore_mask >> i) & 1)
 			continue;
-		set_irq_chip_and_handler(i, &pyxis_irq_type, handle_level_irq);
+		irq_set_chip_and_handler(i, &pyxis_irq_type, handle_level_irq);
 		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
Index: linux-2.6-tip/arch/alpha/kernel/irq_srm.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/irq_srm.c
+++ linux-2.6-tip/arch/alpha/kernel/irq_srm.c
@@ -51,7 +51,7 @@ init_srm_irqs(long max, unsigned long ig
 	for (i = 16; i < max; ++i) {
 		if (i < 64 && ((ignore_mask >> i) & 1))
 			continue;
-		set_irq_chip_and_handler(i, &srm_irq_type, handle_level_irq);
+		irq_set_chip_and_handler(i, &srm_irq_type, handle_level_irq);
 		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 }
Index: linux-2.6-tip/arch/alpha/kernel/sys_alcor.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/sys_alcor.c
+++ linux-2.6-tip/arch/alpha/kernel/sys_alcor.c
@@ -125,7 +125,7 @@ alcor_init_irq(void)
 		   on while IRQ probing.  */
 		if (i >= 16+20 && i <= 16+30)
 			continue;
-		set_irq_chip_and_handler(i, &alcor_irq_type, handle_level_irq);
+		irq_set_chip_and_handler(i, &alcor_irq_type, handle_level_irq);
 		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 	i8259a_irq_type.irq_ack = alcor_isa_mask_and_ack_irq;
Index: linux-2.6-tip/arch/alpha/kernel/sys_cabriolet.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/sys_cabriolet.c
+++ linux-2.6-tip/arch/alpha/kernel/sys_cabriolet.c
@@ -105,8 +105,8 @@ common_init_irq(void (*srm_dev_int)(unsi
 		outb(0xff, 0x806);
 
 		for (i = 16; i < 35; ++i) {
-			set_irq_chip_and_handler(i, &cabriolet_irq_type,
-				handle_level_irq);
+			irq_set_chip_and_handler(i, &cabriolet_irq_type,
+						 handle_level_irq);
 			irq_set_status_flags(i, IRQ_LEVEL);
 		}
 	}
Index: linux-2.6-tip/arch/alpha/kernel/sys_dp264.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/sys_dp264.c
+++ linux-2.6-tip/arch/alpha/kernel/sys_dp264.c
@@ -270,7 +270,7 @@ init_tsunami_irqs(struct irq_chip * ops,
 {
 	long i;
 	for (i = imin; i <= imax; ++i) {
-		set_irq_chip_and_handler(i, ops, handle_level_irq);
+		irq_set_chip_and_handler(i, ops, handle_level_irq);
 		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 }
Index: linux-2.6-tip/arch/alpha/kernel/sys_eb64p.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/sys_eb64p.c
+++ linux-2.6-tip/arch/alpha/kernel/sys_eb64p.c
@@ -118,7 +118,7 @@ eb64p_init_irq(void)
 	init_i8259a_irqs();
 
 	for (i = 16; i < 32; ++i) {
-		set_irq_chip_and_handler(i, &eb64p_irq_type, handle_level_irq);
+		irq_set_chip_and_handler(i, &eb64p_irq_type, handle_level_irq);
 		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
Index: linux-2.6-tip/arch/alpha/kernel/sys_eiger.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/sys_eiger.c
+++ linux-2.6-tip/arch/alpha/kernel/sys_eiger.c
@@ -138,7 +138,7 @@ eiger_init_irq(void)
 	init_i8259a_irqs();
 
 	for (i = 16; i < 128; ++i) {
-		set_irq_chip_and_handler(i, &eiger_irq_type, handle_level_irq);
+		irq_set_chip_and_handler(i, &eiger_irq_type, handle_level_irq);
 		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 }
Index: linux-2.6-tip/arch/alpha/kernel/sys_jensen.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/sys_jensen.c
+++ linux-2.6-tip/arch/alpha/kernel/sys_jensen.c
@@ -171,11 +171,11 @@ jensen_init_irq(void)
 {
 	init_i8259a_irqs();
 
-	set_irq_chip_and_handler(1, &jensen_local_irq_type, handle_level_irq);
-	set_irq_chip_and_handler(4, &jensen_local_irq_type, handle_level_irq);
-	set_irq_chip_and_handler(3, &jensen_local_irq_type, handle_level_irq);
-	set_irq_chip_and_handler(7, &jensen_local_irq_type, handle_level_irq);
-	set_irq_chip_and_handler(9, &jensen_local_irq_type, handle_level_irq);
+	irq_set_chip_and_handler(1, &jensen_local_irq_type, handle_level_irq);
+	irq_set_chip_and_handler(4, &jensen_local_irq_type, handle_level_irq);
+	irq_set_chip_and_handler(3, &jensen_local_irq_type, handle_level_irq);
+	irq_set_chip_and_handler(7, &jensen_local_irq_type, handle_level_irq);
+	irq_set_chip_and_handler(9, &jensen_local_irq_type, handle_level_irq);
 
 	common_init_isa_dma();
 }
Index: linux-2.6-tip/arch/alpha/kernel/sys_marvel.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/sys_marvel.c
+++ linux-2.6-tip/arch/alpha/kernel/sys_marvel.c
@@ -276,7 +276,7 @@ init_io7_irqs(struct io7 *io7, 
 
 	/* Set up the lsi irqs.  */
 	for (i = 0; i < 128; ++i) {
-		set_irq_chip_and_handler(base + i, lsi_ops, handle_level_irq);
+		irq_set_chip_and_handler(base + i, lsi_ops, handle_level_irq);
 		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
@@ -290,7 +290,7 @@ init_io7_irqs(struct io7 *io7, 
 
 	/* Set up the msi irqs.  */
 	for (i = 128; i < (128 + 512); ++i) {
-		set_irq_chip_and_handler(base + i, msi_ops, handle_level_irq);
+		irq_set_chip_and_handler(base + i, msi_ops, handle_level_irq);
 		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
@@ -308,8 +308,8 @@ marvel_init_irq(void)
 
 	/* Reserve the legacy irqs.  */
 	for (i = 0; i < 16; ++i) {
-		set_irq_chip_and_handler(i, &marvel_legacy_irq_type,
-			handle_level_irq);
+		irq_set_chip_and_handler(i, &marvel_legacy_irq_type,
+					 handle_level_irq);
 	}
 
 	/* Init the io7 irqs.  */
Index: linux-2.6-tip/arch/alpha/kernel/sys_mikasa.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/sys_mikasa.c
+++ linux-2.6-tip/arch/alpha/kernel/sys_mikasa.c
@@ -98,7 +98,8 @@ mikasa_init_irq(void)
 	mikasa_update_irq_hw(0);
 
 	for (i = 16; i < 32; ++i) {
-		set_irq_chip_and_handler(i, &mikasa_irq_type, handle_level_irq);
+		irq_set_chip_and_handler(i, &mikasa_irq_type,
+					 handle_level_irq);
 		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
Index: linux-2.6-tip/arch/alpha/kernel/sys_noritake.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/sys_noritake.c
+++ linux-2.6-tip/arch/alpha/kernel/sys_noritake.c
@@ -127,7 +127,8 @@ noritake_init_irq(void)
 	outw(0, 0x54c);
 
 	for (i = 16; i < 48; ++i) {
-		set_irq_chip_and_handler(i, &noritake_irq_type, handle_level_irq);
+		irq_set_chip_and_handler(i, &noritake_irq_type,
+					 handle_level_irq);
 		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
Index: linux-2.6-tip/arch/alpha/kernel/sys_rawhide.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/sys_rawhide.c
+++ linux-2.6-tip/arch/alpha/kernel/sys_rawhide.c
@@ -180,7 +180,8 @@ rawhide_init_irq(void)
 	}
 
 	for (i = 16; i < 128; ++i) {
-		set_irq_chip_and_handler(i, &rawhide_irq_type, handle_level_irq);
+		irq_set_chip_and_handler(i, &rawhide_irq_type,
+					 handle_level_irq);
 		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
Index: linux-2.6-tip/arch/alpha/kernel/sys_rx164.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/sys_rx164.c
+++ linux-2.6-tip/arch/alpha/kernel/sys_rx164.c
@@ -99,7 +99,7 @@ rx164_init_irq(void)
 
 	rx164_update_irq_hw(0);
 	for (i = 16; i < 40; ++i) {
-		set_irq_chip_and_handler(i, &rx164_irq_type, handle_level_irq);
+		irq_set_chip_and_handler(i, &rx164_irq_type, handle_level_irq);
 		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
Index: linux-2.6-tip/arch/alpha/kernel/sys_sable.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/sys_sable.c
+++ linux-2.6-tip/arch/alpha/kernel/sys_sable.c
@@ -518,8 +518,8 @@ sable_lynx_init_irq(int nr_of_irqs)
 	long i;
 
 	for (i = 0; i < nr_of_irqs; ++i) {
-		set_irq_chip_and_handler(i, &sable_lynx_irq_type,
-			handle_level_irq);
+		irq_set_chip_and_handler(i, &sable_lynx_irq_type,
+					 handle_level_irq);
 		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
Index: linux-2.6-tip/arch/alpha/kernel/sys_takara.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/sys_takara.c
+++ linux-2.6-tip/arch/alpha/kernel/sys_takara.c
@@ -138,7 +138,8 @@ takara_init_irq(void)
 		takara_update_irq_hw(i, -1);
 
 	for (i = 16; i < 128; ++i) {
-		set_irq_chip_and_handler(i, &takara_irq_type, handle_level_irq);
+		irq_set_chip_and_handler(i, &takara_irq_type,
+					 handle_level_irq);
 		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
Index: linux-2.6-tip/arch/alpha/kernel/sys_titan.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/sys_titan.c
+++ linux-2.6-tip/arch/alpha/kernel/sys_titan.c
@@ -179,7 +179,7 @@ init_titan_irqs(struct irq_chip * ops, i
 {
 	long i;
 	for (i = imin; i <= imax; ++i) {
-		set_irq_chip_and_handler(i, ops, handle_level_irq);
+		irq_set_chip_and_handler(i, ops, handle_level_irq);
 		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 }
Index: linux-2.6-tip/arch/alpha/kernel/sys_wildfire.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/sys_wildfire.c
+++ linux-2.6-tip/arch/alpha/kernel/sys_wildfire.c
@@ -183,17 +183,17 @@ wildfire_init_irq_per_pca(int qbbno, int
 	for (i = 0; i < 16; ++i) {
 		if (i == 2)
 			continue;
-		set_irq_chip_and_handler(i+irq_bias, &wildfire_irq_type,
-			handle_level_irq);
+		irq_set_chip_and_handler(i + irq_bias, &wildfire_irq_type,
+					 handle_level_irq);
 		irq_set_status_flags(i + irq_bias, IRQ_LEVEL);
 	}
 
-	set_irq_chip_and_handler(36+irq_bias, &wildfire_irq_type,
-		handle_level_irq);
+	irq_set_chip_and_handler(36 + irq_bias, &wildfire_irq_type,
+				 handle_level_irq);
 	irq_set_status_flags(36 + irq_bias, IRQ_LEVEL);
 	for (i = 40; i < 64; ++i) {
-		set_irq_chip_and_handler(i+irq_bias, &wildfire_irq_type,
-			handle_level_irq);
+		irq_set_chip_and_handler(i + irq_bias, &wildfire_irq_type,
+					 handle_level_irq);
 		irq_set_status_flags(i + irq_bias, IRQ_LEVEL);
 	}
 


