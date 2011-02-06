From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 08/19] alpha: eiger: Convert irq_chip functions
Date: Sun, 06 Feb 2011 14:32:37 -0000
Message-ID: <20110206143148.642905297@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-eiger-convert-irq-chip.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/sys_eiger.c |   14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

Index: linux-next/arch/alpha/kernel/sys_eiger.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/sys_eiger.c
+++ linux-next/arch/alpha/kernel/sys_eiger.c
@@ -51,16 +51,18 @@ eiger_update_irq_hw(unsigned long irq, u
 }
 
 static inline void
-eiger_enable_irq(unsigned int irq)
+eiger_enable_irq(struct irq_data *d)
 {
+	unsigned int irq = d->irq;
 	unsigned long mask;
 	mask = (cached_irq_mask[irq >= 64] &= ~(1UL << (irq & 63)));
 	eiger_update_irq_hw(irq, mask);
 }
 
 static void
-eiger_disable_irq(unsigned int irq)
+eiger_disable_irq(struct irq_data *d)
 {
+	unsigned int irq = d->irq;
 	unsigned long mask;
 	mask = (cached_irq_mask[irq >= 64] |= 1UL << (irq & 63));
 	eiger_update_irq_hw(irq, mask);
@@ -68,9 +70,9 @@ eiger_disable_irq(unsigned int irq)
 
 static struct irq_chip eiger_irq_type = {
 	.name		= "EIGER",
-	.unmask		= eiger_enable_irq,
-	.mask		= eiger_disable_irq,
-	.mask_ack	= eiger_disable_irq,
+	.irq_unmask	= eiger_enable_irq,
+	.irq_mask	= eiger_disable_irq,
+	.irq_mask_ack	= eiger_disable_irq,
 };
 
 static void
@@ -136,8 +138,8 @@ eiger_init_irq(void)
 	init_i8259a_irqs();
 
 	for (i = 16; i < 128; ++i) {
-		irq_to_desc(i)->status |= IRQ_LEVEL;
 		set_irq_chip_and_handler(i, &eiger_irq_type, handle_level_irq);
+		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 }
 


