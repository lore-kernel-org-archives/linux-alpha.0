From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v6 2/4] PCI: Split pci_bus_for_each_resource_p() out of
 pci_bus_for_each_resource()
Date: Wed, 22 Mar 2023 14:35:25 -0500
Message-ID: <20230322193525.GA2487882@bhelgaas>
References: <20230320131633.61680-3-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679513726;
        bh=FhntRrT8ocoSuGXxtLHKzHWzymmkrlLBWHmrPDDVUUo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=TZXj21NeIUkUZZar7VNMqh3dVSuN3o8smKLoGeKlxFM4u9gfOpaC3kuIEPrC8theJ
         EjPJVc9oufTxzPD7G4Hc8hmuSNFg5ASYHNUqVWj4Pm/PAM0cm4Y0hL/TmGR1vF7cRJ
         ghHYAN2nzfJSugY4ZFFucSttfz82MaXOPTFpw736rSuhY7yG3U/x5krQWe30aNyfH3
         TpCuc9D3+sHvl4qsdpIcmDaIEydMxpzHx8G9wZuc/iInxcv8qZuNxXLKv+GJGD4EfH
         DaiPCrrrg2VbKAwdhc5c78r9UJzE633kYTaRwA7Xko4oXiDWsAIH0RPGJpwYNqkaDa
         lXTFXlUZ+LxhA==
Content-Disposition: inline
In-Reply-To: <20230320131633.61680-3-andriy.shevchenko@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org

On Mon, Mar 20, 2023 at 03:16:31PM +0200, Andy Shevchenko wrote:
> ...

> -#define pci_bus_for_each_resource(bus, res, i)				\
> -	for (i = 0;							\
> -	    (res = pci_bus_resource_n(bus, i)) || i < PCI_BRIDGE_RESOURCE_NUM; \
> -	     i++)
> +#define __pci_bus_for_each_resource(bus, res, __i, vartype)			\
> +	for (vartype __i = 0;							\
> +	     res = pci_bus_resource_n(bus, __i), __i < PCI_BRIDGE_RESOURCE_NUM;	\
> +	     __i++)
> +
> +#define pci_bus_for_each_resource(bus, res, i)					\
> +	__pci_bus_for_each_resource(bus, res, i, )
> +
> +#define pci_bus_for_each_resource_p(bus, res)					\
> +	__pci_bus_for_each_resource(bus, res, __i, unsigned int)

I like these changes a lot, too!

Same comments about _p vs _idx and __pci_bus_for_each_resource(...,
vartype).

Also would prefer 80 char max instead of 81.
