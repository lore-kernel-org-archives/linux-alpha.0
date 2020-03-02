From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: Some Alphas broken by f75b99d5a77d (PCI: Enforce bus address
 limits in resource allocation)
Date: Mon, 2 Mar 2020 16:47:32 -0600
Message-ID: <20200302224732.GA175863@google.com>
References: <CAEdQ38EzZfUJA-8zg-DgczYTwkxqFL-AThxu0_fC2V-GkXGi2Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583189254;
        bh=G5VGNDsOUPLinc1753Al2KL9STYmJ6m3x0fpad9Cwfk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=mU8uZkSw1wxdHfFSi3rAtL6aNWR0eSieMXdoUEKXLOgJifSYOlGI0WUBJwXr1hJph
         pJgk4FOCZrWB/IFne7rtBSXL6PBpW9f9rmf0XTrsj89DalDX1gCY7snsldLp7ad0OJ
         C92PYps9Dlb/dxktqefQDcKUyHkIG3iEuJ4+wPZ8=
Content-Disposition: inline
In-Reply-To: <CAEdQ38EzZfUJA-8zg-DgczYTwkxqFL-AThxu0_fC2V-GkXGi2Q@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Yinghai Lu <yinghai@kernel.org>, linux-pci@vger.kernel.org, linux-alpha <linux-alpha@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jay Estabrook <jay.estabrook@gmail.com>, Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

[+cc Nicholas, Ben, beginning of thread:
https://lore.kernel.org/r/CAEdQ38GUhL0R4c7ZjEZv89TmqQ0cwhnvBawxuXonSb9On=+B6A@mail.gmail.com]

On Fri, Feb 28, 2020 at 03:51:01PM -0800, Matt Turner wrote:
> On Sat, Feb 22, 2020 at 8:55 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > On Mon, Apr 16, 2018 at 07:33:57AM -0700, Matt Turner wrote:
> > > Commit f75b99d5a77d63f20e07bd276d5a427808ac8ef6 (PCI: Enforce bus
> > > address limits in resource allocation) broke Alpha systems using
> > > CONFIG_ALPHA_NAUTILUS. Alpha is 64-bit, but Nautilus systems use a
> > > 32-bit AMD 751/761 chipset. arch/alpha/kernel/sys_nautilus.c maps PCI
> > > into the upper addresses just below 4GB.
> > >
> > > I can get a working kernel by ifdef'ing out the code in
> > > drivers/pci/bus.c:pci_bus_alloc_resource. We can't tie
> > > PCI_BUS_ADDR_T_64BIT to ALPHA_NAUTILUS without breaking generic
> > > kernels.
> > >
> > > How can we get Nautilus working again?
> >
> > I don't see a resolution in this thread, so I assume this is still
> > broken?  Anybody have any more ideas?
> 
> Indeed, still broken.
> 
> I can add Kconfig logic to unselect ARCH_DMA_ADDR_T_64BIT if
> ALPHA_NAUTILUS, but then generic kernels won't work on Nautilus. It
> doesn't look like we have any way of opting out of
> ARCH_DMA_ADDR_T_64BIT at runtime, and doing enough plumbing to make
> that work is not worth it for such niche hardware. Maybe removing
> Nautilus from the generic kernel build is what I should do until such
> a time that we really fix this?
> 
> Or maybe I could put a hack in pci.c that more or less undoes
> d56dbf5bab8c on Nautilus. #if defined CONFIG_ARCH_DMA_ADDR_T_64BIT &&
> !defined SYS_NAUTILUS.
> 
> Or maybe I just need to take a weekend and try to understand the PCI
> code, instead of applying patches I don't understand and praying :)

I don't have any *useful* ideas, but I think we did screw up the PCI
resource discovery when we started assuming that we know the host
bridge apertures up front.

That's generally true for many ACPI and DT systems, but in principle,
we *should* be able to enumerate the devices and learn their resource
requirements before computing the required host bridge apertures and
assigning the BARs.
