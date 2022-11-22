From: Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH mm-unstable v1 07/20] mm: don't call vm_ops->huge_fault()
 in wp_huge_pmd()/wp_huge_pud() for private mappings
Date: Tue, 22 Nov 2022 15:50:06 +0100
Message-ID: <d40947e4-06c4-8413-9d53-e4926abd9559@suse.cz>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-8-david@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1669128607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TuOeD9hS5w47LsnqcPKQtrXy6koctaIzcHPxwbxmwbA=;
        b=aGZachSXiRVjKPJsrWk8CPop2PpOEMJr7spf/DAJ5bmOd/2f4r4PDMztApEKo2PcSlvmxW
        kUYly+UTyuJUxKmOQFyKK0uK83vpsu8HLfHf74wJV6xsDgOcFpyyuGww7bQkx1IkhT+zig
        CKpIYly4TJFynSwnq3h8C8XfDQxdhu4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1669128607;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TuOeD9hS5w47LsnqcPKQtrXy6koctaIzcHPxwbxmwbA=;
        b=3O83wprOyy/Za1HsOlbBbN841s6+bHjQppNWEZSAiaC61+01222yq5NJYcQdKsFuOVce+G
        lcMh2DB+p4IaJ9Ag==
Content-Language: en-US
In-Reply-To: <20221116102659.70287-8-david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-perf-users-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-security-module-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter Xu <peterx-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>

On 11/16/22 11:26, David Hildenbrand wrote:
> If we already have a PMD/PUD mapped write-protected in a private mapping
> and we want to break COW either due to FAULT_FLAG_WRITE or
> FAULT_FLAG_UNSHARE, there is no need to inform the file system just like on
> the PTE path.
> 
> Let's just split (->zap) + fallback in that case.
> 
> This is a preparation for more generic FAULT_FLAG_UNSHARE support in
> COW mappings.
> 
> Signed-off-by: David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Reviewed-by: Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>

Nits:

> ---
>  mm/memory.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index c35e6cd32b6a..d47ad33c6487 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4802,6 +4802,7 @@ static inline vm_fault_t create_huge_pmd(struct vm_fault *vmf)
>  static inline vm_fault_t wp_huge_pmd(struct vm_fault *vmf)
>  {
>  	const bool unshare = vmf->flags & FAULT_FLAG_UNSHARE;
> +	vm_fault_t ret;
>  
>  	if (vma_is_anonymous(vmf->vma)) {
>  		if (likely(!unshare) &&
> @@ -4809,11 +4810,13 @@ static inline vm_fault_t wp_huge_pmd(struct vm_fault *vmf)
>  			return handle_userfault(vmf, VM_UFFD_WP);
>  		return do_huge_pmd_wp_page(vmf);
>  	}
> -	if (vmf->vma->vm_ops->huge_fault) {
> -		vm_fault_t ret = vmf->vma->vm_ops->huge_fault(vmf, PE_SIZE_PMD);
>  
> -		if (!(ret & VM_FAULT_FALLBACK))
> -			return ret;
> +	if (vmf->vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) {
> +		if (vmf->vma->vm_ops->huge_fault) {

I guess it could have been a single if with && and the reduced identation
could fit keeping 'ret' declaration inside.
AFAICS the later patches don't build more on top of this anyway.
But also fine keeping as is.

(the hunk below same)

> +			ret = vmf->vma->vm_ops->huge_fault(vmf, PE_SIZE_PMD);
> +			if (!(ret & VM_FAULT_FALLBACK))
> +				return ret;
> +		}
>  	}
>  
>  	/* COW or write-notify handled on pte level: split pmd. */
> @@ -4839,14 +4842,17 @@ static vm_fault_t wp_huge_pud(struct vm_fault *vmf, pud_t orig_pud)
>  {
>  #if defined(CONFIG_TRANSPARENT_HUGEPAGE) &&			\
>  	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
> +	vm_fault_t ret;
> +
>  	/* No support for anonymous transparent PUD pages yet */
>  	if (vma_is_anonymous(vmf->vma))
>  		goto split;
> -	if (vmf->vma->vm_ops->huge_fault) {
> -		vm_fault_t ret = vmf->vma->vm_ops->huge_fault(vmf, PE_SIZE_PUD);
> -
> -		if (!(ret & VM_FAULT_FALLBACK))
> -			return ret;
> +	if (vmf->vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) {
> +		if (vmf->vma->vm_ops->huge_fault) {
> +			ret = vmf->vma->vm_ops->huge_fault(vmf, PE_SIZE_PUD);
> +			if (!(ret & VM_FAULT_FALLBACK))
> +				return ret;
> +		}
>  	}
>  split:
>  	/* COW or write-notify not handled on PUD level: split pud.*/

