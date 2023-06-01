From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update users
Date: Thu, 1 Jun 2023 13:17:21 +0200
Message-ID: <CAOiHx=nTgtnfUqRDJR0yFP0du3Yvs73PkEUR_1eb+1gtbDBM-g@mail.gmail.com>
References: <CAOiHx==5YWhDiZP2PyHZiJrmtqRzvqCqoSO59RwuYuR85BezBg@mail.gmail.com>
 <ZHe8dKb3f392MfBO@bhelgaas>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685618253; x=1688210253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3KLMivggFERHTUQ4oKDCdCn/4yto409QZ31zuIfVcxw=;
        b=MeUm9YdyFvQ+EmzMauQm3DwWlQ0uGm51kMyqs4PhBgH/mijyrQiG2NopdYymwRbJxY
         WBb3Tf1Ln6XZqKWhH5S7yQhGi9LLiabQOTeQ8Pbm6c1NX2Xy4WY3/v4jgXe5Wm7qcbDH
         yEY3HNSHJGimYiFdpPz7nmg67nUmGWb4PamYB7ge/Vdfq0ytqPkY0wlqmD8GxJ3QU2ha
         YMgYHSJ7Qpd2tGHgPxbotFgYnGiJWb6n/hwdCwf80mscrhqXd4SxH5LEbISu95zojTnv
         WNtxh7RS0s5xKaXlqlboISfHSVYLF8kc+uAACZeNu+Oizk+CGC+kRe6EXEKAHfyfkH5e
         ZLFg==
In-Reply-To: <ZHe8dKb3f392MfBO@bhelgaas>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory Clement <gregory.clement@bootlin.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, Sebas

On Wed, 31 May 2023 at 23:30, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, May 31, 2023 at 08:48:35PM +0200, Jonas Gorski wrote:
> > ...
>
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

Not sure when I'll come around to, so I have no strong feeling here.
So feel free to just borrow my suggestion, especially since I won't be
able to test it (don't have a kernel tree ready I can build and boot).

Also looking more closely at the Coverity output, I think it might not
handle the comma operator well in the loop condition:

>          11. incr: Incrementing __b. The value of __b may now be up to 17.
>          12. alias: Assigning: r = &pdev->resource[__b]. r may now point to as high as element 17 of pdev->resource (which consists of 17 64-byte elements).
>          13. Condition __b < PCI_NUM_RESOURCES, taking true branch.
>          14. Condition (r = &pdev->resource[__b]) , (__b < PCI_NUM_RESOURCES), taking true branch.

13 If __b is 17 ( = PCI_NUM_RESOURCES) we wouldn't taking the true
branch, but somehow Coverity thinks that we do. No idea if it is worth
reporting to Coverity.

The changed condition statement should hopefully silence the warning though.

Regards
Jonas
