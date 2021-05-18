From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH resend v2 2/5] mm/madvise: introduce
 MADV_POPULATE_(READ|WRITE) to prefault page tables
Date: Tue, 18 May 2021 14:03:52 +0200
Message-ID: <b2fa988d-9625-7c0e-ce83-158af0058e38@redhat.com>
References: <20210511081534.3507-1-david@redhat.com>
 <20210511081534.3507-3-david@redhat.com> <YKOR/8LzEaOgCvio@dhcp22.suse.cz>
 <bb0e2ebb-e66d-176c-b20a-fbadd95cde98@redhat.com>
 <YKOiV9VkEdYFM9nB@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621339437;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F7A0h/wa7e7/Tasvo9gaiD2QfuqTtOZnS8ypc2xwcz8=;
        b=DTS27fLufhJV3alG0gV1+kkaf0+lif+eSU1HS0RWFF3kBPa7WbC92J6OD8GD85YQATrrhZ
        dfy7CQI23BRIDaaD/pQbusGxihlZks4C3GxnomXfZE7xREibH1WYr/uQ8iAzBrH/+wlKvj
        wjwEzab9FZB4vNEMTd8XrSh+FQuKdYM=
In-Reply-To: <YKOiV9VkEdYFM9nB@dhcp22.suse.cz>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E.J. Bottomle

>>> This means that you want to have two different uses depending on the
>>> underlying mapping type. MADV_POPULATE_READ seems rather weak for
>>> anonymous/private mappings. Memory backed by zero pages seems rather
>>> unhelpful as the PF would need to do all the heavy lifting anyway.
>>> Or is there any actual usecase when this is desirable?
>>
>> Currently, userfaultfd-wp, which requires "some mapping" to be able to arm
>> successfully. In QEMU, we currently have to prefault the shared zeropage for
>> userfaultfd-wp to work as expected.
> 
> Just for clarification. The aim is to reduce the memory footprint at the
> same time, right? If that is really the case then this is worth adding.

Yes. userfaultfd-wp is right now used in QEMU for background 
snapshotting of VMs. Just because you trigger a background snapshot 
doesn't mean that you want to COW all pages. (especially, if your VM 
previously inflated the balloon, was using free page reporting etc.)

> 
>> I expect that use case might vanish over
>> time (eventually with new kernels and updated user space), but it might
>> stick for a bit.
> 
> Could you elaborate some more please?

After I raised that the current behavior of userfaultfd-wp is 
suboptimal, Peter started working on a userfaultfd-wp mode that doesn't 
require to prefault all pages just to have it working reliably -- 
getting notified when any page changes, including ones that haven't been 
populated yet and would have been populated with the shared zeropage on 
first access. Not sure what the state of that is and when we might see it.

> 
>> Apart from that, populating the shared zeropage might be relevant in some
>> corner cases: I remember there are sparse matrix algorithms that operate
>> heavily on the shared zeropage.
> 
> I am not sure I see why this would be a useful interface for those? Zero
> page read fault is really low cost. Or are you worried about cummulative
> overhead by entering the kernel many times?

Yes, cumulative overhead when dealing with large, sparse matrices. Just 
an example where I think it could be applied in the future -- but not 
that I consider populating the shared zeropage a really important use 
case in general (besides for userfaultfd-wp right now).

> 
>>> So the split into these two modes seems more like gup interface
>>> shortcomings bubbling up to the interface. I do expect userspace only
>>> cares about pre-faulting the address range. No matter what the backing
>>> storage is.
>>>
>>> Or do I still misunderstand all the usecases?
>>
>> Let me give you an example where we really cannot tell what would be best
>> from a kernel perspective.
>>
>> a) Mapping a file into a VM to be used as RAM. We might expect the guest
>> writing all memory immediately (e.g., booting Windows). We would want
>> MADV_POPULATE_WRITE as we expect a write access immediately.
>>
>> b) Mapping a file into a VM to be used as fake-NVDIMM, for example, ROOTFS
>> or just data storage. We expect mostly reading from this memory, thus, we
>> would want MADV_POPULATE_READ.
> 
> I am afraid I do not follow. Could you be more explicit about advantages
> of using those two modes for those example usecases? Is that to share
> resources (e.g. by not breaking CoW)?

I'm only talking about shared mappings "ordinary files" for now, because 
that's where MADV_POPULATE_READ vs MADV_POPULATE_WRITE differ in regards 
of "mark something dirty and write it back"; CoW doesn't apply to shared 
mappings, it's really just a difference in dirtying and having to write 
back. For things like PMEM/hugetlbfs/... we usually want 
MADV_POPULATE_WRITE because then we'd avoid a context switch when our VM 
actually writes to a page the first time -- and we don't care about 
dirtying, because we don't have writeback.

But again, that's just one use case I have in mind coming from the VM 
area. I consider MADV_POPULATE_READ really only useful when we are 
expecting mostly read access on a mapping. (I assume there are other use 
cases for databases etc. not explored yet where MADV_POPULATE_WRITE 
would not be desired for performance reasons)

> 
>> Instead of trying to be smart in the kernel, I think for this case it makes
>> much more sense to provide user space the options. IMHO it doesn't really
>> hurt to let user space decide on what it thinks is best.
> 
> I am mostly worried that this will turn out to be more confusing than
> helpful. People will need to grasp non trivial concepts and kernel
> internal implementation details about how read/write faults are handled.

And that's the point: in the simplest case (without any additional 
considerations about the underlying mapping), if you end up mostly 
*reading* MADV_POPULATE_READ is the right thing. If you end up mostly 
*writing* MADV_POPULATE_WRITE is the right thing. Only care has to be 
taken when you really want a "prealloction" as in "allocate backend 
storage" or "don't ever use the shared zeropage". I agree that these 
details require more knowledge, but so does anything that messes with 
memory mappings on that level (VMs, databases, ...).

QEMU currently implements exactly these two cases manually in user space.

Anyhow, please suggest a way to handle it via a single flag in the 
kernel -- which would be some kind of heuristic as we know from 
MAP_POPULATE. Having an alternative at hand would make it easier to 
discuss this topic further. I certainly *don't* want MAP_POPULATE 
semantics when it comes to MADV_POPULATE, especially when it comes to 
shared mappings. Not useful in QEMU now and in the future.

We could make MADV_POPULATE act depending on the readability/writability 
of a mapping. Use MADV_POPULATE_WRITE on writable mappings, use 
MADV_POPULATE_READ on readable mappings. Certainly not perfect for use 
cases where you have writable mappings that are mostly read only (as in 
the example with fake-NVDIMMs I gave ...), but if it makes people happy, 
fine with me. I mostly care about MADV_POPULATE_WRITE.

-- 
Thanks,

David / dhildenb

