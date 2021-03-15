From: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH RFCv2] mm/madvise: introduce MADV_POPULATE_(READ|WRITE)
 to prefault/prealloc memory
Date: Mon, 15 Mar 2021 16:03:53 +0300
Message-ID: <20210315130353.iqnwsnp2c2wpt4y2@box>
References: <20210308164520.18323-1-david@redhat.com>
 <20210315122213.k52wtlbbhsw42pks@box>
 <7d607d1c-efd5-3888-39bb-9e5f8bc08185@redhat.com>
Mime-Version: 1.0
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/qOUfo30PmDfy59I8NSJRneNR2Umpzy9YtVUdna4m5M=;
        b=qIqESwX8UcVPz/tRxKsCHl4esn02ZSSAlHCPzPZLxv99wXfXzlp6VFAza1Vy0JT2/L
         Wt138+S5W3UxXpRTA7+owK6XaBvAnSHZGkNuqj8v+ZQQ8/RPH+hOTMGuZTDqWwwssYVM
         mx5UQuIqmmb5Cbf8/Ne/bE11VLMvw65g4YajJvAq4NytDSWbYPoQASv7w/tSsieTjPfQ
         g2PHlQjquIIbXarHbYwFIxvM9rQ6X0eC7E1GT3Y6OafGhvguqHdT/tcj01G/Wu7EKjiX
         ChIrinG5Dt3i2OU8UpS6sID56lC72dTJdnz0V+6y/2j7PL4/T+6W4so0usK7fVpYnlhu
         JWjw==
Content-Disposition: inline
In-Reply-To: <7d607d1c-efd5-3888-39bb-9e5f8bc08185@redhat.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.d>

On Mon, Mar 15, 2021 at 01:25:40PM +0100, David Hildenbrand wrote:
> On 15.03.21 13:22, Kirill A. Shutemov wrote:
> > On Mon, Mar 08, 2021 at 05:45:20PM +0100, David Hildenbrand wrote:
> > > +			case -EHWPOISON: /* Skip over any poisoned pages. */
> > > +				start += PAGE_SIZE;
> > > +				continue;
> > 
> > Why is it good approach? It's not abvious to me.
> 
> My main motivation was to simplify return code handling. I don't want to
> return -EHWPOISON to user space

Why? Hiding the problem under the rug doesn't help anybody. SIGBUS later
is not better than an error upfront.

-- 
 Kirill A. Shutemov
