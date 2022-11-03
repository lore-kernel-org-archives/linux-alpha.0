From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 4/4] pcmcia: Convert to use
 pci_bus_for_each_resource_p()
Date: Thu, 3 Nov 2022 19:12:45 +0200
Message-ID: <Y2P2ja26ikNecTsv@smile.fi.intel.com>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
 <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667495583; x=1699031583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7YpyRAArYVbF9WNy66xCFId6MSUjEg0Z+IBgztnk6pE=;
  b=Hlb6ZeulMNX84C8TzIaZhHQn6gv37m+rlTiiG7xUDZa5z5AqG6LAKBxd
   F1i4/4LUYkTcYIKFQzg7ittzY02I7oK1toTCbcKcKepKj3NJhDQY3OsqT
   H7s0qunnFJ3qSAW6utqhozubObK3Zg0nquAtt6LnPDgUHNFvgEVWK2iey
   EB+l4FaOmmN+SRiXuYNPjRZtfLDle8dewhZjZJuamv7nE+Todemy/Rdue
   y8o6n1l3bT89kIMvx9Gl2P8jp30mnjOd5PDTkI6E/605Nl8fX2XKNgod9
   YRi4oVIb2NK5/biG9yMcqCQ3L4oI8yZG2L0nDTAOv6oy7tDIXA7ylWfpL
   g==;
Content-Disposition: inline
In-Reply-To: <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.ke, rnel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, linux

On Thu, Nov 03, 2022 at 06:03:24PM +0100, Dominik Brodowski wrote:
> Am Thu, Nov 03, 2022 at 06:46:44PM +0200 schrieb Andy Shevchenko:

...

> > -
> > -	for (i = 0; i < PCI_BRIDGE_RESOURCE_NUM; i++) {
> > -		res = s->cb_dev->bus->resource[i];
> > -#else
> > -	pci_bus_for_each_resource(s->cb_dev->bus, res, i) {
> >  #endif
> > +
> > +	pci_bus_for_each_resource_p(s->cb_dev->bus, res) {
> >  		if (!res)
> >  			continue;
> 
> Doesn't this remove the proper iterator for X86? Even if that is the right
> thing to do, it needs an explict explanation.

I dunno what was in 2010, but reading code now I have found no differences in
the logic on how resources are being iterated in these two pieces of code.

But fine, I will add a line to a commit message about this change.

Considering this is done, can you issue your conditional tag so I will
incorporate it in v3?

-- 
With Best Regards,
Andy Shevchenko


