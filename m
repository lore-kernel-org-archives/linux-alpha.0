From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH v2 4/4] pcmcia: Convert to use
 pci_bus_for_each_resource_p()
Date: Thu, 3 Nov 2022 19:38:07 +0100
Message-ID: <Y2QKjzL+nH6Zabg7@owl.dominikbrodowski.net>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
 <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
 <Y2P2ja26ikNecTsv@smile.fi.intel.com>
 <Y2QImB0OLakzz1+F@rocinante>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Y2QImB0OLakzz1+F@rocinante>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@arml>

Am Fri, Nov 04, 2022 at 03:29:44AM +0900 schrieb Krzysztof Wilczy=C5=84ski:
> Hello,
>=20
> [...]
> > > > -
> > > > -	for (i =3D 0; i < PCI_BRIDGE_RESOURCE_NUM; i++) {
> > > > -		res =3D s->cb_dev->bus->resource[i];
> > > > -#else
> > > > -	pci_bus_for_each_resource(s->cb_dev->bus, res, i) {
> > > >  #endif
> > > > +
> > > > +	pci_bus_for_each_resource_p(s->cb_dev->bus, res) {
> > > >  		if (!res)
> > > >  			continue;
> > >=20
> > > Doesn't this remove the proper iterator for X86? Even if that is the =
right
> > > thing to do, it needs an explict explanation.
> >=20
> > I dunno what was in 2010, but reading code now I have found no differen=
ces in
> > the logic on how resources are being iterated in these two pieces of co=
de.
>=20
> This code is over a decade old (13 years old to be precise) and there was
> something odd between Bjorn's and Jesse's patches, as per:
>=20
>   89a74ecccd1f ("PCI: add pci_bus_for_each_resource(), remove direct bus-=
>resource[] refs")
>   cf26e8dc4194 ("pcmcia: do not autoadd root PCI bus resources")
>=20
> > But fine, I will add a line to a commit message about this change.
>=20
> I wouldn't, personally.  The change you are proposing is self-explanatory
> and somewhat in-line with what is there already - unless I am also reading
> the current implementation wrong.
>=20
> That said, Dominik is the maintainer of PCMCIA driver, so his is the last
> word, so to speak. :)
>=20
> > Considering this is done, can you issue your conditional tag so I will
> > incorporate it in v3?
>=20
> No need, really.  Again, unless Dominik thinks otherwise.

Ah, thanks for the correction. Then v2 is perfectly fine.

Thanks,
	Dominik
