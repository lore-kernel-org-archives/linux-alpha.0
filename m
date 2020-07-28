From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 02/24] alpha: use asm-generic/mmu_context.h for no-op implementations
Date: Tue, 28 Jul 2020 13:33:43 +1000
Message-ID: <20200728033405.78469-3-npiggin@gmail.com>
References: <20200728033405.78469-1-npiggin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i6IDKVv/shVEq6irgZZFcLvF1FRkf6GgTDbDcMbNEAs=;
        b=mUj0kRjoi+GkfsEEulsR8I1ODkKxm2yMW1q4DFRYoT2WuM/K1HJF18QaoGvF51V/BY
         vM83LGIhB6ZjJqLPPHT9uFlSBP3KReVY8HB79V4M8Wu/vF+xgORhq7DMZEQQ++NH0ZAV
         mFK4Xn6j0PeyM+RyBFjURcrBjsahRZ/ZJI3c3pzHIdF5ztbBCzR8pUV3rViN1Dm9oFQ1
         RZGL/vy0pzgwTBdTrrp2WpxcIcp2doMnFvbFH+fq2Yofew4xjI0Bk+jVA47kOwv5RZ2q
         eng4HHv3cWyaJuK54Ux9nmmi9vtCNW+EBWiEzxhDxn7JpTKe7JiIdHXfBIS4yOBwJGA7
         bmTA==
In-Reply-To: <20200728033405.78469-1-npiggin@gmail.com>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-arch@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/alpha/include/asm/mmu_context.h | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/asm/mmu_context.h
index 6d7d9bc1b4b8..4eea7c616992 100644
--- a/arch/alpha/include/asm/mmu_context.h
+++ b/arch/alpha/include/asm/mmu_context.h
@@ -214,8 +214,6 @@ ev4_activate_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm)
 	tbiap();
 }
 
-#define deactivate_mm(tsk,mm)	do { } while (0)
-
 #ifdef CONFIG_ALPHA_GENERIC
 # define switch_mm(a,b,c)	alpha_mv.mv_switch_mm((a),(b),(c))
 # define activate_mm(x,y)	alpha_mv.mv_activate_mm((x),(y))
@@ -229,6 +227,7 @@ ev4_activate_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm)
 # endif
 #endif
 
+#define init_new_context init_new_context
 static inline int
 init_new_context(struct task_struct *tsk, struct mm_struct *mm)
 {
@@ -242,12 +241,7 @@ init_new_context(struct task_struct *tsk, struct mm_struct *mm)
 	return 0;
 }
 
-extern inline void
-destroy_context(struct mm_struct *mm)
-{
-	/* Nothing to do.  */
-}
-
+#define enter_lazy_tlb enter_lazy_tlb
 static inline void
 enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
 {
@@ -255,6 +249,8 @@ enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
 	  = ((unsigned long)mm->pgd - IDENT_ADDR) >> PAGE_SHIFT;
 }
 
+#include <asm-generic/mmu_context.h>
+
 #ifdef __MMU_EXTERN_INLINE
 #undef __EXTERN_INLINE
 #undef __MMU_EXTERN_INLINE
-- 
2.23.0

