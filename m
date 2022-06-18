From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Sat, 18 Jun 2022 13:06:40 +1200
Message-ID: <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=KRIeihzYwpT99jVYyWrBvkWlYlvrvIZJfg260Yku6Lc=;
        b=mYCiRA6jX3TZBBpH5i1bdKxf86pnFybirRcUnA7+QegXGbzOVw+vVyBSconShTfcN0
         cCwY9Lg+Wp1DUlN7ZuDKZXZp+Lq9oTrhj5Egt9NASpHMRY0WFnq2TqiOXmxGI5seYlbP
         q0BPpHgaiqex7reMZd7eeiSPLbAesZfnXOSNpNddBnH0OtREDZ0fHr/GsKwCbGO2CEAh
         0hN2+Q0eH6pq4ZYITkDSH3pFg/hKtXahXOuIosfi8Y0II3BWuxt8tZ5GTulif6PPtR6w
         mWvi9cySEswvHdKCNsD70zRyxq32NFDfKs677RtcCSsSo3yIFNheD9lUFe9of5dO2FCw
         T3OQ==
In-Reply-To: <20220617125750.728590-4-arnd@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arnd Bergmann <arnd@kernel.org>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org, Khalid Aziz <khalid@gonehiking.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org, Denis Efremov <efremov@linux.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Michael Ellerman <mpe@ellerman.id.au>

Arnd,

Am 18.06.2022 um 00:57 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
>
> All architecture-independent users of virt_to_bus() and bus_to_virt()
> have been fixed to use the dma mapping interfaces or have been
> removed now.  This means the definitions on most architectures, and the
> CONFIG_VIRT_TO_BUS symbol are now obsolete and can be removed.
>
> The only exceptions to this are a few network and scsi drivers for m68k
> Amiga and VME machines and ppc32 Macintosh. These drivers work correctly
> with the old interfaces and are probably not worth changing.

The Amiga SCSI drivers are all old WD33C93 ones, and replacing 
virt_to_bus by virt_to_phys in the dma_setup() function there would 
cause no functional change at all.

drivers/vme/bridges/vme_ca91cx42.c hasn't been used at all on m68k (it 
is a PCI-to-VME bridge chipset driver that would be needed on 
architectures that natively use a PCI bus). I haven't found anything 
that selects that driver, so not sure it is even still in use??

That would allow you to drop the remaining virt_to_bus define from 
arch/m68k/include/asm/virtconvert.h.

I could submit a patch to convert the Amiga SCSI drivers to use 
virt_to_phys if Geert and the SCSI maintainers think it's worth the churn.

32bit powerpc is a different matter though.

Cheers,

	Michael
