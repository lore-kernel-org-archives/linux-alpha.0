From: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
Date: Thu, 5 May 2022 19:39:42 +0200
Message-ID: <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651772401;
        bh=2IoE4BfEuAg77WmuhMuImyNDvTFHhyYDFxiBCowXMW0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jjkpXAHdVdaGYPRA/+3MWK8YySttWTFzcYC1keAu8erj/0Qv22sl3zrDQYguGunS5
         EYa5oM+lHkIE7YTdldWLi0OWY/DsNHWma+k3zqfE22SXyjFuALh5riYHbPe1kbAc44
         9KAWXnmbdCqw/9NbiY+BaqDNCtIn7quRedBG1XfiA99nj6AB8gym8fHYhho7MeeQF1
         l9XXlvvZnqwjxE3vlzhp6PnrE7j4IrFhVl0Qex8zon67fDEF5nEZv2gZ3ktfM3q+fs
         7pbwFrQBZZkl4jB1bUVpER7HBPy1pVzyBaA4EK56UQiDwNHTAidoXgBZp7AUZ4Ox2c
         dWIFDXtyn6eAA==
In-Reply-To: <20220505161028.GA492600@bhelgaas>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Paul

On Thu, May 5, 2022 at 6:10 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Wed, May 04, 2022 at 11:31:28PM +0200, Arnd Bergmann wrote:
> >
> > The main goal is to avoid c), which is what happens on s390, but
> > can also happen elsewhere. Catching b) would be nice as well,
> > but is much harder to do from generic code as you'd need an
> > architecture specific inline asm statement to insert a ex_table
> > fixup, or a runtime conditional on each access.
>
> Or s390 could implement its own inb().
>
> I'm hearing that generic powerpc kernels have to run both on machines
> that have I/O port space and those that don't.  That makes me think
> s390 could do something similar.

No, this is actually the current situation, and it makes absolutely no
sense. s390 has no way of implementing inb()/outb() because there
are no instructions for it and it cannot tunnel them through a virtual
address mapping like on most of the other architectures. (it has special
instructions for accessing memory space, which is not the same as
a pointer dereference here).

The existing implementation gets flagged as a NULL pointer dereference
by a compiler warning because it effectively is.

powerpc kernels generally map the I/O space into a section of the
physical address space, where it gets mapped into a fixed virtual
address and accessed through pointer dereference. This works on
any powerpc CPU as long as it is implemented in the PCI host
bridge in the usual way. The only difference between powerpc and
arm here is that there are fewer implementations, so one can
make assumptions about which PCI host bridge is used based on
a CPU core.

     Arnd
