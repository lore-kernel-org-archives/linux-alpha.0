From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 02/19] alpha: Pyxis convert irq_chip functions
Date: Sun, 06 Feb 2011 14:32:23 -0000
Message-ID: <20110206143148.057423100@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-pyxis-convert-irqchip.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/irq_pyxis.c |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

Index: linux-next/arch/alpha/kernel/irq_pyxis.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/irq_pyxis.c
+++ linux-next/arch/alpha/kernel/irq_pyxis.c
@@ -29,21 +29,21 @@ pyxis_update_irq_hw(unsigned long mask)
 }
 
 static inline void
-pyxis_enable_irq(unsigned int irq)
+pyxis_enable_irq(struct irq_data *d)
 {
-	pyxis_update_irq_hw(cached_irq_mask |= 1UL << (irq - 16));
+	pyxis_update_irq_hw(cached_irq_mask |= 1UL << (d->irq - 16));
 }
 
 static void
-pyxis_disable_irq(unsigned int irq)
+pyxis_disable_irq(struct irq_data *d)
 {
-	pyxis_update_irq_hw(cached_irq_mask &= ~(1UL << (irq - 16)));
+	pyxis_update_irq_hw(cached_irq_mask &= ~(1UL << (d->irq - 16)));
 }
 
 static void
-pyxis_mask_and_ack_irq(unsigned int irq)
+pyxis_mask_and_ack_irq(struct irq_data *d)
 {
-	unsigned long bit = 1UL << (irq - 16);
+	unsigned long bit = 1UL << (d->irq - 16);
 	unsigned long mask = cached_irq_mask &= ~bit;
 
 	/* Disable the interrupt.  */
@@ -58,9 +58,9 @@ pyxis_mask_and_ack_irq(unsigned int irq)
 
 static struct irq_chip pyxis_irq_type = {
 	.name		= "PYXIS",
-	.mask_ack	= pyxis_mask_and_ack_irq,
-	.mask		= pyxis_disable_irq,
-	.unmask		= pyxis_enable_irq,
+	.irq_mask_ack	= pyxis_mask_and_ack_irq,
+	.irq_mask	= pyxis_disable_irq,
+	.irq_unmask	= pyxis_enable_irq,
 };
 
 void 
@@ -103,7 +103,7 @@ init_pyxis_irqs(unsigned long ignore_mas
 		if ((ignore_mask >> i) & 1)
 			continue;
 		set_irq_chip_and_handler(i, &pyxis_irq_type, handle_level_irq);
-		irq_to_desc(i)->status |= IRQ_LEVEL;
+		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
 	setup_irq(16+7, &isa_cascade_irqaction);


