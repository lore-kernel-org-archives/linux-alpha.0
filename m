From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update
 users
Date: Wed, 5 Apr 2023 11:28:27 +0300
Message-ID: <ZC0xK4YJrKga7akk@smile.fi.intel.com>
References: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
 <20230404161101.GA3554747@bhelgaas>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680683322; x=1712219322;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wrn29fWEWUh9DQE7oDLC0JoUgdEFYGWX1tgF9OvmiyE=;
  b=PXFb75YqxwFOJl+S6VpMXd/JGFHr4Tz7k73GqaeJPqSllwMdpOLI6lWN
   lX8IOp/4JY/YEw9RmqGoH6SAL2LjzWz5SCKyV+/1Wo/0bo49d9eigFJ6p
   Z8QXd7DaSuL4YCcS79tvX5JPBW70kZPyAiqQRkM4x9yVV+An+6R5ONSYn
   s4xxyYgHxLc2pUpAhqWNW1pOAO/0+DBslbDrEMNv/sCeH0jwd2W84c+rx
   VhsXyIrrdPQlUgoWbCTG8jxzZ6NwzlaoTt1Qav+Zcs0HsJLrKBUIeX2HQ
   5E1n2iKl7rxH2Ap1NvhwZyZHhkpgkqWFUTER4izh2NK6Ipuv+lALr/z/g
   w==;
Content-Disposition: inline
In-Reply-To: <20230404161101.GA3554747@bhelgaas>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Niklas Schnelle <schnelle@linux.ibm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org

On Tue, Apr 04, 2023 at 11:11:01AM -0500, Bjorn Helgaas wrote:
> On Thu, Mar 30, 2023 at 07:24:27PM +0300, Andy Shevchenko wrote:
> > Provide two new helper macros to iterate over PCI device resources and
> > convert users.
> > 
> > Looking at it, refactor existing pci_bus_for_each_resource() and convert
> > users accordingly.
> > 
> > Note, the amount of lines grew due to the documentation update.
> > 
> > Changelog v8:
> > - fixed issue with pci_bus_for_each_resource() macro (LKP)
> > - due to above added a new patch to document how it works
> > - moved the last patch to be #2 (Philippe)
> > - added tags (Philippe)
> > 
> > Changelog v7:
> > - made both macros to share same name (Bjorn)
> 
> I didn't actually request the same name for both; I would have had no
> idea how to even do that :)
> 
> v6 had:
> 
>   pci_dev_for_each_resource_p(dev, res)
>   pci_dev_for_each_resource(dev, res, i)
> 
> and I suggested:
> 
>   pci_dev_for_each_resource(dev, res)
>   pci_dev_for_each_resource_idx(dev, res, i)
> 
> because that pattern is used elsewhere.

Ah, sorry I misinterpreted your suggestion (I thought that at the end of
the day you wanted the macro to be less intrusive, so we change less code,
that's why I interpreted it the way described in the Changelog).

> But you figured out how to do
> it, and having one name is even better, so thanks for that extra work!

You are welcome!

> > - split out the pci_resource_n() conversion (Bjorn)
> > 
> > Changelog v6:
> > - dropped unused variable in PPC code (LKP)
> > 
> > Changelog v5:
> > - renamed loop variable to minimize the clash (Keith)
> > - addressed smatch warning (Dan)
> > - addressed 0-day bot findings (LKP)
> > 
> > Changelog v4:
> > - rebased on top of v6.3-rc1
> > - added tag (Krzysztof)
> > 
> > Changelog v3:
> > - rebased on top of v2 by Mika, see above
> > - added tag to pcmcia patch (Dominik)
> > 
> > Changelog v2:
> > - refactor to have two macros
> > - refactor existing pci_bus_for_each_resource() in the same way and
> >   convert users
> > 
> > Andy Shevchenko (6):
> >   kernel.h: Split out COUNT_ARGS() and CONCATENATE()
> >   PCI: Introduce pci_resource_n()
> >   PCI: Document pci_bus_for_each_resource() to avoid confusion
> >   PCI: Allow pci_bus_for_each_resource() to take less arguments
> >   EISA: Convert to use less arguments in pci_bus_for_each_resource()
> >   pcmcia: Convert to use less arguments in pci_bus_for_each_resource()

...

> Applied 2-7 to pci/resource for v6.4, thanks, I really like this!

Btw, can you actually drop patch 7, please?
After I have updated the documentation I have realised that why the first
chunk is invalid. It needs mode careful check and rework.

> I omitted
> 
>   [1/7] kernel.h: Split out COUNT_ARGS() and CONCATENATE()"
> 
> only because it's not essential to this series and has only a trivial
> one-line impact on include/linux/pci.h.

I'm not sure I understood what exactly "essentiality" means to you, but
I included that because it makes the split which can be used later by
others and not including kernel.h in the header is the objective I want
to achieve. Without this patch the achievement is going to be deferred.
Yet, this, as you have noticed, allows to compile and use the macros in
the rest of the patches.

P.S. Thank you for the review and application of the rest!

-- 
With Best Regards,
Andy Shevchenko


