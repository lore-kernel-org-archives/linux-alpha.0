From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH-RFC 03/10] alpha: switch to GENERIC_PCI_IOMAP
Date: Sun, 4 Dec 2011 12:50:37 +0200
Message-ID: <20111204105036.GM15464@redhat.com>
References: <cover.1322163031.git.mst@redhat.com>
 <4245e7d8f484de6512fd4a9e4cba5b90cc111899.1322163031.git.mst@redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4245e7d8f484de6512fd4a9e4cba5b90cc111899.1322163031.git.mst@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On Thu, Nov 24, 2011 at 10:17:23PM +0200, Michael S. Tsirkin wrote:
> alpha copied pci_iomap from generic code to avoid
> pulling the rest of iomap.c in.  Since that's in
> a separate file now, we can reuse the common implementation.
> 
> The only difference is handling of nocache flag,
> that turns out to be done correctly by the
> generic code since arch/alpha/include/asm/io.h
> defines ioremap_nocache same as ioremap.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Sorry to nag - any ACKs/NACKs on the alpha changes
(both this, and 'alpha: drop pci_iomap/pci_iounmap from pci-noop.c')?
I intend to send this to Linus if there are no objections. Thanks!

> ---
>  arch/alpha/Kconfig      |    1 +
>  arch/alpha/kernel/pci.c |   26 +-------------------------
>  2 files changed, 2 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 3636b11..56a4df9 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -315,6 +315,7 @@ config ISA_DMA_API
>  config PCI
>  	bool
>  	depends on !ALPHA_JENSEN
> +	select GENERIC_PCI_IOMAP
>  	default y
>  	help
>  	  Find out whether you have a PCI motherboard. PCI is the name of a
> diff --git a/arch/alpha/kernel/pci.c b/arch/alpha/kernel/pci.c
> index c9ab94e..f3cae27 100644
> --- a/arch/alpha/kernel/pci.c
> +++ b/arch/alpha/kernel/pci.c
> @@ -508,30 +508,7 @@ sys_pciconfig_iobase(long which, unsigned long bus, unsigned long dfn)
>  	return -EOPNOTSUPP;
>  }
>  
> -/* Create an __iomem token from a PCI BAR.  Copied from lib/iomap.c with
> -   no changes, since we don't want the other things in that object file.  */
> -
> -void __iomem *pci_iomap(struct pci_dev *dev, int bar, unsigned long maxlen)
> -{
> -	resource_size_t start = pci_resource_start(dev, bar);
> -	resource_size_t len = pci_resource_len(dev, bar);
> -	unsigned long flags = pci_resource_flags(dev, bar);
> -
> -	if (!len || !start)
> -		return NULL;
> -	if (maxlen && len > maxlen)
> -		len = maxlen;
> -	if (flags & IORESOURCE_IO)
> -		return ioport_map(start, len);
> -	if (flags & IORESOURCE_MEM) {
> -		/* Not checking IORESOURCE_CACHEABLE because alpha does
> -		   not distinguish between ioremap and ioremap_nocache.  */
> -		return ioremap(start, len);
> -	}
> -	return NULL;
> -}
> -
> -/* Destroy that token.  Not copied from lib/iomap.c.  */
> +/* Destroy an __iomem token.  Not copied from lib/iomap.c.  */
>  
>  void pci_iounmap(struct pci_dev *dev, void __iomem * addr)
>  {
> @@ -539,7 +516,6 @@ void pci_iounmap(struct pci_dev *dev, void __iomem * addr)
>  		iounmap(addr);
>  }
>  
> -EXPORT_SYMBOL(pci_iomap);
>  EXPORT_SYMBOL(pci_iounmap);
>  
>  /* FIXME: Some boxes have multiple ISA bridges! */
> -- 
> 1.7.5.53.gc233e
