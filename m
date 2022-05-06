From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
Date: Fri, 6 May 2022 13:28:42 +0000
Message-ID: <3669a28a055344a792b51439c953fd30@AcuMS.aculab.com>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
 <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
 <alpine.DEB.2.21.2205061412080.52331@angie.orcam.me.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.2205061412080.52331@angie.orcam.me.uk>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "'Maciej W. Rozycki'" <macro@orcam.me.uk>
Cc: Arnd Bergmann <arnd@kernel.org>, Rich Felker <dalias@libc.org>, "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>, "open list:SUPERH" <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>, "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>

From: Maciej W. Rozycki
> Sent: 06 May 2022 14:15
> On Fri, 6 May 2022, David Laight wrote:
> 
> > >  The PCI configuration space was retrofitted into x86 systems (and is
> > > accessed in an awkward manner with them), but with a new design such a
> > > clean approach is most welcome IMHO.  Thank you for your explanation.
> >
> > Actually I think x86 was the initial system for PCI.
> > The PCI config space 'mess' is all about trying to make
> > something that wouldn't break existing memory maps.
> 
>  It was retrofitted in that x86 systems already existed for ~15 years when
> PCI came into picture.  Therefore the makers of the CPU ISA couldn't have
> envisaged the need for config access instructions like they did for memory
> and port access.

Rev 2.0 of the PCI spec (1993) defines two mechanisms for config cycles.
#2 is probably the first one and maps all of PCI config space into
4k of IO space (PCI bridges aren't supported).
#1 requires a pair of accesses (and SMP locking).

Neither is really horrid.

For horrid try the ISApnp interface.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

