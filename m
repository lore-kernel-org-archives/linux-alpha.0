From: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 5/6] scsi: remove stale BusLogic driver
Date: Mon, 6 Jun 2022 17:00:11 +0200
Message-ID: <CAK8P3a0pqQHMucGgZDcLpoWMhoyU5yppXK=8y4Wsn0QL7=uD0g@mail.gmail.com>
References: <20220606084109.4108188-1-arnd@kernel.org> <20220606084109.4108188-6-arnd@kernel.org>
 <alpine.DEB.2.21.2206061057060.19680@angie.orcam.me.uk>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654527634;
        bh=tFvHiguChguydwXgPPk94DDRc3Gna/VqX+wPqkO+GTs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OTdTyPoYJ5bNQJSkFPmXEY+eWfJAwSfsYSgk4cODU6UlwBWjeYnv0Sxuz9qV0iSQM
         shE15IXcfCEfv8Mx+p/2oCrRlPgIxb29Lqv+ZUjwFZNe4LdNbfrgVQtNqfyVVnq8bi
         XXptqX4w9uja7FnAnfusW3dxnevauNzz6jq5hzXcmY+3JqZZyKCwbuEiefqMgnxCHt
         T0oumu3+Q5kYXm0Mn9+i87nfTx/T4bJLwOfqVC2aNx8tOMfbYaNABmt4DoR4wkLm1J
         PB4SHhF3GrdL+mEGCiRj9gV6ZRpnlaKARAORIAFsT5McazycsfBDejvPwC+ypF73Lz
         0VIsuzIGYeRKg==
In-Reply-To: <alpine.DEB.2.21.2206061057060.19680@angie.orcam.me.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Khalid Aziz <khalid@gonehiking.org>, linux-scsi <linux-scsi@vger.kernel.org>, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arch <linux-arch@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Parisc List <linux-parisc@vger.kernel.org>, Denis Efremov <efremov@linux.com>, Matt Wang <wwentao@vmware.com>

On Mon, Jun 6, 2022 at 12:40 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Mon, 6 Jun 2022, Arnd Bergmann wrote:
>
> > This was in turn fixed in commit 56f396146af2 ("scsi: BusLogic: Fix
> > 64-bit system enumeration error for Buslogic"), 8 years later.
> >
> > The fact that this was found at all is an indication that there are
> > users, and it seems that Maciej, Matt and Khalid all have access to
> > this hardware, but if it took eight years to find the problem,
> > it's likely that nobody actually relies on it.
>
>  Umm, I use it with a 32-bit system, so it would be quite an issue for me
> to discover a problem with 64-bit configurations.  And I quite rely on
> this system for various stuff too!

Ok, good to know.

> > Remove it as part of the global virt_to_bus()/bus_to_virt() removal.
> > If anyone is still interested in keeping this driver, the alternative
> > is to stop it from using bus_to_virt(), possibly along the lines of
> > how dpt_i2o gets around the same issue.
>
>  Thanks for the pointer and for cc-ing me.  Please refrain from removing
> the driver at least for this release cycle and let me fix it.

Sure, no problem. It looks like I forgot to actually Cc you on the series
as I had meant to, glad it reached you anyway.

> It should be easy to mimic what I did for the defza driver: all bus addresses in
> the DMA API come associated with virtual addresses, so it is just a matter of
> recording those somewhere for later use rather than trying to mess up with
> bus addresses to figure out a reverse mapping.

I looked at the defza driver and that one appears simpler to me, as you
can look up the virtual address from an index, but it's possible I missed
what you do here. I meant specifically the calculation added by commit
67af2b060e02 ("[SCSI] dpt_i2o: move from virt_to_bus/bus_to_virt
to dma_alloc_coherent") in the dpt_i2o driver that can be used to
compute the virtual address. If something simpler works as well, that
is of course better.

        Arnd
