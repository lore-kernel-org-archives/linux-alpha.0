From: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
Date: Thu, 05 May 2022 10:10:15 +0200
Message-ID: <ce5510ff230fe76d9a74d0368d7d5be22011ff88.camel@linux.ibm.com>
References: <20220429135108.2781579-2-schnelle@linux.ibm.com>
         <20220504210840.GA469916@bhelgaas>
         <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=z4sq9VpdyC1twtJvv6LraDF4oC5l7K1Gjqz/EX96h48=;
 b=byg8yPH7lB6IZpHqaGAW/IeqHBFw1qVNnemAYMuW6RqtAD2Pr44LXtY5qhdvLHHtmyHS
 zx9iz65kowFV3EWLgEN1WG/d59kZe4yfXhGahlw0zEySpnmOMpKtnTu1H+qcza8lcgus
 VP1jt7FqQK3My93W8lTLtP5pcjNasJUlrXI0Oj9oLP5ti+9vQ6TEUWY2ibcsPnUs14uv
 NmvMjJPL0KUnhOk2z1eHsYp83y9pSRyRUfpRV7sovwq8yCY9xzBZFlBb50MQwBEdnaiO
 0N3pnELj4DvaEamDhYosnYTLvIbL2KA1mWAd5tpRBkVo6hFlV6xAvxmWORtU26wlKUnZ hw== 
In-Reply-To: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, A

On Wed, 2022-05-04 at 23:31 +0200, Arnd Bergmann wrote:
> On Wed, May 4, 2022 at 11:08 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Fri, Apr 29, 2022 at 03:49:59PM +0200, Niklas Schnelle wrote:
> > > We introduce a new HAS_IOPORT Kconfig option to indicate support for
> > > I/O Port access. In a future patch HAS_IOPORT=3Dn will disable compil=
ation
> > > of the I/O accessor functions inb()/outb() and friends on architectur=
es
> > > which can not meaningfully support legacy I/O spaces such as s390 or
> > > where such support is optional.
> >=20
> > So you plan to drop inb()/outb() on architectures where I/O port space
> > is optional?  So even platforms that have I/O port space may not be
> > able to use it?
> >=20
> > This feels like a lot of work where the main benefit is to keep
> > Kconfig from offering drivers that aren't of interest on s390.
> >=20
> > Granted, there may be issues where inb()/outb() does the wrong thing
> > such as dereferencing null pointers when I/O port space isn't
> > implemented.  I think that's a defect in inb()/outb() and could be
> > fixed there.
>=20
> The current implementation in asm-generic/io.h implements inb()/outb()
> using readb()/writeb() with a fixed architecture specific offset.
>=20
> There are three possible things that can happen here:
>=20
> a) there is a host bridge driver that maps its I/O ports to this window,
>     and everything works
> b) the address range is reserved and accessible but no host bridge
>    driver has mapped its registers there, so an access causes a
>    page fault
> c) the architecture does not define an offset, and accessing low I/O
>     ports ends up as a NULL pointer dereference
>=20
> The main goal is to avoid c), which is what happens on s390, but
> can also happen elsewhere. Catching b) would be nice as well,
> but is much harder to do from generic code as you'd need an
> architecture specific inline asm statement to insert a ex_table
> fixup, or a runtime conditional on each access.
>=20
>          Arnd

Yes and to add to this, we did try a local solution in inb()/outb()
before. This added a warning when they are used and we know at compile
time that we're dealing with case c). This approach was nacked by Linus
though as we were turning a compile time known broken case into a
runtime one:

https://lore.kernel.org/lkml/CAHk-=3Dwg80je=3DK7madF4e7WrRNp37e3qh6y10Svhdc=
7O8SZ_-8g@mail.gmail.com/

I do agree with this assesment and think this is the right=E2=84=A2 approach
but it is more churn as can be seen by the size of this series. I think
longer term it could be valuable though especially if more platforms
phase out I/O port support like POWER9 for which this also allows
filtering what drivers will never work.

