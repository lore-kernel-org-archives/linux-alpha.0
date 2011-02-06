From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 13/19] alpha: rx164: Convert irq_chip functions
Date: Sun, 06 Feb 2011 14:32:49 -0000
Message-ID: <20110206143149.129427318@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-rx164-convert.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/sys_rx164.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

Index: linux-next/arch/alpha/kernel/sys_rx164.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/sys_rx164.c
+++ linux-next/arch/alpha/kernel/sys_rx164.c
@@ -47,22 +47,22 @@ rx164_update_irq_hw(unsigned long mask)
 }
 
 static inline void
-rx164_enable_irq(unsigned int irq)
+rx164_enable_irq(struct irq_data *d)
 {
-	rx164_update_irq_hw(cached_irq_mask |= 1UL << (irq - 16));
+	rx164_update_irq_hw(cached_irq_mask |= 1UL << (d->irq - 16));
 }
 
 static void
-rx164_disable_irq(unsigned int irq)
+rx164_disable_irq(struct irq_data *d)
 {
-	rx164_update_irq_hw(cached_irq_mask &= ~(1UL << (irq - 16)));
+	rx164_update_irq_hw(cached_irq_mask &= ~(1UL << (d->irq - 16)));
 }
 
 static struct irq_chip rx164_irq_type = {
 	.name		= "RX164",
-	.unmask		= rx164_enable_irq,
-	.mask		= rx164_disable_irq,
-	.mask_ack	= rx164_disable_irq,
+	.irq_unmask	= rx164_enable_irq,
+	.irq_mask	= rx164_disable_irq,
+	.irq_mask_ack	= rx164_disable_irq,
 };
 
 static void 
@@ -99,8 +99,8 @@ rx164_init_irq(void)
 
 	rx164_update_irq_hw(0);
 	for (i = 16; i < 40; ++i) {
-		irq_to_desc(i)->status |= IRQ_LEVEL;
 		set_irq_chip_and_handler(i, &rx164_irq_type, handle_level_irq);
+		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
 	init_i8259a_irqs();


