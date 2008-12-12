From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: [RESEND] [PATCH] alpha: remove dead BIO_VMERGE_BOUNDARY
Date: Fri, 12 Dec 2008 09:50:42 +0100
Message-ID: <20081212085042.GK23742@kernel.dk>
References: <20081212174824M.fujita.tomonori@lab.ntt.co.jp>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081212174824M.fujita.tomonori@lab.ntt.co.jp>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Fri, Dec 12 2008, FUJITA Tomonori wrote:
> This is a resend of:
> 
> http://marc.info/?l=linux-kernel&m=122482703716610&w=2
> 
> Jens, can you merge this via your tree? There is no tree for Alpha.

Sure, I'll put it in the 2.6.29 pile.

> 
> =
> From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
> Subject: [PATCH] alpha: remove dead BIO_VMERGE_BOUNDARY
> 
> The block layer dropped the virtual merge feature
> (b8b3e16cfe6435d961f6aaebcfd52a1ff2a988c5). BIO_VMERGE_BOUNDARY
> definition is meaningless now.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> ---
>  arch/alpha/include/asm/io.h |    3 ---
>  1 files changed, 0 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
> index e971ab0..eda9b90 100644
> --- a/arch/alpha/include/asm/io.h
> +++ b/arch/alpha/include/asm/io.h
> @@ -96,9 +96,6 @@ static inline dma_addr_t __deprecated isa_page_to_bus(struct page *page)
>  	return page_to_phys(page);
>  }
>  
> -/* This depends on working iommu.  */
> -#define BIO_VMERGE_BOUNDARY	(alpha_mv.mv_pci_tbi ? PAGE_SIZE : 0)
> -
>  /* Maximum PIO space address supported?  */
>  #define IO_SPACE_LIMIT 0xffff
>  
> -- 
> 1.5.6.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

-- 
Jens Axboe

