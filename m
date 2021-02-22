From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Date: Mon, 22 Feb 2021 16:30:47 +0100
Message-ID: <7d7d2213-92a4-0419-20ad-bba7071a279c@redhat.com>
References: <20210217154844.12392-1-david@redhat.com>
 <640738b5-a47e-448b-586d-a1fb80131891@redhat.com>
 <YDOqA9nQHiuIrKBu@dhcp22.suse.cz>
 <73f73cf2-1b4e-bfa9-9a4c-3192d7b7a5ec@redhat.com>
 <YDOvRv8sCVcgF6yC@dhcp22.suse.cz>
 <3b5cd68d-c4ac-c6be-8824-34c541d5377b@redhat.com>
 <YDO5d+pbPBsjv13T@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614007867;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ibOntcfVMPryl4chcvMDuXiG7DIYwm8AcKE8thK3PgA=;
        b=cIvH5qanO4rs6m/6gvQ6zSJNZAb/ITTzkE2KVXTu+vdCoj15WJMWhdqwZQusgeKKinX67A
        1mlJBIEzZF+8htSzWYzXDZOtSFaTgro9Go/D79gpe6ZYkQ+LPHFD3TaEaX3rXDuWWQEQ+W
        jSXZa0GCdaVQFGngCyjszSurGMqr8k8=
In-Reply-To: <YDO5d+pbPBsjv13T@dhcp22.suse.cz>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E.J. Bottomle

On 22.02.21 15:02, Michal Hocko wrote:
> On Mon 22-02-21 14:22:37, David Hildenbrand wrote:
>>>> Exactly. But for hugetlbfs/shmem ("!RAM-backed files") this is not what we
>>>> want.
>>>
>>> OK, then I must have misread your requirements. Maybe I just got lost in
>>> all the combinations you have listed.
>>
>> Another special case could be dax/pmem I think. You might want to fault it
>> in readable/writable but not perform an actual read/write unless really
>> required.
>>
>> QEMU phrases this as "don't cause wear on the storage backing".
> 
> Sorry for being dense here but I still do not follow. If you do not want
> to read then what do you want to populate from? Only map if it is in the

In the context of VMs it's usually rather a mean to preallocate backend 
storage - which would also happen on read access. See below on case 4).

> page cache?

Let's try to untangle my thoughts regarding VMs. We could have as 
backend storage for our VM:

1) Anonymous memory
2) hugetlbfs (private/shared)
3) tmpfs/shmem (private/shared)
4) Ordinary files (shared)
5) DAX/PMEM (shared)

Excluding special cases (hypervisor upgrades with 2) and 3) ), we expect 
to have pre-existing content in files only in 4) and 5). 4) and 5) might 
be used as NVDIMM backend for a guest, or as DIMM backend.

The first access of our VM to memory could be
a) Write: the usual case when exposed as RAM/DIMM to out guest.
b) Read: possible case when exposed as an NVDIMM to our guest (we don't
    know). But eventually, we might write to (parts of) NVDIMMs later.

We "preallocate"/"populate" memory of our VM so that
- We know we have sufficient backend storage (esp. hugetlbfs, shmem,
   files) - so we don't randomly crash the VM. My most important use
   case.
- We avoid page faults (including page zeroing!) at runtime. Especially
   relevant for RT workloads.

With 1), 2), and 3) we want to have pages faulted in writable - we 
expect that our guest will write to that memory. MADV_POPULATE would do 
that only for 1), and MAP_PRIVATE of 2). For the shared parts, we would 
want MADV_POPULATE_WRITE semantics.

With 5), we already had complaints that preallcoation in QEMU takes a 
long time - because we end up actually reading/writing slow PMEM 
(libvirt now disables preallcoation for that reason, which makes sense). 
However, MADV_POPULATE_WRITE would help to prefault without actually 
reading/writing pmem - if we want to avoid any minor faults.

With 4), I think we primarily prealloc/prefault to make sure we have 
sufficient backend storage. fallocate() might do a better job just for 
the allocation. But if there is sufficient RAM it might make sense to 
prefault all guest RAM at least readable - then we only have a minor 
fault when the VM writes to it and might avoid having to go to disk. 
Prefaulting everything writable means that we *have to* write back all 
guest RAM even if the guest never accessed it. So I think there are 
cases where MADV_POPULATE_READ (current MADV_POPULATE) semantics could 
make sense.


-- 
Thanks,

David / dhildenb

