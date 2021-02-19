From: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Date: Fri, 19 Feb 2021 11:35:21 +0100
Message-ID: <YC+UaTVUn0o4Zynz@dhcp22.suse.cz>
References: <20210217154844.12392-1-david@redhat.com>
Mime-Version: 1.0
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1613730927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7EbNQMFcSNI0oMItBkDkX6r6vOi1t5rzTfwIGyjH8mk=;
        b=NNrBTsfniB4NnydtCSgc8ZsIFoWLIMNsTMJUjTrG2N9/X9kOUGuSMsm0kIrNGWfZy8Ik0c
        V2RTEJyYrvOlxtcC7JiV4cm5jwugeQTy+CvzXaXIFvOJRB3HCp9B4g3N2Gc7kfqiWAwgGp
        9Bjxeh8YcPgEkWrYVdU3mSW+cXWDcUg=
Content-Disposition: inline
In-Reply-To: <20210217154844.12392-1-david@redhat.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@intel.com>, Hugh Dickins <hughd@google.com>, Rik van Riel <riel@surriel.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E.J. Bottomle

On Wed 17-02-21 16:48:44, David Hildenbrand wrote:
[...]

I only got  to the implementation now.

> +static long madvise_populate(struct vm_area_struct *vma,
> +			     struct vm_area_struct **prev,
> +			     unsigned long start, unsigned long end)
> +{
> +	struct mm_struct *mm = vma->vm_mm;
> +	unsigned long tmp_end;
> +	int locked = 1;
> +	long pages;
> +
> +	*prev = vma;
> +
> +	while (start < end) {
> +		/*
> +		 * We might have temporarily dropped the lock. For example,
> +		 * our VMA might have been split.
> +		 */
> +		if (!vma || start >= vma->vm_end) {
> +			vma = find_vma(mm, start);
> +			if (!vma)
> +				return -ENOMEM;
> +		}

Why do you need to find a vma when you already have one. do_madvise will
give you your vma already. I do understand that you want to finish the
vma for some errors but that shouldn't require handling vmas. You should
be in the shope of one here unless I miss anything.

> +
> +		/* Bail out on incompatible VMA types. */
> +		if (vma->vm_flags & (VM_IO | VM_PFNMAP) ||
> +		    !vma_is_accessible(vma)) {
> +			return -EINVAL;
> +		}
> +
> +		/*
> +		 * Populate pages and take care of VM_LOCKED: simulate user
> +		 * space access.
> +		 *
> +		 * For private, writable mappings, trigger a write fault to
> +		 * break COW (i.e., shared zeropage). For other mappings (i.e.,
> +		 * read-only, shared), trigger a read fault.
> +		 */
> +		tmp_end = min_t(unsigned long, end, vma->vm_end);
> +		pages = populate_vma_page_range(vma, start, tmp_end, &locked);
> +		if (!locked) {
> +			mmap_read_lock(mm);
> +			*prev = NULL;
> +			vma = NULL;
> +		}
> +		if (pages < 0) {
> +			switch (pages) {
> +			case -EINTR:
> +			case -ENOMEM:
> +				return pages;
> +			case -EHWPOISON:
> +				/* Skip over any poisoned pages. */
> +				start += PAGE_SIZE;
> +				continue;
> +			case -EBUSY:
> +			case -EAGAIN:
> +				continue;
> +			default:
> +				pr_warn_once("%s: unhandled return value: %ld\n",
> +					     __func__, pages);
> +				return -ENOMEM;
> +			}
> +		}
> +		start += pages * PAGE_SIZE;
> +	}
> +	return 0;
> +}
> +
>  /*
>   * Application wants to free up the pages and associated backing store.
>   * This is effectively punching a hole into the middle of a file.
> @@ -934,6 +1001,8 @@ madvise_vma(struct vm_area_struct *vma, struct vm_area_struct **prev,
>  	case MADV_FREE:
>  	case MADV_DONTNEED:
>  		return madvise_dontneed_free(vma, prev, start, end, behavior);
> +	case MADV_POPULATE:
> +		return madvise_populate(vma, prev, start, end);
>  	default:
>  		return madvise_behavior(vma, prev, start, end, behavior);
>  	}
> @@ -954,6 +1023,7 @@ madvise_behavior_valid(int behavior)
>  	case MADV_FREE:
>  	case MADV_COLD:
>  	case MADV_PAGEOUT:
> +	case MADV_POPULATE:
>  #ifdef CONFIG_KSM
>  	case MADV_MERGEABLE:
>  	case MADV_UNMERGEABLE:
> -- 
> 2.29.2
> 

-- 
Michal Hocko
SUSE Labs
