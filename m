Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7801F3B635F
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 03:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791429868; cv=none; b=lOlsp7yspNdSWiYT8+lz+RF5UsXe34pX3ftB47u+iuot94k9/RSuwi4Vgjmkn2zsw+2nZWagVCagjmjkGlyMaxsK0OTb1WySUVEIsc0PvV8PJA3O29gL08CnqpZOyhMosDQeLzutBmZ/gR04Iv0yOu0VVdSJlsTB9TBrdIy5WXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791429868; c=relaxed/simple;
	bh=2Hy865asx9beZFJbj94kOJRO4va5CyxOEtlp2kyHVXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=be2OTIwkZxoNzD6JrPRQsAAOEZIhwiwb04uNKW+GtQaupJipvCR3pK47rtrYU7SVnwTPOp0v7OMVK8CuBdLml5Ehisq9csLTKgDf0AMCuu5j8OrrikrSeIX1eJahdc5fIPVi1LdEq/ls4hgvRxxUIrXIK6U5rERyFyg6wXC+3eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPmFsok7; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPmFsok7"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8871ada1a26so39028817b3.1
        for <linux-alpha@vger.kernel.org>; Wed, 07 Oct 2026 20:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791429864; x=1792034664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSL2iHt2cmCojVXgq7a4a43FI/CSOoA0l8uAKgOuZck=;
        b=CPmFsok7QwWGZoyQXHYHQguAlWwzVXxHuOPkxuiBJ7Y+D3ahE/UKrMQxRoMiRbGtyH
         aZaRy81o7xq/bTxRCNuCro8CsmgzEpd8kVj3hg/goB22V6ET7KSaJrfPgHouJIHYmRoy
         1Vq8cq+WJqMMFtwnumqHmZ7w40dHqk/0MZpfzORXW6r+e8pIJOooEQM/+fWlxsD8AgCH
         j+aqMV9P0bcAbBSPrkaTDi8T+3fprjPyZbj1RGXRCAhr9QqgqZBr2hNwV9CsEqWhK/TP
         dl+dGIX4r0htpzQdCL9+pfJ6MaOA7rglT1XRKmII+VhS/skRGS7kPRfC41QVYWJlh3ub
         z3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791429864; x=1792034664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSL2iHt2cmCojVXgq7a4a43FI/CSOoA0l8uAKgOuZck=;
        b=nmWhFbmYOfaDyQTObLAJ82W5r2fMiDAO8ulhcdozbnPrCxKgYRviGKxoeZ+cgWMP+u
         whKLzjzQr3jWO1oFNZkQWywb6xwTyO4yW7RLBgpYBoaSPWX0YsN3tlyuW4JNkxQb1Ee7
         TqMgvcxXbzFbXurOrIlZrVwiTEBxr0O2nTk7ndLiCMVUKgYPnyTNVHfhZ3Otwz8nEOud
         wTkuO/b70XZxacetxXB0b0ju/Z61ny69r/gAuun+ji/BN87KgkyyrA3eGLIZgaEKisoK
         ACZllOonAi9g3FvqiFgrVlDl5PubvWScS3TIo+5ZEgQDhNLvnUBD3VKvh6GGXE1u84Pj
         bJmg==
X-Gm-Message-State: AFq9FYJs66CetbitjoBrgpcfrw+EmwtqnmqPBeyrRGgc5nQGhOCxkVnR
	Vp+vIrkVUbjxBTiUtx3wlQtT5CwkSnThLbYscPH0S9SDLQ28kyFRFVOH
X-Gm-Gg: AYBFou2XnjZ/BdoTquQptH86Qo4P3tjQ69uAX52AeO4vkgB+oboDCbN6KX46y/1AewU
	OB1TsTmnIF7QIdxig0xemoNEMPMaXEW2b3NkjQjINQA/2youwkNhIBJDYGsKLg9XdNVl3pCd4yC
	w4kmvt0AJn3TI7dckcvjWMmUgSmAK2Q6HO6Rb4u6inLUihU7OmaOdHvDdtdldvMW3Spuy/vZo2r
	RjKIhcMuWZCx20Phv866UoX4U1YZ3Me7EXKlN2F5lmbtAStFnCuox4ZiZ8Z9XF6cyHLApfpybyb
	sM6T26YZxGhAbAXUfDXAMJi3On+qLOtUhAJw2zC+tGzuLXuf4eMD3pS0S7YOamtkJAUf1Cp2PAW
	l2ak99pjFkdSvJa1RDzaR01fB9Qw2zUPe70PvzHpAClJjl1gsfIquNAwqQG8RFQXptnTx6xL25+
	UYBbJp+4KoV1qsiflky7A5bOXyhauzBMwunjEIVZVxypysaVUN50D797q9O54dGoUfBSJ+xHmfF
	FQxkgksO9w=
