From: Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH 5/6] alpha: enable MMU_LAZY_TLB_SHOOTDOWN
Date: Thu, 25 May 2023 03:18:21 +1000
Message-ID: <20230524171822.177133-6-npiggin@gmail.com>
References: <20230524171822.177133-1-npiggin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684948734; x=1687540734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjn6EdAl09CUVOfjtVI6BOYTWM3WknCj5waV1jTxDBs=;
        b=FEle1APVRzL697qNwmsE1rCHmb1YKkQEoVCxUN0/9vtN6/Tb/lUTJ873/S2zMh164U
         v2kgmVJZ8GBqkSN+BklYabiOgTM+okVz1WAqPcmEmWrUEpSXFvUI2dOBnexmUrfWeHPE
         i9uFGU/Lk87J2RxlPd+0asFb4McwiNkfTbNxNcmBUitj/eiDZpztgdG2Bdu+NrQVkWxm
         9EhiYL23rIxR4r/SQa4DyHyk48QoGcjCsGD8lo4wqPVaq77RrOhsfzCj3K1/5o6xFVkE
         Lt4WdGOfM0QeuBAh7nL/tx9f2/Ir2DZ1jTMjheXz8xfxu+y4pMImseR2VQt3ZrYXX2n+
         MPqw==
In-Reply-To: <20230524171822.177133-1-npiggin@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>

With the sticky mm_cpumask, and conversion to mmgrab_lazy_tlb(), alpha
meets the requirements for MMU_LAZY_TLB_SHOOTDOWN. Select it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/alpha/Kconfig      | 1 +
 arch/alpha/kernel/smp.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index a5c2b1aa46b0..8f9995d66345 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -35,6 +35,7 @@ config ALPHA
 	select OLD_SIGSUSPEND
 	select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
 	select MMU_GATHER_NO_RANGE
+	select MMU_LAZY_TLB_SHOOTDOWN
 	select SPARSEMEM_EXTREME if SPARSEMEM
 	select ZONE_DMA
 	help
diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index d668b9d319af..73bbb81f336e 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -143,7 +143,7 @@ smp_callin(void)
 		alpha_mv.smp_callin();
 
 	/* All kernel threads share the same mm context.  */
-	mmgrab(&init_mm);
+	mmgrab_lazy_tlb(&init_mm);
 	current->active_mm = &init_mm;
 	cpumask_set_cpu(smp_processor_id(), mm_cpumask(&init_mm));
 
-- 
2.40.1

