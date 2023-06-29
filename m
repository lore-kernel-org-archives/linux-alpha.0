From: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v1 08/10] mm: Kconfig hooks to determine max anon folio
 allocation order
Date: Thu, 29 Jun 2023 12:31:52 +0100
Message-ID: <09ef8f66-6697-d803-89ac-228a6fe2e604@arm.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
 <20230626171430.3167004-9-ryan.roberts@arm.com>
 <CAHbLzkpScGq-ja2A6dRffG8qbrVuwXzkMpFvSq_Fzdqp2wUwPA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <CAHbLzkpScGq-ja2A6dRffG8qbrVuwXzkMpFvSq_Fzdqp2wUwPA@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Yang Shi <shy828301@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Yu Zhao <yuzhao@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger

On 29/06/2023 02:38, Yang Shi wrote:
> On Mon, Jun 26, 2023 at 10:15=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.c=
om> wrote:
>>
>> For variable-order anonymous folios, we need to determine the order that
>> we will allocate. From a SW perspective, the higher the order we
>> allocate, the less overhead we will have; fewer faults, fewer folios in
>> lists, etc. But of course there will also be more memory wastage as the
>> order increases.
>>
>> From a HW perspective, there are memory block sizes that can be
>> beneficial to reducing TLB pressure. arm64, for example, has the ability
>> to map "contpte" sized chunks (64K for a 4K base page, 2M for 16K and
>> 64K base pages) such that one of these chunks only uses a single TLB
>> entry.
>>
>> So we let the architecture specify the order of the maximally beneficial
>> mapping unit when PTE-mapped. Furthermore, because in some cases, this
>> order may be quite big (and therefore potentially wasteful of memory),
>> allow the arch to specify 2 values; One is the max order for a mapping
>> that _would not_ use THP if all size and alignment constraints were met,
>> and the other is the max order for a mapping that _would_ use THP if all
>> those constraints were met.
>>
>> Implement this with Kconfig by introducing some new options to allow the
>> architecture to declare that it supports large anonymous folios along
>> with these 2 preferred max order values. Then introduce a user-facing
>> option, LARGE_ANON_FOLIO, which defaults to disabled and can only be
>> enabled if the architecture has declared its support. When disabled, it
>> forces the max order values, LARGE_ANON_FOLIO_NOTHP_ORDER_MAX and
>> LARGE_ANON_FOLIO_THP_ORDER_MAX to 0, meaning only a single page is ever
>> allocated.
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  mm/Kconfig  | 39 +++++++++++++++++++++++++++++++++++++++
>>  mm/memory.c |  8 ++++++++
>>  2 files changed, 47 insertions(+)
>>
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index 7672a22647b4..f4ba48c37b75 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -1208,4 +1208,43 @@ config PER_VMA_LOCK
>>
>>  source "mm/damon/Kconfig"
>>
>> +config ARCH_SUPPORTS_LARGE_ANON_FOLIO
>> +       def_bool n
>> +       help
>> +         An arch should select this symbol if wants to allow LARGE_ANON=
_FOLIO
>> +         to be enabled. It must also set the following integer values:
>> +         - ARCH_LARGE_ANON_FOLIO_NOTHP_ORDER_MAX
>> +         - ARCH_LARGE_ANON_FOLIO_THP_ORDER_MAX
>> +
>> +config ARCH_LARGE_ANON_FOLIO_NOTHP_ORDER_MAX
>> +       int
>> +       help
>> +         The maximum size of folio to allocate for an anonymous VMA PTE=
-mapping
>> +         that does not have the MADV_HUGEPAGE hint set.
>> +
>> +config ARCH_LARGE_ANON_FOLIO_THP_ORDER_MAX
>> +       int
>> +       help
>> +         The maximum size of folio to allocate for an anonymous VMA PTE=
-mapping
>> +         that has the MADV_HUGEPAGE hint set.
>> +
>> +config LARGE_ANON_FOLIO
>> +       bool "Allocate large folios for anonymous memory"
>> +       depends on ARCH_SUPPORTS_LARGE_ANON_FOLIO
>> +       default n
>> +       help
>> +         Use large (bigger than order-0) folios to back anonymous memor=
y where
>> +         possible. This reduces the number of page faults, as well as o=
ther
>> +         per-page overheads to improve performance for many workloads.
>> +
>> +config LARGE_ANON_FOLIO_NOTHP_ORDER_MAX
>> +       int
>> +       default 0 if !LARGE_ANON_FOLIO
>> +       default ARCH_LARGE_ANON_FOLIO_NOTHP_ORDER_MAX
>> +
>> +config LARGE_ANON_FOLIO_THP_ORDER_MAX
>> +       int
>> +       default 0 if !LARGE_ANON_FOLIO
>> +       default ARCH_LARGE_ANON_FOLIO_THP_ORDER_MAX
>> +
>=20
> IMHO I don't think we need all of the new kconfigs. Ideally the large
> anon folios could be supported by all arches, although some of them
> may not benefit from larger TLB entries due to lack of hardware
> support.t
>=20
> For now with a minimum implementation, I think you could define a
> macro or a function that returns the hardware preferred order.

Thanks for the feedback - that aligns with what Yu Zhao suggested. I'm
implementing it for v2.

Thanks,
Ryan


>=20
>>  endmenu
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 9165ed1b9fc2..a8f7e2b28d7a 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -3153,6 +3153,14 @@ static struct folio *try_vma_alloc_movable_folio(=
struct vm_area_struct *vma,
>>         return vma_alloc_movable_folio(vma, vaddr, 0, zeroed);
>>  }
>>
>> +static inline int max_anon_folio_order(struct vm_area_struct *vma)
>> +{
>> +       if (hugepage_vma_check(vma, vma->vm_flags, false, true, true))
>> +               return CONFIG_LARGE_ANON_FOLIO_THP_ORDER_MAX;
>> +       else
>> +               return CONFIG_LARGE_ANON_FOLIO_NOTHP_ORDER_MAX;
>> +}
>> +
>>  /*
>>   * Handle write page faults for pages that can be reused in the current=
 vma
>>   *
>> --
>> 2.25.1
>>
>>

