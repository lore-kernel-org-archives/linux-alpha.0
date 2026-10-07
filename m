Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916B244D01F
	for <linux-alpha@vger.kernel.org>; Wed,  7 Oct 2026 22:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791411808; cv=pass; b=ijxZIb0oZNY1g9QXs09p8KEnl0sF1gGFYjAndtEBlRgCBPIGOZgQlwQ+BnMNTK8n4NrZv0j2sj74tH7F5FFXzjPWe9HfnRsRY2A0qYVCY6yKYHvlIj7WGgbIE/bXV4YzUstRJ6MbUXDoR7z3cjrJ7OL7qjhoiqxFzBeatGfvl5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791411808; c=relaxed/simple;
	bh=r/scJDi45bklCSq9TBEb4q2VtzZiGQt4iCmWvyVtvns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rBUcnJ2zHcUgTx/10mugE+1QFG5OAdK+AMkYgwBJ7OR6AjLipS7gBfceMQC0Wg5OiNMcrAsuWocezdyOMy7wu1fDAMxSegsOWKITXlRBsJJuNc9mEd3Q0Zz1/210dJt7OGJpeO8GH+eRYw/aS1cJmStdt4CF9C9vfo5AaBqP+Lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjH0YSOT; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjH0YSOT"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso7328396a12.3
        for <linux-alpha@vger.kernel.org>; Wed, 07 Oct 2026 15:23:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791411801; cv=none;
        d=google.com; s=arc-20260327;
        b=Ld/BMN1yEDl9VqbXga5Sntq7GFICRdy48hqvulNiHDgG1yLOsgkloMWKjMPKojKhHC
         cZTHWhK8Kh0aKffO+pUI/RWmOHltZkoErx2iHUwuAzjIMnONn4NvJVclkiiFOMsukBlm
         +2y1DbrY0z6jH/1o58IW0hSxT6Hn6a8xN3fsqGfjh8GF2o97Gkvz9VEymGdrezg2fghF
         I5SPoHSlj4vkVNJP/7wm341SdmQR3o8BWDIHhgUy4zzSzf1Sb4pHu7UO9+454EBtBTWo
         srEEq1LX5+nJ642eRGtxAoHz2CilsuKFe6FG8gUgySeVEBMaSmN1t1BdYlLjWgn1+P/T
         pb2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5aRE08CbX0yzAOgxe3Lj0nCfmywYioqb7WZQDcZ+WLY=;
        fh=yLj9zZODNXin/tar100WweHvczUnk9cqubaZUmfghb4=;
        b=gUCr9G3OknKSkicidIhWOU0eYemMVZ09JokcBFePAwzUpMWFcldJ/U5lfstg2y20K0
         v6qjIXw1JeXMnWj7WVlpc+PmiqYrtNZOpZ/4RcQvbxVmhZP2RN8Z19rYjkYmsuoeeAA8
         rJDWFahCWXIebzrVZ8NzBEHeDXvkRDb/F3xTwT460LFD/o1nxslCsTO6WQoKLDCGlWHR
         P6+Ba2y2HtOk4rti39Lf3frWt8fVe92cThN/n0ukaf/YdN43j1MD1/bqf8+krlb/HQJR
         ikXFZLfR+IK3KfdGFvq5CpHCHf12K0amr/9fCF4Gu6Kk7eplG2P8nnk+w5aGqPiWamay
         rCNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791411801; x=1792016601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5aRE08CbX0yzAOgxe3Lj0nCfmywYioqb7WZQDcZ+WLY=;
        b=UjH0YSOTo3SD4vZGI7NS1wSSbo9rD7nkldzIewURuvtFOCZYMf90FxWN2NZBXeryvp
         9l13qDj5GJ2nyGDVrnhdMTewfS/EFDLwgW9LMnWmcOtGxjUkUtiCVq9IfcCm8QLhq3dg
         JgFK4V62laEE+masRP3KrqNDc/wYRZYaVSCC0EMsrZ0XjR8807nPYn9qS4Bsx56MRMv4
         wIWhLMw/SSWYKanf778Y7pM/FjG5Sm/mlk0vOHqXKpeyHrDyXpBYlnPvYKkYARs1UJ4w
         oisC3uR4cbNvhQxoXpKlbnm17dGA8usfuBRODYzwVQon9Uh2u2bLzAZvQAYtcI1wORR5
         h4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791411801; x=1792016601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5aRE08CbX0yzAOgxe3Lj0nCfmywYioqb7WZQDcZ+WLY=;
        b=d1js1OhaFWLm944lO51THnp0DP8fjRMxdGpR8tfx1+J6AOowysOaU8ZPfT70hU+jL2
         WYNbWeCUmFDlrRLJ7HewEEUdLhOd1n3miPkQjkzdpJ+MWjTDk4/BBlRGRzRgUpryU8A7
         62tBa4UCWDgQ0aCr8tUYK+8I87UKr4BH68aRa9capknqd4XLxBR5M04ni8rjTwLbpBzp
         Y0RkFdImoV9zweb/RffCAE48E0qVKOWKojOv6Ma0tMCGbUEMcaxfnq9YwKI7J0JzhIf7
         yxpAOG6HQ0LmwTQQDtNilgVn0mC+3R+/ER7E2nqRr9FZ37IHXJNgwtShW74mKB8ew221
         nisw==
