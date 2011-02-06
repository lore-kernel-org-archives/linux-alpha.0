From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 17/19] alpha: irq: Remove pointless irq status manipulation
Date: Sun, 06 Feb 2011 14:32:58 -0000
Message-ID: <20110206143149.517422918@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline;
	filename=alpha-remove-redundant-irq-flags-fiddling.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

The irq descriptors are initialized IRQ_DISABLED in the generic
code. No need to fiddle with them.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/irq_alpha.c |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

Index: linux-next/arch/alpha/kernel/irq_alpha.c
===================================================================
--- linux-next.orig/arch/alpha/kernel/irq_alpha.c
+++ linux-next/arch/alpha/kernel/irq_alpha.c
@@ -228,14 +228,9 @@ struct irqaction timer_irqaction = {
 void __init
 init_rtc_irq(void)
 {
-	struct irq_desc *desc = irq_to_desc(RTC_IRQ);
-
-	if (desc) {
-		desc->status |= IRQ_DISABLED;
-		set_irq_chip_and_handler_name(RTC_IRQ, &no_irq_chip,
-			handle_simple_irq, "RTC");
-		setup_irq(RTC_IRQ, &timer_irqaction);
-	}
+	set_irq_chip_and_handler_name(RTC_IRQ, &no_irq_chip,
+				      handle_simple_irq, "RTC");
+	setup_irq(RTC_IRQ, &timer_irqaction);
 }
 
 /* Dummy irqactions.  */


