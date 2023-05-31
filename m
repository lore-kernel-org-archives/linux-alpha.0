From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update
 users
Date: Wed, 31 May 2023 16:30:28 -0500
Message-ID: <ZHe8dKb3f392MfBO@bhelgaas>
References: <CAOiHx==5YWhDiZP2PyHZiJrmtqRzvqCqoSO59RwuYuR85BezBg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685568630;
        bh=gW9waI0b8IiYUwk0vfOCM7pXk2nDw1QSAznIy/h3ghs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=KtBbCN/ixHzj8ZulEY/5zCSpe/VVKBpSZFDZuNCSDCoNNZ4IeoA+28lWLQWvSlii6
         83BDJpZxFh6HJCKpfPSOLONuS2M6Vumh+ceOlzxWjyrmYHupNvr4DztdjDLJl3iqmN
         E3araGx+1PyOqST2zluz35yOcgzUDjix8glDLTAN/wUxtojSsJeinZtS0BNCLJVOXb
         hkXJLKswE11TqxiL8vaPqm931ggJJ71GILWlC61yGzVhgB56FeGO9+L1ZryEUY7qlP
         EPZxdEvOEEyvpu7VdWJnY4Z4bFlhgqbJcQ6tWlmZqEjiu2TPM90LCU6E74dCFHn04m
         J5aGwHVGTvHag==
Content-Disposition: inline
In-Reply-To: <CAOiHx==5YWhDiZP2PyHZiJrmtqRzvqCqoSO59RwuYuR85BezBg@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory Clement <gregory.clement@bootlin.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, Sebast

On Wed, May 31, 2023 at 08:48:35PM +0200, Jonas Gorski wrote:
> ...

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
> 
> Rewriting the test expression as
> 
> __b < PCI_NUM_RESOURCES && (res = pci_resource_n(dev, __b));
> 
> should avoid the (coverity) warning by making use of lazy evaluation.
> 
> It probably makes the code slightly less performant as res will now be
> checked for being not NULL (which will always be true), but I doubt it
> will be significant (or in any hot paths).

Thanks a lot for looking into this!  I think you're right, and I think
the rewritten expression is more logical as well.  Do you want to post
a patch for it?

Bjorn
