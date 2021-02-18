From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Date: Thu, 18 Feb 2021 11:44:41 +0100
Message-ID: <3763a505-02d6-5efe-a9f5-40381acfbdfd@redhat.com>
References: <20210217154844.12392-1-david@redhat.com>
 <YC5Am6a4KMSA8XoK@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613645099;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BMH8S4T7u+QFmoTuKd8zzsW1EwjP83j2mvXgWWp0OT0=;
        b=HBofra4iKdCbY7r1xj9jayR+yXaFThEnxBitgPwMC1wZy17HHq94F9T0wXrbXj8rTz5SOO
        bmqy7wjsL8g970IGRiupn2a2WBbwTMrXw4kzoYcoyIYepalbRP1Nnf7iMGr0n4Vd9ghrZy
        dBvU7rAcQbcIUifLDXbgVwyyWbe2uRo=
In-Reply-To: <YC5Am6a4KMSA8XoK@dhcp22.suse.cz>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E.J. Bottomle

On 18.02.21 11:25, Michal Hocko wrote:
> On Wed 17-02-21 16:48:44, David Hildenbrand wrote:
>> When we manage sparse memory mappings dynamically in user space - also
>> sometimes involving MADV_NORESERVE - we want to dynamically populate/
> 
> Just wondering what is MADV_NORESERVE? I do not see anything like that
> in the Linus tree. Did you mean MAP_NORESERVE?

Most certainly, thanks :)

> 
>> discard memory inside such a sparse memory region. Example users are
>> hypervisors (especially implementing memory ballooning or similar
>> technologies like virtio-mem) and memory allocators. In addition, we want
>> to fail in a nice way if populating does not succeed because we are out of
>> backend memory (which can happen easily with file-based mappings,
>> especially tmpfs and hugetlbfs).
> 
> by "fail in a nice way" you mean before a #PF would fail and SIGBUS
> which would be harder to handle?

Yes.

> 
> [...]
>> Because we don't have a proper interface, what applications
>> (like QEMU and databases) end up doing is touching (i.e., writing) all
>> individual pages. However, it requires expensive signal handling (SIGBUS);
>> for example, this is problematic in hypervisors like QEMU where SIGBUS
>> handlers might already be used by other subsystems concurrently to e.g,
>> handle hardware errors. "Simply" doing preallocation from another thread
>> is not that easy.
> 
> OK, that clarifies my above question.
> 
>>
>> Let's introduce MADV_POPULATE with the following semantics
>> 1. MADV_POPULATED does not work on PROT_NONE and special VMAs. It works
>>     on everything else.
> 
> This would better clarify what "does not work" means. I assume those are
> ignored and do not report any error?

I'm currently preparing the man page. "Fail with -ENOMEM" (like 
MADV_DONTNEED or MADV_REMOVE)

> 
>> 2. Errors during MADV_POPULATED (especially OOM) are reported.
> 
> How do you want to achieve that? gup/page fault handler will allocate
> memory and trigger the oom without caller noticing that. You would
> somehow have to weaken the allocation context to GFP_RETRY_MAYFAIL or
> NORETRY to achieve the error handling.

Okay, I should be more clear here (again, I'm realizing this as well 
while I create the man page), OOM is confusing: avoid SIGBUS at runtime 
- like we would get on actual file systems/shmem/hugetlbfs when 
preallocating.

It cannot save us from the actual OOM killer. To handle anonymous memory 
more reliable I'll need other means as well (dynamic swap space 
allocation for sparse mappings).

> 
>>     If we hit
>>     hardware errors on pages, ignore them - nothing we really can or
>>     should do.
>> 3. On errors during MADV_POPULATED, some memory might have been
>>     populated. Callers have to clean up if they care.
> 
> How does caller find out? madvise reports 0 on success so how do you
> find out how much has been populated?

If there is an error, something might have been populated. In my QEMU 
implementation, I simply discard the range again, good enough. I don't 
think we need to really indicate "error and populated" or "error and not 
populated".


> 
>> 4. Concurrent changes to the virtual memory layour are tolerated - we
>>     process each and every PFN only once, though.
> 
> I do not understand this. madvise is about virtual address space not a
> physical address space.

What I wanted to express: if we detect a change in the mapping we don't 
restart at the beginning, we always make forward progress. We process 
each virtual address once (on a per-page basis, thus I accidentally used 
"PFN").

> 
>> 5. If MADV_POPULATE succeeds, all memory in the range can be accessed
>>     without SIGBUS. (of course, not if user space changed mappings in the
>>     meantime or KSM kicked in on anonymous memory).
> 
> I do not see how KSM would change anything here and maybe it is not
> really important to mention it. KSM should be really transparent from
> the users space POV. Parallel and destructive virtual address space
> operations are also expected to change the outcome and there is nothing
> kernel do about at and provide any meaningful guarantees. I guess we
> want to assume a reasonable userspace behavior here.

It's just a note that we cannot protect from someone interfering 
(discard/ksm/whatever). I'm making that clearer in the cover letter.

Thanks!

-- 
Thanks,

David / dhildenb

