From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH resend v2 2/5] mm/madvise: introduce
 MADV_POPULATE_(READ|WRITE) to prefault page tables
Date: Tue, 18 May 2021 12:32:12 +0200
Message-ID: <bb0e2ebb-e66d-176c-b20a-fbadd95cde98@redhat.com>
References: <20210511081534.3507-1-david@redhat.com>
 <20210511081534.3507-3-david@redhat.com> <YKOR/8LzEaOgCvio@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621333937;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I3GoBhYUm/DKIxdTnLjldHt3dau0GNiE51gCpNBcSM0=;
        b=eZwJ2NSd4PKIV/GqNXVaAA9B6D37QU/rOKWCYfsfils4iqUdXQoe3uG+4LGR9gbmYSLZ9o
        SVxyd2Si86fMcQGqLi7qVRSIK2ytmldw6QwtbHXgeo5aRR5nSI0qPH0GwHFCbCb9GMPttP
        2t2cFjMMpjG3zB34iLW3p1CWs+yKJDc=
In-Reply-To: <YKOR/8LzEaOgCvio@dhcp22.suse.cz>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E.J. Bottomle

On 18.05.21 12:07, Michal Hocko wrote:
> [sorry for a long silence on this]
> 
> On Tue 11-05-21 10:15:31, David Hildenbrand wrote:
> [...]
> 
> Thanks for the extensive usecase description. That is certainly useful
> background. I am sorry to bring this up again but I am still not
> convinced that READ/WRITE variant are the best interface.

Thanks for having time to look into this.

>   
>> While the use case for MADV_POPULATE_WRITE is fairly obvious (i.e.,
>> preallocate memory and prefault page tables for VMs), one issue is that
>> whenever we prefault pages writable, the pages have to be marked dirty,
>> because the CPU could dirty them any time. while not a real problem for
>> hugetlbfs or dax/pmem, it can be a problem for shared file mappings: each
>> page will be marked dirty and has to be written back later when evicting.
>>
>> MADV_POPULATE_READ allows for optimizing this scenario: Pre-read a whole
>> mapping from backend storage without marking it dirty, such that eviction
>> won't have to write it back. As discussed above, shared file mappings
>> might require an explciit fallocate() upfront to achieve
>> preallcoation+prepopulation.
> 
> This means that you want to have two different uses depending on the
> underlying mapping type. MADV_POPULATE_READ seems rather weak for
> anonymous/private mappings. Memory backed by zero pages seems rather
> unhelpful as the PF would need to do all the heavy lifting anyway.
> Or is there any actual usecase when this is desirable?

Currently, userfaultfd-wp, which requires "some mapping" to be able to 
arm successfully. In QEMU, we currently have to prefault the shared 
zeropage for userfaultfd-wp to work as expected. I expect that use case 
might vanish over time (eventually with new kernels and updated user 
space), but it might stick for a bit.

Apart from that, populating the shared zeropage might be relevant in 
some corner cases: I remember there are sparse matrix algorithms that 
operate heavily on the shared zeropage.

> 
> So the split into these two modes seems more like gup interface
> shortcomings bubbling up to the interface. I do expect userspace only
> cares about pre-faulting the address range. No matter what the backing
> storage is.
> 
> Or do I still misunderstand all the usecases?

Let me give you an example where we really cannot tell what would be 
best from a kernel perspective.

a) Mapping a file into a VM to be used as RAM. We might expect the guest 
writing all memory immediately (e.g., booting Windows). We would want 
MADV_POPULATE_WRITE as we expect a write access immediately.

b) Mapping a file into a VM to be used as fake-NVDIMM, for example, 
ROOTFS or just data storage. We expect mostly reading from this memory, 
thus, we would want MADV_POPULATE_READ.

Instead of trying to be smart in the kernel, I think for this case it 
makes much more sense to provide user space the options. IMHO it doesn't 
really hurt to let user space decide on what it thinks is best.

-- 
Thanks,

David / dhildenb

