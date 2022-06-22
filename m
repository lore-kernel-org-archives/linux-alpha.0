From: Jiang Jian <jiangjian@cdjrlc.com>
Subject: [PATCH] alpha: irq_i8259: drop unexpected word 'and' in the comments
Date: Wed, 22 Jun 2022 22:02:01 +0800
Message-ID: <20220622140201.5458-1-jiangjian@cdjrlc.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Jiang Jian <jiangjian@cdjrlc.com>

there is an unexpected word 'and' in the comments that need to be dropped

file: arch/alpha/kernel/irq_i8259.c
line: 150

*  Therefore, read the mask register and and out those lines

changed to:

*  Therefore, read the mask register and and out those lines

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
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
2.17.1

