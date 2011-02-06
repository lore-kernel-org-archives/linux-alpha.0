From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 18/19] alpha: irq: Convert affinity to use irq_data
Date: Sun, 06 Feb 2011 14:33:00 -0000
Message-ID: <20110206143149.613660661@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-irq-convert-to-irq-data.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

affinity is moving to irq_data. Fix it up.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/irq.c |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

Index: linux-next/arch/alpha/kernel/irq.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/irq.c
+++ linux-next/arch/alpha/kernel/irq.c
@@ -44,11 +44,16 @@ static char irq_user_affinity[NR_IRQS];
 
 int irq_select_affinity(unsigned int irq)
 {
-	struct irq_desc *desc = irq_to_desc(irq);
+	struct irq_data *data = irq_get_irq_data(irq);
+	struct irq_chip *chip;
 	static int last_cpu;
 	int cpu = last_cpu + 1;
 
-	if (!desc || !get_irq_desc_chip(desc)->set_affinity || irq_user_affinity[irq])
+	if (!data)
+		return 1;
+	chip = irq_data_get_irq_chip(data);
+
+	if (!chip->irq_set_affinity || irq_user_affinity[irq])
 		return 1;
 
 	while (!cpu_possible(cpu) ||
@@ -56,8 +61,8 @@ int irq_select_affinity(unsigned int irq
 		cpu = (cpu < (NR_CPUS-1) ? cpu + 1 : 0);
 	last_cpu = cpu;
 
-	cpumask_copy(desc->affinity, cpumask_of(cpu));
-	get_irq_desc_chip(desc)->set_affinity(irq, cpumask_of(cpu));
+	cpumask_copy(data->affinity, cpumask_of(cpu));
+	chip->irq_set_affinity(data, cpumask_of(cpu), false);
 	return 0;
 }
 #endif /* CONFIG_SMP */


