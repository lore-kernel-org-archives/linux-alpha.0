From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH RFCv2] mm/madvise: introduce MADV_POPULATE_(READ|WRITE) to
 prefault/prealloc memory
Date: Tue, 09 Mar 2021 08:35:44 +0100
Message-ID: <6ecd754406fffe851be6543025203b6b@sf-tec.de>
References: <20210308164520.18323-1-david@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20210308164520.18323-1-david@redhat.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.d>

> diff --git a/mm/internal.h b/mm/internal.h
> index 9902648f2206..a5c4ed23b1db 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -340,6 +340,9 @@ void __vma_unlink_list(struct mm_struct *mm,
> struct vm_area_struct *vma);
>  #ifdef CONFIG_MMU
>  extern long populate_vma_page_range(struct vm_area_struct *vma,
>  		unsigned long start, unsigned long end, int *nonblocking);
> +extern long faultin_vma_page_range(struct vm_area_struct *vma,
> +				   unsigned long start, unsigned long end,
> +				   bool write, int *nonblocking);
>  extern void munlock_vma_pages_range(struct vm_area_struct *vma,
>  			unsigned long start, unsigned long end);
>  static inline void munlock_vma_pages_all(struct vm_area_struct *vma)

The parameter name does not match the one in the implementation.

Otherwise the implementation looks fine AFAICT.

Eike
