From: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Date: Mon, 22 Feb 2021 15:02:31 +0100
Message-ID: <YDO5d+pbPBsjv13T@dhcp22.suse.cz>
References: <20210217154844.12392-1-david@redhat.com>
 <640738b5-a47e-448b-586d-a1fb80131891@redhat.com>
 <YDOqA9nQHiuIrKBu@dhcp22.suse.cz>
 <73f73cf2-1b4e-bfa9-9a4c-3192d7b7a5ec@redhat.com>
 <YDOvRv8sCVcgF6yC@dhcp22.suse.cz>
 <3b5cd68d-c4ac-c6be-8824-34c541d5377b@redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1614002552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tQUwCSCIacoozWWbNg5Y75DeEqHO/V82HG8+4MkdleE=;
        b=XJ//OJFgHkJCft0lm/Ifx1G1glYUfDjs1X+uDhSgDlMcoEZI/bmJC+JOl/344uas/6oD4e
        +RhSfh2QTNn91hYBsi/YrtrCufelAskC+zbrJ3zFaWm7LPgzOfPdOYzmRKO2WMKjvw21a+
        yGgIyiIC/ZD+eEDBaHDilHVfTPMo6Qw=
Content-Disposition: inline
In-Reply-To: <3b5cd68d-c4ac-c6be-8824-34c541d5377b@redhat.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E.J. Bottomle

On Mon 22-02-21 14:22:37, David Hildenbrand wrote:
> > > Exactly. But for hugetlbfs/shmem ("!RAM-backed files") this is not what we
> > > want.
> > 
> > OK, then I must have misread your requirements. Maybe I just got lost in
> > all the combinations you have listed.
> 
> Another special case could be dax/pmem I think. You might want to fault it
> in readable/writable but not perform an actual read/write unless really
> required.
> 
> QEMU phrases this as "don't cause wear on the storage backing".

Sorry for being dense here but I still do not follow. If you do not want
to read then what do you want to populate from? Only map if it is in the
page cache?
-- 
Michal Hocko
SUSE Labs