X-Received: by 2002:a05:690c:6e87:b0:8a8:6fac:217d with SMTP id 00721157ae682-8b05b1abde8mr27866607b3.95.1791429864404;
        Wed, 07 Oct 2026 20:24:24 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05abb19a9sm15417767b3.29.2026.10.07.20.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:24:23 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 07 Oct 2026 23:24:09 -0400
Subject: [PATCH v2 6/6] alpha: implement hugetlb support
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-alpha-hugepages-v2-6-8e108af2d961@gmail.com>
References: <20261007-alpha-hugepages-v2-0-8e108af2d961@gmail.com>
In-Reply-To: <20261007-alpha-hugepages-v2-0-8e108af2d961@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, 
 Axel Rasmussen <axelrasmussen@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=14027; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=2Hy865asx9beZFJbj94kOJRO4va5CyxOEtlp2kyHVXU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKO81xRZv/9+cj0uycvT35Y9XndsqPPlH4IKSteOreis
 vGacFvTzY6PLAxiXAwzxRRZ4tYrssxq27HU57T0L5g5rEwgQ6RFGhiAgIWBLzcxr9RIx0jPVNtQ
 zxDI0DGKh8jpMWhkFheXphbpphUUOeTllySWZObnFevlF6TmFaQX6KVlppVkZOQXFacCjdDLSy0
 xdXV0MzI0MLF0tDBzsnA0NXF2djJ0cnN0dHZ1MrI0NzFwtnQ0cbU0Z+DiFIC55p0sw3+nLAaFC0
 G5nhIyMnflA0KNr8gq/P9e++qqxcRqNTPjTSmMDM/kb/1zPCCcE81/XT1ndSKf2dHdS549P8b3a
 RnnKt1ZgpwA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha has no leaf entry above the last page table level, so the only
huge pages it can offer are granularity hint blocks: 64KB, 512KB and 4MB
with 8KB pages. Register all three as hstates, with 4MB as the default.
There is no PMD sized huge page, hence no transparent huge pages, no PMD
page table sharing and no gigantic pages.

As with arm64's contiguous PTEs, each PTE of a block keeps the frame
number of its own page, so a block is written with set_ptes(). Each
hstate's buddy order is its hint order, so a hugetlb folio is always
naturally aligned physically, as the hint requires, including after a
demote.

All PTEs of a block must agree in bits <15:0> (note 2 of Table 22-3 of
the Alpha Architecture Reference Manual), and both __ACCESS_BITS and
__DIRTY_BITS reach into that range, so every update rewrites the whole
block and huge_ptep_get() merges the young and dirty state back
together. Rewriting a valid block in place would leave its PTEs
disagreeing part way through, so changes to a valid block go through
break before make, following the procedure in section 11.6.1.

The hint is advisory, so this is safe on implementations that ignore it,
and gup_fast needs no changes since it walks the individual PTEs.

Enabling CONFIG_HUGETLB_PAGE derives pageblock_order from
HUGETLB_PAGE_ORDER, which lowers it from 10 to 9 and so halves the
anti-fragmentation and compaction granularity from 8MB to 4MB.

Hugepage migration is left disabled, since it has not been tested.

