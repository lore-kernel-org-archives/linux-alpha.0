From: Richard Henderson <rth@twiddle.net>
Subject: [RFC PATCH 01/10] alpha: Don't if-out dp264_device_interrupt.
Date: Tue, 16 Jul 2013 10:34:09 -0700
Message-ID: <1373996058-13399-2-git-send-email-rth@twiddle.net>
References: <1373996058-13399-1-git-send-email-rth@twiddle.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=xrHML8hEiuj1ViyDIgvIozERnTkH5z718WFYo620Wmw=;
        b=WsjYsY56yZFQkvYxpqlnYIkz0ZXonFob2rSoZfCO2LDezWVBEIe6RIbGuSdToY3QXj
         W1nCviIkBb+HDDVyAy8uPhoqUoqxQarX2f633wJEo4FLWSFfWi9K0sTx+q3gsw/0xvkS
         VZkCmTRSwrT+77t4/6/9G6ZNyjkYWwce2ArB+4y8h/r5W1Pv3IFPotaC+dXUgUaVa+WR
         5eFFrrashT/EqtamzKU72irSx2fO49VfWCyqhz4K85oKdK8P0cwbzuzDD5QTMde03VVs
         l+GtVpCn/QVXaCYUOQfvpfpnXvYRqHmX3QhozV3y/mXqss+mNC21VU0N6WqgQYM6OzBs
         eMlw==
In-Reply-To: <1373996058-13399-1-git-send-email-rth@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

The code as written is correct, and will be used by QEMU emulation.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/alpha/kernel/sys_dp264.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/alpha/kernel/sys_dp264.c b/arch/alpha/kernel/sys_dp264.c
index 5bf401f..6c35159 100644
--- a/arch/alpha/kernel/sys_dp264.c
+++ b/arch/alpha/kernel/sys_dp264.c
@@ -190,9 +190,6 @@ static struct irq_chip clipper_irq_type = {
 static void
 dp264_device_interrupt(unsigned long vector)
 {
-#if 1
-	printk("dp264_device_interrupt: NOT IMPLEMENTED YET!!\n");
-#else
 	unsigned long pld;
 	unsigned int i;
 
@@ -210,12 +207,7 @@ dp264_device_interrupt(unsigned long vector)
 			isa_device_interrupt(vector);
 		else
 			handle_irq(16 + i);
-#if 0
-		TSUNAMI_cchip->dir0.csr = 1UL << i; mb();
-		tmp = TSUNAMI_cchip->dir0.csr;
-#endif
 	}
-#endif
 }
 
 static void 
-- 
1.8.1.4
