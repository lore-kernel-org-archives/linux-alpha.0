From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Date: Wed, 17 Feb 2021 18:06:39 +0100
Message-ID: <9129686d-a272-fa8a-3f99-2de2fac52c93@redhat.com>
References: <20210217154844.12392-1-david@redhat.com>
 <726b0766-9624-69c5-5a45-ffad42c446b1@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613581617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=teZTA6Q4Aw5qzYmTXQsisbEZn/CxzO/4FfFNpRMYgZg=;
        b=Gpb+J8dp6CkVjY4reiUnk9V/e+84nsohs0qJ0sOiFNE0Sclr14OTGtfryptCqbKQHHNF32
        GrXZmPmc+tmRNOzbN9RAAgNGEFiJuEQLhcWoh3NcgVRIMS/v1LIszvtZ7s5UaDgDF3Wmxe
        vRaMp70FI8RHWKFMukqhBeHRETrwR+o=
In-Reply-To: <726b0766-9624-69c5-5a45-ffad42c446b1@intel.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>

On 17.02.21 17:46, Dave Hansen wrote:
> On 2/17/21 7:48 AM, David Hildenbrand wrote:
>> While MADV_DONTNEED and FALLOC_FL_PUNCH_HOLE provide us ways to reliably
>> discard memory, there is no generic approach to populate ("preallocate")
>> memory.
>>
>> Although mmap() supports MAP_POPULATE, it is not applicable to the concept
>> of sparse memory mappings, where we want to do populate/discard
>> dynamically and avoid expensive/problematic remappings. In addition,
>> we never actually report error during the final populate phase - it is
>> best-effort only.
> 
> Seems pretty sane to me.
> 
> But, I was surprised that MADV_WILLNEED was no mentioned.  It might be
> nice to touch on on why MADV_WILLNEED is a bad choice for this
> functionality?  We could theoretically have it populate anonymous
> mappings instead of just swapping in.

I stumbled over it, but it ended up looking like mixing in different 
semantics.

"Expect access in the near future." and "might be a good idea to read 
some pages" vs. "Definitely populate/preallocate all memory and 
definitely fail.".

> 
> I guess it's possible that folks are using MADV_WILLNEED on sparse
> mappings that they don't want to populate, but it would be nice to get
> that in the changelog.

Indeed: prime example is virtio-balloon in QEMU when deflating. Just 
because we are deflating the balloon doesn't mean that the guest is 
going to use all memory immediately - and that we want to actually 
consume memory immediately. ... we call MADV_WILLNEED unconditionally on 
any memory backing when deflating ...

I'll definitely add that to the changelog - thanks.

> 
> I was also a bit bummed to see the broad VM_IO/PFNMAP restriction show
> up again.  I was just looking at implementing pre-faulting for the new
> SGX driver:

I added that because __mm_populate() similarly skips over VM_IO | 
VM_PFNMAP. So it mimics existing "populate semantics" we have.

> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/kernel/cpu/sgx/driver.c
> 
> It has a vm_ops->fault handler, but the VMAs are VM_IO.  It obviously
> don't work with gup, though.  Not a deal breaker, and something we could
> certainly add to this later.

I assume you would then also want to support MAP_POPULATE, right? 
Because it ends up using __mm_populate() and would not work.

Thanks!

-- 
Thanks,

David / dhildenb

