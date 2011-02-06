From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 05/19] alpha: cabriolet: Convert irq_chip functions
Date: Sun, 06 Feb 2011 14:32:30 -0000
Message-ID: <20110206143148.352717817@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-cabriolet-convert-irq-chip.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/sys_cabriolet.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

Index: linux-next/arch/alpha/kernel/sys_cabriolet.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/sys_cabriolet.c
+++ linux-next/arch/alpha/kernel/sys_cabriolet.c
@@ -46,22 +46,22 @@ cabriolet_update_irq_hw(unsigned int irq
 }
 
 static inline void
-cabriolet_enable_irq(unsigned int irq)
+cabriolet_enable_irq(struct irq_data *d)
 {
-	cabriolet_update_irq_hw(irq, cached_irq_mask &= ~(1UL << irq));
+	cabriolet_update_irq_hw(d->irq, cached_irq_mask &= ~(1UL << d->irq));
 }
 
 static void
-cabriolet_disable_irq(unsigned int irq)
+cabriolet_disable_irq(struct irq_data *d)
 {
-	cabriolet_update_irq_hw(irq, cached_irq_mask |= 1UL << irq);
+	cabriolet_update_irq_hw(d->irq, cached_irq_mask |= 1UL << d->irq);
 }
 
 static struct irq_chip cabriolet_irq_type = {
 	.name		= "CABRIOLET",
-	.unmask		= cabriolet_enable_irq,
-	.mask		= cabriolet_disable_irq,
-	.mask_ack	= cabriolet_disable_irq,
+	.irq_unmask	= cabriolet_enable_irq,
+	.irq_mask	= cabriolet_disable_irq,
+	.irq_mask_ack	= cabriolet_disable_irq,
 };
 
 static void 
@@ -107,7 +107,7 @@ common_init_irq(void (*srm_dev_int)(unsi
 		for (i = 16; i < 35; ++i) {
 			set_irq_chip_and_handler(i, &cabriolet_irq_type,
 				handle_level_irq);
-			irq_to_desc(i)->status |= IRQ_LEVEL;
+			irq_set_status_flags(i, IRQ_LEVEL);
 		}
 	}
 


