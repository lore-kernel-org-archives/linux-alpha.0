From: cgel.zte@gmail.com
Subject: [PATCH linu-next V2] mm/fault: fix comparing pointer to 0
Date: Sun, 18 Sep 2022 15:29:12 +0000
Message-ID: <20220918152912.210112-1-xu.panda@zte.com.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=TN0OyYcBSqh1c3Y1Ehd90+XmF+WxSWuLtqr+UXBMFGg=;
        b=gpJ+ylYzn/p3qA9ejBo4y2SQBnkcksJI7EoNYl/gCQloUdRnwb5waaE4n8iIcGuxK2
         behFXYB/CeSZSooC6t9zAUpFzW/ISejtvx8WOIEwNf6R6Z6n3rZxiuPRu+2hAeGxG+bq
         II9priBn25S/y8kxbS6f9XXLUVN18MHTVEBEysbb+W9+nyL1G/ud3WPuiJvCoVmIgedj
         ZCpCBRCZKHhyvpIcHvTG+GD4dLNch4qKbRYT40dSldGjo1XppBqTyxf2CZ6pdTuv+eUG
         nUrO4Gdd2DypBjQfXGbvMbQR/HRjAzTq3yrKNreZ8as/hZSaLWMhwfz4GcYFktu+gOIm
         PSCA==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: richard.henderson@linaro.org
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, akpm@linux-foundation.org, zhengqi.arch@bytedance.com, ebiederm@xmission.com, hannes@cmpxchg.org, catalin.marinas@arm.com, peterx@redhat.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Xu Panda <xu.panda@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>

From: Xu Panda <xu.panda@zte.com.cn>

Do not use assignment in if condition,
and comparing pointer whith NULL instead of comparing pointer to 0.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
---
 arch/alpha/mm/fault.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index ef427a6bdd1a..bb3fe2949313 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -194,7 +194,8 @@ do_page_fault(unsigned long address, unsigned long
mmcsr,

  no_context:
        /* Are we prepared to handle this fault as an exception?  */
-       if ((fixup = search_exception_tables(regs->pc)) != 0) {
+       fixup = search_exception_tables(regs->pc);
+       if (fixup != NULL) {
                unsigned long newpc;
                newpc = fixup_exception(dpf_reg, fixup, regs->pc);
                regs->pc = newpc;
-- 
2.15.2

