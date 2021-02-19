From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Date: Fri, 19 Feb 2021 09:20:16 +0100
Message-ID: <b24996a6-7652-f88c-301e-28417637fd02@redhat.com>
References: <20210217154844.12392-1-david@redhat.com>
 <20210218225904.GB6669@xz-x1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613722838;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rjPfJdHvh7od31Gt2k9bHEivBC+h3on21GgJt1VAVlM=;
        b=aqv3qUnEUggzU+5QVgiqt/uFzdulMQmZBkRpqWQELnuLQAAoomrXI5l9gBJPoflkljKy1V
        IwgyDgdM7F/Z2XJ/3HrX/cSj0t4FJgHwQmhiY2b/nM5nj+Ha6mRzx7d9OxShJrSvOd1O8I
        8J1XoiMGbjSroiOS8spA22W5tfvmyYo=
In-Reply-To: <20210218225904.GB6669@xz-x1>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.d>

On 18.02.21 23:59, Peter Xu wrote:
> Hi, David,
> 
> On Wed, Feb 17, 2021 at 04:48:44PM +0100, David Hildenbrand wrote:
>> When we manage sparse memory mappings dynamically in user space - also
>> sometimes involving MADV_NORESERVE - we want to dynamically populate/
>> discard memory inside such a sparse memory region. Example users are
>> hypervisors (especially implementing memory ballooning or similar
>> technologies like virtio-mem) and memory allocators. In addition, we want
>> to fail in a nice way if populating does not succeed because we are out of
>> backend memory (which can happen easily with file-based mappings,
>> especially tmpfs and hugetlbfs).
> 
> Could you explain a bit more on how do you plan to use this new interface for
> the virtio-balloon scenario?

Sure, that will bring up an interesting point to discuss 
(MADV_POPULATE_WRITE).

I'm planning on using it in virtio-mem: whenever the guests requests the 
hypervisor (via a virtio-mem device) to make specific blocks available 
("plug"), I want to have a configurable option ("populate=on" / 
"prealloc="on") to perform safety checks ("prealloc") and populate page 
tables.

This becomes especially relevant for private/shared hugetlbfs and shared 
files/shmem where we have a limited pool size (e.g., huge pages, tmpfs 
size, filesystem size). But it will also come in handy when just 
preallocating (esp. zeroing) anonymous memory.

For virito-balloon it is not applicable because it really only supports 
anonymous memory and we cannot fail requests to deflate ...

--- Example ---

Example: Assume the guests requests to make 128 MB available and we're 
using hugetlbfs. Assume we're out of huge pages in the hypervisor - we 
want to fail the request - I want to do some kind of preallocation.

So I could do fallocate() on anything that's MAP_SHARED, but not on 
anything that's MAP_PRIVATE. hugetlbfs via memfd() cannot be 
preallocated without going via SIGBUS handlers.

--- QEMU memory configurations ---

I see the following combinations relevant in QEMU that I want to support 
with virito-mem:

1) MAP_PRIVATE anonymous memory
2) MAP_PRIVATE on hugetlbfs (esp. via memfd)
3) MAP_SHARED on hugetlbfs (esp. via memfd)
4) MAP_SHARED on shmem (file / memfd)
5) MAP_SHARED on some sparse file.

Other MAP_PRIVATE mappings barely make any sense to me - "read the file 
and write to page cache" is not really applicable to VM RAM (not to 
mention doing fallocate(PUNCH_HOLE) that invalidates the private copies 
of all other mappings on that file).

--- Ways to populate/preallocate ---

I see the following ways to populate/preallocate:

a) MADV_POPULATE: write fault on writable MAP_PRIVATE, read fault on
    MAP_SHARED
b) Writing to MAP_PRIVATE | MAP_SHARED from user space.
c) (below) MADV_POPULATE_WRITE: write fault on writable MAP_PRIVATE |
    MAP_SHARED

Especially, 2) is kind of weird as implemented in QEMU 
(util/oslib-posix.c:do_touch_pages):

"Read & write back the same value, so we don't corrupt existing user/app 
data ... TODO: get a better solution from kernel so we don't need to 
write at all so we don't cause wear on the storage backing the region..."

So if we have zero, we write zero. We'll COW pages, triggering a write 
fault - and that's the only good thing about it. For example, similar to 
MADV_POPULATE, nothing stops KSM from merging anonymous pages again. So 
for anonymous memory the actual write is not helpful at all. Similarly 
for hugetlbfs, the actual write is not necessary - but there is no other 
way to really achieve the goal.

--- How MADV_POPULATE is useful ---

With virito-mem, our VM will usually write to memory before it reads it.

With 1) and 2) it does exactly what I want: trigger COW / allocate 
memory and trigger a write fault. The only issue with 1) is that KSM 
might come around and undo our work - but that could only be avoided by 
writing random numbers to all pages from user space. Or we could simply 
rather disable KSM in that setup ...

--- How MADV_POPULATE is not perfect ---

KSM can merge anonymous pages again. Just like the current QEMU 
implementation. The only way around that is writing random numbers to 
the pages or mlocking all memory. No big news.

Nothing stops reclaim/swap code from depopulating when using files. 
Again, no big new - we have to mlock.

--- HOW MADV_POPULATE_WRITE might be useful ---

With 3) 4) 5) MADV_POPULATE does partially what I want: preallocate 
memory and populate page tables. But as it's a read fault, I think we'll 
have another minor fault on access. Not perfect, but better than failing 
with SIGBUS. One way around that would be having an additional 
MADV_POPULATE_WRITE, to use in cases where it makes sense (I think at 
least 3) and 4), most probably not on actual files like 5) ).

Trigger a write fault without actually writing.


Makes sense?

-- 
Thanks,

David / dhildenb

