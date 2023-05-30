From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update
 users
Date: Tue, 30 May 2023 16:24:02 -0500
Message-ID: <ZHZpcli2UmdzHgme@bhelgaas>
References: <ZF6YIezraETr9iNM@bhelgaas>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685481844;
        bh=nSQjRvB5sqKGMsdtyBRHXZYqX4emyOnsRXhxnpxj5CY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=TV1bjAHwa6NLdVZVD7DllGDZUObfyAObgZ8dpZarPA3MFb+4JwjHeGjrah/sKeuB6
         Xq8Z6uhzHX0F3PKJSdkRh1pFxjO+XorK0VZvx6no556rDJNfISNz+wSJYYSdEmvn7Z
         hUMZYEgCtddE7YUdKaua4hQLvfWtpf57g3PAd+6ZmWrfu2xY5A7mha+RytVeJ/84Sv
         mxnDEJPKCDkp/bA6BADO+x5ZZtDdknfJeDc4bcwl2S3en2mWL+rmMtiDyQsmiX2t01
         UKGSafGTnUjV0OrS31D6yutY2Y59cmVv6Xh9lXe15RO90svr9jvNnhSKkE8vII7TeO
         VMw5j/h0xzgKQ==
Content-Disposition: inline
In-Reply-To: <ZF6YIezraETr9iNM@bhelgaas>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory Clement <gregory.clement@bootlin.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

On Fri, May 12, 2023 at 02:48:51PM -0500, Bjorn Helgaas wrote:
> On Fri, May 12, 2023 at 01:56:29PM +0300, Andy Shevchenko wrote:
> > On Tue, May 09, 2023 at 01:21:22PM -0500, Bjorn Helgaas wrote:
> > > On Tue, Apr 04, 2023 at 11:11:01AM -0500, Bjorn Helgaas wrote:
> > > > On Thu, Mar 30, 2023 at 07:24:27PM +0300, Andy Shevchenko wrote:
> > > > > Provide two new helper macros to iterate over PCI device resources and
> > > > > convert users.
> > > 
> > > > Applied 2-7 to pci/resource for v6.4, thanks, I really like this!
> > > 
> > > This is 09cc90063240 ("PCI: Introduce pci_dev_for_each_resource()")
> > > upstream now.
> > > 
> > > Coverity complains about each use,
> > 
> > It needs more clarification here. Use of reduced variant of the
> > macro or all of them? If the former one, then I can speculate that
> > Coverity (famous for false positives) simply doesn't understand `for
> > (type var; var ...)` code.
> 
> True, Coverity finds false positives.  It flagged every use in
> drivers/pci and drivers/pnp.  It didn't mention the arch/alpha, arm,
> mips, powerpc, sh, or sparc uses, but I think it just didn't look at
> those.
> 
> It flagged both:
> 
>   pbus_size_io    pci_dev_for_each_resource(dev, r)
>   pbus_size_mem   pci_dev_for_each_resource(dev, r, i)
> 
> Here's a spreadsheet with a few more details (unfortunately I don't
> know how to make it dump the actual line numbers or analysis like I
> pasted below, so "pci_dev_for_each_resource" doesn't appear).  These
> are mostly in the "Drivers-PCI" component.
> 
> https://docs.google.com/spreadsheets/d/1ohOJwxqXXoDUA0gwopgk-z-6ArLvhN7AZn4mIlDkHhQ/edit?usp=sharing
> 
> These particular reports are in the "High Impact Outstanding" tab.

Where are we at?  Are we going to ignore this because some Coverity
reports are false positives?

Bjorn
