From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Date: Sun, 29 Aug 2021 11:27:42 -0400
Message-ID: <20210829112105-mutt-send-email-mst@kernel.org>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210805005218.2912076-12-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210823195409-mutt-send-email-mst@kernel.org>
 <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
 <CAPcyv4iJVQKJ3bVwZhD08c8GNEP0jW2gx=H504NXcYK5o2t01A@mail.gmail.com>
 <d992b5af-8d57-6aa6-bd49-8e2b8d832b19@linux.intel.com>
 <20210824053830-mutt-send-email-mst@kernel.org>
 <d21a2a2d-4670-ba85-ce9a-fc8ea80ef1be@linux.intel.com>
Mime-Version: 1.0
Return-path: <sparclinux-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630250870;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/S0QZCFqA24VJgqlctj6OrB5o3BOYhqGUcLEBNlCi1I=;
        b=ElJiKy7/0Xuj6MbzzV2p2HwXbyFVWUCXAn6WJaDYPxPkC9S/JPbel2Yb1R/wc9ghqHXv0G
        HT/0f5AT88AaKySBnLKjYUmpU4RmXHmGlDjeWvjCYZBwTrDxNHuEMAo0/ZoUo74L8M/7ZR
        Nu5+17ZdsawMxR+QCmP7inaOSol9b50=
Content-Disposition: inline
In-Reply-To: <d21a2a2d-4670-ba85-ce9a-fc8ea80ef1be@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@linux.intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Kirill Shutemov <kirill.shutemov@lin>

On Tue, Aug 24, 2021 at 10:20:44AM -0700, Andi Kleen wrote:
> 
> > I see. Hmm. It's a bit of a random thing to do it at the map time
> > though. E.g. DMA is all handled transparently behind the DMA API.
> > Hardening is much more than just replacing map with map_shared
> > and I suspect what you will end up with is basically
> > vendors replacing map with map shared to make things work
> > for their users and washing their hands.
> 
> That concept exists too. There is a separate allow list for the drivers. So
> just adding shared to a driver is not enough, until it's also added to the
> allowlist
> 
> Users can of course chose to disable the allowlist, but they need to
> understand the security implications.

Right. So given that, why do we need to tweak a random API like the map?
If you just make all maps be shared then the user is in control.
Seems sensible to me.

> 
> > 
> > I would say an explicit flag in the driver that says "hardened"
> > and refusing to init a non hardened one would be better.
> 
> 
> We have that too (that's the device filtering)
> 
> But the problem is that device filtering just stops the probe functions, not
> the initcalls, and lot of legacy drivers do MMIO interactions before going
> into probe. In some cases it's unavoidable because of the device doesn't
> have a separate enumeration mechanism it needs some kind of probing to even
> check for its existence And since we don't want to change all of them it's
> far safer to make the ioremap opt-in.
> 
> 
> -Andi

Let's be frank, even without encryption disabling most drivers -
especially weird ones that poke at hardware before probe -
is far safer than keeping them, but one loses a bunch of features.
IOW all this hardening is nice but which security/feature tradeoff
to take it a policy decision, not something kernel should do
imho.

-- 
MST

