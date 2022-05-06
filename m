From: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
Date: Fri, 6 May 2022 16:03:14 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2205061558430.52331@angie.orcam.me.uk>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com> <20220505161028.GA492600@bhelgaas> <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com> <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com> <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk> <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com> <alpine.DEB.2.21.2205061412080.52331@angie.orcam.me.uk>
 <3669a28a055344a792b51439c953fd30@AcuMS.aculab.com> <alpine.DEB.2.21.2205061440260.52331@angie.orcam.me.uk> <CAMuHMdVsjRUKYqS0nkKsT08A4a4ipuhn7AG+ZqcHBqZvVX02OQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVsjRUKYqS0nkKsT08A4a4ipuhn7AG+ZqcHBqZvVX02OQ@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Laight <David.Laight@aculab.com>, Arnd Bergmann <arnd@kernel.org>, Rich Felker <dalias@libc.org>, "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>, "open list:SUPERH" <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>, "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>

Hi Geert,
> >  Sane access would require a single CPU instruction to read or write from
> > the configuration space.  To access the conventional PCI configuration
> > space in a direct linear manner you need 256 * 21 * 8 * 256 = 10.5MiB of
> > address space.  Such amount of address space seems affordable even with
> > 32-bit systems.
> 
> Won't have fit in the legacy 1 MiB space ("640 KiB...").

 Haha, but anyway you're supposed to use BIOS calls under DOS and the like 
so it doesn't really matter.  You can't poke at the APIC in the legacy 
space either.

  Maciej
