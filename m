From: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
Date: Fri, 6 May 2022 11:20:17 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com> <20220505161028.GA492600@bhelgaas> <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael

On Thu, 5 May 2022, Arnd Bergmann wrote:

> > I'm hearing that generic powerpc kernels have to run both on machines
> > that have I/O port space and those that don't.  That makes me think
> > s390 could do something similar.
> 
> No, this is actually the current situation, and it makes absolutely no
> sense. s390 has no way of implementing inb()/outb() because there
> are no instructions for it and it cannot tunnel them through a virtual
> address mapping like on most of the other architectures. (it has special
> instructions for accessing memory space, which is not the same as
> a pointer dereference here).

 I think I'm missing something here.  IIUC we're talking about a PCI/PCIe 
bus used with s390 hardware, right?

 (It has to be PCI/PCIe, because other than x86/IA-64 host buses there are 
only PCI/PCIe and EISA/ISA buses out there that define I/O access cycles 
and EISA/ISA have long been obsoleted except perhaps from some niche use.)

 If this is PCI/PCIe indeed, then an I/O access is just a different bit 
pattern put on the bus/in the TLP in the address phase.  So what is there 
inherent to the s390 architecture that prevents that different bit pattern 
from being used?

 If anything, I could imagine the same limitation as with current POWER9 
implementations, that is whatever glue is used to wire PCI/PCIe to the 
rest of the system does not implement a way to use said bit pattern (which 
has nothing to do with the POWER9 processor instruction set).

 But that has nothing to do with the presence or absence of any specific 
processor instructions.  It's just a limitation of bus glue.  So I guess 
it's just that all PCI/PCIe glue logic implementations for s390 have such 
a limitation, right?

  Maciej
