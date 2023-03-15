From: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v4 06/36] alpha: Implement the new page table range API
Date: Wed, 15 Mar 2023 11:41:10 +0200
Message-ID: <ZBGStjiZsZ3vqx9e@kernel.org>
References: <20230315051444.3229621-1-willy@infradead.org>
 <20230315051444.3229621-7-willy@infradead.org>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678873284;
        bh=Cim+4pekCAc6dpHMNLRE6AIUDtCV/gkcBRk0QINAJ5Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nrXQuPUT4evsWtsWlZ2uMBFB1LfoezrU7lVIQLMe07h99kaVdYPx8T+x7G4CxROhm
         y3BVzMDBY0G5vUSbtkElRhOt7stkFUGlvkLFdLb3Pvj8y3XQwcE1Enp5sJxg60koFA
         EauRumzpUMFZZ1lgyDx8aox8RlMZ4fL9c1IS+laRhaGdYhdNibg6qwz5EscTjEVVKM
         c3Z4k/LgV1A/CtnRNPtdnayMGaHAnoog9eStV5YAPxd7Mk6mRQ36VnBdJaGPEorQiJ
         ORmbTlbzhmnZpxA+wQDL1B39w6D9TCwJWKWQN74JSPTKhpxhAHWdmZFVv440S6iPZ2
         K6JBddKX5nqQw==
Content-Disposition: inline
In-Reply-To: <20230315051444.3229621-7-willy@infradead.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On Wed, Mar 15, 2023 at 05:14:14AM +0000, Matthew Wilcox (Oracle) wrote:
> Add PFN_PTE_SHIFT, update_mmu_cache_range() and flush_icache_pages().
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/alpha/include/asm/cacheflush.h | 10 ++++++++++
>  arch/alpha/include/asm/pgtable.h    |  9 +++++++--
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/cacheflush.h b/arch/alpha/include/asm/cacheflush.h
> index 9945ff483eaf..3956460e69e2 100644
> --- a/arch/alpha/include/asm/cacheflush.h
> +++ b/arch/alpha/include/asm/cacheflush.h
> @@ -57,6 +57,16 @@ extern void flush_icache_user_page(struct vm_area_struct *vma,
>  #define flush_icache_page(vma, page) \
>  	flush_icache_user_page((vma), (page), 0, 0)
>  
> +/*
> + * Both implementations of flush_icache_user_page flush the entire
> + * address space, so one call, no matter how many pages.
> + */
> +static inline void flush_icache_pages(struct vm_area_struct *vma,
> +		struct page *page, unsigned int nr)
> +{
> +	flush_icache_user_page(vma, page, 0, 0);
> +}
> +
>  #include <asm-generic/cacheflush.h>
>  
>  #endif /* _ALPHA_CACHEFLUSH_H */
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
> index ba43cb841d19..6c24c408b8e9 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -26,7 +26,6 @@ struct vm_area_struct;
>   * hook is made available.
>   */
>  #define set_pte(pteptr, pteval) ((*(pteptr)) = (pteval))
> -#define set_pte_at(mm,addr,ptep,pteval) set_pte(ptep,pteval)
>  
>  /* PMD_SHIFT determines the size of the area a second-level page table can map */
>  #define PMD_SHIFT	(PAGE_SHIFT + (PAGE_SHIFT-3))
> @@ -189,7 +188,8 @@ extern unsigned long __zero_page(void);
>   * and a page entry and page directory to the page they refer to.
>   */
>  #define page_to_pa(page)	(page_to_pfn(page) << PAGE_SHIFT)
> -#define pte_pfn(pte)	(pte_val(pte) >> 32)
> +#define PFN_PTE_SHIFT		32
> +#define pte_pfn(pte)		(pte_val(pte) >> PFN_PTE_SHIFT)
>  
>  #define pte_page(pte)	pfn_to_page(pte_pfn(pte))
>  #define mk_pte(page, pgprot)						\
> @@ -303,6 +303,11 @@ extern inline void update_mmu_cache(struct vm_area_struct * vma,
>  {
>  }
>  
> +static inline void update_mmu_cache_range(struct vm_area_struct *vma,
> +		unsigned long address, pte_t *ptep, unsigned int nr)
> +{
> +}
> +
>  /*
>   * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
>   * are !pte_none() && !pte_present().
> -- 
> 2.39.2
> 
> 

-- 
Sincerely yours,
Mike.
