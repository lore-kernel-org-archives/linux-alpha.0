From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH v3 05/34] alpha: Implement the new page table range API
Date: Tue, 28 Feb 2023 21:37:08 +0000
Message-ID: <20230228213738.272178-6-willy@infradead.org>
References: <20230228213738.272178-1-willy@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=sxlK/dYV0ak5B9qHymTAjJFaSXLib2XJVaYWuBBEzbA=; b=jUkVd05icQZ06ujFqkhm4tlL7P
        3KsRXEKFKwCYnut2p/HhHGJkGHEBc4DSoZLw9EV+fHO+JETgxVJaBIVfaro/iPWSQppKKi06COZPd
        +9YJxdtCk7ZYzWLChXfjkBEgIkaMHE9V9zJzcF0jNsOJfQKOVMWVvAUcddP8L3MltcuwBECQossZT
        qNF+iiYu12rBvdEwuvZTfX/fZj2BqaORssvM3jcGnJlA/ZhjimkeX5x5KyIZnX0S+jZvFM84Tsr3G
        u6rH8EcgKI6WeV84/NCL1Diz44x7ciNaxkPnaUmY1jDi7vB9nR0Lq7X58u2P+JTOikuyef9xzWg9c
        neOWuItA==;
In-Reply-To: <20230228213738.272178-1-willy@infradead.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-mm@kvack.org, linux-arch@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-kernel@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

Add set_ptes(), update_mmu_cache_range() and flush_icache_pages().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
---
 arch/alpha/include/asm/cacheflush.h | 10 ++++++++++
 arch/alpha/include/asm/pgtable.h    | 18 +++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/cacheflush.h b/arch/alpha/include/asm/cacheflush.h
index 9945ff483eaf..3956460e69e2 100644
--- a/arch/alpha/include/asm/cacheflush.h
+++ b/arch/alpha/include/asm/cacheflush.h
@@ -57,6 +57,16 @@ extern void flush_icache_user_page(struct vm_area_struct *vma,
 #define flush_icache_page(vma, page) \
 	flush_icache_user_page((vma), (page), 0, 0)
 
+/*
+ * Both implementations of flush_icache_user_page flush the entire
+ * address space, so one call, no matter how many pages.
+ */
+static inline void flush_icache_pages(struct vm_area_struct *vma,
+		struct page *page, unsigned int nr)
+{
+	flush_icache_user_page(vma, page, 0, 0);
+}
+
 #include <asm-generic/cacheflush.h>
 
 #endif /* _ALPHA_CACHEFLUSH_H */
diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index ba43cb841d19..1e3354e9731b 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -26,7 +26,18 @@ struct vm_area_struct;
  * hook is made available.
  */
 #define set_pte(pteptr, pteval) ((*(pteptr)) = (pteval))
-#define set_pte_at(mm,addr,ptep,pteval) set_pte(ptep,pteval)
+static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
+		pte_t *ptep, pte_t pte, unsigned int nr)
+{
+	for (;;) {
+		set_pte(ptep, pte);
+		if (--nr == 0)
+			break;
+		ptep++;
+		pte_val(pte) += 1UL << 32;
+	}
+}
+#define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
 
 /* PMD_SHIFT determines the size of the area a second-level page table can map */
 #define PMD_SHIFT	(PAGE_SHIFT + (PAGE_SHIFT-3))
@@ -303,6 +314,11 @@ extern inline void update_mmu_cache(struct vm_area_struct * vma,
 {
 }
 
+static inline void update_mmu_cache_range(struct vm_area_struct *vma,
+		unsigned long address, pte_t *ptep, unsigned int nr)
+{
+}
+
 /*
  * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
  * are !pte_none() && !pte_present().
-- 
2.39.1

