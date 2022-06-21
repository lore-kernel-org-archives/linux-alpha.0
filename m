From: Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next] mm: Fix warning comparing pointer to 0
Date: Tue, 21 Jun 2022 11:49:39 +0800
Message-ID: <20220621034939.111812-1-yang.lee@linux.alibaba.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>, Abaci Robot <abaci@linux.alibaba.com>

Fix the following coccicheck warning:
./arch/alpha/mm/fault.c:197:52-53: WARNING comparing pointer to 0

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/alpha/mm/fault.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index ef427a6bdd1a..bb3fe2949313 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -194,7 +194,8 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 
  no_context:
 	/* Are we prepared to handle this fault as an exception?  */
-	if ((fixup = search_exception_tables(regs->pc)) != 0) {
+	fixup = search_exception_tables(regs->pc);
+	if (fixup) {
 		unsigned long newpc;
 		newpc = fixup_exception(dpf_reg, fixup, regs->pc);
 		regs->pc = newpc;
-- 
2.20.1.7.g153144c

