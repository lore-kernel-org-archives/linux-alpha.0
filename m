From: Shaomin Deng <dengshaomin@cdjrlc.com>
Subject: [PATCH] alpha: Fix double word in comments
Date: Tue, 30 Aug 2022 03:42:02 -0400
Message-ID: <20220830074202.11274-1-dengshaomin@cdjrlc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org
Cc: Shaomin Deng <dengshaomin@cdjrlc.com>

Delete the rebundant word "and" in comments.

Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
---
 arch/alpha/kernel/irq_i8259.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/irq_i8259.c b/arch/alpha/kernel/irq_i8259.c
index 1dcf0d9038fd..db574dcd6675 100644
--- a/arch/alpha/kernel/irq_i8259.c
+++ b/arch/alpha/kernel/irq_i8259.c
@@ -147,7 +147,7 @@ isa_no_iack_sc_device_interrupt(unsigned long vector)
 	 */
 	/* 
 	 *  The first read of gives you *all* interrupting lines.
-	 *  Therefore, read the mask register and and out those lines
+	 *  Therefore, read the mask register and out those lines
 	 *  not enabled.  Note that some documentation has 21 and a1 
 	 *  write only.  This is not true.
 	 */
-- 
2.35.1

