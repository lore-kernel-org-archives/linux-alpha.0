From: Haowen Bai <baihaowen@meizu.com>
Subject: [PATCH] alpha: Fix warning comparing pointer to 0
Date: Thu, 24 Mar 2022 09:59:27 +0800
Message-ID: <1648087167-27982-1-git-send-email-baihaowen@meizu.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, ebiederm@xmission.com
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Haowen Bai <baihaowen@meizu.com>

Avoid pointer type value compared with 0 to make code clear.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 arch/alpha/mm/fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index ec20c10..47e5c68 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -190,7 +190,7 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 
  no_context:
 	/* Are we prepared to handle this fault as an exception?  */
-	if ((fixup = search_exception_tables(regs->pc)) != 0) {
+	if ((fixup = search_exception_tables(regs->pc)) != NULL) {
 		unsigned long newpc;
 		newpc = fixup_exception(dpf_reg, fixup, regs->pc);
 		regs->pc = newpc;
-- 
2.7.4

