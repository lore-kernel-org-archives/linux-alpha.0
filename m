From: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Date: Fri, 19 Feb 2021 11:25:51 -0800
Message-ID: <15da147c-e440-ee87-c505-a4684a5b29dc@oracle.com>
References: <20210217154844.12392-1-david@redhat.com>
 <20210218225904.GB6669@xz-x1>
 <b24996a6-7652-f88c-301e-28417637fd02@redhat.com>
 <20210219163157.GF6669@xz-x1>
 <41444eb8-8bb8-8d5b-4cec-be7fa7530d0e@redhat.com>
 <4d8e6f55-66a6-d701-6a94-79f5e2b23e46@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=43jX0YemR80pEyXOS00aLA0YdVuv51bCACRuKzge1xI=;
 b=FNr/YlgBYPCRcOM2xA9UaCA0LpazOrqAa7t/p/0fdEQtXvFvd1nJ3SYYbhJSrO5Dig9P
 Gjp3sBFgYkaENG+ojPKM4j8sIzHKuEVY1/B5lVSy3CFoTstwLiJGFKSVnlCn3F0NEGWH
 0QxUouOl8ZSkV3tZ7UN5nu2Fcp226BVqSjoL1jPBhgWwqOsYxXy+ZckFyv9AF4IrucO6
 2E7ebH7Ztnfhc7MbLpii7okuh0GVuwUUEIHGqtLp/urhRjxzmZkPvEqJMjHA9K5eGg55
 lHJsNu3VptnfxTBNGepWcbfHWqx1g2SD296+g1WN/uxrGy7sWM2akNu2FopUxGaFmSy7 tQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43jX0YemR80pEyXOS00aLA0YdVuv51bCACRuKzge1xI=;
 b=eVnueDwBSgV2yH1V7HIl/6FsRjaX3EDbPzy1T6y+KonZa2pwrySdqgyHHXcVj1N6WKo/PZ6qybCzgOjBoTZ4NgJv6lwzWscH30yWPjAo3q8euFNVcPGLieI2+YapWMijae5exvFAe2aq++JPHF7A0A+Ha6hxV461t8UuhJd22pg=
In-Reply-To: <4d8e6f55-66a6-d701-6a94-79f5e2b23e46@redhat.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.d>

On 2/19/21 11:14 AM, David Hildenbrand wrote:
>>> It's interesting to know about commit 1e356fc14be ("mem-prealloc: reduce large
>>> guest start-up and migration time.", 2017-03-14).  It seems for speeding up VM
>>> boot, but what I can't understand is why it would cause the delay of hugetlb
>>> accounting - I thought we'd fail even earlier at either fallocate() on the
>>> hugetlb file (when we use /dev/hugepages) or on mmap() of the memfd which
>>> contains the huge pages.  See hugetlb_reserve_pages() and its callers.  Or did
>>> I miss something?
>>
>> We should fail on mmap() when the reservation happens (unless
>> MAP_NORESERVE is passed) I think.
>>
>>>
>>> I think there's a special case if QEMU fork() with a MAP_PRIVATE hugetlbfs
>>> mapping, that could cause the memory accouting to be delayed until COW happens.
>>
>> That would be kind of weird. I'd assume the reservation gets properly
>> done during fork() - just like for VM_ACCOUNT.
>>
>>> However that's definitely not the case for QEMU since QEMU won't work at all as
>>> late as that point.
>>>
>>> IOW, for hugetlbfs I don't know why we need to populate the pages at all if we
>>> simply want to know "whether we do still have enough space"..  And IIUC 2)
>>> above is the major issue you'd like to solve too.
>>
>> To avoid page faults at runtime on access I think. Reservation <=
>> Preallocation.
> 
> I just learned that there is more to it: (test done on v5.9)
> 
> # echo 512 > /sys/devices/system/node/node0/hugepages/hugepages-2048kB/nr_hugepages
> # cat /sys/devices/system/node/node*/meminfo | grep HugePages_
> Node 0 HugePages_Total:   512
> Node 0 HugePages_Free:    512
> Node 0 HugePages_Surp:      0
> Node 1 HugePages_Total:     0
> Node 1 HugePages_Free:      0
> Node 1 HugePages_Surp:      0
> # cat /proc/meminfo  | grep HugePages_
> HugePages_Total:     512
> HugePages_Free:      512
> HugePages_Rsvd:        0
> HugePages_Surp:        0
> 
> # /usr/libexec/qemu-kvm -m 1G -smp 1 -object memory-backend-memfd,id=mem0,size=1G,hugetlb=on,hugetlbsize=2M,policy=bind,host-nodes=0 -numa node,nodeid=0,memdev=mem0 -hda Fedora-Cloud-Base-Rawhide-20201004.n.1.x86_64.qcow2 -nographic
> -> works just fine
> 
> # /usr/libexec/qemu-kvm -m 1G -smp 1 -object memory-backend-memfd,id=mem0,size=1G,hugetlb=on,hugetlbsize=2M,policy=bind,host-nodes=1 -numa node,nodeid=0,memdev=mem0 -hda Fedora-Cloud-Base-Rawhide-20201004.n.1.x86_64.qcow2 -nographic
> -> Does not fail nicely but crashes!
> 
> 
> See https://bugzilla.redhat.com/show_bug.cgi?id=1686261 for something similar, however, it no longer applies like that on more recent kernels.
> 
> Hugetlbfs reservations don't always protect you (especially with NUMA) - that's why e.g., libvirt always tells QEMU to prealloc.
> 
> I think the "issue" is that the reservation happens on mmap(). mbind() runs afterwards. Preallocation saves you from that.
> 
> I suspect something similar will happen with anonymous memory with mbind() even if we reserved swap space. Did not test yet, though.
> 

Sorry, for jumping in late ... hugetlb keyword just hit my mail filters :)

Yes, it is true that hugetlb reservations are not numa aware.  So, even if
pages are reserved at mmap time one could still SIGBUS if a fault is
restricted to a node with insufficient pages.

I looked into this some years ago, and there really is not a good way to
make hugetlb reservations numa aware.  preallocation, or on demand
populating as proposed here is a way around the issue.
-- 
Mike Kravetz
