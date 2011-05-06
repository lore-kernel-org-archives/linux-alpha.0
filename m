From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: Re: [PATCH] alpha: Add DMA_ERROR_CODE defn to avert compiler error
 in drm
Date: Fri, 6 May 2011 21:43:44 +0900
Message-ID: <20110506214052V.fujita.tomonori@lab.ntt.co.jp>
References: <1304496817-7646-1-git-send-email-mcree@orcon.net.nz>
	<BANLkTiknKa8xq5UQYTWKZnGDqVyAjGhVmw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BANLkTiknKa8xq5UQYTWKZnGDqVyAjGhVmw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: mattst88@gmail.com
Cc: mcree@orcon.net.nz, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru

On Wed, 4 May 2011 17:59:29 -0400
Matt Turner <mattst88@gmail.com> wrote:

> Other architectures define this differently.
> 
> arch/ia64/include/asm/dma-mapping.h:#define DMA_ERROR_CODE 0
> arch/microblaze/include/asm/dma-mapping.h:#define DMA_ERROR_CODE
>          (~(dma_addr_t)0x0)
> arch/powerpc/include/asm/dma-mapping.h:#define DMA_ERROR_CODE
>  (~(dma_addr_t)0x0)
> arch/sparc/include/asm/dma-mapping.h:#define DMA_ERROR_CODE
> (~(dma_addr_t)0x0)
> arch/x86/include/asm/dma-mapping.h:#define DMA_ERROR_CODE       0
> 
> Any idea what the reason is?

Because an invalid DMA address is architecture specific. To be exact,
an invalid DMA address is DMA operation specific.

As I wrote in another mail, this patch is wrong.

Architectures don't need to define DMA_ERROR_CODE.

Some architectures need multiple dma_mapping_error functions. You
could use DMA_ERROR_CODE in order to avoid duplicated code like
this. That is, you define only for dma_map_ops that needs the own
mapping_error function.

static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
{
	struct dma_map_ops *ops = get_dma_ops(dev);
	if (ops->mapping_error)
		return ops->mapping_error(dev, dma_addr);

	return (dma_addr == DMA_ERROR_CODE);
}
