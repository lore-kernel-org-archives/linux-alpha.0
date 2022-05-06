From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
Date: Fri, 6 May 2022 12:53:32 +0000
Message-ID: <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "'Maciej W. Rozycki'" <macro@orcam.me.uk>, Arnd Bergmann <arnd@kernel.org>
Cc: Rich Felker <dalias@libc.org>, "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>, "open list:SUPERH" <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>, "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>

From: Maciej W. Rozycki
> Sent: 06 May 2022 13:27
> 
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

You don't understand something...

For a memory BAR pci_ioremap() returns a token that can be used with readl().
On most architectures readl() is just a memory access.
This all fails on an I/O BAR.

For an I/O BAR you want a similar pair of functions.
On x86 the access function would need to use the 'in/out' instructions but
there is no requirement for the token to be the native io port number.
On many non-x86 architectures the access function would be a simple memory
access - but a specific system (eg many ppc) may never actually allow
such mappings to succeed.

You might also want a third PCI mapping function that can map a memory
BAR or an I/O BAR - with a suitable access function.
On x86 this would need something like ioread8() for accesses.
Except that function uses small integers for io port numbers
(which is inherently dangerous).

Nothing except the architecture specific implementation of the function
to access an io BAR would ever go near a function called inb().

The same is really true for other bus type - including ISA and EISA.
(Ignoring the horrid of probing ISI bus devices - hopefully they
are in the ACPI tables??_
If a driver is probed on a ISA bus there ought to be functions
equivalent to pci_ioremap() (for both memory and IO addresses)
that return tokens appropriate for the specific bus.

That is all a different load of churn.


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

Actually I think x86 was the initial system for PCI.
The PCI config space 'mess' is all about trying to make
something that wouldn't break existing memory maps.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

