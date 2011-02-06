From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 16/19] alpha: titan: Convert irq_chip functions
Date: Sun, 06 Feb 2011 14:32:56 -0000
Message-ID: <20110206143149.420669286@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-convert-titan.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/sys_titan.c |   19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

Index: linux-next/arch/alpha/kernel/sys_titan.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/sys_titan.c
+++ linux-next/arch/alpha/kernel/sys_titan.c
@@ -112,7 +112,7 @@ titan_update_irq_hw(unsigned long mask)
 }
 
 static inline void
-titan_enable_irq(unsigned int irq)
+titan_enable_irq(struct irq_data *d)
 {
 	spin_lock(&titan_irq_lock);
 	titan_cached_irq_mask |= 1UL << (irq - 16);
@@ -121,7 +121,7 @@ titan_enable_irq(unsigned int irq)
 }
 
 static inline void
-titan_disable_irq(unsigned int irq)
+titan_disable_irq(struct irq_data *d)
 {
 	spin_lock(&titan_irq_lock);
 	titan_cached_irq_mask &= ~(1UL << (irq - 16));
@@ -144,7 +144,8 @@ titan_cpu_set_irq_affinity(unsigned int 
 }
 
 static int
-titan_set_irq_affinity(unsigned int irq, const struct cpumask *affinity)
+titan_set_irq_affinity(struct irq_data *d, const struct cpumask *affinity,
+		       bool force)
 { 
 	spin_lock(&titan_irq_lock);
 	titan_cpu_set_irq_affinity(irq - 16, *affinity);
@@ -175,17 +176,17 @@ init_titan_irqs(struct irq_chip * ops, i
 {
 	long i;
 	for (i = imin; i <= imax; ++i) {
-		irq_to_desc(i)->status |= IRQ_LEVEL;
 		set_irq_chip_and_handler(i, ops, handle_level_irq);
+		irq_set_status_flags(i, IRQ_LEVEL);
 	}
 }
 
 static struct irq_chip titan_irq_type = {
-       .name		= "TITAN",
-       .unmask		= titan_enable_irq,
-       .mask		= titan_disable_irq,
-       .mask_ack	= titan_disable_irq,
-       .set_affinity	= titan_set_irq_affinity,
+       .name			= "TITAN",
+       .irq_unmask		= titan_enable_irq,
+       .irq_mask		= titan_disable_irq,
+       .irq_mask_ack		= titan_disable_irq,
+       .irq_set_affinity	= titan_set_irq_affinity,
 };
 
 static irqreturn_t


