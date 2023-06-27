From: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v1 04/10] mm: Implement folio_add_new_anon_rmap_range()
Date: Tue, 27 Jun 2023 09:09:31 +0100
Message-ID: <b16636b3-b493-39c5-c605-c5701fcbed1f@arm.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
 <20230626171430.3167004-5-ryan.roberts@arm.com>
 <CAOUHufZ0ZzHoJXwbzNyZOv74L=XYdZzcxA8SXxLX0MXdykuWRA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAOUHufZ0ZzHoJXwbzNyZOv74L=XYdZzcxA8SXxLX0MXdykuWRA@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Yu Zhao <yuzhao@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On 27/06/2023 08:08, Yu Zhao wrote:
> On Mon, Jun 26, 2023 at 11:14=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.c=
om> wrote:
>>
>> Like folio_add_new_anon_rmap() but batch-rmaps a range of pages
>> belonging to a folio, for effciency savings. All pages are accounted as
>> small pages.
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  include/linux/rmap.h |  2 ++
>>  mm/rmap.c            | 43 +++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 45 insertions(+)
>>
>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>> index a3825ce81102..15433a3d0cbf 100644
>> --- a/include/linux/rmap.h
>> +++ b/include/linux/rmap.h
>> @@ -196,6 +196,8 @@ void page_add_new_anon_rmap(struct page *, struct vm=
_area_struct *,
>>                 unsigned long address);
>>  void folio_add_new_anon_rmap(struct folio *, struct vm_area_struct *,
>>                 unsigned long address);
>> +void folio_add_new_anon_rmap_range(struct folio *folio, struct page *pa=
ge,
>> +               int nr, struct vm_area_struct *vma, unsigned long addres=
s);
>=20
> We should update folio_add_new_anon_rmap() to support large() &&
> !folio_test_pmd_mappable() folios instead.
>=20
> I double checked all places currently using folio_add_new_anon_rmap(),
> and as expected, none actually allocates large() &&
> !folio_test_pmd_mappable() and maps it one by one, which makes the
> cases simpler, i.e.,
>   if (!large())
>     // the existing basepage case
>   else if (!folio_test_pmd_mappable())
>     // our new case
>   else
>     // the existing THP case

I don't have a strong opinion either way. Happy to go with this suggestion.=
 But
the reason I did it as a new function was because I was following the patte=
rn in
[1] which adds a new folio_add_file_rmap_range() function.

[1] https://lore.kernel.org/linux-mm/20230315051444.3229621-35-willy@infrad=
ead.org/


>=20
>>  void page_add_file_rmap(struct page *, struct vm_area_struct *,
>>                 bool compound);
>>  void folio_add_file_rmap_range(struct folio *, struct page *, unsigned =
int nr,
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 1d8369549424..4050bcea7ae7 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1305,6 +1305,49 @@ void folio_add_new_anon_rmap(struct folio *folio,=
 struct vm_area_struct *vma,
>>         __page_set_anon_rmap(folio, &folio->page, vma, address, 1);
>>  }
>>
>> +/**
>> + * folio_add_new_anon_rmap_range - Add mapping to a set of pages within=
 a new
>> + * anonymous potentially large folio.
>> + * @folio:      The folio containing the pages to be mapped
>> + * @page:       First page in the folio to be mapped
>> + * @nr:         Number of pages to be mapped
>> + * @vma:        the vm area in which the mapping is added
>> + * @address:    the user virtual address of the first page to be mapped
>> + *
>> + * Like folio_add_new_anon_rmap() but batch-maps a range of pages withi=
n a folio
>> + * using non-THP accounting. Like folio_add_new_anon_rmap(), the inc-an=
d-test is
>> + * bypassed and the folio does not have to be locked. All pages in the =
folio are
>> + * individually accounted.
>> + *
>> + * As the folio is new, it's assumed to be mapped exclusively by a sing=
le
>> + * process.
>> + */
>> +void folio_add_new_anon_rmap_range(struct folio *folio, struct page *pa=
ge,
>> +               int nr, struct vm_area_struct *vma, unsigned long addres=
s)
>> +{
>> +       int i;
>> +
>> +       VM_BUG_ON_VMA(address < vma->vm_start ||
>> +                     address + (nr << PAGE_SHIFT) > vma->vm_end, vma);
>=20
> BTW, VM_BUG_ON* shouldn't be used in new code:
> Documentation/process/coding-style.rst

Thanks, sorry about that. Was copy-pasting from folio_add_new_anon_rmap().

