Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9836A47276E
	for <linux-alpha@vger.kernel.org>; Tue,  6 Oct 2026 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295476; cv=none; b=m1T8McDWYbEs6u8iQPoYR2xp3LKokvL8/WheNK8AgijoJL8XoKGOV+Wawbnda1ZuoKT4QXcT0gja/tqc5+0WSeabw0GPpKRROTvZ/o5UzJRQSr1KKiEYdbN5h0pfPJ4BpNKXVk66fIbR1A5IKsrm8cHD1coISo9qXlnK5sLH6ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295476; c=relaxed/simple;
	bh=4+4f5QIzYvFfjpzHXyH3IlcuWFdZtQ/yS7AiM587anM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SdbgEhCA56bVn0rRfW3DpyDfZk+PkySqKYVnVGUiqPyw504wuxr3WPHE1uMkWTctQOyKE81gFH9rmopeo+sUErkh+nD/+ru8JB+qrTa/mElLhzDtAs1PNLy43g1oLumjcBdokMVSX1WrMDt7ATZtBBkoHRgfXvKlx5r8HWCm2xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAzy/TlB; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAzy/TlB"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66c7e3a2332so2072090d50.2
        for <linux-alpha@vger.kernel.org>; Tue, 06 Oct 2026 07:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295472; x=1791900272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2zTA7mUqd3jrapNLg0b6G9fN4LnmcdaczlEFwBM9/0=;
        b=VAzy/TlBZGS3HU0QcQH+C8EHCYVqfoSHof0zjOZHf2V4yZIniuBVEtKeuKiJi5Uoru
         Z89dWSy2Trm4uD3Wfs+yeBS/rep/O1y46RpRzwtG4yP18PK1XRhrixz2xo+GYpioAs/X
         OXoN3MpMssQdYZ6VI48xqiiqVrHkcipySxPnn3QC9LmRhJvInGRzRyUmBqFnOI6kAuKk
         Ypmp+42BMd3Ham3soYTTiK06UNyZLsNMr0VmACxyHg6ui8C0X/qeLg81Yjhw+JVGc9WL
         /c1Z8FX7aNaBqFqdZ/aLG9L+pYrrYZxlaIbqiSZ7DSWFIqYmSkPNGXDJnvDWauWf28sv
         xKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295472; x=1791900272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2zTA7mUqd3jrapNLg0b6G9fN4LnmcdaczlEFwBM9/0=;
        b=LUTMPUCcRYRoKKzEI1zKKTMqFS8jfm9QMC599hXBvHJVfTX/y+gY801nqnX5JHBMBm
         69vUcIXGtlub4aAcULbFsPn1pZU65ABvFlk6L19LbqMUsTjisJGzobzVZ+KRa8H+t4tk
         Hl/K+ayEqe4LcoxaT/52aeSp7dzOVysdZXVhaj1bgsDUrLFRTXDPO1ncRb+Sproa3AjD
         yTx0B5Jh0eqLA1kavAtr1o5pbUOhG/SNKWuTckwtYQwfFelr+ydpjFKASTPbh4REgOy+
         0lUkul6yvdwFBeYY5r1mE0/1uKEtJw6GGJsLUldqM4sMU8gzBTIW3VDGl37YQ6Z+O/RA
         Q8zA==
X-Gm-Message-State: AFq9FYIUx69l2/K9mFhvS6fVf+4s7UQXYiwBRTWkq7nwrR5JOTif38x/
	eHSy8shqUjqXK2fogx3oD0b+0RDQdTXggrC5bixmtPUQM5MSqnMgsixs1wregA==
X-Gm-Gg: AYBFou1g6iJ1tRx4ypdLCUdBqv383VDVqIFJJ5WIh16ovVZHPpRk/6hlPm1OK4E5/Kr
	2i4xlbpmjp9KrxJOIJX6ahwpfh7rJAm1xQy6PsErSAT3x7vSobYfUS5gb9+1KW4cVOE63O8RVeO
	DHqupdiiNqsFjn3LWAwxeXCwiEE6gFnFAkmhLBLv/PrjHDvs1P1F5eIcAglmzsyt6kFMtE3eYwg
	blZtYauZR1NkKjXp8SU2fu0nLk8btjcXrLhcUM147UoXLiIoibdSIFBw7p/2XFDg+9iOWoRyXD3
	yEljdQ0qnR2hvPELCbygS6o0R+9RuIEGRoMikrk7CaHUHfQ69GwRnijBZ8zEK1ePfyEaXmrc1LL
	P2/tbOsf/9dhzOyqHDIrcx5ZJao9it6AitDo9W9uNN0YDjtGHUioGBumCyziAiCy5hopxFKYAEM
	mkC11NnRocFhmcNPVg7dxwuzuZA8IEF39DbD4XZroM5xUCswR/wXGqFh6DL4lOBXgnIFVP9Ig=
X-Received: by 2002:a05:690c:6b12:b0:8ae:68d9:cef6 with SMTP id 00721157ae682-8b04f4600e0mr5897337b3.76.1791295472431;
        Tue, 06 Oct 2026 07:04:32 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae334e967dsm52666407b3.38.2026.10.06.07.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:04:31 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 06 Oct 2026 10:04:18 -0400
Subject: [PATCH 6/6] alpha: implement hugetlb support
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-alpha-hugepages-v1-6-a673a18aaa70@gmail.com>
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13952; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=4+4f5QIzYvFfjpzHXyH3IlcuWFdZtQ/yS7AiM587anM=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKO/L87dW2e/VXX6g//L2tvVJ3wMeqdctQZBrMUhdL+d
 6IXa5R0Oj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAO4aH4b/pYcEPPm93n
 9co9yqsEHXXvTuh6ipQq/Ycg3ram089j2wYvgrs6vYj8M6I+kQ2wdva9lzMUeOJf3Ny3948orMu
 x2Rs3S4AA==
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

All PTEs of a block must agree in bits <15:0>, and both __ACCESS_BITS
and __DIRTY_BITS reach into that range, so every update rewrites the
whole block and huge_ptep_get() merges the young and dirty state back
together. Changes to a valid block go through break before make, as
section 11.6.1 of the architecture manual requires.
huge_ptep_set_access_flags() skips the break when no entry would change:
hugetlb_fault() calls it on every fault on a present entry, and breaking
an unchanged block makes threads on other CPUs refault and break it
again.

The hint is advisory, so this is safe on implementations that ignore it,
and gup_fast needs no changes since it walks the individual PTEs.

Enabling CONFIG_HUGETLB_PAGE derives pageblock_order from
HUGETLB_PAGE_ORDER, which lowers it from 10 to 9 and so halves the
anti-fragmentation and compaction granularity from 8MB to 4MB.

Hugepage migration is left disabled, since it has not been tested.

Co-developed-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig               |   1 +
 arch/alpha/include/asm/hugetlb.h |  43 ++++++
 arch/alpha/include/asm/page.h    |  13 ++
 arch/alpha/mm/Makefile           |   2 +
 arch/alpha/mm/hugetlbpage.c      | 306 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 365 insertions(+)

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
index 000000000000..94b02de4b370
--- /dev/null
+++ b/arch/alpha/mm/hugetlbpage.c
@@ -0,0 +1,306 @@
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
+	 * ARM 11.6.1 requires an already valid entry to be invalidated
+	 * everywhere before it is rewritten, and the invalidate has to assume
+	 * the hint is zero, so it must cover every page of the block.
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
2.54.0

