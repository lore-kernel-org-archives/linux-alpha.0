From: Ryan Roberts <ryan.roberts@arm.com>
Subject: [PATCH v1 06/10] mm: Allow deferred splitting of arbitrary large anon folios
Date: Mon, 26 Jun 2023 18:14:26 +0100
Message-ID: <20230626171430.3167004-7-ryan.roberts@arm.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20230626171430.3167004-1-ryan.roberts@arm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Yu Zhao <yuzhao@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org

With the introduction of large folios for anonymous memory, we would
like to be able to split them when they have unmapped subpages, in order
to free those unused pages under memory pressure. So remove the
artificial requirement that the large folio needed to be at least
PMD-sized.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 mm/rmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index ac1d93d43f2b..3d11c5fb6090 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1567,7 +1567,7 @@ void page_remove_rmap(struct page *page, struct vm_area_struct *vma,
 		 * page of the folio is unmapped and at least one page
 		 * is still mapped.
 		 */
-		if (folio_test_pmd_mappable(folio) && folio_test_anon(folio))
+		if (folio_test_large(folio) && folio_test_anon(folio))
 			if (!compound || nr < nr_pmdmapped)
 				deferred_split_folio(folio);
 	}
-- 
2.25.1

