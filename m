From: Niklas Schnelle <schnelle-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
Subject: Re: [PATCH v2 13/21] s390/pci: don't set failed sg dma_address to
 DMA_MAPPING_ERROR
Date: Mon, 02 Aug 2021 12:34:13 +0200
Message-ID: <a5a46d84866f69df8c9737ecd8b066b61f24960a.camel@linux.ibm.com>
References: <20210723175008.22410-1-logang@deltatee.com>
 <20210723175008.22410-14-logang@deltatee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=r00k+UjFn2pP62ZTrfQkfAUimzcY0iIqFp/tRGXpoq0=;
 b=XB+IyIVRuwsaGl5Cf36GJrmEG3pUanAUVbJd0L+oKz2n9pFqA/PMFgwKaU8Fqyy8Lva3
 Kbt8Pm8E3v6Do/WIyQyINblL2EUrwMVz8/MgaVk9CKB/lYzJLp0Z77DY+Z/NLG27Hxbj
 E9qpS5txHaS6nt9qU2jVBdzVhvDQmwEAwKpzUg/IADG8yUZYRc/KRZKQB9m3YaMNAQ/V
 mqocdQdQhDdcY8hBX72GpQ0R0Ltra1dQR25fDeh1xYBUCQnH2894AsakTiIyquwCzLQd
 SFjOXifLtRwVjfMNlR/0nvfzPGZm64KH9KxFjtA2pZJTcvqIwBuMeqWbhKoD7NaDevz8 Aw== 
In-Reply-To: <20210723175008.22410-14-logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org
Cc: Vasily Gorbik <gor-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Heiko Carstens <hca-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Martin Oliveira <martin.oliveira-N4T0u6BTIXMybS5Ee8rs3A@public.gmane.org>, Stephen Bates <sbates-pv7U853sEMVWk0Htik3J/w@public.gmane.org>, Christian Borntraeger <borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Gerald Schaefer <gerald.schaefer-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>

On Fri, 2021-07-23 at 11:50 -0600, Logan Gunthorpe wrote:
> Setting the ->dma_address to DMA_MAPPING_ERROR is not part of
> the ->map_sg calling convention, so remove it.
> 
> Link: https://lore.kernel.org/linux-mips/20210716063241.GC13345-jcswGhMUV9g@public.gmane.org/
> Suggested-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
> Signed-off-by: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
> Cc: Niklas Schnelle <schnelle-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
> Cc: Gerald Schaefer <gerald.schaefer-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
> Cc: Heiko Carstens <hca-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
> Cc: Vasily Gorbik <gor-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
> Cc: Christian Borntraeger <borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/s390/pci/pci_dma.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/s390/pci/pci_dma.c b/arch/s390/pci/pci_dma.c
> index c78b02012764..be48e5b5bfcf 100644
> --- a/arch/s390/pci/pci_dma.c
> +++ b/arch/s390/pci/pci_dma.c
> @@ -492,7 +492,6 @@ static int s390_dma_map_sg(struct device *dev, struct scatterlist *sg,
>  	for (i = 1; i < nr_elements; i++) {
>  		s = sg_next(s);
>  
> -		s->dma_address = DMA_MAPPING_ERROR;
>  		s->dma_length = 0;
>  
>  		if (s->offset || (size & ~PAGE_MASK) ||

Acked-by: Niklas Schnelle <schnelle-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>

Thanks!
