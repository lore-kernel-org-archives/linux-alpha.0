From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH v2 4/4] pcmcia: Convert to use
 pci_bus_for_each_resource_p()
Date: Thu, 3 Nov 2022 18:25:45 +0100
Message-ID: <Y2P5mRt//Pp6XTLT@owl.dominikbrodowski.net>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
 <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
 <Y2P2ja26ikNecTsv@smile.fi.intel.com>
Mime-Version: 1.0
Return-path: <sparclinux-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Y2P2ja26ikNecTsv@smile.fi.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.fra>

Am Thu, Nov 03, 2022 at 07:12:45PM +0200 schrieb Andy Shevchenko:
> On Thu, Nov 03, 2022 at 06:03:24PM +0100, Dominik Brodowski wrote:
> > Am Thu, Nov 03, 2022 at 06:46:44PM +0200 schrieb Andy Shevchenko:
> 
> ...
> 
> > > -
> > > -	for (i = 0; i < PCI_BRIDGE_RESOURCE_NUM; i++) {
> > > -		res = s->cb_dev->bus->resource[i];
> > > -#else
> > > -	pci_bus_for_each_resource(s->cb_dev->bus, res, i) {
> > >  #endif
> > > +
> > > +	pci_bus_for_each_resource_p(s->cb_dev->bus, res) {
> > >  		if (!res)
> > >  			continue;
> > 
> > Doesn't this remove the proper iterator for X86? Even if that is the right
> > thing to do, it needs an explict explanation.
> 
> I dunno what was in 2010, but reading code now I have found no differences in
> the logic on how resources are being iterated in these two pieces of code.
> 
> But fine, I will add a line to a commit message about this change.
> 
> Considering this is done, can you issue your conditional tag so I will
> incorporate it in v3?

Certainly, feel free to add

	Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>

Thanks,
	Dominik
