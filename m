From: Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH 4/6] alpha: clean mm_cpumask when flushing TLBs
Date: Thu, 25 May 2023 03:18:20 +1000
Message-ID: <20230524171822.177133-5-npiggin@gmail.com>
References: <20230524171822.177133-1-npiggin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684948730; x=1687540730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/fgyjon/AwniOTHg0dz2YdYyh8X90uD3//N5gexQS8=;
        b=YqpyVFlp/d4Lx0SsnRQaqESTcuqAxtY+z/G3hBNpzdk9qAI2rrOTjXfwVNHLGPXSvW
         3D0Lg85VlDAGr5Vnz+eQJVtRS95S3puj09RSyQOiQ8vVLLIAW4pXT8Ia4shdQxpL3gPX
         RWkt8ncOZfb+qZ9bNAmW2ylYiuhjfd9j7MI7w+CQJQRw3+kr/KFzMudlUmpUBjmsz7po
         CjxXSPag109m5qiOvHPiKgjJCPQZpni8RSbg9YWnUEo11o9vAyVYgbF6BuG4wV1sPupN
         wMNsWKEYQTvcds+DKgNl2indi8YjTy20ygnH2ojIzTgxOimL45fZKpdQ1+MdNPXJj0nU
         k8nA==
In-Reply-To: <20230524171822.177133-1-npiggin@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>

mm_cpumask is a map of the CPUs which must be IPIed to flush TLBs,
and/or IPIed to shootdown lazy TLB mms at exit time.

When flushing TLBs on the CPU, trim it from mm_cpumask if the mm is not
currently active on the CPU. TLBs will have been flush, and the mm is
not active, so there is no more reason to get IPIs.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/alpha/include/asm/tlbflush.h |  3 +++
 arch/alpha/kernel/smp.c           | 29 +++++++++++++++++++++++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/tlbflush.h b/arch/alpha/include/asm/tlbflush.h
index 94dc37cf873a..7c4e719ac9e7 100644
--- a/arch/alpha/include/asm/tlbflush.h
+++ b/arch/alpha/include/asm/tlbflush.h
@@ -12,6 +12,7 @@
 #endif
 
 extern void __load_new_mm_context(struct mm_struct *);
+extern void try_clear_mm_cpumask(struct mm_struct *);
 
 
 /* Use a few helper functions to hide the ugly broken ASN
@@ -106,6 +107,7 @@ static inline void flush_tlb_all(void)
 static inline void
 flush_tlb_mm(struct mm_struct *mm)
 {
+	try_clear_mm_cpumask(mm);
 	if (mm == current->active_mm)
 		flush_tlb_current(mm);
 	else
@@ -118,6 +120,7 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
 	struct mm_struct *mm = vma->vm_mm;
 
+	try_clear_mm_cpumask(mm);
 	if (mm == current->active_mm)
 		flush_tlb_current_page(mm, vma, addr);
 	else
diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index e436c056267d..d668b9d319af 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -610,6 +610,28 @@ smp_imb(void)
 }
 EXPORT_SYMBOL(smp_imb);
 
+#define asn_locked() (cpu_data[smp_processor_id()].asn_lock)
+
+/*
+ * If the mm_cpumask bit is cleared, the caller *must* flush the TLB for the
+ * mm on this CPU. It is only cleared when the mm is not active, in which
+ * case the flushing always performs flush_tlb_other that flushes everything.
+ * If that changes in callers, they will have to arrange to always do a full
+ * flush if mm_cpumask is cleared by this function.
+ */
+void
+try_clear_mm_cpumask(struct mm_struct *mm)
+{
+	int cpu;
+
+	if (current->active_mm == mm || asn_locked())
+		return;
+
+	cpu = smp_processor_id();
+	if (cpumask_test_cpu(cpu, mm_cpumask(mm)))
+		cpumask_clear_cpu(cpu, mm_cpumask(mm));
+}
+
 static void
 ipi_flush_tlb_all(void *ignored)
 {
@@ -624,12 +646,12 @@ flush_tlb_all(void)
 	on_each_cpu(ipi_flush_tlb_all, NULL, 1);
 }
 
-#define asn_locked() (cpu_data[smp_processor_id()].asn_lock)
-
 static void
 ipi_flush_tlb_mm(void *x)
 {
 	struct mm_struct *mm = x;
+
+	try_clear_mm_cpumask(mm);
 	if (mm == current->active_mm && !asn_locked())
 		flush_tlb_current(mm);
 	else
@@ -671,6 +693,7 @@ ipi_flush_tlb_page(void *x)
 	struct flush_tlb_page_struct *data = x;
 	struct mm_struct * mm = data->mm;
 
+	try_clear_mm_cpumask(mm);
 	if (mm == current->active_mm && !asn_locked())
 		flush_tlb_current_page(mm, data->vma, data->addr);
 	else
@@ -710,6 +733,8 @@ static void
 ipi_flush_icache_page(void *x)
 {
 	struct mm_struct *mm = (struct mm_struct *) x;
+
+	try_clear_mm_cpumask(mm);
 	if (mm == current->active_mm && !asn_locked())
 		__load_new_mm_context(mm);
 	else
-- 
2.40.1

