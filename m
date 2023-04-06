From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update
 users
Date: Thu, 6 Apr 2023 13:31:07 +0300
Message-ID: <ZC6fa1vJGOOI7t8a@smile.fi.intel.com>
References: <ZC0xK4YJrKga7akk@smile.fi.intel.com>
 <20230405201832.GA3638070@bhelgaas>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680777085; x=1712313085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3ceVcmjc6Ptm9PzaLBlyJdk3QXqcq40nfjFwb4WczVs=;
  b=kOgwiJmMD8Ijg1BxIDiKzJGlnfh06c4u/a+t6pG62SWIfHGF43vwVcn1
   l6kS+CWjI97tH1JSPZkOsacTF0JAUvep3W1ya7BUNjaWtSu7hvUBsFwJz
   BlQ2tzA8zaxvzXb1oiwO6NBUu4WDqTE/TetiEy6DMDrGtz8beNGL74wJD
   dCyJbcd2nE9qI2kCe1NPga9pgkYVvDi8lCXHSDtjgFmEp3jJFueV16xhT
   SBGxffan6xHWIQQumEr51X4IvgROVSWHITRTO8w1ZsICins7XqX5z2WvK
   xY5dytToTv+c5r1i6cuzWbUECnfKoYXigdPJ/pjWqzQorPBjnWriHCQw7
   w==;
Content-Disposition: inline
In-Reply-To: <20230405201832.GA3638070@bhelgaas>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Niklas Schnelle <schnelle@linux.ibm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org

On Wed, Apr 05, 2023 at 03:18:32PM -0500, Bjorn Helgaas wrote:
> On Wed, Apr 05, 2023 at 11:28:27AM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 04, 2023 at 11:11:01AM -0500, Bjorn Helgaas wrote:
> > > On Thu, Mar 30, 2023 at 07:24:27PM +0300, Andy Shevchenko wrote:

...

> > > I omitted
> > > 
> > >   [1/7] kernel.h: Split out COUNT_ARGS() and CONCATENATE()"
> > > 
> > > only because it's not essential to this series and has only a trivial
> > > one-line impact on include/linux/pci.h.
> > 
> > I'm not sure I understood what exactly "essentiality" means to you, but
> > I included that because it makes the split which can be used later by
> > others and not including kernel.h in the header is the objective I want
> > to achieve. Without this patch the achievement is going to be deferred.
> > Yet, this, as you have noticed, allows to compile and use the macros in
> > the rest of the patches.
> 
> I haven't followed the kernel.h splitting, and I try to avoid
> incidental changes outside of the files I maintain, so I just wanted
> to keep this series purely PCI and avoid any possible objections to a
> new include file or discussion about how it should be done.

Okay, fair enough :-) Thank you for elaboration, I will send the new version of
patch 7 separately.

-- 
With Best Regards,
Andy Shevchenko


