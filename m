From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 4/4] pcmcia: Convert to use
 pci_bus_for_each_resource_p()
Date: Thu, 3 Nov 2022 20:59:33 +0200
Message-ID: <Y2QPlZ0mhLvKw7X5@smile.fi.intel.com>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
 <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
 <Y2P2ja26ikNecTsv@smile.fi.intel.com>
 <Y2QImB0OLakzz1+F@rocinante>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667501985; x=1699037985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iDzJkwIYDgDj9s9QyYyQqMun6Fj8NrFnD6UKX0fcnAs=;
  b=U1Umt9qku3GYocruQL5t/15455Rny7EXR4FHjNANVPsZL25YbnUAmdw7
   qIzTFjDWCpBgRXNs3Vbg1eHClJd1/n5Wa49RgzySMT3ePursA7PQg7cXD
   sLjdAwNydWb/Vt1ChnQmxLcAQf95L6jvAT4KX6UtC4kwn8aujIzJrWwQS
   bKdewFI+vEeeGUC9VHlUrHdjxCqn0dn86Rca8THquoXv8VgMtdbmbVFFA
   w1kxOgKcc3YhgFBkK3NoJ0GO4PBXfg2QNkTCPW9PFJjwIfH5yf9PfE5vf
   IVlV/x38M2FJ9Zjdqc1379zmLj14WK/LfvvHm6CIVsSp/Xex+l6bFwfEf
   Q==;
Content-Disposition: inline
In-Reply-To: <Y2QImB0OLakzz1+F@rocinante>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.>

On Fri, Nov 04, 2022 at 03:29:44AM +0900, Krzysztof Wilczy=C5=84ski wrote:

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

Yeah, thanks for pointing out to the other patch from the same 2010 year.
It seems the code was completely identical that time, now it uses more
sophisticated way of getting bus resources, but it's kept the same for
the resources under PCI_BRIDGE_RESOURCE_NUM threshold.

> > But fine, I will add a line to a commit message about this change.
>=20
> I wouldn't, personally.  The change you are proposing is self-explanatory
> and somewhat in-line with what is there already - unless I am also reading
> the current implementation wrong.

But it wouldn't be harmful either.

> That said, Dominik is the maintainer of PCMCIA driver, so his is the last
> word, so to speak. :)
>=20
> > Considering this is done, can you issue your conditional tag so I will
> > incorporate it in v3?
>=20
> No need, really.  Again, unless Dominik thinks otherwise.

I think that what is wanted to have to get his tag.

Thanks for review, both of you, guys!

--=20
With Best Regards,
Andy Shevchenko


