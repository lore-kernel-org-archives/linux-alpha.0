From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH mm-unstable v1 05/20] mm: add early FAULT_FLAG_WRITE
 consistency checks
Date: Fri, 18 Nov 2022 18:03:00 +0100
Message-ID: <e4dd50b8-7ae9-a6fd-8765-2b2dd90ea1a8@suse.cz>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-6-david@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1668790981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fK2sdLfZqlxwdzyzeVC6Yy7wx8vYkqbsaxCq7BgcB58=;
        b=LS+hNeQ4geGgj4IXWO5+0pS41T+O+kbhrtYk+pP+vVRIoeuKs+oW13F6Ht+tR7USTuEyYF
        w44h38vtDK2kFPU+O2RCals0tqkM1nJKUf86qC24NucyatqLyr4TTvgkMY8PsBAD2uBX+L
        cHUUR5s7utA0uOsl3r11W1mUfWblbh8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1668790981;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fK2sdLfZqlxwdzyzeVC6Yy7wx8vYkqbsaxCq7BgcB58=;
        b=khb2AjlSZXqyWGI6UYbr+/ZmYWHGQEHMU8He9yK4yvl4DWCKZ0jYtp3ha5rFTfTmR/yC2u
        C7/yrrNfpsGvyLBA==
Content-Language: en-US
In-Reply-To: <20221116102659.70287-6-david@redhat.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On 11/16/22 11:26, David Hildenbrand wrote:
> Let's catch abuse of FAULT_FLAG_WRITE early, such that we don't have to
> care in all other handlers and might get "surprises" if we forget to do
> so.
> 
> Write faults without VM_MAYWRITE don't make any sense, and our
> maybe_mkwrite() logic could have hidden such abuse for now.
> 
> Write faults without VM_WRITE on something that is not a COW mapping is
> similarly broken, and e.g., do_wp_page() could end up placing an
> anonymous page into a shared mapping, which would be bad.
> 
> This is a preparation for reliable R/O long-term pinning of pages in
> private mappings, whereby we want to make sure that we will never break
> COW in a read-only private mapping.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  mm/memory.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index e014435a87db..c4fa378ec2a0 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5170,6 +5170,14 @@ static vm_fault_t sanitize_fault_flags(struct vm_area_struct *vma,
>  		 */
>  		if (!is_cow_mapping(vma->vm_flags))
>  			*flags &= ~FAULT_FLAG_UNSHARE;
> +	} else if (*flags & FAULT_FLAG_WRITE) {
> +		/* Write faults on read-only mappings are impossible ... */
> +		if (WARN_ON_ONCE(!(vma->vm_flags & VM_MAYWRITE)))
> +			return VM_FAULT_SIGSEGV;
> +		/* ... and FOLL_FORCE only applies to COW mappings. */
> +		if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE) &&
> +				 !is_cow_mapping(vma->vm_flags)))
> +			return VM_FAULT_SIGSEGV;
>  	}
>  	return 0;
>  }

