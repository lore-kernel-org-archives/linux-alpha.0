Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC00B3B47F1
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 18:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791483115; cv=pass; b=F/hIIKqlhUF1O4wLLn87OfW/3H5MAjv7YhFYfJGgJGsfiNOYG/XYiYnMIX2NdC60YJzvnsXLO4NAnu3PBKyCWlRkjsxNKHWTAj4hmIB4+HFmFVz+wcy//y3TWF8Mh526nGE/GV1/UE/82ExLJDfINYCg3iO/7eOustePCcuGrXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791483115; c=relaxed/simple;
	bh=v/QmfXMnxoIWgdev+GCUEZw7H49HtDlO6GqIf0JOWNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nxfejXRD0Z41jGavJqVTwIIKqVkOxTkx9hcazz8Cp0B+62pEUZjc/Yhv/Tw6NFc8bcxwzjXk4DOvm2UwPMSepg7vadsZIg9AG3ak83BO6FL3NOwYTFDEIErykwylBkGZr9/ogQWX4Vj52dfmOfmRquLTj8IIYAyERumfb228l9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eC/hHhLZ; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eC/hHhLZ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c247f6687dcso518157466b.2
        for <linux-alpha@vger.kernel.org>; Thu, 08 Oct 2026 11:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791483112; cv=none;
        d=google.com; s=arc-20260327;
        b=p8rC9ADHTRmnzVV8rTrhS6ofJ2iokCr8sSCjyeyQA4gQHO8yU9nD7eVsVhWzaIkCex
         MiJeg6dzQguhVQJJNMJ+/G7b/HmpKH8WvC/u+inTbJc3AImkzfCebR0KUl1eHOQBR7Ml
         OlvUWmlW7GZgWQKc3559aSXr+RP1KUyVOEZ+jyJgJrE8lvXZykauNJJPohJHaWfjWt8n
         ZRs8pxFlvSbgkF43wKGAuUG5HLFo9SnXtjJbD5HovZmYeU/mtcvNqyC7UcYw7rQASUvr
         lSWJrYJfCBqwc8HCHWfLjHT+404U6k6sJ5F18Mm5jg12GYL23TMq2+MBDJR9Svk2mghc
         kSBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mJueXiMU6C3+5L1e5alLDOg0bAXaz1Z72DpQmQMXcyc=;
        fh=ufdYHMWkaEZyweMf5bxemeK2cUUfo59kcE5ZG1ET55o=;
        b=Hp+tr7VivU8ytSkK8IIRlcT0Q822jd9neZxOqTzrTy0Ey5OQlF7/7DrS1dHV9tEgWR
         yA9A2qQn7dCiaNbeQ+iWQg/yDcFAnimz4FbDe7+9hGzRHRWokRjUOVYGmQkw/bNMlpxp
         6CdlQdJ+CcPqX0ZldclVS7GGmFNF3dJhS5H1ObNBtVzH5/qa+r7mo3LKop9r7P113Vbf
         D+RAujS/GfSSsStQWh041RCdJYI/ovukhzSwgrlWvQ9V0cAinnXrNKUjlV+A7Im8TGlb
         bFCZRsYXh//1iSZSnVxNK45t709Ob9DnsSudL+OYsYRVOD5b3WjHBKzRliwI0C4zx5L+
         3GjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791483112; x=1792087912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mJueXiMU6C3+5L1e5alLDOg0bAXaz1Z72DpQmQMXcyc=;
        b=eC/hHhLZl4H0PhCWnx3yl9y966AtveN8OJJ/0nuTaWqUSBkpFBDS2VhNJUsic7luQI
         27H1mkY1xu+LlsGYLmH+074HSBOajdAt9zAgHAK4qCSWApCFHtlNmxCEx7STCTDcSuMt
         4Xj0BDabBk0BDbulU9DQUuwCNxLRZ+t/Xfql44jmEvkJW2VlqJfVA80712rpwmOV3w4G
         Bf6BbOj8w0MV3mmGQLTXrYx5TndHKE4yQ33hfKgldmbLTEYQE/XCVbfJSlO60GOK/44K
         Ut0Wm0lUQLV4ve1qO7XGP7h52FggLXUauUZ4cS0uKth1KDuxD1QS+Qlisw32uoV1GRzb
         0XYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791483112; x=1792087912;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mJueXiMU6C3+5L1e5alLDOg0bAXaz1Z72DpQmQMXcyc=;
        b=t610jfjUintUQAYbUl20WrF20CiI+XQwu28IZqtloy1nBdBNWTeFpYnm09zHGt9yEz
         eRqYWFmBLg/ciLrszGfXblUHddl4UBt1vfJzUdSJj3/gPUaEVHUOH8GeGFHtLjkb9Ka3
         8qQDUCcfCzmxAYeKQQooNkQN9HnPE88KyPS+am0cj4DKOSBJe/hdooLtm6LCxI5HDEta
         dKnbcXq2rRJvoFiw1FMN5iyEORjtfNlotLjdm1S/p7yJC3R5k4IQSfwWa+ni+vFv1Oe4
         nnDBVrjwdOhCCDnfrXUkHLtCug4jOzf1+ZLDZV+8h6rI6B6Etg7o69Tf6wNT+COGLSnJ
         GDEw==
