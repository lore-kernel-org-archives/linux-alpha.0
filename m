From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 14/19] alpha: sable: Convert irq_chip functions
Date: Sun, 06 Feb 2011 14:32:51 -0000
Message-ID: <20110206143149.225219738@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-convert-sable.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/sys_sable.c |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

Index: linux-next/arch/alpha/kernel/sys_sable.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/sys_sable.c
+++ linux-next/arch/alpha/kernel/sys_sable.c
@@ -443,11 +443,11 @@ lynx_swizzle(struct pci_dev *dev, u8 *pi
 /* GENERIC irq routines */
 
 static inline void
-sable_lynx_enable_irq(unsigned int irq)
+sable_lynx_enable_irq(struct irq_data *d)
 {
 	unsigned long bit, mask;
 
-	bit = sable_lynx_irq_swizzle->irq_to_mask[irq];
+	bit = sable_lynx_irq_swizzle->irq_to_mask[d->irq];
 	spin_lock(&sable_lynx_irq_lock);
 	mask = sable_lynx_irq_swizzle->shadow_mask &= ~(1UL << bit);
 	sable_lynx_irq_swizzle->update_irq_hw(bit, mask);
@@ -459,11 +459,11 @@ sable_lynx_enable_irq(unsigned int irq)
 }
 
 static void
-sable_lynx_disable_irq(unsigned int irq)
+sable_lynx_disable_irq(struct irq_data *d)
 {
 	unsigned long bit, mask;
 
-	bit = sable_lynx_irq_swizzle->irq_to_mask[irq];
+	bit = sable_lynx_irq_swizzle->irq_to_mask[d->irq];
 	spin_lock(&sable_lynx_irq_lock);
 	mask = sable_lynx_irq_swizzle->shadow_mask |= 1UL << bit;
 	sable_lynx_irq_swizzle->update_irq_hw(bit, mask);
@@ -475,11 +475,11 @@ sable_lynx_disable_irq(unsigned int irq)
 }
 
 static void
-sable_lynx_mask_and_ack_irq(unsigned int irq)
+sable_lynx_mask_and_ack_irq(struct irq_data *d)
 {
 	unsigned long bit, mask;
 
-	bit = sable_lynx_irq_swizzle->irq_to_mask[irq];
+	bit = sable_lynx_irq_swizzle->irq_to_mask[d->irq];
 	spin_lock(&sable_lynx_irq_lock);
 	mask = sable_lynx_irq_swizzle->shadow_mask |= 1UL << bit;
 	sable_lynx_irq_swizzle->update_irq_hw(bit, mask);
@@ -489,9 +489,9 @@ sable_lynx_mask_and_ack_irq(unsigned int
 
 static struct irq_chip sable_lynx_irq_type = {
 	.name		= "SABLE/LYNX",
-	.unmask		= sable_lynx_enable_irq,
-	.mask		= sable_lynx_disable_irq,
-	.mask_ack	= sable_lynx_mask_and_ack_irq,
+	.irq_unmask	= sable_lynx_enable_irq,
+	.irq_mask	= sable_lynx_disable_irq,
+	.irq_mask_ack	= sable_lynx_mask_and_ack_irq,
 };
 
 static void 
@@ -518,9 +518,9 @@ sable_lynx_init_irq(int nr_of_irqs)
 	long i;
 
 	for (i = 0; i < nr_of_irqs; ++i) {
-		irq_to_desc(i)->status |= IRQ_LEVEL;
 		set_irq_chip_and_handler(i, &sable_lynx_irq_type,
 			handle_level_irq);
+		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
 	common_init_isa_dma();


