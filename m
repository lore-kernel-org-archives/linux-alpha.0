From: Ryan Roberts <ryan.roberts@arm.com>
Subject: [PATCH v1 04/10] mm: Implement folio_add_new_anon_rmap_range()
Date: Mon, 26 Jun 2023 18:14:24 +0100
Message-ID: <20230626171430.3167004-5-ryan.roberts@arm.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20230626171430.3167004-1-ryan.roberts@arm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Yu Zhao <yuzhao@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org

Like folio_add_new_anon_rmap() but batch-rmaps a range of pages
belonging to a folio, for effciency savings. All pages are accounted as
small pages.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/linux/rmap.h |  2 ++
 mm/rmap.c            | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index a3825ce81102..15433a3d0cbf 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -196,6 +196,8 @@ void page_add_new_anon_rmap(struct page *, struct vm_area_struct *,
 		unsigned long address);
 void folio_add_new_anon_rmap(struct folio *, struct vm_area_struct *,
 		unsigned long address);
+void folio_add_new_anon_rmap_range(struct folio *folio, struct page *page,
+		int nr, struct vm_area_struct *vma, unsigned long address);
 void page_add_file_rmap(struct page *, struct vm_area_struct *,
 		bool compound);
 void folio_add_file_rmap_range(struct folio *, struct page *, unsigned int nr,
diff --git a/mm/rmap.c b/mm/rmap.c
index 1d8369549424..4050bcea7ae7 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1305,6 +1305,49 @@ void folio_add_new_anon_rmap(struct folio *folio, struct vm_area_struct *vma,
 	__page_set_anon_rmap(folio, &folio->page, vma, address, 1);
 }
 
+/**
+ * folio_add_new_anon_rmap_range - Add mapping to a set of pages within a new
+ * anonymous potentially large folio.
+ * @folio:      The folio containing the pages to be mapped
+ * @page:       First page in the folio to be mapped
+ * @nr:         Number of pages to be mapped
+ * @vma:        the vm area in which the mapping is added
+ * @address:    the user virtual address of the first page to be mapped
+ *
+ * Like folio_add_new_anon_rmap() but batch-maps a range of pages within a folio
+ * using non-THP accounting. Like folio_add_new_anon_rmap(), the inc-and-test is
+ * bypassed and the folio does not have to be locked. All pages in the folio are
+ * individually accounted.
+ *
+ * As the folio is new, it's assumed to be mapped exclusively by a single
+ * process.
+ */
+void folio_add_new_anon_rmap_range(struct folio *folio, struct page *page,
+		int nr, struct vm_area_struct *vma, unsigned long address)
+{
+	int i;
+
+	VM_BUG_ON_VMA(address < vma->vm_start ||
+		      address + (nr << PAGE_SHIFT) > vma->vm_end, vma);
+	__folio_set_swapbacked(folio);
+
+	if (folio_test_large(folio)) {
+		/* increment count (starts at 0) */
+		atomic_set(&folio->_nr_pages_mapped, nr);
+	}
+
+	for (i = 0; i < nr; i++) {
+		/* increment count (starts at -1) */
+		atomic_set(&page->_mapcount, 0);
+		__page_set_anon_rmap(folio, page, vma, address, 1);
+		page++;
+		address += PAGE_SIZE;
+	}
+
+	__lruvec_stat_mod_folio(folio, NR_ANON_MAPPED, nr);
+
+}
+
 /**
  * folio_add_file_rmap_range - add pte mapping to page range of a folio
  * @folio:	The folio to add the mapping to
-- 
2.25.1

