From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Date: Sat, 20 Feb 2021 10:01:00 +0100
Message-ID: <2073702b-9e09-2033-2915-628c7b7ccb3d@redhat.com>
References: <20210217154844.12392-1-david@redhat.com>
 <20210218225904.GB6669@xz-x1>
 <b24996a6-7652-f88c-301e-28417637fd02@redhat.com>
 <20210219163157.GF6669@xz-x1>
 <41444eb8-8bb8-8d5b-4cec-be7fa7530d0e@redhat.com>
 <4d8e6f55-66a6-d701-6a94-79f5e2b23e46@redhat.com>
 <15da147c-e440-ee87-c505-a4684a5b29dc@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613811682;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JgoL6yAU+V/ArfjxO3XDCSurXdtNKbGCFrJc0uCVVRc=;
        b=OKXfWYhJmM5Iu9Z+loWXuV1KRRnkrLicW79Ooo8ifmcUEO9c7dAXg2MZdHPbUDYfglekmx
        nBipeXSRd14eEsqRmdPnaZz9J+/mCpqcs919ACpWX9oozKkIHZkfj+XH6r3b94zqzjV2Mf
        sXERgTnusJHAvYuT1pnysQcVrSAFw0U=
In-Reply-To: <15da147c-e440-ee87-c505-a4684a5b29dc@oracle.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Kravetz <mike.kravetz@oracle.com>, Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.d>

> Sorry, for jumping in late ... hugetlb keyword just hit my mail filters :)
> 

Sorry for not realizing to cc you before I sent out the man page update :)

> Yes, it is true that hugetlb reservations are not numa aware.  So, even if
> pages are reserved at mmap time one could still SIGBUS if a fault is
> restricted to a node with insufficient pages.
> 
> I looked into this some years ago, and there really is not a good way to
> make hugetlb reservations numa aware.  preallocation, or on demand
> populating as proposed here is a way around the issue.


Thanks for confirming, this makes a lot of sense to me now.


-- 
Thanks,

David / dhildenb

