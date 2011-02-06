From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 07/19] alpha: eb64p: Convert irq_chip functions
Date: Sun, 06 Feb 2011 14:32:35 -0000
Message-ID: <20110206143148.548226828@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-convert-eb64p.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/sys_eb64p.c |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

Index: linux-next/arch/alpha/kernel/sys_eb64p.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/sys_eb64p.c
+++ linux-next/arch/alpha/kernel/sys_eb64p.c
@@ -44,22 +44,22 @@ eb64p_update_irq_hw(unsigned int irq, un
 }
 
 static inline void
-eb64p_enable_irq(unsigned int irq)
+eb64p_enable_irq(struct irq_data *d)
 {
-	eb64p_update_irq_hw(irq, cached_irq_mask &= ~(1 << irq));
+	eb64p_update_irq_hw(d->irq, cached_irq_mask &= ~(1 << d->irq));
 }
 
 static void
-eb64p_disable_irq(unsigned int irq)
+eb64p_disable_irq(struct irq_data *d)
 {
-	eb64p_update_irq_hw(irq, cached_irq_mask |= 1 << irq);
+	eb64p_update_irq_hw(d->irq, cached_irq_mask |= 1 << d->irq);
 }
 
 static struct irq_chip eb64p_irq_type = {
 	.name		= "EB64P",
-	.unmask		= eb64p_enable_irq,
-	.mask		= eb64p_disable_irq,
-	.mask_ack	= eb64p_disable_irq,
+	.irq_unmask	= eb64p_enable_irq,
+	.irq_mask	= eb64p_disable_irq,
+	.irq_mask_ack	= eb64p_disable_irq,
 };
 
 static void 
@@ -118,9 +118,9 @@ eb64p_init_irq(void)
 	init_i8259a_irqs();
 
 	for (i = 16; i < 32; ++i) {
-		irq_to_desc(i)->status |= IRQ_LEVEL;
 		set_irq_chip_and_handler(i, &eb64p_irq_type, handle_level_irq);
-	}		
+		irq_set_status_flags(i, IRQ_LEVEL);
+	}
 
 	common_init_isa_dma();
 	setup_irq(16+5, &isa_cascade_irqaction);


