From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update
 users
Date: Tue, 9 May 2023 13:21:22 -0500
Message-ID: <20230509182122.GA1259567@bhelgaas>
References: <20230404161101.GA3554747@bhelgaas>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683656484;
        bh=wTrGWZ/prXac+ksuuHC0df7jUrXSG9zBg0tuZm4eZAk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=eWEhqVADxc/GqJSwXnOQ3JLmV9EVm67GRKXU/8kCH+e7bYAn4tbjZ8OZRHVaX3ZcO
         S0xv0AhCQd5NINM++YJU/lVWNxRqARJ2JdTZgkf8DKQ/aBVDAb43Y4DpvrsggmiDhc
         VLuK4RypC1++gIMHtYJwDcVU3u+My56Q4IZYK0at1LgOku1qb8yZmqculMrILZXTXZ
         neG8vnzAeERR8/VCvqWmCzd1JtSknWdohvz8yYije8I6fBKpAtZuUigoK/yqxiyRiQ
         4E280Lp7b1rI5aQ6wbmUv7nAdHleWjJ8JY7/fVD00VEW304Ke/w4PCv+lqMsKKDnXi
         XzOdVIUpJ2dRg==
Content-Disposition: inline
In-Reply-To: <20230404161101.GA3554747@bhelgaas>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory Clement <gregory.clement@bootlin.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@ar>

On Tue, Apr 04, 2023 at 11:11:01AM -0500, Bjorn Helgaas wrote:
> On Thu, Mar 30, 2023 at 07:24:27PM +0300, Andy Shevchenko wrote:
> > Provide two new helper macros to iterate over PCI device resources and
> > convert users.

> Applied 2-7 to pci/resource for v6.4, thanks, I really like this!

This is 09cc90063240 ("PCI: Introduce pci_dev_for_each_resource()")
upstream now.

Coverity complains about each use, sample below from
drivers/pci/vgaarb.c.  I didn't investigate at all, so it might be a
false positive; just FYI.

	  1. Condition screen_info.capabilities & (2U /* 1 << 1 */), taking true branch.
  556        if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
  557                base |= (u64)screen_info.ext_lfb_base << 32;
  558
  559        limit = base + size;
  560
  561        /* Does firmware framebuffer belong to us? */
	  2. Condition __b < PCI_NUM_RESOURCES, taking true branch.
	  3. Condition (r = &pdev->resource[__b]) , (__b < PCI_NUM_RESOURCES), taking true branch.
	  6. Condition __b < PCI_NUM_RESOURCES, taking true branch.
	  7. cond_at_most: Checking __b < PCI_NUM_RESOURCES implies that __b may be up to 16 on the true branch.
	  8. Condition (r = &pdev->resource[__b]) , (__b < PCI_NUM_RESOURCES), taking true branch.
	  11. incr: Incrementing __b. The value of __b may now be up to 17.
	  12. alias: Assigning: r = &pdev->resource[__b]. r may now point to as high as element 17 of pdev->resource (which consists of 17 64-byte elements).
	  13. Condition __b < PCI_NUM_RESOURCES, taking true branch.
	  14. Condition (r = &pdev->resource[__b]) , (__b < PCI_NUM_RESOURCES), taking true branch.
  562        pci_dev_for_each_resource(pdev, r) {
	  4. Condition resource_type(r) != 512, taking true branch.
	  9. Condition resource_type(r) != 512, taking true branch.

  CID 1529911 (#1 of 1): Out-of-bounds read (OVERRUN)
  15. overrun-local: Overrunning array of 1088 bytes at byte offset 1088 by dereferencing pointer r. [show details]
  563                if (resource_type(r) != IORESOURCE_MEM)
	  5. Continuing loop.
	  10. Continuing loop.
  564                        continue;