X-Forwarded-Encrypted: i=1; AKwUvBzwoodunU61WRfZeYSubbTqm3do7IVTC6JSoy7p8nMdBR+1ebtVPk1i5LdUDxZ+8bxVDE+AsDgeSyDbqQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mLrB7FQbsv77B0Urkcjw2O1ZNKC7AywDRTPKCLXVp4DAY9q1aH
	T07PSSuNpwLNS31eQmxn44TBxk1DpWlvp1T+iuqGQf4OYwWNzvGPawxHiYCQznXN1BpbQz8v6Vi
	oL6Bvkz83/zPHwruJo5KS9euABj7uNYM=
X-Gm-Gg: AYBFou3VWzM7xL5e64Fu0KSXCKvO7gXRWH5mAjV1ExxUBzuCR+yXKF9JKEid8gBnpj3
	uEXKzBKaJMUeKu6rnSoxSxn7hZHKygEcF1a3nAi1Snlcqq3AFnGhz4DPqgXZuXGQmGOU9boa6v/
	JW91KvFJwYwG80/cxgqy1NzWNELTze39LQp4Epq4oObjc6dOO+ywJ3w8kH89/c6S8D1a2QFPQg/
	2wnPaIQSEn7XbiD9Z7XYwi3vGh42TrlG1jzV8Y5ii4bctl/qJL4P12imWyCIYkSlbC1BPscRS1y
	WER4zTzyHzTFy4Xslj3a3qmGwZfi57jUBoracjYGDpoapcILPS78IdpDALI0W7VZ1NKYXZtFYsR
	TB1MrpMZ+dd434YkGbL64ukVoOzCvJelobJZab+Chew==
X-Received: by 2002:a17:907:3f9b:b0:c26:1648:a062 with SMTP id
 a640c23a62f3a-c317be58e90mr628369066b.29.1791483111643; Thu, 08 Oct 2026
 11:11:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-alpha-hugepages-v2-0-8e108af2d961@gmail.com> <20261007-alpha-hugepages-v2-6-8e108af2d961@gmail.com>