Co-developed-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig               |   1 +
 arch/alpha/include/asm/hugetlb.h |  43 ++++++
 arch/alpha/include/asm/page.h    |  13 ++
 arch/alpha/mm/Makefile           |   2 +
 arch/alpha/mm/hugetlbpage.c      | 308 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 367 insertions(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index b5b02bb42aca..b2c359b947f6 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -19,6 +19,7 @@ config ALPHA
 	select ARCH_NO_PREEMPT
 	select ARCH_NO_SG_CHAIN
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
 	select ARCH_USE_CMPXCHG_LOCKREF
diff --git a/arch/alpha/include/asm/hugetlb.h b/arch/alpha/include/asm/hugetlb.h
new file mode 100644
index 000000000000..ff69e24c775d
--- /dev/null
+++ b/arch/alpha/include/asm/hugetlb.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ALPHA_HUGETLB_H
+#define _ALPHA_HUGETLB_H
+
+#include <asm/page.h>
+
+pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
+#define arch_make_huge_pte arch_make_huge_pte
+
+#define __HAVE_ARCH_HUGE_PTEP_GET
+extern pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr,
+			   pte_t *ptep);
+#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
+extern void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+			    pte_t *ptep, pte_t pte, unsigned long sz);
+#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
+extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
+				     pte_t *ptep, unsigned long sz);
+#define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
+extern pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+				   unsigned long addr, pte_t *ptep);
+#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
+extern void huge_ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
+				    pte_t *ptep);
+#define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
+extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
+				      unsigned long addr, pte_t *ptep,
+				      pte_t pte, int dirty);
+#define __HAVE_ARCH_HUGE_PTE_CLEAR
+extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
+			   pte_t *ptep, unsigned long sz);
+
+/*
+ * The generic version does not flush, which would leave the old translation
+ * live across a restrictive change to PTE bits <15:0>.
+ */
+#define huge_ptep_modify_prot_start huge_ptep_modify_prot_start
+extern pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma,
+					 unsigned long addr, pte_t *ptep);
+
+#include <asm-generic/hugetlb.h>
+
+#endif /* _ALPHA_HUGETLB_H */
diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.h
index 59d01f9b77f6..67053c52953f 100644
--- a/arch/alpha/include/asm/page.h
+++ b/arch/alpha/include/asm/page.h
@@ -6,6 +6,19 @@
 #include <asm/pal.h>
 #include <vdso/page.h>
 
+#ifdef CONFIG_HUGETLB_PAGE
+/*
+ * The default huge page is the largest granularity hint block, 4MB. All
+ * three hint sizes are registered as hstates, hence HUGE_MAX_HSTATE, which
+ * linux/hugetlb.h needs before it includes asm/hugetlb.h.
+ */
+#define HPAGE_SHIFT		22
+#define HPAGE_SIZE		(_AC(1, UL) << HPAGE_SHIFT)
+#define HPAGE_MASK		(~(HPAGE_SIZE - 1))
+#define HUGETLB_PAGE_ORDER	(HPAGE_SHIFT - PAGE_SHIFT)
+#define HUGE_MAX_HSTATE		3
+#endif
+
 #ifndef __ASSEMBLER__
 
 #define STRICT_MM_TYPECHECKS
diff --git a/arch/alpha/mm/Makefile b/arch/alpha/mm/Makefile
index 2d05664058f6..c022e55f231a 100644
--- a/arch/alpha/mm/Makefile
+++ b/arch/alpha/mm/Makefile
@@ -4,3 +4,5 @@
 #
 
 obj-y	:= init.o fault.o tlbflush.o
