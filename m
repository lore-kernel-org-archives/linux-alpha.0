From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Date: Wed, 17 Feb 2021 08:46:18 -0800
Message-ID: <726b0766-9624-69c5-5a45-ffad42c446b1@intel.com>
References: <20210217154844.12392-1-david@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20210217154844.12392-1-david@redhat.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>

On 2/17/21 7:48 AM, David Hildenbrand wrote:
> While MADV_DONTNEED and FALLOC_FL_PUNCH_HOLE provide us ways to reliably
> discard memory, there is no generic approach to populate ("preallocate")
> memory.
> 
> Although mmap() supports MAP_POPULATE, it is not applicable to the concept
> of sparse memory mappings, where we want to do populate/discard
> dynamically and avoid expensive/problematic remappings. In addition,
> we never actually report error during the final populate phase - it is
> best-effort only.

Seems pretty sane to me.

But, I was surprised that MADV_WILLNEED was no mentioned.  It might be
nice to touch on on why MADV_WILLNEED is a bad choice for this
functionality?  We could theoretically have it populate anonymous
mappings instead of just swapping in.

I guess it's possible that folks are using MADV_WILLNEED on sparse
mappings that they don't want to populate, but it would be nice to get
that in the changelog.

I was also a bit bummed to see the broad VM_IO/PFNMAP restriction show
up again.  I was just looking at implementing pre-faulting for the new
SGX driver:

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/kernel/cpu/sgx/driver.c

It has a vm_ops->fault handler, but the VMAs are VM_IO.  It obviously
don't work with gup, though.  Not a deal breaker, and something we could
certainly add to this later.