In-Reply-To: <20261007-alpha-hugepages-v2-6-8e108af2d961@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 8 Oct 2026 20:11:39 +0200
X-Gm-Features: AclHuK-aqLSIZxF96Cz9j30E0cCpQF4i_m-jLtt7e-Ep5i5uuGymRtDv63F-xQA
Message-ID: <CA+=Fv5RgEQDkM34g_b60uPVALVHwEgShQhsq3P_gnSH28ZmGdg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] alpha: implement hugetlb support
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Thu, Oct 8, 2026 at 5:24=E2=80=AFAM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Alpha has no leaf entry above the last page table level, so the only
> huge pages it can offer are granularity hint blocks: 64KB, 512KB and 4MB
> with 8KB pages. Register all three as hstates, with 4MB as the default.
> There is no PMD sized huge page, hence no transparent huge pages, no PMD
> page table sharing and no gigantic pages.
>
> As with arm64's contiguous PTEs, each PTE of a block keeps the frame
> number of its own page, so a block is written with set_ptes(). Each
> hstate's buddy order is its hint order, so a hugetlb folio is always
> naturally aligned physically, as the hint requires, including after a
> demote.
>
> All PTEs of a block must agree in bits <15:0> (note 2 of Table 22-3 of
> the Alpha Architecture Reference Manual), and both __ACCESS_BITS and
> __DIRTY_BITS reach into that range, so every update rewrites the whole
> block and huge_ptep_get() merges the young and dirty state back
> together. Rewriting a valid block in place would leave its PTEs
> disagreeing part way through, so changes to a valid block go through
> break before make, following the procedure in section 11.6.1.
>
> The hint is advisory, so this is safe on implementations that ignore it,
> and gup_fast needs no changes since it walks the individual PTEs.
>
> Enabling CONFIG_HUGETLB_PAGE derives pageblock_order from
> HUGETLB_PAGE_ORDER, which lowers it from 10 to 9 and so halves the
> anti-fragmentation and compaction granularity from 8MB to 4MB.
>
> Hugepage migration is left disabled, since it has not been tested.
>
> Co-developed-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> Tested-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig               |   1 +
>  arch/alpha/include/asm/hugetlb.h |  43 ++++++
>  arch/alpha/include/asm/page.h    |  13 ++
>  arch/alpha/mm/Makefile           |   2 +
>  arch/alpha/mm/hugetlbpage.c      | 308 +++++++++++++++++++++++++++++++++=
++++++
>  5 files changed, 367 insertions(+)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index b5b02bb42aca..b2c359b947f6 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -19,6 +19,7 @@ config ALPHA
>         select ARCH_NO_PREEMPT
>         select ARCH_NO_SG_CHAIN
>         select ARCH_SUPPORTS_ATOMIC_RMW
> +       select ARCH_SUPPORTS_HUGETLBFS
>         select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>         select ARCH_SUPPORTS_PAGE_TABLE_CHECK
>         select ARCH_USE_CMPXCHG_LOCKREF
> diff --git a/arch/alpha/include/asm/hugetlb.h b/arch/alpha/include/asm/hu=
getlb.h
> new file mode 100644
> index 000000000000..ff69e24c775d
> --- /dev/null
> +++ b/arch/alpha/include/asm/hugetlb.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ALPHA_HUGETLB_H
> +#define _ALPHA_HUGETLB_H
> +
> +#include <asm/page.h>
> +
> +pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t fla=
gs);
> +#define arch_make_huge_pte arch_make_huge_pte
> +
> +#define __HAVE_ARCH_HUGE_PTEP_GET
> +extern pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr,
> +                          pte_t *ptep);
> +#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
> +extern void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> +                           pte_t *ptep, pte_t pte, unsigned long sz);
> +#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
> +extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long=
 addr,
