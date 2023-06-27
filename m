From: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v1 01/10] mm: Expose clear_huge_page() unconditionally
Date: Tue, 27 Jun 2023 10:41:43 +0100
Message-ID: <91e3364f-1d1b-f959-636b-4f60bf5a577b@arm.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
 <20230626171430.3167004-2-ryan.roberts@arm.com>
 <CAOUHufacvArJh7NjL_3LT-e3s1X+bazkvbgvEU+KPKGKEoW+dw@mail.gmail.com>
 <2ff8ccf6-bf36-48b2-7dc2-e6c0d962f8b7@arm.com>
 <CAOUHufZoT-maN3kY5eYQmrYV48shmKAAancEvabXzfTDncDa9A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAOUHufZoT-maN3kY5eYQmrYV48shmKAAancEvabXzfTDncDa9A@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Yu Zhao <yuzhao@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On 27/06/2023 09:29, Yu Zhao wrote:
> On Tue, Jun 27, 2023 at 1:21 AM Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 27/06/2023 02:55, Yu Zhao wrote:
>>> On Mon, Jun 26, 2023 at 11:14 AM Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>
>>>> In preparation for extending vma_alloc_zeroed_movable_folio() to
>>>> allocate a arbitrary order folio, expose clear_huge_page()
>>>> unconditionally, so that it can be used to zero the allocated folio in
>>>> the generic implementation of vma_alloc_zeroed_movable_folio().
>>>>
>>>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>>>> ---
>>>>  include/linux/mm.h | 3 ++-
>>>>  mm/memory.c        | 2 +-
>>>>  2 files changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>>> index 7f1741bd870a..7e3bf45e6491 100644
>>>> --- a/include/linux/mm.h
>>>> +++ b/include/linux/mm.h
>>>> @@ -3684,10 +3684,11 @@ enum mf_action_page_type {
>>>>   */
>>>>  extern const struct attribute_group memory_failure_attr_group;
>>>>
>>>> -#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBFS)
>>>>  extern void clear_huge_page(struct page *page,
>>>>                             unsigned long addr_hint,
>>>>                             unsigned int pages_per_huge_page);
>>>> +
>>>> +#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBFS)
>>>
>>> We might not want to depend on THP eventually. Right now, we still
>>> have to, unless splitting is optional, which seems to contradict
>>> 06/10. (deferred_split_folio()  is a nop without THP.)
>>
>> Yes, I agree - for large anon folios to work, we depend on THP. But I don't
>> think that helps us here.
>>
>> In the next patch, I give vma_alloc_zeroed_movable_folio() an extra `order`
>> parameter. So the generic/default version of the function now needs a way to
>> clear a compound page.
>>
>> I guess I could do something like:
>>
>>  static inline
>>  struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
>>                                    unsigned long vaddr, gfp_t gfp, int order)
>>  {
>>         struct folio *folio;
>>
>>         folio = vma_alloc_folio(GFP_HIGHUSER_MOVABLE | gfp,
>>                                         order, vma, vaddr, false);
>>         if (folio) {
>> #ifdef CONFIG_LARGE_FOLIO
>>                 clear_huge_page(&folio->page, vaddr, 1U << order);
>> #else
>>                 BUG_ON(order != 0);
>>                 clear_user_highpage(&folio->page, vaddr);
>> #endif
>>         }
>>
>>         return folio;
>>  }
>>
>> But that's pretty messy and there's no reason why other users might come along
>> that pass order != 0 and will be surprised by the BUG_ON.
> 
> #ifdef CONFIG_LARGE_ANON_FOLIO // depends on CONFIG_TRANSPARENT_HUGE_PAGE
> struct folio *alloc_anon_folio(struct vm_area_struct *vma, unsigned
> long vaddr, int order)
> {
>   // how do_huge_pmd_anonymous_page() allocs and clears
>   vma_alloc_folio(..., *true*);

This controls the mem allocation policy (see mempolicy.c::vma_alloc_folio()) not
clearing. Clearing is done in __do_huge_pmd_anonymous_page():

  clear_huge_page(page, vmf->address, HPAGE_PMD_NR);

> }
> #else
> #define alloc_anon_folio(vma, addr, order)
> vma_alloc_zeroed_movable_folio(vma, addr)
> #endif

Sorry I don't get this at all... If you are suggesting to bypass
vma_alloc_zeroed_movable_folio() entirely for the LARGE_ANON_FOLIO case, I don't
think that works because the arch code adds its own gfp flags there. For
example, arm64 adds __GFP_ZEROTAGS for VM_MTE VMAs.

Perhaps we can do away with an arch-owned vma_alloc_zeroed_movable_folio() and
replace it with a new arch_get_zeroed_movable_gfp_flags() then
alloc_anon_folio() add in those flags?

But I still think the cleanest, simplest change is just to unconditionally
expose clear_huge_page() as I've done it.