X-Forwarded-Encrypted: i=1; AKwUvBw0yc27sM1fq3w3EaYVBmJfAPzwpMrcVuky/15EyvpSwvYLCiToLieSftSspOnq1dacuBfY15J9v8647Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKkPfOuqhDjdGr2Y9wYfVrOIB3LlBOliUCHBkAwerjiLWYyGT50
	K31dCRqyLdhVvjHhLjLusqb9k5oN3a6rtCpKFukNEpqy8YM7DyQ9pFctb5Q2gk4wEJ++ifGv2OS
	IK8oshqL9SAca/TGHOpX5Wv7ZMtP2ozU00O9+KCk=
X-Gm-Gg: AYBFou2WUF5H/1YXmMiTuX/qAVE8VBhcGkLZYx4yWvHeHw3sTVv4NafJQq60KJ/RHEn
	9NvUfxEKfTlZa2dADxsNup/qPAZ+uB1UbRIHxMDS1/LzO67PfXnVii+yjWv1UNDZiFgdNR/fBR3
	r3lPlkM+QNZmKt28Rqik1Ik6lWLsMabKCL7ivq1ZaYDlagGd1U68qbagU3YC1bWJx1d04gryojH
	OhOSuPWTgwV37ItEyvEkkldJYkUuaVUGy4HiswJ/fSgrs1cnDiy38UyOTYSZUC2NXgqJOivawds
	YbXGP7MYLfg/36ggl0zSKizL58BgaNVXJXS4odrljVpLUGvxu4YJAaeJfijVjlaXeOoNLCdWiWF
	3JkBmjYso6IvH8/6+36xnzHx3PoSKDF+wZsvAN7vmWg==
X-Received: by 2002:a05:6402:254d:b0:6ac:8730:71e with SMTP id
 4fb4d7f45d1cf-6aff45a77ccmr3491985a12.29.1791411801222; Wed, 07 Oct 2026
 15:23:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com> <20261006-alpha-hugepages-v1-6-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-6-a673a18aaa70@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 8 Oct 2026 00:23:09 +0200
X-Gm-Features: AclHuK_iL9wbXmrjid5JxUEBtaokBbm5_UQSO6pDz8320KhjF23UG3KKQNRNcYw
Message-ID: <CA+=Fv5TY-Bchkza4D_RnKb5J-eSDYd2g3xAMS-ggSgXHsJq9QA@mail.gmail.com>
Subject: Re: [PATCH 6/6] alpha: implement hugetlb support
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Oct 6, 2026 at 4:04=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
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
> All PTEs of a block must agree in bits <15:0>, and both __ACCESS_BITS
> and __DIRTY_BITS reach into that range, so every update rewrites the
> whole block and huge_ptep_get() merges the young and dirty state back
> together. Changes to a valid block go through break before make, as
> section 11.6.1 of the architecture manual requires.

ARM 11.6.1 (4th ed.) is in the OpenVMS part; the Alpha Linux part only
asks for a TB invalidate after the change (ARM 22.4.1, 22.7). What
makes break before make necessary here is note 2 of ARM Table 22-3 (all
PTEs of a block agree in bits <15:0>), so I'd cite that as the reason,
and 11.6.1 as the procedure followed, both here and in the comment in
set_huge_pte_at(), which also says 11.6.1 "requires" it.

> huge_ptep_set_access_flags() skips the break when no entry would change:
> hugetlb_fault() calls it on every fault on a present entry, and breaking
> an unchanged block makes threads on other CPUs refault and break it
> again.
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
> Signed-off-by: Matt Turner <mattst88@gmail.com>

checkpatch warns about the ordering of tags ("Co-developed-by and
Signed-off-by: name/email do not match"). Should it be (see
Documentation/process/submitting-patches.rst):

Co-developed-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>

If the other comments lead to a v2, could you fix it there? Otherwise
I can fix it up when applying.


> ---
>  arch/alpha/Kconfig               |   1 +
>  arch/alpha/include/asm/hugetlb.h |  43 ++++++
>  arch/alpha/include/asm/page.h    |  13 ++
>  arch/alpha/mm/Makefile           |   2 +
>  arch/alpha/mm/hugetlbpage.c      | 306 +++++++++++++++++++++++++++++++++=
++++++
>  5 files changed, 365 insertions(+)
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
> index 000000000000..94b02de4b370
> --- /dev/null
> +++ b/arch/alpha/mm/hugetlbpage.c
> @@ -0,0 +1,306 @@
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
> +        * ARM 11.6.1 requires an already valid entry to be invalidated
> +        * everywhere before it is rewritten, and the invalidate has to a=
ssume
> +        * the hint is zero, so it must cover every page of the block.
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
> 2.54.0
>

Tested-by: Magnus Lindholm <linmag7@gmail.com>
