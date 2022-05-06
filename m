From: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
Date: Fri, 06 May 2022 14:55:52 +0200
Message-ID: <2eba36c5dbfb0f92cd567237170fd235b7aa5e9c.camel@linux.ibm.com>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
         <20220505161028.GA492600@bhelgaas>
         <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
         <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
         <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
         <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=i5+k77lUjCqEK3UnGdBp+j1ZK2ZiBqwNF9P/xBcssx8=;
 b=hdLVXCn614jWnu9BOgShS4X0SwKBt54/I/X6D8YoCUUCdptAKLuW2vQKQPouwJDU0702
 gaXq8F4SAg0nUYZfHIOHDRduz8HOWGuZJ1nDNYXzfZsSe3c4FYGZ8Yx6pavoXYCO+Wyr
 ubxbrakugGGGlmV9rsX3bbRh+ArWENvmlzNtbwLXBUjhGeJQBqKP5w67IUEX1oA9kaVF
 Z+BSKz58HXkui5VCTh43pp+MTZAmhvtA64Xi6b8l1ZURcy8QMUElDNsN5hCrggaICKv1
 XLkCPjcgR3sqm/gxeiKl9BBi/VFthi7xfaEIP1vR/+G0xAmOV+84VmjIvNmZxzPlNDmy pQ== 
In-Reply-To: <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, Arnd Bergmann <arnd@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <paul.w>

On Fri, 2022-05-06 at 13:27 +0100, Maciej W. Rozycki wrote:
> On Fri, 6 May 2022, Arnd Bergmann wrote:
> 
> > >  If this is PCI/PCIe indeed, then an I/O access is just a different bit
> > > pattern put on the bus/in the TLP in the address phase.  So what is there
> > > inherent to the s390 architecture that prevents that different bit pattern
> > > from being used?
> > 
> > The hardware design for PCI on s390 is very different from any other
> > architecture, and more abstract. Rather than implementing MMIO register
> > access as pointer dereference, this is a separate CPU instruction that
> > takes a device/bar plus offset as arguments rather than a pointer, and
> > Linux encodes this back into a fake __iomem token.
> 
>  OK, that seems to me like a reasonable and quite a clean design (on the 
> hardware side).
> 
>  So what happens if the instruction is given an I/O rather than memory BAR 
> as the relevant argument?  Is the address space indicator bit (bit #0) 
> simply ignored or what?

See my answer to Arnd for some more background but there simply isn't a
way to formulate an I/O access. In the old style PCI instructions the
BAR number and the function handle are put in a register before the
access. BAR number 15 is used to access config space. If there is no
BAR for that number the instruction fails with a non-zero CC.

> 
> > >  But that has nothing to do with the presence or absence of any specific
> > > processor instructions.  It's just a limitation of bus glue.  So I guess
> > > it's just that all PCI/PCIe glue logic implementations for s390 have such
> > > a limitation, right?
> > 
> > There are separate instructions for PCI memory and config space, but
> > no instructions for I/O space, or for non-PCI MMIO that it could be mapped
> > into.
> 
>  The PCI configuration space was retrofitted into x86 systems (and is 
> accessed in an awkward manner with them), but with a new design such a 
> clean approach is most welcome IMHO.  Thank you for your explanation.
> 
>   Maciej

Well our design is a retrofit too considering s390x is a direct
decendent of IBM System/360 which one could argue to have been the
first ISA. But yes as PCI support was only added with PCIe and with a
machine level hypervisor already in place we do get shielded a lot from
the gritty details.

