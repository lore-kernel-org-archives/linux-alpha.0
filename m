From: Martyn Welch <martyn@welchs.me.uk>
Subject: Re: [PATCH 0/6] phase out CONFIG_VIRT_TO_BUS
Date: Tue, 7 Jun 2022 10:09:49 +0100
Message-ID: <CAEccXecB=rkZ1Kejmzcfay6qMMVo7Kb7SovSq+Xs1zWMnJOxnQ@mail.gmail.com>
References: <20220606084109.4108188-1-arnd@kernel.org> <Yp3ID86TBFxl7qyL@kroah.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <Yp3ID86TBFxl7qyL@kroah.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org, Khalid Aziz <khalid@gonehiking.org>, linux-scsi@vger.kernel.org, Manohar Vanga <manohar.vanga@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org, Denis Efremov <efremov@linux.com>

On Mon, 6 Jun 2022 at 10:25, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 06, 2022 at 10:41:03AM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The virt_to_bus/bus_to_virt interface has been deprecated for
> > decades. After Jakub Kicinski put a lot of work into cleaning out the
> > network drivers using them, there are only a couple of other drivers
> > left, which can all be removed or otherwise cleaned up, to remove the
> > old interface for good.
> >
> > Any out of tree drivers using virt_to_bus() should be converted to
> > using the dma-mapping interfaces, typically dma_alloc_coherent()
> > or dma_map_single()).
> >
> > There are a few m68k and ppc32 specific drivers that keep using the
> > interfaces, but these are all guarded with architecture-specific
> > Kconfig dependencies, and are not actually broken.
> >
> > There are still a number of drivers that are using virt_to_phys()
> > and phys_to_virt() in place of dma-mapping operations, and these
> > are often broken, but they are out of scope for this series.
>
> I'll take patches 1 and 2 right now through my staging tree if that's
> ok.
>

Hi,

I'd love to say that I could fix this stuff up, however I've lacked access to
suitable hardware for a long time now and don't foresee that changing any
time soon...

Martyn

> thanks,
>
> greg k-h
>
