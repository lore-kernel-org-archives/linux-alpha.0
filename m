From: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Date: Mon, 22 Feb 2021 14:19:02 +0100
Message-ID: <YDOvRv8sCVcgF6yC@dhcp22.suse.cz>
References: <20210217154844.12392-1-david@redhat.com>
 <640738b5-a47e-448b-586d-a1fb80131891@redhat.com>
 <YDOqA9nQHiuIrKBu@dhcp22.suse.cz>
 <73f73cf2-1b4e-bfa9-9a4c-3192d7b7a5ec@redhat.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1613999943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rSiPjSkLqdeOPyifVQ+VIJxm12MmG0Mig1onROPX2wY=;
        b=C+olW4OAqXGwjCEBjkvjzaeQ2iSZcqPzUB0qwohLeVfSOlRbkhMq4hWC3z9xopsQiTh01L
        r0kHW1kJSK4yMsiqYIK53zeKyR1lZzM/HwMQAvTL2dcDgUKoM5QLxqgOfUT5JQDdJUwP6a
        DHWRxIS4jdk/T8720GZYw4Nuywnb8TI=
Content-Disposition: inline
In-Reply-To: <73f73cf2-1b4e-bfa9-9a4c-3192d7b7a5ec@redhat.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E.J. Bottomle

On Mon 22-02-21 13:59:55, David Hildenbrand wrote:
> On 22.02.21 13:56, Michal Hocko wrote:
> > On Sat 20-02-21 10:12:26, David Hildenbrand wrote:
> > [...]
> > > Thinking about MADV_POPULATE vs. MADV_POPULATE_WRITE I wonder if it would be
> > > more versatile to break with existing MAP_POPULATE semantics and directly go
> > > with
> > > 
> > > MADV_POPULATE_READ: simulate user space read access without actually
> > > reading. Trigger a read fault if required.
> > > 
> > > MADV_POPULATE_WRITE: simulate user space write access without actually
> > > writing. Trigger a write fault if required.
> > > 
> > > For my use case, I could use MADV_POPULATE_WRITE on anonymous memory and
> > > RAM-backed files (shmem/hugetlb) - I would not have a minor fault when the
> > > guest inside the VM first initializes memory. This mimics how QEMU currently
> > > preallocates memory.
> > > 
> > > However, I would use MADV_POPULATE_READ on any !RAM-backed files where we
> > > actually have to write-back to a (slow?) device. Dirtying everything
> > > although the guest might not actually consume it in the near future might be
> > > undesired.
> > 
> > Isn't what the current mm_populate does?
> >          if ((vma->vm_flags & (VM_WRITE | VM_SHARED)) == VM_WRITE)
> >                  gup_flags |= FOLL_WRITE;
> > 
> > So it will write fault to shared memory mappings but it will touch
> > others.

Ble, I have writen that opposit to the actual behavior. It will write
fault on writeable private mappings and only touch on read/only or
private mappings.

> 
> Exactly. But for hugetlbfs/shmem ("!RAM-backed files") this is not what we
> want.

OK, then I must have misread your requirements. Maybe I just got lost in
all the combinations you have listed.
-- 
Michal Hocko
SUSE Labs
