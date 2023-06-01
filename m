From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update
 users
Date: Thu, 1 Jun 2023 19:27:29 +0300
Message-ID: <ZHjG8cBIdZsjhDOe@smile.fi.intel.com>
References: <ZF6YIezraETr9iNM@bhelgaas>
 <ZHZpcli2UmdzHgme@bhelgaas>
 <CAOiHx==5YWhDiZP2PyHZiJrmtqRzvqCqoSO59RwuYuR85BezBg@mail.gmail.com>
 <ZHjGik12vSFgi1eO@smile.fi.intel.com>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685636865; x=1717172865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Re3XUbJYE5wz7BKtwG+m2aCGFJz7ak2dDNPkBnP/kmg=;
  b=LYgA2WPWdZssZmEPeY1Rr7lbbbRrKYNF+Zx9CsW+bPHxHc/Jlcrw8oiJ
   ofN7lYLmBsbsCHD8m3dkobK24qeA5W0mlyrxABaxLDG1aEREmk0AqVRW3
   QV+25pR3UC2lrQjiotkiHroCv7FQ2XYhGq+v+4EFYyTtkMOO7I/U3EJ0Q
   jrQwCMxIL7WbP+Tw7TyRifglzAMurA3XfL+2KRSk/h40phCt0L0uS9aGR
   bckw71Gv8lbaIoau2digHUiKJrNB1eTd7QtzfsuTXzudG4qOCGmMEmpSv
   bsylEhnfUSIK7Z+5f/FiYr7d+VHztapVvasLBya//SzcV1LdMNfrN+3av
   A==;
Content-Disposition: inline
In-Reply-To: <ZHjGik12vSFgi1eO@smile.fi.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory Clement <gregory.clement@bootlin.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, Sebastian

On Thu, Jun 01, 2023 at 07:25:46PM +0300, Andy Shevchenko wrote:
> On Wed, May 31, 2023 at 08:48:35PM +0200, Jonas Gorski wrote:
> > On Tue, 30 May 2023 at 23:34, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Fri, May 12, 2023 at 02:48:51PM -0500, Bjorn Helgaas wrote:

...

> > > Where are we at?  Are we going to ignore this because some Coverity
> > > reports are false positives?
> > 
> > Looking at the code I understand where coverity is coming from:
> > 
> > #define __pci_dev_for_each_res0(dev, res, ...)                         \
> >        for (unsigned int __b = 0;                                      \
> >             res = pci_resource_n(dev, __b), __b < PCI_NUM_RESOURCES;   \
> >             __b++)
> > 
> >  res will be assigned before __b is checked for being less than
> > PCI_NUM_RESOURCES, making it point to behind the array at the end of
> > the last loop iteration.
> 
> Which is fine and you stumbled over the same mistake I made, that's why the
> documentation has been added to describe why the heck this macro is written
> the way it's written.
> 
> Coverity sucks.
> 
> > Rewriting the test expression as
> > 
> > __b < PCI_NUM_RESOURCES && (res = pci_resource_n(dev, __b));
> > 
> > should avoid the (coverity) warning by making use of lazy evaluation.
> 
> Obviously NAK.
> 
> > It probably makes the code slightly less performant as res will now be
> > checked for being not NULL (which will always be true), but I doubt it
> > will be significant (or in any hot paths).

Oh my god, I mistakenly read this as bus macro, sorry for my rant,
it's simply wrong.

-- 
With Best Regards,
Andy Shevchenko


