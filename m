From: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v1 08/10] mm: Kconfig hooks to determine max anon folio
 allocation order
Date: Tue, 27 Jun 2023 10:54:08 +0100
Message-ID: <6fc531bc-6b72-37bd-7380-0969622f08d4@arm.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
 <20230626171430.3167004-9-ryan.roberts@arm.com>
 <CAOUHufZ5pAR=ySs7YyoUpum2_6tJ9jM-H608ZeQucguNGAfKTw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAOUHufZ5pAR=ySs7YyoUpum2_6tJ9jM-H608ZeQucguNGAfKTw@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Yu Zhao <yuzhao@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On 27/06/2023 03:47, Yu Zhao wrote:
> On Mon, Jun 26, 2023 at 11:15=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.c=
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
>>  endmenu
>=20
> I don't think an MVP should add this many Kconfigs. One Kconfig sounds
> reasonable to me for now.

If we move to arch_wants_pte_order() as you suggested (in your response to =
patch
3) then I agree we can remove most of these. I still think we might want 2
though. For an arch that does not implement arch_wants_pte_order() we would=
n't
want LARGE_ANON_FOLIO to show up in menuconfig so we would still need
ARCH_SUPPORTS_LARGE_ANON_FOLIO:


config ARCH_SUPPORTS_LARGE_ANON_FOLIO
       def_bool n
       help
         An arch should select this symbol if wants to allow LARGE_ANON_FOL=
IO
         to be enabled. In this case, It must also define arch_wants_pte_or=
der()

config LARGE_ANON_FOLIO
       bool "Allocate large folios for anonymous memory"
       depends on ARCH_SUPPORTS_LARGE_ANON_FOLIO
       default n
       help
         Use large (bigger than order-0) folios to back anonymous memory wh=
ere
         possible. This reduces the number of page faults, as well as other
         per-page overheads to improve performance for many workloads.

What do you think?

