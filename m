From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 01/19] alpha: Fix broken SMP=y
Date: Sun, 06 Feb 2011 14:32:21 -0000
Message-ID: <20110206143147.961801523@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-fix-smp-compile.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

The __doIRQ cleanup left SMP=y broken.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/irq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-next/arch/alpha/kernel/irq.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/irq.c
+++ linux-next/arch/alpha/kernel/irq.c
@@ -44,7 +44,7 @@ static char irq_user_affinity[NR_IRQS];
 
 int irq_select_affinity(unsigned int irq)
 {
-	struct irq_desc *desc = irq_to_desc[irq];
+	struct irq_desc *desc = irq_to_desc(irq);
 	static int last_cpu;
 	int cpu = last_cpu + 1;
 


