From: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v4 1/4] PCI: Introduce pci_dev_for_each_resource()
Date: Fri, 10 Mar 2023 15:15:38 -0700
Message-ID: <ZAusCnLSXeEcpQs+@kbusch-mbp.dhcp.thefacebook.com>
References: <20230310171416.23356-1-andriy.shevchenko@linux.intel.com>
 <20230310171416.23356-2-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678486543;
        bh=DBl3XYhVnPnvHREV6khsX0zced8HUvT1CffAKeLd3Ro=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OfS4jME/FTj7znUmYf295mHvCJSGHW15meDAWvWzrPF00ribhkkR54Qzq1xN8JWLo
         4ifTzybHNa9ZODC6VxC42vmMGTVR8rpuWOM6tKK420xu8RHuuxnRruXC7YKzvCsgbR
         u/3W/J52kt+Sw35gEY+GHE+yc90z2JKYQ8ziYt9KjcC+XD8bNVo3dAsYq1L9Dq9Z0P
         F78mqifIRtEWY9l2xPq1eww1JPlj0DytsnzKq9XlcZ3XWB4shMaJ1Gp356DNbpjhAm
         fT6kd6cAHwWNZ9v/mPpirze0bthx/rOXMwvra8reVtn+1Ve3YO1CPCN4cOH1gbnOxg
         +A+CV4nR0FY6w==
Content-Disposition: inline
In-Reply-To: <20230310171416.23356-2-andriy.shevchenko@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.ker

On Fri, Mar 10, 2023 at 07:14:13PM +0200, Andy Shevchenko wrote:
> +#define __pci_dev_for_each_resource(dev, res, __i, vartype)		\
> +	for (vartype __i = 0;						\
> +		res = &(dev)->resource[__i], __i < PCI_NUM_RESOURCES;	\
> +		__i++)

...

> +#define pci_dev_for_each_resource_p(dev, res)				\
> +	__pci_dev_for_each_resource(dev, res, i, unsigned int)

It looks dangerous to have a macro declare a variable when starting a new
scope. How do you know the name 'i' won't clash with something defined above?
