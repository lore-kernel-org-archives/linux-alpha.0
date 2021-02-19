From: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Date: Fri, 19 Feb 2021 14:23:10 -0500
Message-ID: <20210219192310.GI6669@xz-x1>
References: <20210217154844.12392-1-david@redhat.com>
 <20210218225904.GB6669@xz-x1>
 <b24996a6-7652-f88c-301e-28417637fd02@redhat.com>
 <20210219163157.GF6669@xz-x1>
 <41444eb8-8bb8-8d5b-4cec-be7fa7530d0e@redhat.com>
Mime-Version: 1.0
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613762595;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fdCSAN64npUd+P1YDfJ63MqsRK7B7rJbfhaQ54M1yUc=;
        b=UB1kTviubUmLmit1ExQoe6Ps1l/QqotAnFIrwA/4wyXXOafBwpSqGohS2uaZ21LALMYZy4
        J2N+gSI/27XoLHCIcw/OlHgz797flJz26uFzknDWLgWhwqrw/0vbJu5vcTC+RYz15mg7+O
        Oz2adYb5WxS1V/jQIr/i//BNQriWDsI=
Content-Disposition: inline
In-Reply-To: <41444eb8-8bb8-8d5b-4cec-be7fa7530d0e@redhat.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.d>

On Fri, Feb 19, 2021 at 06:13:47PM +0100, David Hildenbrand wrote:
> On 19.02.21 17:31, Peter Xu wrote:
> > On Fri, Feb 19, 2021 at 09:20:16AM +0100, David Hildenbrand wrote:
> > > On 18.02.21 23:59, Peter Xu wrote:
> > > > Hi, David,
> > > > 
> > > > On Wed, Feb 17, 2021 at 04:48:44PM +0100, David Hildenbrand wrote:
> > > > > When we manage sparse memory mappings dynamically in user space - also
> > > > > sometimes involving MADV_NORESERVE - we want to dynamically populate/
> > > > > discard memory inside such a sparse memory region. Example users are
> > > > > hypervisors (especially implementing memory ballooning or similar
> > > > > technologies like virtio-mem) and memory allocators. In addition, we want
> > > > > to fail in a nice way if populating does not succeed because we are out of
> > > > > backend memory (which can happen easily with file-based mappings,
> > > > > especially tmpfs and hugetlbfs).

[1]

> > E.g., can we simply ask the kernel "how much memory this process can still
> > allocate", then get a number out of it?  I'm not sure whether it can be done
> 
> Anything like that is completely racy and unreliable.

The failure path won't be racy imho - If we can detect current process doesn't
have enough memory budget, it'll be more efficient to fail even before trying
to populate any memory and then drop part of them again.

But I see your point - indeed it's good to guarantee the guest won't crash at
any point of further guest side memory access.

Another question: can the user actually specify arbitrary max-length for the
virtio-mem device (which decides the maximum memory this device could possibly
consume)?  I thought we should check that first before realizing the device and
we really shouldn't fail any guest memory access if that check passed. Feel
free to correct me..

[...]

> > 
> > I think there's a special case if QEMU fork() with a MAP_PRIVATE hugetlbfs
> > mapping, that could cause the memory accouting to be delayed until COW happens.
> 
> That would be kind of weird. I'd assume the reservation gets properly done
> during fork() - just like for VM_ACCOUNT.

AFAIK VM_ACCOUNT is never applied for hugetlbfs.  Neither do I know any
accounting done for hugetlbfs during fork(), if not taking the pinned pages
into account - that is definitely a special case.

> 
> > However that's definitely not the case for QEMU since QEMU won't work at all as
> > late as that point.
> > 
> > IOW, for hugetlbfs I don't know why we need to populate the pages at all if we
> > simply want to know "whether we do still have enough space"..  And IIUC 2)
> > above is the major issue you'd like to solve too.
> 
> To avoid page faults at runtime on access I think. Reservation <=
> Preallocation.

Yes.  Besides my above question regarding max-length of virtio-mem device: we
care most about private mappings of hugetlbfs/shmem here, am I right?

I'm thinking why we'd need MAP_PRIVATE of these at all for VM context.

It's definitely not the major scenario when they're used shared with either ovs
or any non-qemu process, because then MAP_SHARED is a must. Then if we use them
privately, can we simply always make it MAP_SHARED?

IMHO MAP_PRIVATE could be helpful only if we'd like the COW scemantics, so it
means when there're something already, we'd like to keep that snapshot but
trigger page copy when writes.  But is that the case for a VM memory backend
which should be always zeroed by default?  Then, I'm wondering can we simply
avoid bothering with VM_PRIVATE on these file-backed memory at all - then we'll
naturally get fallocate() on hand, which seems already working for us.

Thanks,

-- 
Peter Xu

