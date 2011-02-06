From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 10/19] alpha: mikasa: Convert irq_chip functions
Date: Sun, 06 Feb 2011 14:32:42 -0000
Message-ID: <20110206143148.838646591@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-convert-mikasa.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/sys_mikasa.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

Index: linux-next/arch/alpha/kernel/sys_mikasa.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/sys_mikasa.c
+++ linux-next/arch/alpha/kernel/sys_mikasa.c
@@ -43,22 +43,22 @@ mikasa_update_irq_hw(int mask)
 }
 
 static inline void
-mikasa_enable_irq(unsigned int irq)
+mikasa_enable_irq(struct irq_data *d)
 {
-	mikasa_update_irq_hw(cached_irq_mask |= 1 << (irq - 16));
+	mikasa_update_irq_hw(cached_irq_mask |= 1 << (d->irq - 16));
 }
 
 static void
-mikasa_disable_irq(unsigned int irq)
+mikasa_disable_irq(struct irq_data *d)
 {
-	mikasa_update_irq_hw(cached_irq_mask &= ~(1 << (irq - 16)));
+	mikasa_update_irq_hw(cached_irq_mask &= ~(1 << (d->irq - 16)));
 }
 
 static struct irq_chip mikasa_irq_type = {
 	.name		= "MIKASA",
-	.unmask		= mikasa_enable_irq,
-	.mask		= mikasa_disable_irq,
-	.mask_ack	= mikasa_disable_irq,
+	.irq_unmask	= mikasa_enable_irq,
+	.irq_mask	= mikasa_disable_irq,
+	.irq_mask_ack	= mikasa_disable_irq,
 };
 
 static void 
@@ -98,8 +98,8 @@ mikasa_init_irq(void)
 	mikasa_update_irq_hw(0);
 
 	for (i = 16; i < 32; ++i) {
-		irq_to_desc(i)->status |= IRQ_LEVEL;
 		set_irq_chip_and_handler(i, &mikasa_irq_type, handle_level_irq);
+		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
 	init_i8259a_irqs();


