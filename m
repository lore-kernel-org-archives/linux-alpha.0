From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 09/19] alpha: marvel: Convert irq_chip functions
Date: Sun, 06 Feb 2011 14:32:39 -0000
Message-ID: <20110206143148.743291534@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-marvel-convert.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/sys_marvel.c |   42 ++++++++++++++++++-----------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

Index: linux-next/arch/alpha/kernel/sys_marvel.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/sys_marvel.c
+++ linux-next/arch/alpha/kernel/sys_marvel.c
@@ -104,9 +104,10 @@ io7_get_irq_ctl(unsigned int irq, struct
 }
 
 static void
-io7_enable_irq(unsigned int irq)
+io7_enable_irq(struct irq_data *d)
 {
 	volatile unsigned long *ctl;
+	unsigned int irq = d->irq;
 	struct io7 *io7;
 
 	ctl = io7_get_irq_ctl(irq, &io7);
@@ -115,7 +116,7 @@ io7_enable_irq(unsigned int irq)
 		       __func__, irq);
 		return;
 	}
-		
+
 	spin_lock(&io7->irq_lock);
 	*ctl |= 1UL << 24;
 	mb();
@@ -124,9 +125,10 @@ io7_enable_irq(unsigned int irq)
 }
 
 static void
-io7_disable_irq(unsigned int irq)
+io7_disable_irq(struct irq_data *d)
 {
 	volatile unsigned long *ctl;
+	unsigned int irq = d->irq;
 	struct io7 *io7;
 
 	ctl = io7_get_irq_ctl(irq, &io7);
@@ -135,7 +137,7 @@ io7_disable_irq(unsigned int irq)
 		       __func__, irq);
 		return;
 	}
-		
+
 	spin_lock(&io7->irq_lock);
 	*ctl &= ~(1UL << 24);
 	mb();
@@ -144,35 +146,29 @@ io7_disable_irq(unsigned int irq)
 }
 
 static void
-marvel_irq_noop(unsigned int irq) 
-{ 
-	return; 
-}
-
-static unsigned int
-marvel_irq_noop_return(unsigned int irq) 
-{ 
-	return 0; 
+marvel_irq_noop(struct irq_data *d)
+{
+	return;
 }
 
 static struct irq_chip marvel_legacy_irq_type = {
 	.name		= "LEGACY",
-	.mask		= marvel_irq_noop,
-	.unmask		= marvel_irq_noop,
+	.irq_mask	= marvel_irq_noop,
+	.irq_unmask	= marvel_irq_noop,
 };
 
 static struct irq_chip io7_lsi_irq_type = {
 	.name		= "LSI",
-	.unmask		= io7_enable_irq,
-	.mask		= io7_disable_irq,
-	.mask_ack	= io7_disable_irq,
+	.irq_unmask	= io7_enable_irq,
+	.irq_mask	= io7_disable_irq,
+	.irq_mask_ack	= io7_disable_irq,
 };
 
 static struct irq_chip io7_msi_irq_type = {
 	.name		= "MSI",
-	.unmask		= io7_enable_irq,
-	.mask		= io7_disable_irq,
-	.ack		= marvel_irq_noop,
+	.irq_unmask	= io7_enable_irq,
+	.irq_mask	= io7_disable_irq,
+	.irq_ack	= marvel_irq_noop,
 };
 
 static void
@@ -280,8 +276,8 @@ init_io7_irqs(struct io7 *io7, 
 
 	/* Set up the lsi irqs.  */
 	for (i = 0; i < 128; ++i) {
-		irq_to_desc(base + i)->status |= IRQ_LEVEL;
 		set_irq_chip_and_handler(base + i, lsi_ops, handle_level_irq);
+		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
 	/* Disable the implemented irqs in hardware.  */
@@ -294,8 +290,8 @@ init_io7_irqs(struct io7 *io7, 
 
 	/* Set up the msi irqs.  */
 	for (i = 128; i < (128 + 512); ++i) {
-		irq_to_desc(base + i)->status |= IRQ_LEVEL;
 		set_irq_chip_and_handler(base + i, msi_ops, handle_level_irq);
+		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 
 	for (i = 0; i < 16; ++i)


