From: Yong Zhang <yong.zhang0@gmail.com>
Subject: [PATCH 02/49] alpha: irq: Remove IRQF_DISABLED
Date: Sat, 22 Oct 2011 17:56:14 +0800
Message-ID: <1319277421-9203-3-git-send-email-yong.zhang0@gmail.com>
References: <1319277421-9203-1-git-send-email-yong.zhang0@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
        bh=dOzMrnfzVf1fCWe2PYOmV2Iq7xL4Ppw/PwchxuQ6WUo=;
        b=co5cRg19soiLEcsQSDUZzEOnLrwjKz0Wm9elNmpPi6HJWGJIH0pS6JZrmZo9QWKt5+
         unelEQ9bL0RNeDLM/0lxS0/CD6YOBJcmd/pTalnEqLOvtkOR/a7uPhXvEj/63Y+ugoGo
         5dREQzk6DgOR/u8AS5wbMoRvoeYYIgSN/Ve48=
In-Reply-To: <1319277421-9203-1-git-send-email-yong.zhang0@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

Since commit [e58aa3d2: genirq: Run irq handlers with interrupts disabled],
We run all interrupt handlers with interrupts disabled
and we even check and yell when an interrupt handler
returns with interrupts enabled (see commit [b738a50a:
genirq: Warn when handler enables interrupts]).

So now this flag is a NOOP and can be removed.

Signed-off-by: Yong Zhang <yong.zhang0@gmail.com>
---
 arch/alpha/include/asm/floppy.h |    2 +-
 arch/alpha/kernel/irq_alpha.c   |    1 -
 arch/alpha/kernel/sys_titan.c   |   14 +++++++-------
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/alpha/include/asm/floppy.h b/arch/alpha/include/asm/floppy.h
index 46cefbd..bae97eb 100644
--- a/arch/alpha/include/asm/floppy.h
+++ b/arch/alpha/include/asm/floppy.h
@@ -26,7 +26,7 @@
 #define fd_disable_irq()        disable_irq(FLOPPY_IRQ)
 #define fd_cacheflush(addr,size) /* nothing */
 #define fd_request_irq()        request_irq(FLOPPY_IRQ, floppy_interrupt,\
-					    IRQF_DISABLED, "floppy", NULL)
+					    0, "floppy", NULL)
 #define fd_free_irq()           free_irq(FLOPPY_IRQ, NULL)
 
 #ifdef CONFIG_PCI
diff --git a/arch/alpha/kernel/irq_alpha.c b/arch/alpha/kernel/irq_alpha.c
index 51b7fbd..e0312e8 100644
--- a/arch/alpha/kernel/irq_alpha.c
+++ b/arch/alpha/kernel/irq_alpha.c
@@ -221,7 +221,6 @@ process_mcheck_info(unsigned long vector, unsigned long la_ptr,
 
 struct irqaction timer_irqaction = {
 	.handler	= timer_interrupt,
-	.flags		= IRQF_DISABLED,
 	.name		= "timer",
 };
 
diff --git a/arch/alpha/kernel/sys_titan.c b/arch/alpha/kernel/sys_titan.c
index f47b30a..f96dc81 100644
--- a/arch/alpha/kernel/sys_titan.c
+++ b/arch/alpha/kernel/sys_titan.c
@@ -281,15 +281,15 @@ titan_late_init(void)
 	 * all reported to the kernel as machine checks, so the handler
 	 * is a nop so it can be called to count the individual events.
 	 */
-	titan_request_irq(63+16, titan_intr_nop, IRQF_DISABLED,
+	titan_request_irq(63+16, titan_intr_nop, 0,
 		    "CChip Error", NULL);
-	titan_request_irq(62+16, titan_intr_nop, IRQF_DISABLED,
+	titan_request_irq(62+16, titan_intr_nop, 0,
 		    "PChip 0 H_Error", NULL);
-	titan_request_irq(61+16, titan_intr_nop, IRQF_DISABLED,
+	titan_request_irq(61+16, titan_intr_nop, 0,
 		    "PChip 1 H_Error", NULL);
-	titan_request_irq(60+16, titan_intr_nop, IRQF_DISABLED,
+	titan_request_irq(60+16, titan_intr_nop, 0,
 		    "PChip 0 C_Error", NULL);
-	titan_request_irq(59+16, titan_intr_nop, IRQF_DISABLED,
+	titan_request_irq(59+16, titan_intr_nop, 0,
 		    "PChip 1 C_Error", NULL);
 
 	/* 
@@ -348,9 +348,9 @@ privateer_init_pci(void)
 	 * Hook a couple of extra err interrupts that the
 	 * common titan code won't.
 	 */
-	titan_request_irq(53+16, titan_intr_nop, IRQF_DISABLED,
+	titan_request_irq(53+16, titan_intr_nop, 0,
 		    "NMI", NULL);
-	titan_request_irq(50+16, titan_intr_nop, IRQF_DISABLED,
+	titan_request_irq(50+16, titan_intr_nop, 0,
 		    "Temperature Warning", NULL);
 
 	/*
-- 
1.7.1

