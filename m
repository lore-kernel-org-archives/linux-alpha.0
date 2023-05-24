From: Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH 1/6] alpha: remove extern inline from mmu_context
Date: Thu, 25 May 2023 03:18:17 +1000
Message-ID: <20230524171822.177133-2-npiggin@gmail.com>
References: <20230524171822.177133-1-npiggin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684948719; x=1687540719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErBiScfzJ/3xiKxznskKuvERy9jtasoKBcxxPGITvYY=;
        b=AT7CwRECFJ9o82eR3kZBX1xYlgc1fWJHelTyG7NQGCb9ZwbpFDGClHFOcIz5IbYHY1
         xIDSDfwFzd3PEFuuzKKcMeAjp4fzNXQh65oybC1v1pdKmP/Kdk+XKWpSU8w3lfAER8Eb
         v9GjAlclsK0PA5XxUjG4lmI5R/juD6W2CRbTfHgus6MDT+MQGmLFGrDMPAtZwuDZoRrs
         BYTVGm4YN8HIxarEAuCsj1HgoG0qn3wsvClNnvrYsBqw49PpaMPpvf9WtulpHnReij6n
         DV5N9SvfZDSHSSRlP+r+0GPLBgdyCTR4WvuvT4KG70/embNFTYWF6eeor2Qc5CzfBXWh
         dK7Q==
In-Reply-To: <20230524171822.177133-1-npiggin@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>

This caused a pain when working on alpha, and extern inlines aren't
really used these days (outside alpha), so remove them from mmu_context.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/alpha/include/asm/mmu_context.h | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/asm/mmu_context.h
index 4eea7c616992..8ce89350e4b3 100644
--- a/arch/alpha/include/asm/mmu_context.h
+++ b/arch/alpha/include/asm/mmu_context.h
@@ -20,11 +20,7 @@
  * table pointer or when we update the ASN of the current process.
  */
 
-/* Don't get into trouble with dueling __EXTERN_INLINEs.  */
-#ifndef __EXTERN_INLINE
 #include <asm/io.h>
-#endif
-
 
 static inline unsigned long
 __reload_thread(struct pcb_struct *pcb)
@@ -112,12 +108,7 @@ extern unsigned long last_asn;
  * run.
  */
 
-#ifndef __EXTERN_INLINE
-#define __EXTERN_INLINE extern inline
-#define __MMU_EXTERN_INLINE
-#endif
-
-extern inline unsigned long
+static inline unsigned long
 __get_new_mm_context(struct mm_struct *mm, long cpu)
 {
 	unsigned long asn = cpu_last_asn(cpu);
@@ -132,7 +123,7 @@ __get_new_mm_context(struct mm_struct *mm, long cpu)
 	return next;
 }
 
-__EXTERN_INLINE void
+static inline void
 ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	      struct task_struct *next)
 {
@@ -162,7 +153,7 @@ ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	task_thread_info(next)->pcb.asn = mmc & HARDWARE_ASN_MASK;
 }
 
-__EXTERN_INLINE void
+static inline void
 ev4_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	      struct task_struct *next)
 {
@@ -201,13 +192,13 @@ do {								\
 #define check_mmu_context()  do { } while(0)
 #endif
 
-__EXTERN_INLINE void
+static inline void
 ev5_activate_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm)
 {
 	__load_new_mm_context(next_mm);
 }
 
-__EXTERN_INLINE void
+static inline void
 ev4_activate_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm)
 {
 	__load_new_mm_context(next_mm);
@@ -251,9 +242,4 @@ enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
 
 #include <asm-generic/mmu_context.h>
 
-#ifdef __MMU_EXTERN_INLINE
-#undef __EXTERN_INLINE
-#undef __MMU_EXTERN_INLINE
-#endif
-
 #endif /* __ALPHA_MMU_CONTEXT_H */
-- 
2.40.1

