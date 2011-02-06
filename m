From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 15/19] alpha: takara: Convert irq_chip functions
Date: Sun, 06 Feb 2011 14:32:53 -0000
Message-ID: <20110206143149.323743124@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-convert-takara.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/sys_takara.c |   14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

Index: linux-next/arch/alpha/kernel/sys_takara.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/sys_takara.c
+++ linux-next/arch/alpha/kernel/sys_takara.c
@@ -45,16 +45,18 @@ takara_update_irq_hw(unsigned long irq, 
 }
 
 static inline void
-takara_enable_irq(unsigned int irq)
+takara_enable_irq(struct irq_data *d)
 {
+	unsigned int irq = d->irq;
 	unsigned long mask;
 	mask = (cached_irq_mask[irq >= 64] &= ~(1UL << (irq & 63)));
 	takara_update_irq_hw(irq, mask);
 }
 
 static void
-takara_disable_irq(unsigned int irq)
+takara_disable_irq(struct irq_data *d)
 {
+	unsigned int irq = d->irq;
 	unsigned long mask;
 	mask = (cached_irq_mask[irq >= 64] |= 1UL << (irq & 63));
 	takara_update_irq_hw(irq, mask);
@@ -62,9 +64,9 @@ takara_disable_irq(unsigned int irq)
 
 static struct irq_chip takara_irq_type = {
 	.name		= "TAKARA",
-	.unmask		= takara_enable_irq,
-	.mask		= takara_disable_irq,
-	.mask_ack	= takara_disable_irq,
+	.irq_unmask	= takara_enable_irq,
+	.irq_mask	= takara_disable_irq,
+	.irq_mask_ack	= takara_disable_irq,
 };
 
 static void
@@ -136,8 +138,8 @@ takara_init_irq(void)
 		takara_update_irq_hw(i, -1);
 
 	for (i = 16; i < 128; ++i) {
-		irq_to_desc(i)->status |= IRQ_LEVEL;
 		set_irq_chip_and_handler(i, &takara_irq_type, handle_level_irq);
+		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
 	common_init_isa_dma();


