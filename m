From: Ryan Roberts <ryan.roberts@arm.com>
Subject: [PATCH v1 01/10] mm: Expose clear_huge_page() unconditionally
Date: Mon, 26 Jun 2023 18:14:21 +0100
Message-ID: <20230626171430.3167004-2-ryan.roberts@arm.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20230626171430.3167004-1-ryan.roberts@arm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Yu Zhao <yuzhao@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org

In preparation for extending vma_alloc_zeroed_movable_folio() to
allocate a arbitrary order folio, expose clear_huge_page()
unconditionally, so that it can be used to zero the allocated folio in
the generic implementation of vma_alloc_zeroed_movable_folio().

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/linux/mm.h | 3 ++-
 mm/memory.c        | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7f1741bd870a..7e3bf45e6491 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3684,10 +3684,11 @@ enum mf_action_page_type {
  */
 extern const struct attribute_group memory_failure_attr_group;
 
-#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBFS)
 extern void clear_huge_page(struct page *page,
 			    unsigned long addr_hint,
 			    unsigned int pages_per_huge_page);
+
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBFS)
 int copy_user_large_folio(struct folio *dst, struct folio *src,
 			  unsigned long addr_hint,
 			  struct vm_area_struct *vma);
diff --git a/mm/memory.c b/mm/memory.c
index fb30f7523550..3d4ea668c4d1 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5741,7 +5741,6 @@ void __might_fault(const char *file, int line)
 EXPORT_SYMBOL(__might_fault);
 #endif
 
-#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBFS)
 /*
  * Process all subpages of the specified huge page with the specified
  * operation.  The target subpage will be processed last to keep its
@@ -5839,6 +5838,7 @@ void clear_huge_page(struct page *page,
 	process_huge_page(addr_hint, pages_per_huge_page, clear_subpage, page);
 }
 
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBFS)
 static int copy_user_gigantic_page(struct folio *dst, struct folio *src,
 				     unsigned long addr,
 				     struct vm_area_struct *vma,
-- 
2.25.1

