From: Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH 1/3] alpha: Add performance monitor interrupt counter.
Date: Sat,  1 May 2010 11:55:38 +1200
Message-ID: <4796dfa7b7b9ad693d5ce7f4a4b2d7f58dc3fc65.1272668361.git.mcree@orcon.net.nz>
References: <cover.1272668360.git.mcree@orcon.net.nz>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <cover.1272668360.git.mcree@orcon.net.nz>
In-Reply-To: <cover.1272668360.git.mcree@orcon.net.nz>
References: <cover.1272668360.git.mcree@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>, linux-alpha@vger.kernel.org

And export the count to user space via /proc/interrupts.

Signed-off-by: Michael Cree <mcree@orcon.net.nz>
---
 arch/alpha/include/asm/hw_irq.h |    1 +
 arch/alpha/kernel/irq.c         |    7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/hw_irq.h b/arch/alpha/include/asm/hw_irq.h
index a37db0f..5050ac8 100644
--- a/arch/alpha/include/asm/hw_irq.h
+++ b/arch/alpha/include/asm/hw_irq.h
@@ -3,6 +3,7 @@
 
 
 extern volatile unsigned long irq_err_count;
+DECLARE_PER_CPU(unsigned long, irq_pmi_count);
 
 #ifdef CONFIG_ALPHA_GENERIC
 #define ACTUAL_NR_IRQS	alpha_mv.nr_irqs
diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
index 7f912ba..fe91298 100644
--- a/arch/alpha/kernel/irq.c
+++ b/arch/alpha/kernel/irq.c
@@ -31,6 +31,7 @@
 #include <asm/uaccess.h>
 
 volatile unsigned long irq_err_count;
+DEFINE_PER_CPU(unsigned long, irq_pmi_count);
 
 void ack_bad_irq(unsigned int irq)
 {
@@ -63,9 +64,7 @@ int irq_select_affinity(unsigned int irq)
 int
 show_interrupts(struct seq_file *p, void *v)
 {
-#ifdef CONFIG_SMP
 	int j;
-#endif
 	int irq = *(loff_t *) v;
 	struct irqaction * action;
 	unsigned long flags;
@@ -112,6 +111,10 @@ unlock:
 			seq_printf(p, "%10lu ", cpu_data[j].ipi_count);
 		seq_putc(p, '\n');
 #endif
+		seq_puts(p, "PMI: ");
+		for_each_online_cpu(j)
+			seq_printf(p, "%10lu ", per_cpu(irq_pmi_count, j));
+		seq_puts(p, "          Performance Monitoring\n");
 		seq_printf(p, "ERR: %10lu\n", irq_err_count);
 	}
 	return 0;
-- 
1.7.0

