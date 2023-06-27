From: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v1 10/10] mm: Allocate large folios for anonymous memory
Date: Tue, 27 Jun 2023 10:57:46 +0100
Message-ID: <0c98f854-b4e4-9a71-8e0c-1556bc79468c@arm.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
 <20230626171430.3167004-11-ryan.roberts@arm.com>
 <CAOUHufarua_JmnTu5NM-W3K4Togw+24F=Pf0HU0ZOjuwbRMC0A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <CAOUHufarua_JmnTu5NM-W3K4Togw+24F=Pf0HU0ZOjuwbRMC0A@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Yu Zhao <yuzhao@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On 27/06/2023 04:01, Yu Zhao wrote:
> On Mon, Jun 26, 2023 at 11:15=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.c=
om> wrote:
>>
>> With all of the enabler patches in place, modify the anonymous memory
>> write allocation path so that it opportunistically attempts to allocate
>> a large folio up to `max_anon_folio_order()` size (This value is
>> ultimately configured by the architecture). This reduces the number of
>> page faults, reduces the size of (e.g. LRU) lists, and generally
>> improves performance by batching what were per-page operations into
>> per-(large)-folio operations.
>>
>> If CONFIG_LARGE_ANON_FOLIO is not enabled (the default) then
>> `max_anon_folio_order()` always returns 0, meaning we get the existing
>> allocation behaviour.
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  mm/memory.c | 159 +++++++++++++++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 144 insertions(+), 15 deletions(-)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index a8f7e2b28d7a..d23c44cc5092 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -3161,6 +3161,90 @@ static inline int max_anon_folio_order(struct vm_=
area_struct *vma)
>>                 return CONFIG_LARGE_ANON_FOLIO_NOTHP_ORDER_MAX;
>>  }
>>
>> +/*
>> + * Returns index of first pte that is not none, or nr if all are none.
>> + */
>> +static inline int check_ptes_none(pte_t *pte, int nr)
>> +{
>> +       int i;
>> +
>> +       for (i =3D 0; i < nr; i++) {
>> +               if (!pte_none(ptep_get(pte++)))
>> +                       return i;
>> +       }
>> +
>> +       return nr;
>> +}
>> +
>> +static int calc_anon_folio_order_alloc(struct vm_fault *vmf, int order)
>=20
> As suggested previously in 03/10, we can leave this for later.

I disagree. This is the logic that prevents us from accidentally replacing
already set PTEs, or wandering out of the VMA bounds etc. How would you cat=
ch
all those corener cases without this?
