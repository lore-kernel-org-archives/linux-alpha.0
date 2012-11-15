From: Shuah Khan <shuah.khan@hp.com>
Subject: Re: [PATCH RFT linux-next] alpha: dma-mapping: support
 debug_dma_mapping_error
Date: Thu, 15 Nov 2012 10:49:28 -0700
Message-ID: <1353001768.2532.31.camel@lorien2>
References: <1351269163.4013.27.camel@lorien2>
Reply-To: shuah.khan@hp.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1351269163.4013.27.camel@lorien2>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, m.szyprowski@samsung.com
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, kyungmin.park@samsung.com, arnd@arndb.de, andrzej.p@samsung.com, linux-alpha@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, shuahkhan@gmail.com

On Fri, 2012-10-26 at 10:32 -0600, Shuah Khan wrote:
> Add support for debug_dma_mapping_error() call to avoid warning from
> debug_dma_unmap() interface when it checks for mapping error checked
> status. Without this patch, device driver failed to check map error
> warning is generated.
> 
> Signed-off-by: Shuah Khan <shuah.khan@hp.com>
> ---
>  arch/alpha/include/asm/dma-mapping.h |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/alpha/include/asm/dma-mapping.h b/arch/alpha/include/asm/dma-mapping.h
> index dfa32f0..b4d483b 100644
> --- a/arch/alpha/include/asm/dma-mapping.h
> +++ b/arch/alpha/include/asm/dma-mapping.h
> @@ -32,6 +32,7 @@ static inline void dma_free_attrs(struct device *dev, size_t size,
>  
>  static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
>  {
> +	debug_dma_mapping_error(dev, dma_addr);
>  	return get_dma_ops(dev)->mapping_error(dev, dma_addr);
>  }
>  

Marek,

This is for alpha to go through your tree.

-- Shuah


