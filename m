From: David Rientjes <rientjes@google.com>
Subject: Re: [RFC][PATCH v2 00/23] (alpha) __vmalloc: add gfp flags variant
 of pte and pmd allocation
Date: Mon, 14 Mar 2011 13:54:54 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1103141351210.31514@chino.kir.corp.google.com>
References: <AANLkTik3qn-RVUTZp5+gTk+wB9SO_MsxySHEwE8Yzi-e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1300136099; bh=ksiOHSLk8306lcb4z+lIg1ei39Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	b=cYwXXNMTVHDZ+nneGzu5Ar2l8wNvsCgOPkwQYJfYpU29DUFGmgp2UarBDf+ve+JR+
	 rgwqjqMNwwxnFOm+AxRhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=beta;
        h=domainkey-signature:date:from:x-x-sender:to:cc:subject:in-reply-to
         :message-id:references:user-agent:mime-version:content-type;
        bh=D6ipWva+PK87GXPoVa9am7X89/NuuBNYkjxXxnlWcXk=;
        b=tf/HnSDdVUPWUOhpzvHN1Nyb5aGVTshwTwKhUkMBLNWw2YFC4ZGgv0KSHYTMSMwYuR
         t7game4RtpSUakBEkV6A==
In-Reply-To: <AANLkTik3qn-RVUTZp5+gTk+wB9SO_MsxySHEwE8Yzi-e@mail.gmail.com>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Prasad Joshi <prasadjoshi124@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org

On Mon, 14 Mar 2011, Prasad Joshi wrote:

> __vmalloc: propagating GFP allocation flag.
> 

This isn't the correct title of the patch.  You don't need to actually 
give them titles, the subject line will be used instead.

The subject line should also indicate this as patch 01/2 and it should 
read "mm, alpha: add gfp flags variant of pte and pmd allocations".

> - adds functions to allow caller to pass the GFP flag for memory allocation
> - helps in fixing the Bug 30702 (__vmalloc(GFP_NOFS) can callback
>   file system evict_inode).
> 
> Signed-off-by: Anand Mitra <mitra@kqinfotech.com>
> Signed-off-by: Prasad Joshi <prasadjoshi124@gmail.com>

The first signed-off-by line usually indicates the author of the change in 
which case this would require the first line of the email to be

From: Anand Mitra <mitra@kqinfotech.com>

if that's the correct attribution.

> ---
> Chnagelog:
> arch/alpha/include/asm/pgalloc.h |   18 ++++++++++++++----
> 1 files changed, 14 insertions(+), 4 deletions(-)
> ---
> diff --git a/arch/alpha/include/asm/pgalloc.h b/arch/alpha/include/asm/pgalloc.h
> index bc2a0da..d05dfc2 100644
> --- a/arch/alpha/include/asm/pgalloc.h
> +++ b/arch/alpha/include/asm/pgalloc.h
> @@ -38,10 +38,15 @@ pgd_free(struct mm_struct *mm, pgd_t *pgd)
>  }
> 
>  static inline pmd_t *
> +__pmd_alloc_one(struct mm_struct *mm, unsigned long address, gfp_t gfp_mask)
> +{
> +	return (pmd_t *)__get_free_page(gfp_mask | __GFP_ZERO);
> +}
> +
> +static inline pmd_t *
>  pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>  {
> -	pmd_t *ret = (pmd_t *)__get_free_page(GFP_KERNEL|__GFP_REPEAT|__GFP_ZERO);
> -	return ret;
> +	return __pmd_alloc_one(mm, address, GFP_KERNEL | __GFP_REPEAT);
>  }
> 
>  static inline void
> @@ -51,10 +56,15 @@ pmd_free(struct mm_struct *mm, pmd_t *pmd)
>  }
> 
>  static inline pte_t *
> +__pte_alloc_one_kernel(struct mm_struct *mm, unsigned long addressi,
> gfp_t gfp_mask)

This patch is corrupt probably because of your email client (and all other 
patches in this series are corrupt, as well).  Please see 
Documentation/email-clients.txt and try sending test patches to a 
colleague and git-apply them first.

BTW, s/addressi/address/ for this function definition.

> +{
> +	return (pte_t *)__get_free_page(gfp_mask | __GFP_ZERO);
> +}
> +
> +static inline pte_t *
>  pte_alloc_one_kernel(struct mm_struct *mm, unsigned long address)
>  {
> -	pte_t *pte = (pte_t *)__get_free_page(GFP_KERNEL|__GFP_REPEAT|__GFP_ZERO);
> -	return pte;
> +	return __pte_alloc_one_kernel(mm, address, GFP_KERNEL | __GFP_REPEAT);
>  }
> 
>  static inline void

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
