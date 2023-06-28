From: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v1 04/10] mm: Implement folio_add_new_anon_rmap_range()
Date: Wed, 28 Jun 2023 12:09:07 +0100
Message-ID: <e6318ca2-e385-87d5-28a2-d69b0d8a3d42@arm.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
 <20230626171430.3167004-5-ryan.roberts@arm.com>
 <CAOUHufZ0ZzHoJXwbzNyZOv74L=XYdZzcxA8SXxLX0MXdykuWRA@mail.gmail.com>
 <b16636b3-b493-39c5-c605-c5701fcbed1f@arm.com>
 <8c01486f-3c1a-e50d-544e-502eadbddf05@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <8c01486f-3c1a-e50d-544e-502eadbddf05@intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Yin Fengwei <fengwei.yin@intel.com>, Yu Zhao <yuzhao@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org

On 28/06/2023 03:20, Yin Fengwei wrote:
>=20
>=20
> On 6/27/23 16:09, Ryan Roberts wrote:
>> On 27/06/2023 08:08, Yu Zhao wrote:
>>> On Mon, Jun 26, 2023 at 11:14=E2=80=AFAM Ryan Roberts <ryan.roberts@arm=
.com> wrote:
>>>>
>>>> Like folio_add_new_anon_rmap() but batch-rmaps a range of pages
>>>> belonging to a folio, for effciency savings. All pages are accounted as
>>>> small pages.
>>>>
>>>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>>>> ---
>>>>  include/linux/rmap.h |  2 ++
>>>>  mm/rmap.c            | 43 +++++++++++++++++++++++++++++++++++++++++++
>>>>  2 files changed, 45 insertions(+)
>>>>
>>>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>>>> index a3825ce81102..15433a3d0cbf 100644
>>>> --- a/include/linux/rmap.h
>>>> +++ b/include/linux/rmap.h
>>>> @@ -196,6 +196,8 @@ void page_add_new_anon_rmap(struct page *, struct =
vm_area_struct *,
>>>>                 unsigned long address);
>>>>  void folio_add_new_anon_rmap(struct folio *, struct vm_area_struct *,
>>>>                 unsigned long address);
>>>> +void folio_add_new_anon_rmap_range(struct folio *folio, struct page *=
page,
>>>> +               int nr, struct vm_area_struct *vma, unsigned long addr=
ess);
>>>
>>> We should update folio_add_new_anon_rmap() to support large() &&
>>> !folio_test_pmd_mappable() folios instead.
>>>
>>> I double checked all places currently using folio_add_new_anon_rmap(),
>>> and as expected, none actually allocates large() &&
>>> !folio_test_pmd_mappable() and maps it one by one, which makes the
>>> cases simpler, i.e.,
>>>   if (!large())
>>>     // the existing basepage case
>>>   else if (!folio_test_pmd_mappable())
>>>     // our new case
>>>   else
>>>     // the existing THP case
>>
>> I don't have a strong opinion either way. Happy to go with this suggesti=
on. But
>> the reason I did it as a new function was because I was following the pa=
ttern in
>> [1] which adds a new folio_add_file_rmap_range() function.
>>
>> [1] https://lore.kernel.org/linux-mm/20230315051444.3229621-35-willy@inf=
radead.org/
> Oh. There is different here:
> For page cache, large folio could be created by previous file access. But=
 later
> file access by other process just need map partial large folio. In this c=
ase, we need
> _range for filemap.
>=20
> But for anonymous, I suppose we always map whole folio in. So I agree wit=
h Yu. We
> don't need _range for folio_add_new_anon_rmap(). Thanks.

Yes that makes sense - thanks. I'll merge the new case into
folio_add_new_anon_rmap() for v2.

>=20
>=20
> Regards
> Yin, Fengwei
>=20
>>
>>
>>>
>>>>  void page_add_file_rmap(struct page *, struct vm_area_struct *,
>>>>                 bool compound);
>>>>  void folio_add_file_rmap_range(struct folio *, struct page *, unsigne=
d int nr,
>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>> index 1d8369549424..4050bcea7ae7 100644
>>>> --- a/mm/rmap.c
>>>> +++ b/mm/rmap.c
>>>> @@ -1305,6 +1305,49 @@ void folio_add_new_anon_rmap(struct folio *foli=
o, struct vm_area_struct *vma,
>>>>         __page_set_anon_rmap(folio, &folio->page, vma, address, 1);
>>>>  }
>>>>
>>>> +/**
>>>> + * folio_add_new_anon_rmap_range - Add mapping to a set of pages with=
in a new
>>>> + * anonymous potentially large folio.
>>>> + * @folio:      The folio containing the pages to be mapped
>>>> + * @page:       First page in the folio to be mapped
>>>> + * @nr:         Number of pages to be mapped
>>>> + * @vma:        the vm area in which the mapping is added
>>>> + * @address:    the user virtual address of the first page to be mapp=
ed
>>>> + *
>>>> + * Like folio_add_new_anon_rmap() but batch-maps a range of pages wit=
hin a folio
>>>> + * using non-THP accounting. Like folio_add_new_anon_rmap(), the inc-=
and-test is
>>>> + * bypassed and the folio does not have to be locked. All pages in th=
e folio are
>>>> + * individually accounted.
>>>> + *
>>>> + * As the folio is new, it's assumed to be mapped exclusively by a si=
ngle
>>>> + * process.
>>>> + */
>>>> +void folio_add_new_anon_rmap_range(struct folio *folio, struct page *=
page,
>>>> +               int nr, struct vm_area_struct *vma, unsigned long addr=
ess)
>>>> +{
>>>> +       int i;
>>>> +
>>>> +       VM_BUG_ON_VMA(address < vma->vm_start ||
>>>> +                     address + (nr << PAGE_SHIFT) > vma->vm_end, vma);
>>>
>>> BTW, VM_BUG_ON* shouldn't be used in new code:
>>> Documentation/process/coding-style.rst
>>
>> Thanks, sorry about that. Was copy-pasting from folio_add_new_anon_rmap(=
).
>>

