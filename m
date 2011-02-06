From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 04/19] alpha: i8259, alcor, jensen wildfire: Convert irq_chip
Date: Sun, 06 Feb 2011 14:32:28 -0000
Message-ID: <20110206143148.256344738@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha=i8259-convert-irq-chip.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/irq_i8259.c    |   18 ++++++++++--------
 arch/alpha/kernel/irq_impl.h     |    8 +++-----
 arch/alpha/kernel/sys_alcor.c    |   28 ++++++++++++++--------------
 arch/alpha/kernel/sys_jensen.c   |   24 ++++++++++++------------
 arch/alpha/kernel/sys_wildfire.c |   32 +++++++++++++++++++-------------
 5 files changed, 58 insertions(+), 52 deletions(-)

Index: linux-next/arch/alpha/kernel/irq_i8259.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/irq_i8259.c
+++ linux-next/arch/alpha/kernel/irq_i8259.c
@@ -33,10 +33,10 @@ i8259_update_irq_hw(unsigned int irq, un
 }
 
 inline void
-i8259a_enable_irq(unsigned int irq)
+i8259a_enable_irq(struct irq_data *d)
 {
 	spin_lock(&i8259_irq_lock);
-	i8259_update_irq_hw(irq, cached_irq_mask &= ~(1 << irq));
+	i8259_update_irq_hw(d->irq, cached_irq_mask &= ~(1 << d->irq));
 	spin_unlock(&i8259_irq_lock);
 }
 
@@ -47,16 +47,18 @@ __i8259a_disable_irq(unsigned int irq)
 }
 
 void
-i8259a_disable_irq(unsigned int irq)
+i8259a_disable_irq(struct irq_data *d)
 {
 	spin_lock(&i8259_irq_lock);
-	__i8259a_disable_irq(irq);
+	__i8259a_disable_irq(d->irq);
 	spin_unlock(&i8259_irq_lock);
 }
 
 void
