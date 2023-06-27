From: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v1 00/10] variable-order, large folios for anonymous
 memory
Date: Tue, 27 Jun 2023 10:59:22 +0100
Message-ID: <1fb0c4cb-a709-de20-d643-32ed43550059@arm.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
 <CAOUHufaUTbUw9MTzw8D=sVrEB+RP6LSBQVGn93TWk=ozV8XobA@mail.gmail.com>
 <CAOUHufa0S_ayrys0XzDbH8KJi5HxvbGCh_bSAhDpAgcmSJjFUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAOUHufa0S_ayrys0XzDbH8KJi5HxvbGCh_bSAhDpAgcmSJjFUQ@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Yu Zhao <yuzhao@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On 27/06/2023 08:49, Yu Zhao wrote:
> On Mon, Jun 26, 2023 at 9:30 PM Yu Zhao <yuzhao@google.com> wrote:
>>
>> On Mon, Jun 26, 2023 at 11:14 AM Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>
>>> Hi All,
>>>
>>> Following on from the previous RFCv2 [1], this series implements variable order,
>>> large folios for anonymous memory. The objective of this is to improve
>>> performance by allocating larger chunks of memory during anonymous page faults:
>>>
>>>  - Since SW (the kernel) is dealing with larger chunks of memory than base
>>>    pages, there are efficiency savings to be had; fewer page faults, batched PTE
>>>    and RMAP manipulation, fewer items on lists, etc. In short, we reduce kernel
>>>    overhead. This should benefit all architectures.
>>>  - Since we are now mapping physically contiguous chunks of memory, we can take
>>>    advantage of HW TLB compression techniques. A reduction in TLB pressure
>>>    speeds up kernel and user space. arm64 systems have 2 mechanisms to coalesce
>>>    TLB entries; "the contiguous bit" (architectural) and HPA (uarch).
>>>
>>> This patch set deals with the SW side of things only and based on feedback from
>>> the RFC, aims to be the most minimal initial change, upon which future
>>> incremental changes can be added. For this reason, the new behaviour is hidden
>>> behind a new Kconfig switch, CONFIG_LARGE_ANON_FOLIO, which is disabled by
>>> default. Although the code has been refactored to parameterize the desired order
>>> of the allocation, when the feature is disabled (by forcing the order to be
>>> always 0) my performance tests measure no regression. So I'm hoping this will be
>>> a suitable mechanism to allow incremental submissions to the kernel without
>>> affecting the rest of the world.
>>>
>>> The patches are based on top of v6.4 plus Matthew Wilcox's set_ptes() series
>>> [2], which is a hard dependency. I'm not sure of Matthew's exact plans for
>>> getting that series into the kernel, but I'm hoping we can start the review
>>> process on this patch set independently. I have a branch at [3].
>>>
>>> I've posted a separate series concerning the HW part (contpte mapping) for arm64
>>> at [4].
>>>
>>>
>>> Performance
>>> -----------
>>>
>>> Below results show 2 benchmarks; kernel compilation and speedometer 2.0 (a
>>> javascript benchmark running in Chromium). Both cases are running on Ampere
>>> Altra with 1 NUMA node enabled, Ubuntu 22.04 and XFS filesystem. Each benchmark
>>> is repeated 15 times over 5 reboots and averaged.
>>>
>>> All improvements are relative to baseline-4k. 'anonfolio-basic' is this series.
>>> 'anonfolio' is the full patch set similar to the RFC with the additional changes
>>> to the extra 3 fault paths. The rest of the configs are described at [4].
>>>
>>> Kernel Compilation (smaller is better):
>>>
>>> | kernel          |   real-time |   kern-time |   user-time |
>>> |:----------------|------------:|------------:|------------:|
>>> | baseline-4k     |        0.0% |        0.0% |        0.0% |
>>> | anonfolio-basic |       -5.3% |      -42.9% |       -0.6% |
>>> | anonfolio       |       -5.4% |      -46.0% |       -0.3% |
>>> | contpte         |       -6.8% |      -45.7% |       -2.1% |
>>> | exefolio        |       -8.4% |      -46.4% |       -3.7% |
>>> | baseline-16k    |       -8.7% |      -49.2% |       -3.7% |
>>> | baseline-64k    |      -10.5% |      -66.0% |       -3.5% |
>>>
>>> Speedometer 2.0 (bigger is better):
>>>
>>> | kernel          |   runs_per_min |
>>> |:----------------|---------------:|
>>> | baseline-4k     |           0.0% |
>>> | anonfolio-basic |           0.7% |
>>> | anonfolio       |           1.2% |
>>> | contpte         |           3.1% |
>>> | exefolio        |           4.2% |
>>> | baseline-16k    |           5.3% |
>>
>> Thanks for pushing this forward!
>>
>>> Changes since RFCv2
>>> -------------------
>>>
>>>   - Simplified series to bare minimum (on David Hildenbrand's advice)
>>
>> My impression is that this series still includes many pieces that can
>> be split out and discussed separately with followup series.
>>
>> (I skipped 04/10 and will look at it tomorrow.)
> 
> I went through the series twice. Here what I think a bare minimum
> series (easier to review/debug/land) would look like:
> 1. a new arch specific function providing a prefered order within (0,
> PMD_ORDER).
> 2. an extended anon folio alloc API taking that order (02/10, partially).
> 3. an updated folio_add_new_anon_rmap() covering the large() &&
> !pmd_mappable() case (similar to 04/10).
> 4. s/folio_test_pmd_mappable/folio_test_large/ in page_remove_rmap()
> (06/10, reviewed-by provided).
> 5. finally, use the extended anon folio alloc API with the arch
> preferred order in do_anonymous_page() (10/10, partially).
> 
> The rest can be split out into separate series and move forward in
> parallel with probably a long list of things we need/want to do.

Thanks for the fadt review - I really appreciate it!

I've responded to many of your comments. I'd appreciate if we can close those
points then I will work up a v2.

Thanks,
Ryan


