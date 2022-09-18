From: cgel.zte@gmail.com
Subject: [PATCH linu-next] mm/fault: fix comparing pointer to 0
Date: Sun, 18 Sep 2022 15:15:51 +0000
Message-ID: <20220918151550.210045-1-xu.panda@zte.com.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=b9sg2pbCYEJ+t1KhaLMA+JttLAxFc5yjDpZw1fgFqzE=;
        b=EvYhoKK3t753H/8E/SxENQV02D0UULdMP1dS9mhHd0WeNbPQVQq5DMcVHLfcv2O6Bq
         myxzOTNrCw2ARxCfN+RfDw2NzlZNWxj1o3GW5LzyorbAbjwYEK82qjznZn4YhG7BmTWh
         3Tj2ebQ/7inewPDqyi85aOV/8burub/raMGV7jzmf8fz8+d3bHvb4dgKKjpSKZlVlsBu
         AmEAVuTJnaFp7/cowv2xWG+s5FbJLQCXXSkNhUXcXp6pcsn37QwJgbWYeOPGkN+ikiQA
         Fc0eF1OpRyynRfewhUBtmjvW9ZUwZkWKCFZp27GZPtBv10MihptF9z5Jl8uKCa/z8840
         BELg==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: richard.henderson@linaro.org
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, akpm@linux-foundation.org, zhengqi.arch@bytedance.com, ebiederm@xmission.com, hannes@cmpxchg.org, catalin.marinas@arm.com, peterx@redhat.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Xu Panda <xu.panda@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>

From: Xu Panda <xu.panda@zte.com.cn>

Do not use assignment in if condition,
and using "!P" instead of comparing pointer to 0.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
---
 arch/alpha/mm/fault.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index ef427a6bdd1a..09d0d069059b 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -194,7 +194,8 @@ do_page_fault(unsigned long address, unsigned long mmcsr,

  no_context:
        /* Are we prepared to handle this fault as an exception?  */
-       if ((fixup = search_exception_tables(regs->pc)) != 0) {
+       fixup = search_exception_tables(regs->pc);
+       if (!fixup) {
                unsigned long newpc;
                newpc = fixup_exception(dpf_reg, fixup, regs->pc);
                regs->pc = newpc;
-- 
2.15.2

