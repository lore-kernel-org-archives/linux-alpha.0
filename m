From: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v1 02/10] mm: pass gfp flags and order to
 vma_alloc_zeroed_movable_folio()
Date: Tue, 27 Jun 2023 08:27:24 +0100
Message-ID: <a729a5cb-2376-869b-96dd-cb1babac04d2@arm.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
 <20230626171430.3167004-3-ryan.roberts@arm.com>
 <CAOUHufYWtsAU4PvKpVhzJUeQb9cd+BifY9KzgceBXHp2F2dDRg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <CAOUHufYWtsAU4PvKpVhzJUeQb9cd+BifY9KzgceBXHp2F2dDRg@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Yu Zhao <yuzhao@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On 27/06/2023 03:27, Yu Zhao wrote:
> On Mon, Jun 26, 2023 at 11:14=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.c=
om> wrote:
>>
>> Allow allocation of large folios with vma_alloc_zeroed_movable_folio().
>> This prepares the ground for large anonymous folios. The generic
>> implementation of vma_alloc_zeroed_movable_folio() now uses
>> clear_huge_page() to zero the allocated folio since it may now be a
>> non-0 order.
>>
>> Currently the function is always called with order 0 and no extra gfp
>> flags, so no functional change intended. But a subsequent commit will
>> take advantage of the new parameters to allocate large folios. The extra
>> gfp flags will be used to control the reclaim policy.
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  arch/alpha/include/asm/page.h   |  5 +++--
>>  arch/arm64/include/asm/page.h   |  3 ++-
>>  arch/arm64/mm/fault.c           |  7 ++++---
>>  arch/ia64/include/asm/page.h    |  5 +++--
>>  arch/m68k/include/asm/page_no.h |  7 ++++---
>>  arch/s390/include/asm/page.h    |  5 +++--
>>  arch/x86/include/asm/page.h     |  5 +++--
>>  include/linux/highmem.h         | 23 +++++++++++++----------
>>  mm/memory.c                     |  5 +++--
>>  9 files changed, 38 insertions(+), 27 deletions(-)
>>
>> diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page=
.h
>> index 4db1ebc0ed99..6fc7fe91b6cb 100644
>> --- a/arch/alpha/include/asm/page.h
>> +++ b/arch/alpha/include/asm/page.h
>> @@ -17,8 +17,9 @@
>>  extern void clear_page(void *page);
>>  #define clear_user_page(page, vaddr, pg)       clear_page(page)
>>
>> -#define vma_alloc_zeroed_movable_folio(vma, vaddr) \
>> -       vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma, vaddr=
, false)
>> +#define vma_alloc_zeroed_movable_folio(vma, vaddr, gfp, order) \
>> +       vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO | (gfp), \
>> +                       order, vma, vaddr, false)
>=20
> I don't think we need to worry about gfp if we want to make a minimum
> series. There would be many discussion points around it, e.g., I
> already disagree with what you chose: GFP_TRANSHUGE_LIGHT would be
> more suitable than __GFP_NORETRY, and there are even better options
> than GFP_TRANSHUGE_LIGHT.

OK, but disagreeing about what the GFP flags should be is different from
disagreeing about whether we need a mechanism for specifying them. Given I =
need
to do the changes to add `order` I thought it was sensible to add the gfp f=
lags
at the same time.

I'll follow your advice and remove the gfp flag addition for now.
