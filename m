From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 1/4] PCI: Introduce pci_dev_for_each_resource()
Date: Tue, 14 Mar 2023 20:39:56 +0200
Message-ID: <ZBC/fL+KS7RiZClB@smile.fi.intel.com>
References: <20230310171416.23356-1-andriy.shevchenko@linux.intel.com>
 <20230310171416.23356-2-andriy.shevchenko@linux.intel.com>
 <ZAusCnLSXeEcpQs+@kbusch-mbp.dhcp.thefacebook.com>
Mime-Version: 1.0
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
  t=1678819225; x=1710355225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cCLbIes7UXT3DAC9eDK/G+6dQMpfpn9vtj5PUMV+0Io=;
  b=MlSrDSNx7q4lw+TXH76QNTftTtLOmycR1E2tsTCYWTDxzneRvkDchxmD
   RvEeVJGjUlAV43y8JXF0cZy8byg+H7o7A4W1btcpPaysUz/8i10Layjpd
   Id6cmtGENw/SOKq5UgWeQjbBQddQZQhwzu5isGxjGrGE0Sjg+ag6Sh+Mc
   WMR6vrud8coYf2oG3cvzWVdBaZYnLMkZoKy+7J68md209LTTke2bNQUTy
   gF3zL5BgU8fOhvpgtexbQ2Vdmu0gLhAskuRl++Y7iTy5nJUSfscdA6/sc
   X+5/8gVrJxZqM0Ap07gvO0DHzgIwoyTR07FfEhCwDfJZMEU6NvH5mbrVx
   Q==;
Content-Disposition: inline
In-Reply-To: <ZAusCnLSXeEcpQs+@kbusch-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Keith Busch <kbusch@kernel.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org, Miguel Ojeda <o>

On Fri, Mar 10, 2023 at 03:15:38PM -0700, Keith Busch wrote:
> On Fri, Mar 10, 2023 at 07:14:13PM +0200, Andy Shevchenko wrote:

...

> > +#define pci_dev_for_each_resource_p(dev, res)				\
> > +	__pci_dev_for_each_resource(dev, res, i, unsigned int)
> 
> It looks dangerous to have a macro declare a variable when starting a new
> scope. How do you know the name 'i' won't clash with something defined above?

I'll rename. Thank you.

-- 
With Best Regards,
Andy Shevchenko



