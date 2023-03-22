From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v6 1/4] PCI: Introduce pci_dev_for_each_resource()
Date: Wed, 22 Mar 2023 14:28:04 -0500
Message-ID: <20230322192804.GA2485349@bhelgaas>
References: <20230320131633.61680-2-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679513286;
        bh=QIwrcxSinbm192yIC5GYq8pmRiEZXatEfhuZCKvaZVA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=kI7PD7oKOFUaqAGxpAEV1J4pqcq5sYqOlE6tZdI8XvLDftVUW7xBLrIm39EDMCeew
         YbY7ekOsQ8pk2imeaozqedO08eUYORwgATq+PR72VZKK9Z+xSe875Jwime72E5sujt
         OKX3MZ05HrUnh6VUWqiK4KPTgw44b5/A4+dvjU5eUJO6DS6BfQZ05ojXQDveuaCfbR
         6kmoRGkL8zdl0AgEDHh0jZJq5WemnXINfkZV2PRGtY6aFlS4evcy50ZkNqbrgQ5Ywt
         FkmgtOO8ISwsbbhE86dRqqKL+QyXR15+6PMXkOeNiqH/SJXrUqlZdQCXic7R1fgBC0
         vZjopyk7ipwkQ==
Content-Disposition: inline
In-Reply-To: <20230320131633.61680-2-andriy.shevchenko@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org

Hi Andy and Mika,

I really like the improvements here.  They make the code read much
better.

On Mon, Mar 20, 2023 at 03:16:30PM +0200, Andy Shevchenko wrote:
> From: Mika Westerberg <mika.westerberg@linux.intel.com>
> ...

>  static void fixup_winbond_82c105(struct pci_dev* dev)
>  {
> -	int i;
> +	struct resource *r;
>  	unsigned int reg;
>  
>  	if (!machine_is(pseries))
> @@ -251,14 +251,14 @@ static void fixup_winbond_82c105(struct pci_dev* dev)
>  	/* Enable LEGIRQ to use INTC instead of ISA interrupts */
>  	pci_write_config_dword(dev, 0x40, reg | (1<<11));
>  
> -	for (i = 0; i < DEVICE_COUNT_RESOURCE; ++i) {
> +	pci_dev_for_each_resource_p(dev, r) {
>  		/* zap the 2nd function of the winbond chip */
> -		if (dev->resource[i].flags & IORESOURCE_IO
> -		    && dev->bus->number == 0 && dev->devfn == 0x81)
> -			dev->resource[i].flags &= ~IORESOURCE_IO;
> -		if (dev->resource[i].start == 0 && dev->resource[i].end) {
> -			dev->resource[i].flags = 0;
> -			dev->resource[i].end = 0;
> +		if (dev->bus->number == 0 && dev->devfn == 0x81 &&
> +		    r->flags & IORESOURCE_IO)

This is a nice literal conversion, but it's kind of lame to test
bus->number and devfn *inside* the loop here, since they can't change
inside the loop.

> +			r->flags &= ~IORESOURCE_IO;
> +		if (r->start == 0 && r->end) {
> +			r->flags = 0;
> +			r->end = 0;
>  		}
>  	}

>  #define pci_resource_len(dev,bar) \
>  	((pci_resource_end((dev), (bar)) == 0) ? 0 :	\
>  							\
> -	 (pci_resource_end((dev), (bar)) -		\
> -	  pci_resource_start((dev), (bar)) + 1))
> +	 resource_size(pci_resource_n((dev), (bar))))

I like this change, but it's unrelated to pci_dev_for_each_resource()
and unmentioned in the commit log.

> +#define __pci_dev_for_each_resource(dev, res, __i, vartype)		\
> +	for (vartype __i = 0;						\
> +	     res = pci_resource_n(dev, __i), __i < PCI_NUM_RESOURCES;	\
> +	     __i++)
> +
> +#define pci_dev_for_each_resource(dev, res, i)				\
> +       __pci_dev_for_each_resource(dev, res, i, )
> +
> +#define pci_dev_for_each_resource_p(dev, res)				\
> +	__pci_dev_for_each_resource(dev, res, __i, unsigned int)

This series converts many cases to drop the iterator variable ("i"),
which is fantastic.

Several of the remaining places need the iterator variable only to
call pci_claim_resource(), which could be converted to take a "struct
resource *" directly without much trouble.

We don't have to do that pci_claim_resource() conversion now, but
since we're converging on the "(dev, res)" style, I think we should
reverse the names so we have something like:

  pci_dev_for_each_resource(dev, res)
  pci_dev_for_each_resource_idx(dev, res, i)

Not sure __pci_dev_for_each_resource() is worthwhile since it only
avoids repeating that single "for" statement, and passing in "vartype"
(sometimes empty to implicitly avoid the declaration) is a little
complicated to read.  I think it'd be easier to read like this:

  #define pci_dev_for_each_resource(dev, res)                      \
    for (unsigned int __i = 0;                                     \
         res = pci_resource_n(dev, __i), __i < PCI_NUM_RESOURCES;  \
         __i++)

  #define pci_dev_for_each_resource_idx(dev, res, idx)             \
    for (idx = 0;                                                  \
         res = pci_resource_n(dev, idx), idx < PCI_NUM_RESOURCES;  \
         idx++)

Bjorn