+
+obj-$(CONFIG_HUGETLB_PAGE) += hugetlbpage.o
diff --git a/arch/alpha/mm/hugetlbpage.c b/arch/alpha/mm/hugetlbpage.c
new file mode 100644
index 000000000000..ca36af4667dc
--- /dev/null
+++ b/arch/alpha/mm/hugetlbpage.c
@@ -0,0 +1,308 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Alpha huge page support, built on the page table entry granularity hint
+ * described in asm/pgtable.h. All PTEs of a block have to agree in bits
+ * <15:0>, so every update below rewrites the whole block.
+ */
+
+#include <linux/hugetlb.h>
+#include <linux/mm.h>
+#include <linux/pgtable.h>
+
+#include <asm/tlbflush.h>
+
+/*
+ * Every hint size is smaller than PMD_SIZE, so a block always fits inside a
+ * single last level page table and its entry count is just its page count.
+ */
+static inline unsigned long num_contig_ptes(unsigned long sz)
+{
+	return sz >> PAGE_SHIFT;
+}
+
+/* Hint order that maps @sz, or 0 if @sz is not a hint size. */
+static unsigned int gh_order_from_size(unsigned long sz)
+{
+	unsigned int order;
+
+	for_each_gh_order(order)
+		if (gh_cont_size(order) == sz)
+			return order;
+
+	return 0;
+}
+
+pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
+		      unsigned long addr, unsigned long sz)
+{
+	unsigned int order = gh_order_from_size(sz);
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+
+	if (!order)
+		return NULL;
+
+	pgd = pgd_offset(mm, addr);
+	p4d = p4d_alloc(mm, pgd, addr);
+	if (!p4d)
+		return NULL;
+
+	pud = pud_alloc(mm, p4d, addr);
+	if (!pud)
+		return NULL;
+
+	pmd = pmd_alloc(mm, pud, addr);
+	if (!pmd)
+		return NULL;
+
+	return pte_alloc_huge(mm, pmd, addr & gh_cont_mask(order));
+}
+
+pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr,
+		       unsigned long sz)
+{
+	unsigned int order = gh_order_from_size(sz);
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+
+	if (!order)
+		return NULL;
+
+	pgd = pgd_offset(mm, addr);
+	if (!pgd_present(pgdp_get(pgd)))
+		return NULL;
+
+	p4d = p4d_offset(pgd, addr);
+	if (!p4d_present(p4dp_get(p4d)))
+		return NULL;
+
+	pud = pud_offset(p4d, addr);
+	if (!pud_present(pudp_get(pud)))
+		return NULL;
+
+	pmd = pmd_offset(pud, addr);
+	if (!pmd_present(pmdp_get(pmd)))
+		return NULL;
+
+	return pte_offset_huge(pmd, addr & gh_cont_mask(order));
+}
+
+/*
+ * A block is only as large as its own hint, so the walk can skip to the end of
+ * the containing last level page table but no further.
+ */
+unsigned long hugetlb_mask_last_page(struct hstate *h)
+{
+	return PMD_SIZE - huge_page_size(h);
+}
+
+pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
+{
+	pte_t orig_pte = ptep_get(ptep);
+	unsigned long i, ncontig;
+
+	/* Swap, migration and marker entries carry no hint. */
+	if (!pte_huge(orig_pte))
+		return orig_pte;
+
+	ncontig = gh_pte_num(pte_gh_order(orig_pte));
+
+	for (i = 0; i < ncontig; i++, ptep++) {
+		pte_t pte = ptep_get(ptep);
+
+		if (pte_dirty(pte))
+			orig_pte = pte_mkdirty(orig_pte);
+		if (pte_young(pte))
+			orig_pte = pte_mkyoung(orig_pte);
+	}
+
+	return orig_pte;
+}
+
+static pte_t get_clear_contig(struct mm_struct *mm, unsigned long addr,
+			      pte_t *ptep, unsigned long ncontig)
+{
+	pte_t pte = ptep_get_and_clear(mm, addr, ptep);
+	bool present = pte_present(pte);
+
+	while (--ncontig) {
+		pte_t tmp_pte;
+
+		ptep++;
+		addr += PAGE_SIZE;
+		tmp_pte = ptep_get_and_clear(mm, addr, ptep);
+		if (present) {
+			if (pte_dirty(tmp_pte))
+				pte = pte_mkdirty(pte);
+			if (pte_young(tmp_pte))
+				pte = pte_mkyoung(pte);
+		}
+	}
+
+	return pte;
+}
+
+static pte_t get_clear_contig_flush(struct mm_struct *mm, unsigned long addr,
+				    pte_t *ptep, unsigned long ncontig)
+{
+	pte_t orig_pte = get_clear_contig(mm, addr, ptep, ncontig);
+	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
+
+	if (!pte_none(orig_pte))
+		flush_tlb_range(&vma, addr, addr + ncontig * PAGE_SIZE);
+
+	return orig_pte;
+}
+
+pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
+{
+	unsigned int order = gh_order_from_size(1UL << shift);
+
+	/*
+	 * Not every caller asks for a size Alpha can hint; mm/debug_vm_pgtable.c
+	 * probes with PMD_SHIFT. Leave the entry alone rather than complaining.
+	 */
+	if (order)
+		entry = pte_mkgh(entry, order);
+
+	return entry;
+}
+
+void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+		     pte_t pte, unsigned long sz)
+{
+	unsigned long i, ncontig = num_contig_ptes(sz);
+
+	/* The hint requires the block to be naturally aligned in the VA too. */
+	VM_WARN_ON_ONCE(addr & (sz - 1));
+
+	if (!pte_present(pte)) {
+		/*
+		 * Swap, migration and marker entries hold no frame number, so
+		 * every slot gets the same value.
+		 */
+		for (i = 0; i < ncontig; i++, ptep++, addr += PAGE_SIZE)
+			set_ptes(mm, addr, ptep, pte, 1);
+		return;
+	}
+
+	/*
+	 * All PTEs of a block must agree in bits <15:0> (ARM Table 22-3, note
+	 * 2), which rewriting a valid block in place would violate part way
+	 * through. Invalidate it everywhere first, following ARM 11.6.1: the
+	 * invalidate has to assume the hint is zero, so it must cover every
+	 * page of the block.
+	 */
+	if (pte_present(ptep_get(ptep)))
+		get_clear_contig_flush(mm, addr, ptep, ncontig);
+
+	/* set_ptes() advances the frame number for each entry. */
+	set_ptes(mm, addr, ptep, pte, ncontig);
+}
+
+pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
+			      pte_t *ptep, unsigned long sz)
+{
+	return get_clear_contig(mm, addr, ptep, num_contig_ptes(sz));
+}
+
+/*
+ * The block size comes from the hstate rather than from the entry, because
+ * this is also reached for non-present entries, which carry no hint.
+ */
+pte_t huge_ptep_clear_flush(struct vm_area_struct *vma, unsigned long addr,
+			    pte_t *ptep)
+{
+	unsigned long sz = huge_page_size(hstate_vma(vma));
+
+	return get_clear_contig_flush(vma->vm_mm, addr, ptep,
+				      num_contig_ptes(sz));
+}
+
+pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr,
+				  pte_t *ptep)
+{
+	return huge_ptep_clear_flush(vma, addr, ptep);
+}
+
+/* True if any entry of the block differs from @pte outside the frame number. */
+static bool gh_access_flags_changed(pte_t *ptep, pte_t pte,
+				    unsigned long ncontig)
+{
+	unsigned long i;
+
+	for (i = 0; i < ncontig; i++)
+		if ((pte_val(ptep_get(ptep + i)) ^ pte_val(pte)) & ~_PFN_MASK)
+			return true;
+
+	return false;
+}
+
+int huge_ptep_set_access_flags(struct vm_area_struct *vma, unsigned long addr,
+			       pte_t *ptep, pte_t pte, int dirty)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long sz = huge_page_size(hstate_vma(vma));
+	unsigned long ncontig = num_contig_ptes(sz);
+	pte_t orig_pte = huge_ptep_get(mm, addr, ptep);
+
+	/* Keep the young and dirty state the block already has. */
+	if (pte_dirty(orig_pte))
+		pte = pte_mkdirty(pte);
+	if (pte_young(orig_pte))
+		pte = pte_mkyoung(pte);
+
+	/* Breaking an unchanged block only makes concurrent touchers refault. */
+	if (!gh_access_flags_changed(ptep, pte, ncontig))
+		return 0;
+
+	get_clear_contig_flush(mm, addr, ptep, ncontig);
+	set_ptes(mm, addr, ptep, pte, ncontig);
+
+	return 1;
+}
+
+void huge_ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
+			     pte_t *ptep)
+{
+	pte_t pte = ptep_get(ptep);
+	unsigned long ncontig = gh_pte_num(pte_gh_order(pte));
+
+	VM_WARN_ON_ONCE(!pte_huge(pte));
+
+	/*
+	 * pte_wrprotect() sets _PAGE_FOW, which lives in the bits the whole
+	 * block must agree on, so this takes the break before make path.
+	 */
+	pte = pte_wrprotect(get_clear_contig_flush(mm, addr, ptep, ncontig));
+	set_ptes(mm, addr, ptep, pte, ncontig);
+}
+
+void huge_pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+		    unsigned long sz)
+{
+	unsigned long i, ncontig = num_contig_ptes(sz);
+
+	for (i = 0; i < ncontig; i++, addr += PAGE_SIZE, ptep++)
+		pte_clear(mm, addr, ptep);
+}
+
+bool __init arch_hugetlb_valid_size(unsigned long size)
+{
+	return gh_order_from_size(size) != 0;
+}
+
+static __init int alpha_hugetlbpage_init(void)
+{
+	unsigned int order;
+
+	for_each_gh_order(order)
+		hugetlb_add_hstate(gh_cont_shift(order) - PAGE_SHIFT);
+
+	return 0;
+}
+arch_initcall(alpha_hugetlbpage_init);

-- 
2.55.0

