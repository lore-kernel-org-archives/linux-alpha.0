From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update
 users
Date: Thu, 1 Jun 2023 19:25:46 +0300
Message-ID: <ZHjGik12vSFgi1eO@smile.fi.intel.com>
References: <ZF6YIezraETr9iNM@bhelgaas>
 <ZHZpcli2UmdzHgme@bhelgaas>
 <CAOiHx==5YWhDiZP2PyHZiJrmtqRzvqCqoSO59RwuYuR85BezBg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685636761; x=1717172761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q1NNNfNs1qkINp4+7F0o+S22gLPh78FVwhQOR7EmNDk=;
  b=WCtBTXEMjhLetcnNCW8dM0WRYV9m75ZwDYcIkIzNBmDYp418uTMxcnyX
   ixHaZrWvHUQ4NWCr8XHHm6wrzxSmwGKONUYrhenI6M6JJkFtWLTfeK00C
   Cq/xP/g4Vh7pm5Frre0W0BOYLBymxLz9S8jphH2UZz9UsrvurU81Fk388
   Ko73DFYhoNunjoXKzN+RX6yJncDjQLoJ/TTkMdsZXBMoDBdCqDjUxluHG
   XmwPrY3aJ2YA6dtN7G8PxzJGtx7uaFK5eRLVM/PsGRQ7oqSLGH2iwbfVE
   IkHQwYvozsuEGYGct7dUGUyXkoV4EnOQO+dZNBh3SuEBR2zEFjGuflSrn
   Q==;
Content-Disposition: inline
In-Reply-To: <CAOiHx==5YWhDiZP2PyHZiJrmtqRzvqCqoSO59RwuYuR85BezBg@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory Clement <gregory.clement@bootlin.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, Sebastian

On Wed, May 31, 2023 at 08:48:35PM +0200, Jonas Gorski wrote:
> On Tue, 30 May 2023 at 23:34, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Fri, May 12, 2023 at 02:48:51PM -0500, Bjorn Helgaas wrote:
> > > On Fri, May 12, 2023 at 01:56:29PM +0300, Andy Shevchenko wrote:
> > > > On Tue, May 09, 2023 at 01:21:22PM -0500, Bjorn Helgaas wrote:
> > > > > On Tue, Apr 04, 2023 at 11:11:01AM -0500, Bjorn Helgaas wrote:
> > > > > > On Thu, Mar 30, 2023 at 07:24:27PM +0300, Andy Shevchenko wrote:
> > > > > > > Provide two new helper macros to iterate over PCI device resources and
> > > > > > > convert users.
> > > > >
> > > > > > Applied 2-7 to pci/resource for v6.4, thanks, I really like this!
> > > > >
> > > > > This is 09cc90063240 ("PCI: Introduce pci_dev_for_each_resource()")
> > > > > upstream now.
> > > > >
> > > > > Coverity complains about each use,
> > > >
> > > > It needs more clarification here. Use of reduced variant of the
> > > > macro or all of them? If the former one, then I can speculate that
> > > > Coverity (famous for false positives) simply doesn't understand `for
> > > > (type var; var ...)` code.
> > >
> > > True, Coverity finds false positives.  It flagged every use in
> > > drivers/pci and drivers/pnp.  It didn't mention the arch/alpha, arm,
> > > mips, powerpc, sh, or sparc uses, but I think it just didn't look at
> > > those.
> > >
> > > It flagged both:
> > >
> > >   pbus_size_io    pci_dev_for_each_resource(dev, r)
> > >   pbus_size_mem   pci_dev_for_each_resource(dev, r, i)
> > >
> > > Here's a spreadsheet with a few more details (unfortunately I don't
> > > know how to make it dump the actual line numbers or analysis like I
> > > pasted below, so "pci_dev_for_each_resource" doesn't appear).  These
> > > are mostly in the "Drivers-PCI" component.
> > >
> > > https://docs.google.com/spreadsheets/d/1ohOJwxqXXoDUA0gwopgk-z-6ArLvhN7AZn4mIlDkHhQ/edit?usp=sharing
> > >
> > > These particular reports are in the "High Impact Outstanding" tab.
> >
> > Where are we at?  Are we going to ignore this because some Coverity
> > reports are false positives?
> 
> Looking at the code I understand where coverity is coming from:
> 
> #define __pci_dev_for_each_res0(dev, res, ...)                         \
>        for (unsigned int __b = 0;                                      \
>             res = pci_resource_n(dev, __b), __b < PCI_NUM_RESOURCES;   \
>             __b++)
> 
>  res will be assigned before __b is checked for being less than
> PCI_NUM_RESOURCES, making it point to behind the array at the end of
> the last loop iteration.

Which is fine and you stumbled over the same mistake I made, that's why the
documentation has been added to describe why the heck this macro is written
the way it's written.

Coverity sucks.

> Rewriting the test expression as
> 
> __b < PCI_NUM_RESOURCES && (res = pci_resource_n(dev, __b));
> 
> should avoid the (coverity) warning by making use of lazy evaluation.

Obviously NAK.

> It probably makes the code slightly less performant as res will now be
> checked for being not NULL (which will always be true), but I doubt it
> will be significant (or in any hot paths).

-- 
With Best Regards,
Andy Shevchenko


