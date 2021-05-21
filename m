From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH resend v2 2/5] mm/madvise: introduce
 MADV_POPULATE_(READ|WRITE) to prefault page tables
Date: Fri, 21 May 2021 10:48:57 +0200
Message-ID: <2e41144c-27f4-f341-d855-f966dabc2c21@redhat.com>
References: <20210511081534.3507-1-david@redhat.com>
 <20210511081534.3507-3-david@redhat.com> <YKOR/8LzEaOgCvio@dhcp22.suse.cz>
 <bb0e2ebb-e66d-176c-b20a-fbadd95cde98@redhat.com>
 <YKOiV9VkEdYFM9nB@dhcp22.suse.cz>
 <b2fa988d-9625-7c0e-ce83-158af0058e38@redhat.com>
 <YKZnsnqgEMx6Xl6X@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621586943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ss3oq71TJpZynR4jRUU0R8ghR5Bhj/98WSz+6h5ZWWw=;
        b=Y8xI2onXI7Gmvnzu68dfGzae/Ko6JprIfw4kKSmJ2+oNr+rjclxqbfbJMKx2OlbqotGCrC
        EI0Ox7KJo6aH8NMjYSUba6xZaThUYPyVxcuzE+/JS0kLhrty5C7Hx5uBxPPBETuNU3C6Rk
        r6/BXdF9JB/R/+XWSgOecjn6GvDUc1E=
In-Reply-To: <YKZnsnqgEMx6Xl6X@dhcp22.suse.cz>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E.J. Bottomle

> [...]
>> Anyhow, please suggest a way to handle it via a single flag in the kernel --
>> which would be some kind of heuristic as we know from MAP_POPULATE. Having
>> an alternative at hand would make it easier to discuss this topic further. I
>> certainly *don't* want MAP_POPULATE semantics when it comes to
>> MADV_POPULATE, especially when it comes to shared mappings. Not useful in
>> QEMU now and in the future.
> 
> OK, this point is still not entirely clear to me. Elsewhere you are
> saying that QEMU cannot use MAP_POPULATE because it ignores errors
> and also it doesn't support sparse mappings because they apply to the
> whole mmap. These are all clear but it is less clear to me why the same
> semantic is not applicable for QEMU when used through madvise interface
> which can handle both of those.

It's a combination of things:

a) MAP_POPULATE never was an option simply because of deferred
    "prealloc=on" handling in QEMU, happening way after we created the
    memmap. Further it doesn't report if there was an error, which is
    another reason why it's basically useless for QEMU use cases.
b) QEMU uses manual read-write prefaulting for "preallocation", for
    example, to avoid SIGBUS on hugetlbfs or shmem at runtime. There are
    cases where we absolutely want to avoid crashing the VM later just
    because of a user error. MAP_POPULATE does *not* do what we want for
    shared mappings, because it triggers a read fault.
c) QEMU uses the same mechanism for prefaulting in RT environments,
    where we want to avoid any kind of pagefault, using mlock() etc.
d) MAP_POPULATE does not apply to sparse memory mappings that I'll be
    using more heavily in QEMU, also for the purpose of preallocation
    with virtio-mem.

See the current QEMU code along with a comment in

https://github.com/qemu/qemu/blob/972e848b53970d12cb2ca64687ef8ff797fb6236/util/oslib-posix.c#L496

it's especially bad for PMEM ("wear on the storage backing"), which is 
why we have to trust on users not to trigger preallocation/prefaulting 
on PMEM, otherwise (as already expressed via bug reports) we waste a lot 
of time when backing VMs on PMEM or forwarding NVDIMMs, unnecessarily 
read/writing (slow) DAX.

> Do I get it right that you really want to emulate the full fledged write
> fault to a) limit another write fault when the content is actually
> modified and b) prevent from potential errors during the write fault
> (e.g. mkwrite failing on the fs data)?

Yes, for the use case of "preallocation" in QEMU. See the QEMU link.

But again, the thing that makes it more complicated is that I can come 
up with some use cases that want to handle "shared mappings of ordinary 
files" a little better. Or the usefaultfd-wp example I gave, where 
prefaulting via MADV_POPULATE_READ can roughly half the population time.

>> We could make MADV_POPULATE act depending on the readability/writability of
>> a mapping. Use MADV_POPULATE_WRITE on writable mappings, use
>> MADV_POPULATE_READ on readable mappings. Certainly not perfect for use cases
>> where you have writable mappings that are mostly read only (as in the
>> example with fake-NVDIMMs I gave ...), but if it makes people happy, fine
>> with me. I mostly care about MADV_POPULATE_WRITE.
> 
> Yes, this is where my thinking was going as well. Essentially define
> MADV_POPULATE as "Populate the mapping with the memory based on the
> mapping access." This looks like a straightforward semantic to me and it
> doesn't really require any deep knowledge of internals.
> 
> Now, I was trying to compare which of those would be more tricky to
> understand and use and TBH I am not really convinced any of the two is
> much better. Separate READ/WRITE modes are explicit which can be good
> but it will require quite an advanced knowledge of the #PF behavior.
> On the other hand MADV_POPULATE would require some tricks like mmap,
> madvise and mprotect(to change to writable) when the data is really
> written to. I am not sure how much of a deal this would be for QEMU for
> example.

IIRC, at the time we enable background snapshotting, the VM is running 
and we cannot temporarily mprotect(PROT_READ) without making the guest 
crash. But again, uffd-wp handling is somewhat a special case because 
the implementation in the kernel is really suboptimal.

The reason I chose MADV_POPULATE_READ + MADV_POPULATE_WRITE is because 
it really mimics what user space currently does to get the job done.

I guess the important part to document is that "be careful when using 
MADV_POPULATE_READ because it might just populate the shared zeropage" 
and "be careful with MADV_POPULATE_WRITE because it will do the same as 
when writing to every page: dirty the pages such that they will have to 
be written back when backed by actual files".


The current MAN page entry for MADV_POPULATE_READ reads:

"
Populate (prefault) page tables readable for the whole range without 
actually reading. Depending on the underlying mapping, map the shared 
zeropage, preallocate memory or read the underlying file. Do not 
generate SIGBUS when populating fails, return an error instead.

If  MADV_POPULATE_READ succeeds, all page tables have been populated 
(prefaulted) readable once. If MADV_POPULATE_READ fails, some page 
tables might have been populated.

MADV_POPULATE_READ cannot be applied to mappings without read 
permissions  and  special mappings marked with the kernel-internal 
VM_PFNMAP and VM_IO.

Note that with MADV_POPULATE_READ, the process can still be killed at 
any moment when the system runs out of memory.
"


> 
> So, all that being said, I am not really sure. I am not really happy
> about READ/WRITE split but if a simpler interface is going to be a bad
> fit for existing usecases then I believe a proper way to go is the
> document the more complex interface thoroughly.

I think with the split we are better off long term without requiring 
workarounds (mprotect()) to make some use cases work in the long term.

But again, if there is a good justification why a single MADV_POPULATE 
make sense, I'm happy to change it. Again, for me, the most important 
thing long-term is MADV_POPULATE_WRITE because that's really what QEMU 
mainly uses right now for preallocation. But I can see use cases for 
MADV_POPULATE_READ as well.

Thanks for your input!

-- 
Thanks,

David / dhildenb

