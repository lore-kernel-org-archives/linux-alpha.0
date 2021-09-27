From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Date: Mon, 27 Sep 2021 05:07:42 -0400
Message-ID: <20210927044738-mutt-send-email-mst@kernel.org>
References: <20210829112105-mutt-send-email-mst@kernel.org>
 <09b340dd-c8a8-689c-4dad-4fe0e36d39ae@linux.intel.com>
 <20210829181635-mutt-send-email-mst@kernel.org>
 <3a88a255-a528-b00a-912b-e71198d5f58f@linux.intel.com>
 <20210830163723-mutt-send-email-mst@kernel.org>
 <69fc30f4-e3e2-add7-ec13-4db3b9cc0cbd@linux.intel.com>
 <20210910054044-mutt-send-email-mst@kernel.org>
 <f672dc1c-5280-7bbc-7a56-7c7aab31725c@linux.intel.com>
 <20210911195006-mutt-send-email-mst@kernel.org>
 <ad1e41d1-3f4e-8982-16ea-18a3b2c04019@linux.intel.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632733673;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KVP7Xe4ufaNCXcd20wpSSrMBsG9usYiBh4tpjUVxTUI=;
        b=A87jVk+oepUAxtpitt31u+xGVoIIAZhHvRG1ytMIxJ+Evgb5oKfi/FAAY/t0EhtGY2B8lu
        GsmusM22kaoZRJikJg9TYi0PoN98zEYTRM/R/2H1BcIJJCkx8JRF3r39x/pYwXMPCOrKZ5
        1Co2wrNmMfgPWkUPO8PgrqhlcK68OmY=
Content-Disposition: inline
In-Reply-To: <ad1e41d1-3f4e-8982-16ea-18a3b2c04019@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@linux.intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Kirill Shutemov <kirill.shutemov@lin>

On Fri, Sep 24, 2021 at 03:43:40PM -0700, Andi Kleen wrote:
> 
> > > Hmm, yes that's true. I guess we can make it default to opt-in for
> > > pci_iomap.
> > > 
> > > It only really matters for device less ioremaps.
> > OK. And same thing for other things with device, such as
> > devm_platform_ioremap_resource.
> > If we agree on all that, this will basically remove virtio
> > changes from the picture ;)
> 
> Hi we revisited this now. One problem with removing the ioremap opt-in is
> that it's still possible for drivers to get at devices without going through
> probe. For example they can walk the PCI device list. Some drivers do that
> for various reasons. So if we remove the opt-in we would need to audit and
> possibly fix all that, which would be potentially a lot of churn. That's why
> I think it's better to keep the opt-in.
> 
> 
> -Andi
> 

I've been thinking about why this still feels wrong to me.

Here's what I came up with: at some point someone will want one of these
modules (poking at devices in the initcall) in the encrypted
environment, and will change ioremap to ioremap_shared.
At that point the allowlist will be broken again, and
by that time it will be set in stone and too late to fix.

Isn't the problem that what is actually audited is modules,
but you are trying to add devices to allow list?
So why not have modules/initcalls in the allowlist then?
For built-in modules, we already have initcall_blacklisted, right?
This could be an extension ... no?

-- 
MST

