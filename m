From: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [PATCH v3 01/38] Kconfig: introduce HAS_IOPORT option and
 select it as necessary
Date: Thu, 23 Mar 2023 14:23:57 +0100
Message-ID: <95d5d0c434ef6c4cadc3fca34c4c0d3104becea8.camel@linux.ibm.com>
References: <20230314121216.413434-1-schnelle@linux.ibm.com>
         <20230314121216.413434-2-schnelle@linux.ibm.com>
         <21a828bae06b97b8ca806a6b76d867902b1e0e1f.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=VwL2eHgiXbSpbcyOMi1Fm6CGpKEbs60ss+WPZnJK5Ik=;
 b=XUOZb+O02s7yDbfd9owIe2KU+IxtepAYblP5hOfMaou9r1s62w4XYcd21Ay890Ch0UtZ
 b3P6V74UYISN/vgI9gfJX4goA81aaSJ6+BrnqTltbxt9dViPahHFqwYh2ph/oHgOCuUs
 cBuk/dBdRXe6yir7UjhPfJohLY53yu99IuZ0u/VvorW219jlSZERTnQz24NuopyuaJRv
 f/R4+LqrQSLYvZjgJitqK439IVBWg+2l8kKrls150yN5+2GDZLbAW/9AVV53S7LOSmnA
 XiauVMwmdc0qgxFAu2fBNR8kde+goodonXLhqI7dsBaHwnZoURHUBVQ40SKG6ndeV6av Ww== 
In-Reply-To: <21a828bae06b97b8ca806a6b76d867902b1e0e1f.camel@sipsolutions.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Johannes Berg <johannes@sipsolutions.net>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@e>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-pci@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org

On Tue, 2023-03-14 at 13:37 +0100, Johannes Berg wrote:
> On Tue, 2023-03-14 at 13:11 +0100, Niklas Schnelle wrote:
> > --- a/arch/um/Kconfig
> > +++ b/arch/um/Kconfig
> > @@ -56,6 +56,7 @@ config NO_IOPORT_MAP
> > =20
> >  config ISA
> >  	bool
> > +	depends on HAS_IOPORT
> >=20
>=20
> config ISA here is already unselectable, and nothing ever does "select
> ISA" (only in some other architectures), so is there much point in this?
>=20
> I'm not even sure why this exists at all.

You're right there's not much point and I dropped this for v4. I agree
that probably the whole "config ISA" could be removed if it's always
false anyway but that seems out of scope for this patch.

>=20
> But anyway, adding a dependency to a always-false symbol doesn't make it
> less always-false :-)
>=20
> Acked-by: Johannes Berg <johannes@sipsolutions.net> # for ARCH=3Dum

Thanks

>=20
>=20
> Certainly will be nice to get rid of this cruft for architectures that
> don't have it.
>=20
> johannes

Yes, also, for s390 the broken NULL + port number access in the generic
inb()/outb() currently causes the only remaining clang warning on
defconfig builds.
