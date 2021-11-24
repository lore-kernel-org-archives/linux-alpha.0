From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] mm: Fix warning comparing pointer to 0
Date: Wed, 24 Nov 2021 18:13:38 +0800
Message-ID: <1637748818-21730-1-git-send-email-jiapeng.chong@linux.alibaba.com>
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
 arch/alpha/mm/fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index 6c0a277..22c1f24 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -190,7 +190,7 @@
 
  no_context:
 	/* Are we prepared to handle this fault as an exception?  */
-	if ((fixup = search_exception_tables(regs->pc)) != 0) {
+	if (!(fixup = search_exception_tables(regs->pc)) {
 		unsigned long newpc;
 		newpc = fixup_exception(dpf_reg, fixup, regs->pc);
 		regs->pc = newpc;
-- 
1.8.3.1

