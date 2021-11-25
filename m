From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH v2] mm: Fix warning comparing pointer to 0
Date: Thu, 25 Nov 2021 18:14:00 +0800
Message-ID: <1637835240-51114-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Fix the following coccicheck warning:

./arch/alpha/mm/fault.c:193:52-53: WARNING comparing pointer to 0.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
Changes in v2:
  -For the follow advice:
   https://lore.kernel.org/lkml/5391025983087ae9d1292387bc0b2b37c9c57863.camel@perches.com/

 arch/alpha/mm/fault.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index 6c0a277..89e265e 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -190,10 +190,9 @@
 
  no_context:
 	/* Are we prepared to handle this fault as an exception?  */
-	if ((fixup = search_exception_tables(regs->pc)) != 0) {
-		unsigned long newpc;
-		newpc = fixup_exception(dpf_reg, fixup, regs->pc);
-		regs->pc = newpc;
+	fixup = search_exception_tables(regs->pc);
+	if (fixup) {
+		regs->pc = fixup_exception(dpf_reg, fixup, regs->pc);
 		return;
 	}
 
-- 
1.8.3.1

