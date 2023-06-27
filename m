From: Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH v1 01/10] mm: Expose clear_huge_page() unconditionally
Date: Tue, 27 Jun 2023 12:26:24 -0600
Message-ID: <CAOUHufaEwY=cm8mBi4HSbxYBvAr_x4_vyZZM2NYHEt-U7KaFhA@mail.gmail.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
 <20230626171430.3167004-2-ryan.roberts@arm.com> <CAOUHufacvArJh7NjL_3LT-e3s1X+bazkvbgvEU+KPKGKEoW+dw@mail.gmail.com>
 <2ff8ccf6-bf36-48b2-7dc2-e6c0d962f8b7@arm.com> <CAOUHufZoT-maN3kY5eYQmrYV48shmKAAancEvabXzfTDncDa9A@mail.gmail.com>
 <91e3364f-1d1b-f959-636b-4f60bf5a577b@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687890421; x=1690482421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3Nmjy2pgfjuqrruYrf3lVaHDsPBe2Ms9OHkO4l14Tc=;
        b=a5RlIMj6/IRppc+ipWDHPaQTI2NhmfAqOceI7FC6rDBUZ0YdWXpB5zfD+TDmPmokOg
         jJXKx4J2oRR8E3NnFmWvYg9la8baydeNVr9oJbMJyt50K9AMIZlmte0xfGlr6TV3MML5
         LrQAUxCQfhlj2l++9GUeDiQl/rQ+QmOHDqrNKf7heXFnN+EDTaAWQdahCnuSKR+hGYi8
         mEYm2joPAYfJ/fx11Sys9/N3cPzfAaHa0lhslrsT7SZV8q4oWy5oGXQwkxGDn3xrr6JJ
         AKbfCrZGMBQjGn035U+41RxpE/ToIdBPphfBiTFtcaLZRR63Up3cgl2i04ScxAi1WsUV
         6uQg==
In-Reply-To: <91e3364f-1d1b-f959-636b-4f60bf5a577b@arm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On Tue, Jun 27, 2023 at 3:41=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
>
> On 27/06/2023 09:29, Yu Zhao wrote:
> > On Tue, Jun 27, 2023 at 1:21=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.=
com> wrote:
> >>
> >> On 27/06/2023 02:55, Yu Zhao wrote:
> >>> On Mon, Jun 26, 2023 at 11:14=E2=80=AFAM Ryan Roberts <ryan.roberts@a=
rm.com> wrote:
> >>>>
> >>>> In preparation for extending vma_alloc_zeroed_movable_folio() to
> >>>> allocate a arbitrary order folio, expose clear_huge_page()
> >>>> unconditionally, so that it can be used to zero the allocated folio =
in
> >>>> the generic implementation of vma_alloc_zeroed_movable_folio().
> >>>>
> >>>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> >>>> ---
> >>>>  include/linux/mm.h | 3 ++-
> >>>>  mm/memory.c        | 2 +-
> >>>>  2 files changed, 3 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
> >>>> index 7f1741bd870a..7e3bf45e6491 100644
> >>>> --- a/include/linux/mm.h
> >>>> +++ b/include/linux/mm.h
> >>>> @@ -3684,10 +3684,11 @@ enum mf_action_page_type {
> >>>>   */
> >>>>  extern const struct attribute_group memory_failure_attr_group;
> >>>>
> >>>> -#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBF=
S)
> >>>>  extern void clear_huge_page(struct page *page,
> >>>>                             unsigned long addr_hint,
> >>>>                             unsigned int pages_per_huge_page);
> >>>> +
> >>>> +#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBF=
S)
> >>>
> >>> We might not want to depend on THP eventually. Right now, we still
> >>> have to, unless splitting is optional, which seems to contradict
> >>> 06/10. (deferred_split_folio()  is a nop without THP.)
> >>
> >> Yes, I agree - for large anon folios to work, we depend on THP. But I =
don't
> >> think that helps us here.
> >>
> >> In the next patch, I give vma_alloc_zeroed_movable_folio() an extra `o=
rder`
> >> parameter. So the generic/default version of the function now needs a =
way to
> >> clear a compound page.
> >>
> >> I guess I could do something like:
> >>
> >>  static inline
> >>  struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *v=
ma,
> >>                                    unsigned long vaddr, gfp_t gfp, int=
 order)
> >>  {
> >>         struct folio *folio;
> >>
> >>         folio =3D vma_alloc_folio(GFP_HIGHUSER_MOVABLE | gfp,
> >>                                         order, vma, vaddr, false);
> >>         if (folio) {
> >> #ifdef CONFIG_LARGE_FOLIO
> >>                 clear_huge_page(&folio->page, vaddr, 1U << order);
> >> #else
> >>                 BUG_ON(order !=3D 0);
> >>                 clear_user_highpage(&folio->page, vaddr);
> >> #endif
> >>         }
> >>
> >>         return folio;
> >>  }
> >>
> >> But that's pretty messy and there's no reason why other users might co=
me along
> >> that pass order !=3D 0 and will be surprised by the BUG_ON.
> >
> > #ifdef CONFIG_LARGE_ANON_FOLIO // depends on CONFIG_TRANSPARENT_HUGE_PA=
GE
> > struct folio *alloc_anon_folio(struct vm_area_struct *vma, unsigned
> > long vaddr, int order)
> > {
> >   // how do_huge_pmd_anonymous_page() allocs and clears
> >   vma_alloc_folio(..., *true*);
>
> This controls the mem allocation policy (see mempolicy.c::vma_alloc_folio=
()) not
> clearing. Clearing is done in __do_huge_pmd_anonymous_page():
>
>   clear_huge_page(page, vmf->address, HPAGE_PMD_NR);

Sorry for rushing this previously. This is what I meant. The #ifdef
makes it safe to use clear_huge_page() without 01/10. I highlighted
the last parameter to vma_alloc_folio() only because it's different
from what you chose (not implying it clears the folio).

> > }
> > #else
> > #define alloc_anon_folio(vma, addr, order)
> > vma_alloc_zeroed_movable_folio(vma, addr)
> > #endif
>
> Sorry I don't get this at all... If you are suggesting to bypass
> vma_alloc_zeroed_movable_folio() entirely for the LARGE_ANON_FOLIO case

Correct.

> I don't
> think that works because the arch code adds its own gfp flags there. For
> example, arm64 adds __GFP_ZEROTAGS for VM_MTE VMAs.

I think it's the opposite: it should be safer to reuse the THP code because
1. It's an existing case that has been working for PMD_ORDER folios
mapped by PTEs, and it's an arch-independent API which would be easier
to review.
2. Use vma_alloc_zeroed_movable_folio() for large folios is a *new*
case. It's an arch-*dependent* API which I have no idea what VM_MTE
does (should do) to large folios and don't plan to answer that for
now.

> Perhaps we can do away with an arch-owned vma_alloc_zeroed_movable_folio(=
) and
> replace it with a new arch_get_zeroed_movable_gfp_flags() then
> alloc_anon_folio() add in those flags?
>
> But I still think the cleanest, simplest change is just to unconditionall=
y
> expose clear_huge_page() as I've done it.

The fundamental choice there as I see it is to whether the first step
of large anon folios should lean toward the THP code base or the base
page code base (I'm a big fan of the answer "Neither -- we should
create something entirely new instead"). My POV is that the THP code
base would allow us to move faster, since it's proven to work for a
very similar case (PMD_ORDER folios mapped by PTEs).