-i8259a_mask_and_ack_irq(unsigned int irq)
+i8259a_mask_and_ack_irq(struct irq_data *d)
 {
+	unsigned int irq = d->irq;
+
 	spin_lock(&i8259_irq_lock);
 	__i8259a_disable_irq(irq);
 
@@ -71,9 +73,9 @@ i8259a_mask_and_ack_irq(unsigned int irq
 
 struct irq_chip i8259a_irq_type = {
 	.name		= "XT-PIC",
-	.unmask		= i8259a_enable_irq,
-	.mask		= i8259a_disable_irq,
-	.mask_ack	= i8259a_mask_and_ack_irq,
+	.irq_unmask	= i8259a_enable_irq,
+	.irq_mask	= i8259a_disable_irq,
+	.irq_mask_ack	= i8259a_mask_and_ack_irq,
 };
 
 void __init
Index: linux-next/arch/alpha/kernel/irq_impl.h
===================================================================
--- linux-next.orig/arch/alpha/kernel/irq_impl.h
+++ linux-next/arch/alpha/kernel/irq_impl.h
@@ -31,11 +31,9 @@ extern void init_rtc_irq(void);
 
 extern void common_init_isa_dma(void);
 
-extern void i8259a_enable_irq(unsigned int);
-extern void i8259a_disable_irq(unsigned int);
-extern void i8259a_mask_and_ack_irq(unsigned int);
-extern unsigned int i8259a_startup_irq(unsigned int);
-extern void i8259a_end_irq(unsigned int);
+extern void i8259a_enable_irq(struct irq_data *d);
+extern void i8259a_disable_irq(struct irq_data *d);
+extern void i8259a_mask_and_ack_irq(struct irq_data *d);
 extern struct irq_chip i8259a_irq_type;
 extern void init_i8259a_irqs(void);
 
Index: linux-next/arch/alpha/kernel/sys_alcor.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/sys_alcor.c
+++ linux-next/arch/alpha/kernel/sys_alcor.c
@@ -44,31 +44,31 @@ alcor_update_irq_hw(unsigned long mask)
 }
 
 static inline void
-alcor_enable_irq(unsigned int irq)
+alcor_enable_irq(struct irq_data *d)
 {
-	alcor_update_irq_hw(cached_irq_mask |= 1UL << (irq - 16));
+	alcor_update_irq_hw(cached_irq_mask |= 1UL << (d->irq - 16));
 }
 
 static void
-alcor_disable_irq(unsigned int irq)
+alcor_disable_irq(struct irq_data *d)
 {
-	alcor_update_irq_hw(cached_irq_mask &= ~(1UL << (irq - 16)));
+	alcor_update_irq_hw(cached_irq_mask &= ~(1UL << (d->irq - 16)));
 }
 
 static void
-alcor_mask_and_ack_irq(unsigned int irq)
+alcor_mask_and_ack_irq(struct irq_data *d)
 {
-	alcor_disable_irq(irq);
+	alcor_disable_irq(d);
 
 	/* On ALCOR/XLT, need to dismiss interrupt via GRU. */
-	*(vuip)GRU_INT_CLEAR = 1 << (irq - 16); mb();
+	*(vuip)GRU_INT_CLEAR = 1 << (d->irq - 16); mb();
 	*(vuip)GRU_INT_CLEAR = 0; mb();
 }
 
 static void
-alcor_isa_mask_and_ack_irq(unsigned int irq)
+alcor_isa_mask_and_ack_irq(struct irq_data *d)
 {
-	i8259a_mask_and_ack_irq(irq);
+	i8259a_mask_and_ack_irq(d);
 
 	/* On ALCOR/XLT, need to dismiss interrupt via GRU. */
 	*(vuip)GRU_INT_CLEAR = 0x80000000; mb();
@@ -77,9 +77,9 @@ alcor_isa_mask_and_ack_irq(unsigned int 
 
 static struct irq_chip alcor_irq_type = {
 	.name		= "ALCOR",
-	.unmask		= alcor_enable_irq,
-	.mask		= alcor_disable_irq,
-	.mask_ack	= alcor_mask_and_ack_irq,
+	.irq_unmask	= alcor_enable_irq,
+	.irq_mask	= alcor_disable_irq,
+	.irq_mask_ack	= alcor_mask_and_ack_irq,
 };
 
 static void
@@ -126,9 +126,9 @@ alcor_init_irq(void)
 		if (i >= 16+20 && i <= 16+30)
 			continue;
 		set_irq_chip_and_handler(i, &alcor_irq_type, handle_level_irq);
-		irq_to_desc(i)->status |= IRQ_LEVEL;
+		irq_set_status_flags(i, IRQ_LEVEL);
 	}
-	i8259a_irq_type.ack = alcor_isa_mask_and_ack_irq;
+	i8259a_irq_type.irq_ack = alcor_isa_mask_and_ack_irq;
 
 	init_i8259a_irqs();
 	common_init_isa_dma();
Index: linux-next/arch/alpha/kernel/sys_jensen.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/sys_jensen.c
+++ linux-next/arch/alpha/kernel/sys_jensen.c
@@ -63,34 +63,34 @@
  */
 
 static void
-jensen_local_enable(unsigned int irq)
+jensen_local_enable(struct irq_data *d)
 {
 	/* the parport is really hw IRQ 1, silly Jensen.  */
-	if (irq == 7)
-		i8259a_enable_irq(1);
+	if (d->irq == 7)
+		i8259a_enable_irq(d);
 }
 
 static void
-jensen_local_disable(unsigned int irq)
+jensen_local_disable(struct irq_data *d)
 {
 	/* the parport is really hw IRQ 1, silly Jensen.  */
-	if (irq == 7)
-		i8259a_disable_irq(1);
+	if (d->irq == 7)
+		i8259a_disable_irq(d);
 }
 
 static void
-jensen_local_mask_ack(unsigned int irq)
+jensen_local_mask_ack(struct irq_data *d)
 {
 	/* the parport is really hw IRQ 1, silly Jensen.  */
-	if (irq == 7)
-		i8259a_mask_and_ack_irq(1);
+	if (d->irq == 7)
+		i8259a_mask_and_ack_irq(d);
 }
 
 static struct irq_chip jensen_local_irq_type = {
 	.name		= "LOCAL",
-	.unmask		= jensen_local_enable,
-	.mask		= jensen_local_disable,
-	.mask_ack	= jensen_local_mask_ack,
+	.irq_unmask	= jensen_local_enable,
+	.irq_mask	= jensen_local_disable,
+	.irq_mask_ack	= jensen_local_mask_ack,
 };
 
 static void 
Index: linux-next/arch/alpha/kernel/sys_wildfire.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/sys_wildfire.c
+++ linux-next/arch/alpha/kernel/sys_wildfire.c
@@ -104,10 +104,12 @@ wildfire_init_irq_hw(void)
 }
 
 static void
-wildfire_enable_irq(unsigned int irq)
+wildfire_enable_irq(struct irq_data *d)
 {
+	unsigned int irq = d->irq;
+
 	if (irq < 16)
-		i8259a_enable_irq(irq);
+		i8259a_enable_irq(d);
 
 	spin_lock(&wildfire_irq_lock);
 	set_bit(irq, &cached_irq_mask);
@@ -116,10 +118,12 @@ wildfire_enable_irq(unsigned int irq)
 }
 
 static void
-wildfire_disable_irq(unsigned int irq)
+wildfire_disable_irq(struct irq_data *d)
 {
+	unsigned int irq = d->irq;
+
 	if (irq < 16)
-		i8259a_disable_irq(irq);
+		i8259a_disable_irq(d);
 
 	spin_lock(&wildfire_irq_lock);
 	clear_bit(irq, &cached_irq_mask);
@@ -128,10 +132,12 @@ wildfire_disable_irq(unsigned int irq)
 }
 
 static void
-wildfire_mask_and_ack_irq(unsigned int irq)
+wildfire_mask_and_ack_irq(struct irq_data *d)
 {
+	unsigned int irq = d->irq;
+
 	if (irq < 16)
-		i8259a_mask_and_ack_irq(irq);
+		i8259a_mask_and_ack_irq(d);
 
 	spin_lock(&wildfire_irq_lock);
 	clear_bit(irq, &cached_irq_mask);
@@ -141,9 +147,9 @@ wildfire_mask_and_ack_irq(unsigned int i
 
 static struct irq_chip wildfire_irq_type = {
 	.name		= "WILDFIRE",
-	.unmask		= wildfire_enable_irq,
-	.mask		= wildfire_disable_irq,
-	.mask_ack	= wildfire_mask_and_ack_irq,
+	.irq_unmask	= wildfire_enable_irq,
+	.irq_mask	= wildfire_disable_irq,
+	.irq_mask_ack	= wildfire_mask_and_ack_irq,
 };
 
 static void __init
@@ -177,21 +183,21 @@ wildfire_init_irq_per_pca(int qbbno, int
 	for (i = 0; i < 16; ++i) {
 		if (i == 2)
 			continue;
-		irq_to_desc(i+irq_bias)->status |= IRQ_LEVEL;
 		set_irq_chip_and_handler(i+irq_bias, &wildfire_irq_type,
 			handle_level_irq);
+		irq_set_status_flags(i + irq_bias, IRQ_LEVEL);
 	}
 
-	irq_to_desc(36+irq_bias)->status |= IRQ_LEVEL;
 	set_irq_chip_and_handler(36+irq_bias, &wildfire_irq_type,
 		handle_level_irq);
+	irq_set_status_flags(36 + irq_bias, IRQ_LEVEL);
 	for (i = 40; i < 64; ++i) {
-		irq_to_desc(i+irq_bias)->status |= IRQ_LEVEL;
 		set_irq_chip_and_handler(i+irq_bias, &wildfire_irq_type,
 			handle_level_irq);
+		irq_set_status_flags(i + irq_bias, IRQ_LEVEL);
 	}
 
-	setup_irq(32+irq_bias, &isa_enable);	
+	setup_irq(32+irq_bias, &isa_enable);
 }
 
 static void __init


