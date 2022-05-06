From: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
Date: Fri, 6 May 2022 14:40:09 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2205061426390.52331@angie.orcam.me.uk>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com> <20220505161028.GA492600@bhelgaas> <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com> <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com> <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk> <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com> <CAMuHMdWj5rmrP941DF7bsUXbiiemE-o2=8XqnAS-chgmpFFPQg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWj5rmrP941DF7bsUXbiiemE-o2=8XqnAS-chgmpFFPQg@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Laight <David.Laight@aculab.com>, Arnd Bergmann <arnd@kernel.org>, Rich Felker <dalias@libc.org>, "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>, "open list:SUPERH" <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>, "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>

On Fri, 6 May 2022, Geert Uytterhoeven wrote:

> A loooong time ago,  it was suggested to add register accessor
> functions to struct device, so e.g. readl(dev, offset) would call
> into these accessors, which would implement the bus-specific behavior.
> No more worries about readl(), __raw_readl(), ioread32b(), or whatever
> quirk is needed, at the (small on nowadays' machines) expense of
> some indirection...

 I guess you'd need an additional parameter for the endianness policy 
required (to match either bit or byte lanes, according to ultimate data 
interpretation) where crossing between buses of a different endianness 
each.  Otherwise you'd end up with the mess elsewhere.

  Maciej
