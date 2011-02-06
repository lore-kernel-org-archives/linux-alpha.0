From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 11/19] alpha: rawhide: Convert irq_chip functions
Date: Sun, 06 Feb 2011 14:32:44 -0000
Message-ID: <20110206143148.940553498@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-convert-rawhide.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

---
 arch/alpha/kernel/sys_rawhide.c |   17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

Index: linux-next/arch/alpha/kernel/sys_rawhide.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/sys_rawhide.c
+++ linux-next/arch/alpha/kernel/sys_rawhide.c
@@ -56,9 +56,10 @@ rawhide_update_irq_hw(int hose, int mask
   (((h) < MCPCIA_MAX_HOSES) && (cached_irq_masks[(h)] != 0))
 
 static inline void 
-rawhide_enable_irq(unsigned int irq)
+rawhide_enable_irq(struct irq_data *d)
 {
 	unsigned int mask, hose;
+	unsigned int irq = d->irq;
 
 	irq -= 16;
 	hose = irq / 24;
@@ -76,9 +77,10 @@ rawhide_enable_irq(unsigned int irq)
 }
 
 static void 
-rawhide_disable_irq(unsigned int irq)
+rawhide_disable_irq(struct irq_data *d)
 {
 	unsigned int mask, hose;
+	unsigned int irq = d->irq;
 
 	irq -= 16;
 	hose = irq / 24;
@@ -96,9 +98,10 @@ rawhide_disable_irq(unsigned int irq)
 }
 
 static void
-rawhide_mask_and_ack_irq(unsigned int irq)
+rawhide_mask_and_ack_irq(struct irq_data *d)
 {
 	unsigned int mask, mask1, hose;
+	unsigned int irq = d->irq;
 
 	irq -= 16;
 	hose = irq / 24;
@@ -123,9 +126,9 @@ rawhide_mask_and_ack_irq(unsigned int ir
 
 static struct irq_chip rawhide_irq_type = {
 	.name		= "RAWHIDE",
-	.unmask		= rawhide_enable_irq,
-	.mask		= rawhide_disable_irq,
-	.mask_ack	= rawhide_mask_and_ack_irq,
+	.irq_unmask	= rawhide_enable_irq,
+	.irq_mask	= rawhide_disable_irq,
+	.irq_mask_ack	= rawhide_mask_and_ack_irq,
 };
 
 static void 
@@ -177,8 +180,8 @@ rawhide_init_irq(void)
 	}
 
 	for (i = 16; i < 128; ++i) {
-		irq_to_desc(i)->status |= IRQ_LEVEL;
 		set_irq_chip_and_handler(i, &rawhide_irq_type, handle_level_irq);
+		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
 	init_i8259a_irqs();


