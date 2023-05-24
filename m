From: Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH 6/6] alpha: shoot the lazy tlb mm when flushing TLBs
Date: Thu, 25 May 2023 03:18:22 +1000
Message-ID: <20230524171822.177133-7-npiggin@gmail.com>
References: <20230524171822.177133-1-npiggin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684948738; x=1687540738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4zFZrNoBN7VmAO1selbkqGP4to7smKZ8JOAFepzbeA=;
        b=ZDueHHRfLWIs9BABd7MhLFNcW2S0IRxmKCRr8dfgqxSaTEGbJw2zJ9rpzyIqlJpzTc
         IVcCJyZXUjl/cuLXido/nVL8BBc+qEnrN+pKlYuEvKcWQFGQCFiJ4tMOBclDISXfIoO8
         l8aXBFZ4YSrFBR+bSsqR42b/I54L7XZ15ftS6laMcX/SkrWTmb82IISpplDBxbh1bVyZ
         kj2/UxwvmzC3oddV6k68tGZ2h/FApgd9D6ggI0FjZ//yojq1X4WLKKTeVaYNTe+3ZqhS
         Esy/9HOj3OI1UepnxZNRfglJbcS9kiu5wlzawBna1DIZLhe0jv3murYgw+qyffGwECGS
         1x5g==
In-Reply-To: <20230524171822.177133-1-npiggin@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>

Since we're flushing the TLB, take the opportunity to switch away from
a lazy tlb mm if it's active, allowing the CPU to be taken out of
mm_cpumask and avoiding any further IPIs from TLB flushing or the final
lazy tlb mm shootdown.

This naturally combines lazy tlb mm shootdowns with the final exit TLB
flush IPIs, reducing the need for additional IPIs for the lazy tlb mm
shootdown.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/alpha/kernel/smp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 73bbb81f336e..cccd5ef721b7 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -624,9 +624,18 @@ try_clear_mm_cpumask(struct mm_struct *mm)
 {
 	int cpu;
 
-	if (current->active_mm == mm || asn_locked())
+	if (current->mm == mm || asn_locked())
 		return;
 
+	/*
+	 * Shoot the lazy tlb mm while we're here. This allows us to also
+	 * trim it out of the mm_cpumask if it was the active_mm, and has the
+	 * effect of avoiding final lazy shootdown IPIs in cleanup_lazy_tlbs(),
+	 * because the final TLB cleanup happens before that.
+	 */
+	if (current->active_mm == mm)
+		kthread_end_lazy_tlb_mm();
+
 	cpu = smp_processor_id();
 	if (cpumask_test_cpu(cpu, mm_cpumask(mm)))
 		cpumask_clear_cpu(cpu, mm_cpumask(mm));
-- 
2.40.1

