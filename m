From: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 3/4] alpha: Fix RTC interrupt setup.
Date: Sun, 17 Apr 2011 13:05:25 -0700
Message-ID: <1303070726-32155-4-git-send-email-rth@twiddle.net>
References: <1303070726-32155-1-git-send-email-rth@twiddle.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:from:to:cc:subject:date:message-id
         :x-mailer:in-reply-to:references;
        bh=E/ODtlo68IPQvyOklIc60sORNEqCniUey7Uvd86FFcA=;
        b=pdxu31Sl4K6FtL5m47Xi35zJuQDX9yhJ11MClFf0IsDykkPRa+j9k4ltRi9Yo04zHH
         ZdOJkhEQVMOy1+59DYZWGcxLMl0U9PgqEgLxzjWyNUrCa+FJ+Gu9x1RM/mWn/V+ZwJSN
         fCxsjcvYN/0l0znjnVjcgI6QZ0OUPdt9r5cBE=
In-Reply-To: <1303070726-32155-1-git-send-email-rth@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, mattst88@gmail.com, linux-alpha@vger.kernel.org

Following 091738a266fc74329ae186f22ff2b3f01319112d we removed
an automatic conversion of no_irq_chip to dummy_irq_chip.  This
change needs to be propagated back into the alpha backend.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/alpha/kernel/irq_alpha.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/kernel/irq_alpha.c b/arch/alpha/kernel/irq_alpha.c
index 1479dc6..51b7fbd 100644
--- a/arch/alpha/kernel/irq_alpha.c
+++ b/arch/alpha/kernel/irq_alpha.c
@@ -228,7 +228,7 @@ struct irqaction timer_irqaction = {
 void __init
 init_rtc_irq(void)
 {
-	irq_set_chip_and_handler_name(RTC_IRQ, &no_irq_chip,
+	irq_set_chip_and_handler_name(RTC_IRQ, &dummy_irq_chip,
 				      handle_simple_irq, "RTC");
 	setup_irq(RTC_IRQ, &timer_irqaction);
 }
-- 
1.7.4.2

