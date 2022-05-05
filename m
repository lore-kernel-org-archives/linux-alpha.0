From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
Date: Thu, 5 May 2022 11:10:28 -0500
Message-ID: <20220505161028.GA492600@bhelgaas>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651767031;
        bh=y1bm/ePw6qN7M+uAMLXPbjzr3hDC7iN+2T5U5hZp75c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=V+TiGeXpnpx8QAPISZ/tFZ1vgqt07jnZ/e8UGsZFjYbSOIbxjOaFyb/UjHBhqn5hx
         Z64n0P5wnIuaGgxiRpF7HUD9ziSD/Vy04koyZ+3OiNayjnxjzS0fZIDvEf4IlnjJDh
         ZFqZNchd+Rmh0D+frE/gcDMj07LtCQDi4bliOoYzYtwBViRsBNVzjXBMPmC2/Yp3+O
         avJDoEKTBRLhRLGuv5dd4ZPPntedsmPSHGr9oDetkDU8rgxRb4BichpG/ijCid5diK
         e/q4W6AYEDDk6fNQ6Z+JXpgOmkNdUU12Kp4sKoGZvuLv591DrEpNAjn9EHl9SCvfts
         lHbL5gffrnaQA==
Content-Disposition: inline
In-Reply-To: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@kernel.org>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Paul

On Wed, May 04, 2022 at 11:31:28PM +0200, Arnd Bergmann wrote:
> On Wed, May 4, 2022 at 11:08 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Fri, Apr 29, 2022 at 03:49:59PM +0200, Niklas Schnelle wrote:
> > > We introduce a new HAS_IOPORT Kconfig option to indicate support for
> > > I/O Port access. In a future patch HAS_IOPORT=n will disable compilation
> > > of the I/O accessor functions inb()/outb() and friends on architectures
> > > which can not meaningfully support legacy I/O spaces such as s390 or
> > > where such support is optional.
> >
> > So you plan to drop inb()/outb() on architectures where I/O port space
> > is optional?  So even platforms that have I/O port space may not be
> > able to use it?
> >
> > This feels like a lot of work where the main benefit is to keep
> > Kconfig from offering drivers that aren't of interest on s390.
> >
> > Granted, there may be issues where inb()/outb() does the wrong thing
> > such as dereferencing null pointers when I/O port space isn't
> > implemented.  I think that's a defect in inb()/outb() and could be
> > fixed there.
> 
> The current implementation in asm-generic/io.h implements inb()/outb()
> using readb()/writeb() with a fixed architecture specific offset.
> 
> There are three possible things that can happen here:
> 
> a) there is a host bridge driver that maps its I/O ports to this window,
>     and everything works
> b) the address range is reserved and accessible but no host bridge
>    driver has mapped its registers there, so an access causes a
>    page fault
> c) the architecture does not define an offset, and accessing low I/O
>     ports ends up as a NULL pointer dereference
> 
> The main goal is to avoid c), which is what happens on s390, but
> can also happen elsewhere. Catching b) would be nice as well,
> but is much harder to do from generic code as you'd need an
> architecture specific inline asm statement to insert a ex_table
> fixup, or a runtime conditional on each access.

Or s390 could implement its own inb().

I'm hearing that generic powerpc kernels have to run both on machines
that have I/O port space and those that don't.  That makes me think
s390 could do something similar.

Bjorn
