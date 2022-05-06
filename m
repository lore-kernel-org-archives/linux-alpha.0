From: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
Date: Fri, 6 May 2022 13:27:20 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
In-Reply-To: <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@kernel.org>
Cc: Rich Felker <dalias@libc.org>, "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>, "open list:SUPERH" <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>, "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <helgaas@k>

On Fri, 6 May 2022, Arnd Bergmann wrote:

> >  If this is PCI/PCIe indeed, then an I/O access is just a different bit
> > pattern put on the bus/in the TLP in the address phase.  So what is there
> > inherent to the s390 architecture that prevents that different bit pattern
> > from being used?
> 
> The hardware design for PCI on s390 is very different from any other
> architecture, and more abstract. Rather than implementing MMIO register
> access as pointer dereference, this is a separate CPU instruction that
> takes a device/bar plus offset as arguments rather than a pointer, and
> Linux encodes this back into a fake __iomem token.

 OK, that seems to me like a reasonable and quite a clean design (on the 
hardware side).

 So what happens if the instruction is given an I/O rather than memory BAR 
as the relevant argument?  Is the address space indicator bit (bit #0) 
simply ignored or what?

> >  But that has nothing to do with the presence or absence of any specific
> > processor instructions.  It's just a limitation of bus glue.  So I guess
> > it's just that all PCI/PCIe glue logic implementations for s390 have such
> > a limitation, right?
> 
> There are separate instructions for PCI memory and config space, but
> no instructions for I/O space, or for non-PCI MMIO that it could be mapped
> into.

 The PCI configuration space was retrofitted into x86 systems (and is 
accessed in an awkward manner with them), but with a new design such a 
clean approach is most welcome IMHO.  Thank you for your explanation.

  Maciej
