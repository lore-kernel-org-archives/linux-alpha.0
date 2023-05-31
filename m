From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update users
Date: Wed, 31 May 2023 20:48:35 +0200
Message-ID: <CAOiHx==5YWhDiZP2PyHZiJrmtqRzvqCqoSO59RwuYuR85BezBg@mail.gmail.com>
References: <ZF6YIezraETr9iNM@bhelgaas> <ZHZpcli2UmdzHgme@bhelgaas>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685558927; x=1688150927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3EtbHmfy3w5R7KQLkJ5R/6zIzXV1vr/wfKtqhO2sLZ4=;
        b=Hm0hCkYdtfQRemjMKlbllQL4O8L2Qa3TjHMKohF0mlxv+EqXmacGN9VR1Ny8tXDjdD
         ACVftV9H3bIHuquZ0Z6IE+mZYNe74kNRg3Br1jlJLowCFdPWRxtQpFk0AR3q9LiI7a38
         qPm3c5PRQ8s61eGVhHEjXW5Ih2HToJ0OAz+aWBcvAjzRU6N56VF0Fcsn7e4Of0o6uY+V
         qRpB5UPr9AHKifnMYX6CIDRDJncTTr+hdj/URjfBb9uRPa4+D9LrQ9gR8d8PKDjKpkeg
         cNuAOwwh+6NOWOIuGiEwVq+aM6BLqglu5nX06SX1AVpMS+9Xl4QNAABt0kr2BfTfppz2
         6BaA==
In-Reply-To: <ZHZpcli2UmdzHgme@bhelgaas>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory Clement <gregory.clement@bootlin.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>

Hi,

On Tue, 30 May 2023 at 23:34, Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Fri, May 12, 2023 at 02:48:51PM -0500, Bjorn Helgaas wrote:
> > On Fri, May 12, 2023 at 01:56:29PM +0300, Andy Shevchenko wrote:
> > > On Tue, May 09, 2023 at 01:21:22PM -0500, Bjorn Helgaas wrote:
> > > > On Tue, Apr 04, 2023 at 11:11:01AM -0500, Bjorn Helgaas wrote:
> > > > > On Thu, Mar 30, 2023 at 07:24:27PM +0300, Andy Shevchenko wrote:
> > > > > > Provide two new helper macros to iterate over PCI device resources and
> > > > > > convert users.
> > > >
> > > > > Applied 2-7 to pci/resource for v6.4, thanks, I really like this!
> > > >
> > > > This is 09cc90063240 ("PCI: Introduce pci_dev_for_each_resource()")
> > > > upstream now.
> > > >
> > > > Coverity complains about each use,
> > >
> > > It needs more clarification here. Use of reduced variant of the
> > > macro or all of them? If the former one, then I can speculate that
> > > Coverity (famous for false positives) simply doesn't understand `for
> > > (type var; var ...)` code.
> >
> > True, Coverity finds false positives.  It flagged every use in
> > drivers/pci and drivers/pnp.  It didn't mention the arch/alpha, arm,
> > mips, powerpc, sh, or sparc uses, but I think it just didn't look at
> > those.
> >
> > It flagged both:
> >
> >   pbus_size_io    pci_dev_for_each_resource(dev, r)
> >   pbus_size_mem   pci_dev_for_each_resource(dev, r, i)
> >
> > Here's a spreadsheet with a few more details (unfortunately I don't
> > know how to make it dump the actual line numbers or analysis like I
> > pasted below, so "pci_dev_for_each_resource" doesn't appear).  These
> > are mostly in the "Drivers-PCI" component.
> >
> > https://docs.google.com/spreadsheets/d/1ohOJwxqXXoDUA0gwopgk-z-6ArLvhN7AZn4mIlDkHhQ/edit?usp=sharing
> >
> > These particular reports are in the "High Impact Outstanding" tab.
>
> Where are we at?  Are we going to ignore this because some Coverity
> reports are false positives?

Looking at the code I understand where coverity is coming from:

#define __pci_dev_for_each_res0(dev, res, ...)                         \
       for (unsigned int __b = 0;                                      \
            res = pci_resource_n(dev, __b), __b < PCI_NUM_RESOURCES;   \
            __b++)

 res will be assigned before __b is checked for being less than
PCI_NUM_RESOURCES, making it point to behind the array at the end of
the last loop iteration.

Rewriting the test expression as

__b < PCI_NUM_RESOURCES && (res = pci_resource_n(dev, __b));

should avoid the (coverity) warning by making use of lazy evaluation.

It probably makes the code slightly less performant as res will now be
checked for being not NULL (which will always be true), but I doubt it
will be significant (or in any hot paths).

Regards,
Jonas