> +                                    pte_t *ptep, unsigned long sz);
> +#define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
> +extern pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
> +                                  unsigned long addr, pte_t *ptep);
> +#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
> +extern void huge_ptep_set_wrprotect(struct mm_struct *mm, unsigned long =
addr,
> +                                   pte_t *ptep);
> +#define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
> +extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
> +                                     unsigned long addr, pte_t *ptep,
> +                                     pte_t pte, int dirty);
> +#define __HAVE_ARCH_HUGE_PTE_CLEAR
> +extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
> +                          pte_t *ptep, unsigned long sz);
> +
> +/*
> + * The generic version does not flush, which would leave the old transla=
tion
> + * live across a restrictive change to PTE bits <15:0>.
> + */
> +#define huge_ptep_modify_prot_start huge_ptep_modify_prot_start
> +extern pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma,
> +                                        unsigned long addr, pte_t *ptep)=
;
> +
> +#include <asm-generic/hugetlb.h>
> +
> +#endif /* _ALPHA_HUGETLB_H */
> diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.=
h
> index 59d01f9b77f6..67053c52953f 100644
> --- a/arch/alpha/include/asm/page.h
> +++ b/arch/alpha/include/asm/page.h
> @@ -6,6 +6,19 @@
>  #include <asm/pal.h>
>  #include <vdso/page.h>
>
> +#ifdef CONFIG_HUGETLB_PAGE
> +/*
> + * The default huge page is the largest granularity hint block, 4MB. All
> + * three hint sizes are registered as hstates, hence HUGE_MAX_HSTATE, wh=
ich
> + * linux/hugetlb.h needs before it includes asm/hugetlb.h.
> + */
> +#define HPAGE_SHIFT            22
> +#define HPAGE_SIZE             (_AC(1, UL) << HPAGE_SHIFT)
> +#define HPAGE_MASK             (~(HPAGE_SIZE - 1))
> +#define HUGETLB_PAGE_ORDER     (HPAGE_SHIFT - PAGE_SHIFT)
> +#define HUGE_MAX_HSTATE                3
> +#endif
> +
>  #ifndef __ASSEMBLER__
>
>  #define STRICT_MM_TYPECHECKS
> diff --git a/arch/alpha/mm/Makefile b/arch/alpha/mm/Makefile
> index 2d05664058f6..c022e55f231a 100644
> --- a/arch/alpha/mm/Makefile
> +++ b/arch/alpha/mm/Makefile
> @@ -4,3 +4,5 @@
>  #
>
>  obj-y  :=3D init.o fault.o tlbflush.o
> +
> +obj-$(CONFIG_HUGETLB_PAGE) +=3D hugetlbpage.o
> diff --git a/arch/alpha/mm/hugetlbpage.c b/arch/alpha/mm/hugetlbpage.c
> new file mode 100644
> index 000000000000..ca36af4667dc
> --- /dev/null
> +++ b/arch/alpha/mm/hugetlbpage.c
> @@ -0,0 +1,308 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Alpha huge page support, built on the page table entry granularity hi=
nt
> + * described in asm/pgtable.h. All PTEs of a block have to agree in bits
> + * <15:0>, so every update below rewrites the whole block.
> + */
> +
> +#include <linux/hugetlb.h>
> +#include <linux/mm.h>
> +#include <linux/pgtable.h>
> +
> +#include <asm/tlbflush.h>
> +
> +/*
> + * Every hint size is smaller than PMD_SIZE, so a block always fits insi=
de a
> + * single last level page table and its entry count is just its page cou=
nt.
> + */
> +static inline unsigned long num_contig_ptes(unsigned long sz)
> +{
> +       return sz >> PAGE_SHIFT;
> +}
> +
> +/* Hint order that maps @sz, or 0 if @sz is not a hint size. */
> +static unsigned int gh_order_from_size(unsigned long sz)
> +{
> +       unsigned int order;
> +
> +       for_each_gh_order(order)
> +               if (gh_cont_size(order) =3D=3D sz)
> +                       return order;
> +
> +       return 0;
> +}
> +
> +pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
> +                     unsigned long addr, unsigned long sz)
> +{
> +       unsigned int order =3D gh_order_from_size(sz);
> +       pgd_t *pgd;
> +       p4d_t *p4d;
> +       pud_t *pud;
> +       pmd_t *pmd;
> +
> +       if (!order)
> +               return NULL;
> +
> +       pgd =3D pgd_offset(mm, addr);
> +       p4d =3D p4d_alloc(mm, pgd, addr);
> +       if (!p4d)
> +               return NULL;
> +
> +       pud =3D pud_alloc(mm, p4d, addr);
> +       if (!pud)
> +               return NULL;
> +
> +       pmd =3D pmd_alloc(mm, pud, addr);
> +       if (!pmd)
> +               return NULL;
> +
> +       return pte_alloc_huge(mm, pmd, addr & gh_cont_mask(order));
> +}
> +
> +pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr,
> +                      unsigned long sz)
> +{
> +       unsigned int order =3D gh_order_from_size(sz);
> +       pgd_t *pgd;
> +       p4d_t *p4d;
> +       pud_t *pud;
> +       pmd_t *pmd;
> +
> +       if (!order)
> +               return NULL;
> +
> +       pgd =3D pgd_offset(mm, addr);
> +       if (!pgd_present(pgdp_get(pgd)))
> +               return NULL;
> +
> +       p4d =3D p4d_offset(pgd, addr);
> +       if (!p4d_present(p4dp_get(p4d)))
> +               return NULL;
> +
> +       pud =3D pud_offset(p4d, addr);
> +       if (!pud_present(pudp_get(pud)))
> +               return NULL;
> +
> +       pmd =3D pmd_offset(pud, addr);
> +       if (!pmd_present(pmdp_get(pmd)))
> +               return NULL;
> +
> +       return pte_offset_huge(pmd, addr & gh_cont_mask(order));
> +}
> +
> +/*
> + * A block is only as large as its own hint, so the walk can skip to the=
 end of
> + * the containing last level page table but no further.
> + */
> +unsigned long hugetlb_mask_last_page(struct hstate *h)
> +{
> +       return PMD_SIZE - huge_page_size(h);
> +}
> +
> +pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *pte=
p)
> +{
> +       pte_t orig_pte =3D ptep_get(ptep);
> +       unsigned long i, ncontig;
> +
> +       /* Swap, migration and marker entries carry no hint. */
> +       if (!pte_huge(orig_pte))
> +               return orig_pte;
> +
> +       ncontig =3D gh_pte_num(pte_gh_order(orig_pte));
> +
> +       for (i =3D 0; i < ncontig; i++, ptep++) {
> +               pte_t pte =3D ptep_get(ptep);
> +
> +               if (pte_dirty(pte))
> +                       orig_pte =3D pte_mkdirty(orig_pte);
> +               if (pte_young(pte))
> +                       orig_pte =3D pte_mkyoung(orig_pte);
> +       }
> +
> +       return orig_pte;
> +}
> +
> +static pte_t get_clear_contig(struct mm_struct *mm, unsigned long addr,
> +                             pte_t *ptep, unsigned long ncontig)
> +{
> +       pte_t pte =3D ptep_get_and_clear(mm, addr, ptep);
> +       bool present =3D pte_present(pte);
> +
> +       while (--ncontig) {
> +               pte_t tmp_pte;
> +
> +               ptep++;
> +               addr +=3D PAGE_SIZE;
> +               tmp_pte =3D ptep_get_and_clear(mm, addr, ptep);
> +               if (present) {
> +                       if (pte_dirty(tmp_pte))
> +                               pte =3D pte_mkdirty(pte);
> +                       if (pte_young(tmp_pte))
> +                               pte =3D pte_mkyoung(pte);
> +               }
> +       }
> +
> +       return pte;
> +}
> +
> +static pte_t get_clear_contig_flush(struct mm_struct *mm, unsigned long =
addr,
> +                                   pte_t *ptep, unsigned long ncontig)
> +{
> +       pte_t orig_pte =3D get_clear_contig(mm, addr, ptep, ncontig);
> +       struct vm_area_struct vma =3D TLB_FLUSH_VMA(mm, 0);
> +
> +       if (!pte_none(orig_pte))
> +               flush_tlb_range(&vma, addr, addr + ncontig * PAGE_SIZE);
> +
> +       return orig_pte;
> +}
> +
> +pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t fla=
gs)
> +{
> +       unsigned int order =3D gh_order_from_size(1UL << shift);
> +
> +       /*
> +        * Not every caller asks for a size Alpha can hint; mm/debug_vm_p=
gtable.c
> +        * probes with PMD_SHIFT. Leave the entry alone rather than compl=
aining.
> +        */
> +       if (order)
> +               entry =3D pte_mkgh(entry, order);
> +
> +       return entry;
> +}
> +
> +void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *pt=
ep,
> +                    pte_t pte, unsigned long sz)
> +{
> +       unsigned long i, ncontig =3D num_contig_ptes(sz);
> +
> +       /* The hint requires the block to be naturally aligned in the VA =
too. */
> +       VM_WARN_ON_ONCE(addr & (sz - 1));
> +
> +       if (!pte_present(pte)) {
> +               /*
> +                * Swap, migration and marker entries hold no frame numbe=
r, so
> +                * every slot gets the same value.
> +                */
> +               for (i =3D 0; i < ncontig; i++, ptep++, addr +=3D PAGE_SI=
ZE)
> +                       set_ptes(mm, addr, ptep, pte, 1);
> +               return;
> +       }
> +
> +       /*
> +        * All PTEs of a block must agree in bits <15:0> (ARM Table 22-3,=
 note
> +        * 2), which rewriting a valid block in place would violate part =
way
> +        * through. Invalidate it everywhere first, following ARM 11.6.1:=
 the
> +        * invalidate has to assume the hint is zero, so it must cover ev=
ery
> +        * page of the block.
> +        */
> +       if (pte_present(ptep_get(ptep)))
> +               get_clear_contig_flush(mm, addr, ptep, ncontig);
> +
> +       /* set_ptes() advances the frame number for each entry. */
> +       set_ptes(mm, addr, ptep, pte, ncontig);
> +}
> +
> +pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
> +                             pte_t *ptep, unsigned long sz)
> +{
> +       return get_clear_contig(mm, addr, ptep, num_contig_ptes(sz));
> +}
> +
> +/*
> + * The block size comes from the hstate rather than from the entry, beca=
use
> + * this is also reached for non-present entries, which carry no hint.
> + */
> +pte_t huge_ptep_clear_flush(struct vm_area_struct *vma, unsigned long ad=
dr,
> +                           pte_t *ptep)
> +{
> +       unsigned long sz =3D huge_page_size(hstate_vma(vma));
> +
> +       return get_clear_contig_flush(vma->vm_mm, addr, ptep,
> +                                     num_contig_ptes(sz));
> +}
> +
> +pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned l=
ong addr,
> +                                 pte_t *ptep)
> +{
> +       return huge_ptep_clear_flush(vma, addr, ptep);
> +}
> +
> +/* True if any entry of the block differs from @pte outside the frame nu=
mber. */
> +static bool gh_access_flags_changed(pte_t *ptep, pte_t pte,
> +                                   unsigned long ncontig)
> +{
> +       unsigned long i;
> +
> +       for (i =3D 0; i < ncontig; i++)
> +               if ((pte_val(ptep_get(ptep + i)) ^ pte_val(pte)) & ~_PFN_=
MASK)
> +                       return true;
> +
> +       return false;
> +}
> +
> +int huge_ptep_set_access_flags(struct vm_area_struct *vma, unsigned long=
 addr,
> +                              pte_t *ptep, pte_t pte, int dirty)
> +{
> +       struct mm_struct *mm =3D vma->vm_mm;
> +       unsigned long sz =3D huge_page_size(hstate_vma(vma));
> +       unsigned long ncontig =3D num_contig_ptes(sz);
> +       pte_t orig_pte =3D huge_ptep_get(mm, addr, ptep);
> +
> +       /* Keep the young and dirty state the block already has. */
> +       if (pte_dirty(orig_pte))
> +               pte =3D pte_mkdirty(pte);
> +       if (pte_young(orig_pte))
> +               pte =3D pte_mkyoung(pte);
> +
> +       /* Breaking an unchanged block only makes concurrent touchers ref=
ault. */
> +       if (!gh_access_flags_changed(ptep, pte, ncontig))
> +               return 0;
> +
> +       get_clear_contig_flush(mm, addr, ptep, ncontig);
> +       set_ptes(mm, addr, ptep, pte, ncontig);
> +
> +       return 1;
> +}
> +
> +void huge_ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
> +                            pte_t *ptep)
> +{
> +       pte_t pte =3D ptep_get(ptep);
> +       unsigned long ncontig =3D gh_pte_num(pte_gh_order(pte));
> +
> +       VM_WARN_ON_ONCE(!pte_huge(pte));
> +
> +       /*
> +        * pte_wrprotect() sets _PAGE_FOW, which lives in the bits the wh=
ole
> +        * block must agree on, so this takes the break before make path.
> +        */
> +       pte =3D pte_wrprotect(get_clear_contig_flush(mm, addr, ptep, ncon=
tig));
> +       set_ptes(mm, addr, ptep, pte, ncontig);
> +}
> +
> +void huge_pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *pte=
p,
> +                   unsigned long sz)
> +{
> +       unsigned long i, ncontig =3D num_contig_ptes(sz);
> +
> +       for (i =3D 0; i < ncontig; i++, addr +=3D PAGE_SIZE, ptep++)
> +               pte_clear(mm, addr, ptep);
> +}
> +
> +bool __init arch_hugetlb_valid_size(unsigned long size)
> +{
> +       return gh_order_from_size(size) !=3D 0;
> +}
> +
> +static __init int alpha_hugetlbpage_init(void)
> +{
> +       unsigned int order;
> +
> +       for_each_gh_order(order)
> +               hugetlb_add_hstate(gh_cont_shift(order) - PAGE_SHIFT);
> +
> +       return 0;
> +}
> +arch_initcall(alpha_hugetlbpage_init);
>
> --
> 2.55.0
>

Looks good, thanks!

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
