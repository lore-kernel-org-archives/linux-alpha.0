From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 2/2] alpha: Use generic show_interrupts()
Date: Fri, 25 Mar 2011 21:40:49 -0000
Message-ID: <20110325214012.224609851@linutronix.de>
References: <20110325213858.436906458@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-show.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org

The only subtle difference is that alpha uses ACTUAL_NR_IRQS and
prints the IRQF_DISABLED flag.

Change the generic implementation to deal with ACTUAL_NR_IRQS if
defined.

The IRQF_DISABLED printing is pointless, as we nowadays run all
interrupts with irqs disabled.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/Kconfig      |    1 
 arch/alpha/kernel/irq.c |   67 +++++++-----------------------------------------
 kernel/irq/proc.c       |    8 ++++-
 3 files changed, 17 insertions(+), 59 deletions(-)

Index: linux-2.6-tip/arch/alpha/Kconfig
===================================================================
--- linux-2.6-tip.orig/arch/alpha/Kconfig
+++ linux-2.6-tip/arch/alpha/Kconfig
@@ -11,6 +11,7 @@ config ALPHA
 	select HAVE_GENERIC_HARDIRQS
 	select GENERIC_IRQ_PROBE
 	select AUTO_IRQ_AFFINITY if SMP
+	select GENERIC_IRQ_SHOW
 	select GENERIC_HARDIRQS_NO_DEPRECATED
 	help
 	  The Alpha is a 64-bit general-purpose processor designed and
Index: linux-2.6-tip/arch/alpha/kernel/irq.c
===================================================================
--- linux-2.6-tip.orig/arch/alpha/kernel/irq.c
+++ linux-2.6-tip/arch/alpha/kernel/irq.c
@@ -67,68 +67,21 @@ int irq_select_affinity(unsigned int irq
 }
 #endif /* CONFIG_SMP */
 
-int
-show_interrupts(struct seq_file *p, void *v)
+int arch_show_interrupts(struct seq_file *p, int prec)
 {
 	int j;
-	int irq = *(loff_t *) v;
-	struct irqaction * action;
-	struct irq_desc *desc;
-	unsigned long flags;
 
 #ifdef CONFIG_SMP
-	if (irq == 0) {
-		seq_puts(p, "           ");
-		for_each_online_cpu(j)
-			seq_printf(p, "CPU%d       ", j);
-		seq_putc(p, '\n');
-	}
-#endif
-
-	if (irq < ACTUAL_NR_IRQS) {
-		desc = irq_to_desc(irq);
-
-		if (!desc)
-			return 0;
-
-		raw_spin_lock_irqsave(&desc->lock, flags);
-		action = desc->action;
-		if (!action) 
-			goto unlock;
-		seq_printf(p, "%3d: ", irq);
-#ifndef CONFIG_SMP
-		seq_printf(p, "%10u ", kstat_irqs(irq));
-#else
-		for_each_online_cpu(j)
-			seq_printf(p, "%10u ", kstat_irqs_cpu(irq, j));
-#endif
-		seq_printf(p, " %14s", irq_desc_get_chip(desc)->name);
-		seq_printf(p, "  %c%s",
-			(action->flags & IRQF_DISABLED)?'+':' ',
-			action->name);
-
-		for (action=action->next; action; action = action->next) {
-			seq_printf(p, ", %c%s",
-				  (action->flags & IRQF_DISABLED)?'+':' ',
-				   action->name);
-		}
-
-		seq_putc(p, '\n');
-unlock:
-		raw_spin_unlock_irqrestore(&desc->lock, flags);
-	} else if (irq == ACTUAL_NR_IRQS) {
-#ifdef CONFIG_SMP
-		seq_puts(p, "IPI: ");
-		for_each_online_cpu(j)
-			seq_printf(p, "%10lu ", cpu_data[j].ipi_count);
-		seq_putc(p, '\n');
+	seq_puts(p, "IPI: ");
+	for_each_online_cpu(j)
+		seq_printf(p, "%10lu ", cpu_data[j].ipi_count);
+	seq_putc(p, '\n');
 #endif
-		seq_puts(p, "PMI: ");
-		for_each_online_cpu(j)
-			seq_printf(p, "%10lu ", per_cpu(irq_pmi_count, j));
-		seq_puts(p, "          Performance Monitoring\n");
-		seq_printf(p, "ERR: %10lu\n", irq_err_count);
-	}
+	seq_puts(p, "PMI: ");
+	for_each_online_cpu(j)
+		seq_printf(p, "%10lu ", per_cpu(irq_pmi_count, j));
+	seq_puts(p, "          Performance Monitoring\n");
+	seq_printf(p, "ERR: %10lu\n", irq_err_count);
 	return 0;
 }
 
Index: linux-2.6-tip/kernel/irq/proc.c
===================================================================
--- linux-2.6-tip.orig/kernel/irq/proc.c
+++ linux-2.6-tip/kernel/irq/proc.c
@@ -364,6 +364,10 @@ int __weak arch_show_interrupts(struct s
 	return 0;
 }
 
+#ifndef ACTUAL_NR_IRQS
+# define ACTUAL_NR_IRQS nr_irqs
+#endif
+
 int show_interrupts(struct seq_file *p, void *v)
 {
 	static int prec;
@@ -373,10 +377,10 @@ int show_interrupts(struct seq_file *p, 
 	struct irqaction *action;
 	struct irq_desc *desc;
 
-	if (i > nr_irqs)
+	if (i > ACTUAL_NR_IRQS)
 		return 0;
 
-	if (i == nr_irqs)
+	if (i == ACTUAL_NR_IRQS)
 		return arch_show_interrupts(p, prec);
 
 	/* print header and calculate the width of the first column */


