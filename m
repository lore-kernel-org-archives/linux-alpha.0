From: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v1 01/10] mm: Expose clear_huge_page() unconditionally
Date: Tue, 27 Jun 2023 08:21:22 +0100
Message-ID: <2ff8ccf6-bf36-48b2-7dc2-e6c0d962f8b7@arm.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
 <20230626171430.3167004-2-ryan.roberts@arm.com>
 <CAOUHufacvArJh7NjL_3LT-e3s1X+bazkvbgvEU+KPKGKEoW+dw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <CAOUHufacvArJh7NjL_3LT-e3s1X+bazkvbgvEU+KPKGKEoW+dw@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Yu Zhao <yuzhao@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On 27/06/2023 02:55, Yu Zhao wrote:
> On Mon, Jun 26, 2023 at 11:14=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.c=
om> wrote:
>>
>> In preparation for extending vma_alloc_zeroed_movable_folio() to
>> allocate a arbitrary order folio, expose clear_huge_page()
>> unconditionally, so that it can be used to zero the allocated folio in
>> the generic implementation of vma_alloc_zeroed_movable_folio().
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  include/linux/mm.h | 3 ++-
>>  mm/memory.c        | 2 +-
>>  2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 7f1741bd870a..7e3bf45e6491 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -3684,10 +3684,11 @@ enum mf_action_page_type {
>>   */
>>  extern const struct attribute_group memory_failure_attr_group;
>>
>> -#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBFS)
>>  extern void clear_huge_page(struct page *page,
>>                             unsigned long addr_hint,
>>                             unsigned int pages_per_huge_page);
>> +
>> +#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBFS)
>=20
> We might not want to depend on THP eventually. Right now, we still
> have to, unless splitting is optional, which seems to contradict
> 06/10. (deferred_split_folio()  is a nop without THP.)

Yes, I agree - for large anon folios to work, we depend on THP. But I don't
think that helps us here.

In the next patch, I give vma_alloc_zeroed_movable_folio() an extra `order`
parameter. So the generic/default version of the function now needs a way to
clear a compound page.

I guess I could do something like:

 static inline
 struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
				   unsigned long vaddr, gfp_t gfp, int order)
 {
 	struct folio *folio;

	folio =3D vma_alloc_folio(GFP_HIGHUSER_MOVABLE | gfp,
					order, vma, vaddr, false);
 	if (folio) {
#ifdef CONFIG_LARGE_FOLIO
		clear_huge_page(&folio->page, vaddr, 1U << order);
#else
		BUG_ON(order !=3D 0);
		clear_user_highpage(&folio->page, vaddr);
#endif
	}

 	return folio;
 }

But that's pretty messy and there's no reason why other users might come al=
ong
that pass order !=3D 0 and will be surprised by the BUG_ON.
