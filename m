From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v7 4/6] EISA: Convert to use less arguments in
 pci_bus_for_each_resource()
Date: Fri, 24 Mar 2023 11:19:52 +0200
Message-ID: <ZB1rOHt8pG+9Ti2V@smile.fi.intel.com>
References: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
 <20230323173610.60442-5-andriy.shevchenko@linux.intel.com>
 <43e7ef6d-6248-4ee5-7144-70809e5c93e0@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679649609; x=1711185609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vsNBrnwY/qFfdSufiaxoySiGuysdLC+OL9fxRmgKucY=;
  b=OQ3Oq38sLlGjmFk8Oapo3a5jEsDEbXy9CKNfB6iZ5oYmRlkN90WujeJi
   SA25MA2HRt9S82gsrtjbKuSWNuF1NL0ZtbrsZyR/1ept037Q09GUyrxAz
   3i4nHdB7vsrP9h+BBlMwDmWvrwYkUsKVKHzJatZsY+f1Sivt8jB9p+l56
   Hw/+dlmAqO8G4QdkQp4gQlkjczOZKzcxtYktY7WvUEa0Dwt33yzY5RsSj
   snobdRaXZnEWy1NEP02cFSBvCM/FXZfo0IGez3hU0cdSqo40fe9dgY1ay
   /3rUuAHyTOTma08Er4AqsygxOt0JU9UpmuXdyoV3TUyR/j9+Ow4a9Awq/
   A==;
Content-Disposition: inline
In-Reply-To: <43e7ef6d-6248-4ee5-7144-70809e5c93e0@linaro.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.ker

On Fri, Mar 24, 2023 at 10:02:15AM +0100, Philippe Mathieu-Daudé wrote:
> On 23/3/23 18:36, Andy Shevchenko wrote:
> > The pci_bus_for_each_resource() can hide the iterator loop since
> > it may be not used otherwise. With this, we may drop that iterator
> > variable definition.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
> > ---
> >   drivers/eisa/pci_eisa.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/eisa/pci_eisa.c b/drivers/eisa/pci_eisa.c
> 
> Since this is *PCI* EISA, could be squashed into previous patch.

I believe it would be better to have them separated.
But if maintainers want to squash, I can do that.

> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thank you!


-- 
With Best Regards,
Andy Shevchenko


