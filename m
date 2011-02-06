From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 03/19] alpha: srm: Convert irq_chip functions
Date: Sun, 06 Feb 2011 14:32:26 -0000
Message-ID: <20110206143148.156371836@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-srm-convert-irqchip.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/irq_srm.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

Index: linux-next/arch/alpha/kernel/irq_srm.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/irq_srm.c
+++ linux-next/arch/alpha/kernel/irq_srm.c
@@ -18,27 +18,27 @@
 DEFINE_SPINLOCK(srm_irq_lock);
 
 static inline void
-srm_enable_irq(unsigned int irq)
+srm_enable_irq(struct irq_data *d)
 {
 	spin_lock(&srm_irq_lock);
-	cserve_ena(irq - 16);
+	cserve_ena(d->irq - 16);
 	spin_unlock(&srm_irq_lock);
 }
 
 static void
-srm_disable_irq(unsigned int irq)
+srm_disable_irq(struct irq_data *d)
 {
 	spin_lock(&srm_irq_lock);
-	cserve_dis(irq - 16);
+	cserve_dis(d->irq - 16);
 	spin_unlock(&srm_irq_lock);
 }
 
 /* Handle interrupts from the SRM, assuming no additional weirdness.  */
 static struct irq_chip srm_irq_type = {
 	.name		= "SRM",
-	.unmask		= srm_enable_irq,
-	.mask		= srm_disable_irq,
-	.mask_ack	= srm_disable_irq,
+	.irq_unmask	= srm_enable_irq,
+	.irq_mask	= srm_disable_irq,
+	.irq_mask_ack	= srm_disable_irq,
 };
 
 void __init
@@ -52,7 +52,7 @@ init_srm_irqs(long max, unsigned long ig
 		if (i < 64 && ((ignore_mask >> i) & 1))
 			continue;
 		set_irq_chip_and_handler(i, &srm_irq_type, handle_level_irq);
-		irq_to_desc(i)->status |= IRQ_LEVEL;
+		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 }
 


