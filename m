From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
Date: Fri, 6 May 2022 16:56:56 +0200
Message-ID: <CAMuHMdVsjRUKYqS0nkKsT08A4a4ipuhn7AG+ZqcHBqZvVX02OQ@mail.gmail.com>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
 <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
 <alpine.DEB.2.21.2205061412080.52331@angie.orcam.me.uk>
 <3669a28a055344a792b51439c953fd30@AcuMS.aculab.com>
 <alpine.DEB.2.21.2205061440260.52331@angie.orcam.me.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLs9Q/GXSSeJ9Y1omcI1ufexe/Zpv05YMBSI2hVPDpw=; b=Ac2YJcrq455QjP
	gu5NCEv45IWR8mKppKuERZeR+CkGSa5AOO0a23WT4fnJPcRHeE3tn23haJ/So+RN0u4XcQotTwLpJ
	1FttCkAtp1QJNy5iEes1GwvSX61RU4Ws59dgNc0AAnir2Ckks+HUVVCRZmCrVoCjQcp3qF1/rFjDn
	n+Nqk6HuhiU7qctGQlzHW1iV1LmpIDH4j0xd89Vo50QFONYKc2V00TZAHzLxvU8vlxnt5kw17cPcy
	M9qkB2g5ygpSvnY0dcGfMhP/UrpoeRhgGi+xFvlTg/djH02/wDG6hjWJz+6K94ZQzamB2yrbTKrsL
	pYJkTmGkgAG1Dk+OTmhg==;
In-Reply-To: <alpine.DEB.2.21.2205061440260.52331@angie.orcam.me.uk>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: David Laight <David.Laight@aculab.com>, Arnd Bergmann <arnd@kernel.org>, Rich Felker <dalias@libc.org>, "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>, "open list:SUPERH" <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>, "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, linux-pci <linux-pci@vger.ke>

Hi Maciej,

On Fri, May 6, 2022 at 4:44 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> On Fri, 6 May 2022, David Laight wrote:
> > >  It was retrofitted in that x86 systems already existed for ~15 years when
> > > PCI came into picture.  Therefore the makers of the CPU ISA couldn't have
> > > envisaged the need for config access instructions like they did for memory
> > > and port access.
> >
> > Rev 2.0 of the PCI spec (1993) defines two mechanisms for config cycles.
> > #2 is probably the first one and maps all of PCI config space into
> > 4k of IO space (PCI bridges aren't supported).
>
>  This one is even more horrid than #1 in that it requires two separate
> preparatory I/O writes rather than just one, one to the Forward Register
> (at 0xcfa) to set the bus number, and another to the Configuration Space
> Enable Register (at 0xcf8) to set the function number, before you can
> issue a configuration read or write to a device.  So you need MP locking
> too.
>
>  NB only peer bridges aren't supported with this mechanism, normal PCI-PCI
> bridges are, via the Forward Register.
>
> > #1 requires a pair of accesses (and SMP locking).
> >
> > Neither is really horrid.
>
>  Both are.  First neither is MP-safe and second both are indirect in that
> you need to poke at some chipset registers before you can issue the actual
> read or write.
>
>  Sane access would require a single CPU instruction to read or write from
> the configuration space.  To access the conventional PCI configuration
> space in a direct linear manner you need 256 * 21 * 8 * 256 = 10.5MiB of
> address space.  Such amount of address space seems affordable even with
> 32-bit systems.

Won't have fit in the legacy 1 MiB space ("640 KiB...").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
