From: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v1 07/10] mm: Batch-zap large anonymous folio PTE mappings
Date: Tue, 27 Jun 2023 10:46:50 +0100
Message-ID: <b247e32a-03f0-1dbf-59e5-d7cbf90a5500@arm.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
 <20230626171430.3167004-8-ryan.roberts@arm.com>
 <CAOUHufbhVM-+zMUvHy0zeTb1ZFnDWnvD+=f6v9YxNJ_h5bjaRw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <CAOUHufbhVM-+zMUvHy0zeTb1ZFnDWnvD+=f6v9YxNJ_h5bjaRw@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Yu Zhao <yuzhao@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On 27/06/2023 04:04, Yu Zhao wrote:
> On Mon, Jun 26, 2023 at 11:15=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.c=
om> wrote:
>>
>> This allows batching the rmap removal with folio_remove_rmap_range(),
>> which means we avoid spuriously adding a partially unmapped folio to the
>> deferrred split queue in the common case, which reduces split queue lock
>> contention.
>>
>> Previously each page was removed from the rmap individually with
>> page_remove_rmap(). If the first page belonged to a large folio, this
>> would cause page_remove_rmap() to conclude that the folio was now
>> partially mapped and add the folio to the deferred split queue. But
>> subsequent calls would cause the folio to become fully unmapped, meaning
>> there is no value to adding it to the split queue.
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  mm/memory.c | 119 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 119 insertions(+)
>=20
> We don't really need this patch for the series to work. So again, I'd
> split it out.

The reason I included it in the MVP was that without it I was seeing high l=
ock
contention for the split queue lock, which was significantly eating the
performance gains. But since then Yin Fengwei's patch to make this more
efficient has been accepted so perhaps that solves the problem and in that =
case
we can drop this as you suggest. If I still see a reasonable perf improveme=
nt
without it, I'll drop for v2.
