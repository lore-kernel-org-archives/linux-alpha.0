From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update
 users
Date: Mon, 5 Jun 2023 17:04:05 +0300
Message-ID: <ZH3rVcSr+m8DHmo9@smile.fi.intel.com>
References: <CAOiHx==5YWhDiZP2PyHZiJrmtqRzvqCqoSO59RwuYuR85BezBg@mail.gmail.com>
 <ZHe8dKb3f392MfBO@bhelgaas>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685974074; x=1717510074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zjA9XYetqLmj2er7YOpXmYqZcR8z8Fh+g5Flt9xdytk=;
  b=V1qpbe5GCXcEd+WXHjE2Ec4+yeFaghq8tJf9dtaC3jkyU3cCzaltWhl/
   0yBrMSrDL6PrLWPfMkwu8ZQIJlzqliPZE5xKanBO+8dzTb8l7sM4c4FdX
   2P1sbRmKVO54MnkxedJW4W/mSeBPHkKvg3RSv1pCF+reZqNb8BhkjOvMT
   FOsFncTrSHbTEmQrs79O7ZFmG4OMncKlgBIRFpp3CrFSOC6wEYtYSlDYP
   nwG871Y1qA7zQorEVJvOE7xdEhFlaKqY0DXjK/GInYwtgPxHoNjZDFw0V
   s2CHloMK1bWA8cvcvXBOh/F0Wb4hg46X5NHVJRNj0VQlnmDjZPhpB77Gv
   A==;
Content-Disposition: inline
In-Reply-To: <ZHe8dKb3f392MfBO@bhelgaas>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Andrew Lunn <andrew@lunn.ch>, Jonas Gorski <jonas.gorski@gmail.com>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory Clement <gregory.clement@bootlin.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arn d Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Richard Henderson <richard.h>

On Wed, May 31, 2023 at 04:30:28PM -0500, Bjorn Helgaas wrote:
> On Wed, May 31, 2023 at 08:48:35PM +0200, Jonas Gorski wrote:

...

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
> > 
> > Rewriting the test expression as
> > 
> > __b < PCI_NUM_RESOURCES && (res = pci_resource_n(dev, __b));
> > 
> > should avoid the (coverity) warning by making use of lazy evaluation.
> > 
> > It probably makes the code slightly less performant as res will now be
> > checked for being not NULL (which will always be true), but I doubt it
> > will be significant (or in any hot paths).
> 
> Thanks a lot for looking into this!  I think you're right, and I think
> the rewritten expression is more logical as well.  Do you want to post
> a patch for it?

Gimme some time, I was on a long leave and now it's a pile to handle.

-- 
With Best Regards,
Andy Shevchenko


