From: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
Date: Fri, 06 May 2022 15:15:16 +0200
Message-ID: <1424b9289049d0ad8b5c37a4e23ef70f0ef0f83d.camel@linux.ibm.com>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
         <20220505161028.GA492600@bhelgaas>
         <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
         <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
         <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
         <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
         <CAK8P3a0EMK0gHOmb-jvtfVLb1dun72kYUMKpb11T_GgXiuR9Mw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=xscNj3LKneLSbobsh3Ku1jl1vBQ8kIYhyMEEDDClgkk=;
 b=oBJQd8ZmQELQLadl/nTQ3LRaxIO/aB6J2HboQ8BtrRYXRlcTMjQ42tG86DF5+sRI/Us2
 6yu8YnHriU0eFlcupkHKrl5OxO6l9qZQOtyx5XnV8n6fWIF5tm+4Xe6HLE0FVlZwA4u6
 kFoAKCVEO22F/gM0owTO4fXUMywSG4eelo40bGXyRJwUwJP8fgeMEf2giutmEehQ3ILo
 VMW19KhYJUNwWTFL+36LFCX1mTzjraYcsur9KBqO1jctjg9DQeNWddzlAAqMquqYAopw
 YD8BUDGUByovfvkdobmUJ/1Kk4HpVfdE5WguUCW42hdJhdEFoqQmDOfvveZrLJzKpLro VQ== 
In-Reply-To: <CAK8P3a0EMK0gHOmb-jvtfVLb1dun72kYUMKpb11T_GgXiuR9Mw@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <paul.w>

On Fri, 2022-05-06 at 14:53 +0200, Arnd Bergmann wrote:
> On Fri, May 6, 2022 at 2:27 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> > On Fri, 6 May 2022, Arnd Bergmann wrote:
> > 
> > > >  If this is PCI/PCIe indeed, then an I/O access is just a different bit
> > > > pattern put on the bus/in the TLP in the address phase.  So what is there
> > > > inherent to the s390 architecture that prevents that different bit pattern
> > > > from being used?
> > > 
> > > The hardware design for PCI on s390 is very different from any other
> > > architecture, and more abstract. Rather than implementing MMIO register
> > > access as pointer dereference, this is a separate CPU instruction that
> > > takes a device/bar plus offset as arguments rather than a pointer, and
> > > Linux encodes this back into a fake __iomem token.
> > 
> >  OK, that seems to me like a reasonable and quite a clean design (on the
> > hardware side).
> > 
> >  So what happens if the instruction is given an I/O rather than memory BAR
> > as the relevant argument?  Is the address space indicator bit (bit #0)
> > simply ignored or what?
> 
> Not sure. My best guess is that it would actually work as you'd expect,
> but is deliberately left out of the architecture specification so they don't
> have to to validate the correctness.  Note that only a small number of
> PCIe cards are actually supported by IBM, and I think the firmware
> only passes devices to the OS if they are whitelisted.
> 
>         Arnd

Yes, though in Linux we do try hard to work with whatever is plugged
in. We did benefit from this in the past working with a new NIC from a
different vendor with 0 additional changes. Also you can use vfio-pci
to pass-through arbitrary PCI devices to a QEMU emulating s390x.

