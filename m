From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 4/4] pcmcia: Convert to use
 pci_bus_for_each_resource_p()
Date: Thu, 3 Nov 2022 21:01:07 +0200
Message-ID: <Y2QP8yrZ7/9fpUQQ@smile.fi.intel.com>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
 <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
 <Y2P2ja26ikNecTsv@smile.fi.intel.com>
 <Y2QImB0OLakzz1+F@rocinante>
 <Y2QKjzL+nH6Zabg7@owl.dominikbrodowski.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667502081; x=1699038081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sNkpjDaE4wFtOA2SWrBA99Yi2yLtSUQQFYkHqzgZpY0=;
  b=bjjERSibgTNUU85Hg7P6wSvUP770XMf72qD1UXaO+5D3TRBcX1RWt/ds
   UEoeNDbR6gIrc3dwng7ZjogkA9dtx2rD9FsSOn6qfcC4sqFOeW/uL+0JN
   epwlVg5QaoL/Ryi/rPUbkhLIx+FL+4v5HKhZj1aM1wYVwxLoqlbw6rvsa
   oPXvxe3M7mrGwL+zYN8MZxjY27Wuwt2vGYqHta/Dz4hQxzNpdFmmwauwZ
   l6gcKK/U6IxXstGnRSLmaAoviY6fMWIyGGOMQYqEtz795WTjalDMLLg5q
   RsQxF/J/OmqMMZjkcR2jpvRYfhom/VXZXJLYXsANd05L5ks0W+wHkf5eK
   w==;
Content-Disposition: inline
In-Reply-To: <Y2QKjzL+nH6Zabg7@owl.dominikbrodowski.net>
Content-Type: text/plain; charset="windows-1252"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Ch

On Thu, Nov 03, 2022 at 07:38:07PM +0100, Dominik Brodowski wrote:
> Am Fri, Nov 04, 2022 at 03:29:44AM +0900 schrieb Krzysztof Wilczy=C5=84sk=
i:

...

> > That said, Dominik is the maintainer of PCMCIA driver, so his is the la=
st
> > word, so to speak. :)
> >=20
> > > Considering this is done, can you issue your conditional tag so I will
> > > incorporate it in v3?
> >=20
> > No need, really.  Again, unless Dominik thinks otherwise.
>=20
> Ah, thanks for the correction. Then v2 is perfectly fine.

I'm fine with either, thanks!

--=20
With Best Regards,
Andy Shevchenko



