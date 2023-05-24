From: Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH 3/6] alpha: remove TLB flushing mm_users special case
Date: Thu, 25 May 2023 03:18:19 +1000
Message-ID: <20230524171822.177133-4-npiggin@gmail.com>
References: <20230524171822.177133-1-npiggin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684948726; x=1687540726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZpZnDLITfYtgsC1nucuMFymh0j+j6fu5jMJb91bNrI=;
        b=H1ZWKZZ/DXD9Ect+aQf5aeUp4j+KEPDTUfNnlT3jNPh2p8JtO5GH+f81fD3uzI+sDn
         HMrbn1KGuv/LU0nxnmiPRWzTPz1ho0Qsaas0NmpeQMGMDM0trEcTxErswnuFBVMlY3f0
         3ig7VQ/Wl3gVmC7EhBVKffW1+6j0/JP7tGDj+E+y1lkXhKNPeaKQrDcp7YZGmI+adzWa
         S3eZaS/Kloh8rGBnSH9qwAQvLsfQ95TMGLLrZQejrb9StqRyCI+NhYpWcJ0Xty0tdBEp
         +blbBi4PkyceTuNL/9XRydT/ywFhROnOL102q3XPPf0MQUqPLKVb/ApKmmiFvdyW2vk0
         FpDA==
In-Reply-To: <20230524171822.177133-1-npiggin@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>

With mm_cpumask, there is less reason to keep the mm_users special case
in the TLB flushing code, because IPIs will be filtered out by the mask.

These special cases are another complicated set of races e.g., vs
kthread_use_mm that make this code tricky to reason about.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/alpha/kernel/smp.c | 68 +++++++++--------------------------------
 1 file changed, 15 insertions(+), 53 deletions(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index b702372fbaba..e436c056267d 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -639,23 +639,6 @@ ipi_flush_tlb_mm(void *x)
 void
 flush_tlb_mm(struct mm_struct *mm)
 {
-	preempt_disable();
-
-	if (mm == current->active_mm) {
-		flush_tlb_current(mm);
-		if (atomic_read(&mm->mm_users) <= 1) {
-			int cpu, this_cpu = smp_processor_id();
-			for (cpu = 0; cpu < NR_CPUS; cpu++) {
-				if (!cpu_online(cpu) || cpu == this_cpu)
-					continue;
-				if (mm->context[cpu])
-					mm->context[cpu] = 0;
-			}
-			preempt_enable();
-			return;
-		}
-	}
-
 	/*
 	 * TLB flush IPIs will be sent to all CPUs with mm_cpumask set. The
 	 * problem of ordering the load of mm_cpumask vs a CPU switching to
@@ -666,8 +649,12 @@ flush_tlb_mm(struct mm_struct *mm)
 	 * The other side is switch_mm.
 	 */
 	smp_mb();
+	preempt_disable();
+	if (mm == current->active_mm)
+		flush_tlb_current(mm);
+	else
+		flush_tlb_other(mm);
 	smp_call_function_many(mm_cpumask(mm), ipi_flush_tlb_mm, mm, 1);
-
 	preempt_enable();
 }
 EXPORT_SYMBOL(flush_tlb_mm);
@@ -696,30 +683,17 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 	struct flush_tlb_page_struct data;
 	struct mm_struct *mm = vma->vm_mm;
 
-	preempt_disable();
-
-	if (mm == current->active_mm) {
-		flush_tlb_current_page(mm, vma, addr);
-		if (atomic_read(&mm->mm_users) <= 1) {
-			int cpu, this_cpu = smp_processor_id();
-			for (cpu = 0; cpu < NR_CPUS; cpu++) {
-				if (!cpu_online(cpu) || cpu == this_cpu)
-					continue;
-				if (mm->context[cpu])
-					mm->context[cpu] = 0;
-			}
-			preempt_enable();
-			return;
-		}
-	}
-
 	data.vma = vma;
 	data.mm = mm;
 	data.addr = addr;
 
 	smp_mb(); /* see flush_tlb_mm */
+	preempt_disable();
+	if (mm == current->active_mm)
+		flush_tlb_current_page(mm, vma, addr);
+	else
+		flush_tlb_other(mm);
 	smp_call_function_many(mm_cpumask(mm), ipi_flush_tlb_page, &data, 1);
-
 	preempt_enable();
 }
 EXPORT_SYMBOL(flush_tlb_page);
@@ -751,24 +725,12 @@ flush_icache_user_page(struct vm_area_struct *vma, struct page *page,
 	if ((vma->vm_flags & VM_EXEC) == 0)
 		return;
 
+	smp_mb(); /* see flush_tlb_mm */
 	preempt_disable();
-
-	if (mm == current->active_mm) {
+	if (mm == current->active_mm)
 		__load_new_mm_context(mm);
-		if (atomic_read(&mm->mm_users) <= 1) {
-			int cpu, this_cpu = smp_processor_id();
-			for (cpu = 0; cpu < NR_CPUS; cpu++) {
-				if (!cpu_online(cpu) || cpu == this_cpu)
-					continue;
-				if (mm->context[cpu])
-					mm->context[cpu] = 0;
-			}
-			preempt_enable();
-			return;
-		}
-	}
-
-	smp_call_function(ipi_flush_icache_page, mm, 1);
-
+	else
+		flush_tlb_other(mm);
+	smp_call_function_many(mm_cpumask(mm), ipi_flush_icache_page, mm, 1);
 	preempt_enable();
 }
-- 
2.40.1

