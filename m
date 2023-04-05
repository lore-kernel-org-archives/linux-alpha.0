From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update
 users
Date: Wed, 5 Apr 2023 15:18:32 -0500
Message-ID: <20230405201832.GA3638070@bhelgaas>
References: <ZC0xK4YJrKga7akk@smile.fi.intel.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680725914;
        bh=nzqjLaTJey3sRM+1TqQcKEYWams7IVp4kAG1Ou4QbaQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=qSIFfK6lOkdOAB5LY9zLp6kglpMt1j7LNegofExp0NbD3DdGJu2FIQSd9fKDakYSF
         8EdaJODqwbg6kctJMgL0riv0zeo2GlzJNTyce/xBoaGt5wkbyslXtmEQr79jETD5VN
         JkGR/SuDh0S5XNaO9WvVcUE8aLyF+fq2KHagkNoYCPN/ufYZsMFzIEL8TOwxz22rru
         dTfc7KYc7iXQfdVOTiFqncjiOZ6vNACqFFlXmfZkUJ6vh6opIHeXG2F88mLt2+N1/j
         qSW8PkxMlDLNSe4zXOh05GwayXmUNnmLRiK0jPqk3fXDd1WbPKGLoR9/9OHb8FIaNI
         uOrsrDeBHNVGg==
Content-Disposition: inline
In-Reply-To: <ZC0xK4YJrKga7akk@smile.fi.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Niklas Schnelle <schnelle@linux.ibm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org

On Wed, Apr 05, 2023 at 11:28:27AM +0300, Andy Shevchenko wrote:
> On Tue, Apr 04, 2023 at 11:11:01AM -0500, Bjorn Helgaas wrote:
> > On Thu, Mar 30, 2023 at 07:24:27PM +0300, Andy Shevchenko wrote:
> > > Provide two new helper macros to iterate over PCI device resources and
> > > convert users.
> > > 
> > > Looking at it, refactor existing pci_bus_for_each_resource() and convert
> > > users accordingly.

> > Applied 2-7 to pci/resource for v6.4, thanks, I really like this!
> 
> Btw, can you actually drop patch 7, please?

Done.

> > I omitted
> > 
> >   [1/7] kernel.h: Split out COUNT_ARGS() and CONCATENATE()"
> > 
> > only because it's not essential to this series and has only a trivial
> > one-line impact on include/linux/pci.h.
> 
> I'm not sure I understood what exactly "essentiality" means to you, but
> I included that because it makes the split which can be used later by
> others and not including kernel.h in the header is the objective I want
> to achieve. Without this patch the achievement is going to be deferred.
> Yet, this, as you have noticed, allows to compile and use the macros in
> the rest of the patches.

I haven't followed the kernel.h splitting, and I try to avoid
incidental changes outside of the files I maintain, so I just wanted
to keep this series purely PCI and avoid any possible objections to a
new include file or discussion about how it should be done.
