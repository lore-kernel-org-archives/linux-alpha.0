From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 12/19] alpha: noritake: Convert irq_chip functions
Date: Sun, 06 Feb 2011 14:32:46 -0000
Message-ID: <20110206143149.031335413@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-noritake-convert.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/sys_noritake.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

Index: linux-next/arch/alpha/kernel/sys_noritake.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/sys_noritake.c
+++ linux-next/arch/alpha/kernel/sys_noritake.c
@@ -48,22 +48,22 @@ noritake_update_irq_hw(int irq, int mask
 }
 
 static void
-noritake_enable_irq(unsigned int irq)
+noritake_enable_irq(struct irq_data *d)
 {
-	noritake_update_irq_hw(irq, cached_irq_mask |= 1 << (irq - 16));
+	noritake_update_irq_hw(d->irq, cached_irq_mask |= 1 << (d->irq - 16));
 }
 
 static void
-noritake_disable_irq(unsigned int irq)
+noritake_disable_irq(struct irq_data *d)
 {
-	noritake_update_irq_hw(irq, cached_irq_mask &= ~(1 << (irq - 16)));
+	noritake_update_irq_hw(d->irq, cached_irq_mask &= ~(1 << (d->irq - 16)));
 }
 
 static struct irq_chip noritake_irq_type = {
 	.name		= "NORITAKE",
-	.unmask		= noritake_enable_irq,
-	.mask		= noritake_disable_irq,
-	.mask_ack	= noritake_disable_irq,
+	.irq_unmask	= noritake_enable_irq,
+	.irq_mask	= noritake_disable_irq,
+	.irq_mask_ack	= noritake_disable_irq,
 };
 
 static void 
@@ -127,8 +127,8 @@ noritake_init_irq(void)
 	outw(0, 0x54c);
 
 	for (i = 16; i < 48; ++i) {
-		irq_to_desc(i)->status |= IRQ_LEVEL;
 		set_irq_chip_and_handler(i, &noritake_irq_type, handle_level_irq);
+		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
 	init_i8259a_irqs();


