From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 06/19] alpha: dp264: Convert irq_chip functions
Date: Sun, 06 Feb 2011 14:32:33 -0000
Message-ID: <20110206143148.451298480@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-dp264-convert-irq-chip.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/sys_dp264.c |   52 +++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 25 deletions(-)

Index: linux-next/arch/alpha/kernel/sys_dp264.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/sys_dp264.c
+++ linux-next/arch/alpha/kernel/sys_dp264.c
@@ -98,37 +98,37 @@ tsunami_update_irq_hw(unsigned long mask
 }
 
 static void
-dp264_enable_irq(unsigned int irq)
+dp264_enable_irq(struct irq_data *d)
 {
 	spin_lock(&dp264_irq_lock);
-	cached_irq_mask |= 1UL << irq;
+	cached_irq_mask |= 1UL << d->irq;
 	tsunami_update_irq_hw(cached_irq_mask);
 	spin_unlock(&dp264_irq_lock);
 }
 
 static void
-dp264_disable_irq(unsigned int irq)
+dp264_disable_irq(struct irq_data *d)
 {
 	spin_lock(&dp264_irq_lock);
-	cached_irq_mask &= ~(1UL << irq);
+	cached_irq_mask &= ~(1UL << d->irq);
 	tsunami_update_irq_hw(cached_irq_mask);
 	spin_unlock(&dp264_irq_lock);
 }
 
 static void
-clipper_enable_irq(unsigned int irq)
+clipper_enable_irq(struct irq_data *d)
 {
 	spin_lock(&dp264_irq_lock);
-	cached_irq_mask |= 1UL << (irq - 16);
+	cached_irq_mask |= 1UL << (d->irq - 16);
 	tsunami_update_irq_hw(cached_irq_mask);
 	spin_unlock(&dp264_irq_lock);
 }
 
 static void
-clipper_disable_irq(unsigned int irq)
+clipper_disable_irq(struct irq_data *d)
 {
 	spin_lock(&dp264_irq_lock);
-	cached_irq_mask &= ~(1UL << (irq - 16));
+	cached_irq_mask &= ~(1UL << (d->irq - 16));
 	tsunami_update_irq_hw(cached_irq_mask);
 	spin_unlock(&dp264_irq_lock);
 }
@@ -149,10 +149,11 @@ cpu_set_irq_affinity(unsigned int irq, c
 }
 
 static int
-dp264_set_affinity(unsigned int irq, const struct cpumask *affinity)
-{ 
+dp264_set_affinity(struct irq_data *d, const struct cpumask *affinity,
+		   bool force)
+{
 	spin_lock(&dp264_irq_lock);
-	cpu_set_irq_affinity(irq, *affinity);
+	cpu_set_irq_affinity(d->irq, *affinity);
 	tsunami_update_irq_hw(cached_irq_mask);
 	spin_unlock(&dp264_irq_lock);
 
@@ -160,10 +161,11 @@ dp264_set_affinity(unsigned int irq, con
 }
 
 static int
-clipper_set_affinity(unsigned int irq, const struct cpumask *affinity)
-{ 
+clipper_set_affinity(struct irq_data *d, const struct cpumask *affinity,
+		     bool force)
+{
 	spin_lock(&dp264_irq_lock);
-	cpu_set_irq_affinity(irq - 16, *affinity);
+	cpu_set_irq_affinity(d->irq - 16, *affinity);
 	tsunami_update_irq_hw(cached_irq_mask);
 	spin_unlock(&dp264_irq_lock);
 
@@ -171,19 +173,19 @@ clipper_set_affinity(unsigned int irq, c
 }
 
 static struct irq_chip dp264_irq_type = {
-	.name		= "DP264",
-	.unmask		= dp264_enable_irq,
-	.mask		= dp264_disable_irq,
-	.mask_ack	= dp264_disable_irq,
-	.set_affinity	= dp264_set_affinity,
+	.name			= "DP264",
+	.irq_unmask		= dp264_enable_irq,
+	.irq_mask		= dp264_disable_irq,
+	.irq_mask_ack		= dp264_disable_irq,
+	.irq_set_affinity	= dp264_set_affinity,
 };
 
 static struct irq_chip clipper_irq_type = {
-	.name		= "CLIPPER",
-	.unmask		= clipper_enable_irq,
-	.mask		= clipper_disable_irq,
-	.mask_ack	= clipper_disable_irq,
-	.set_affinity	= clipper_set_affinity,
+	.name			= "CLIPPER",
+	.irq_unmask		= clipper_enable_irq,
+	.irq_mask		= clipper_disable_irq,
+	.irq_mask_ack		= clipper_disable_irq,
+	.irq_set_affinity	= clipper_set_affinity,
 };
 
 static void
@@ -268,8 +270,8 @@ init_tsunami_irqs(struct irq_chip * ops,
 {
 	long i;
 	for (i = imin; i <= imax; ++i) {
-		irq_to_desc(i)->status |= IRQ_LEVEL;
 		set_irq_chip_and_handler(i, ops, handle_level_irq);
+		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 }
 


