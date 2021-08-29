From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Date: Sun, 29 Aug 2021 09:43:14 -0700
Message-ID: <82e133af-6ad4-6910-8b1a-3f9e1a42a0fa@linux.intel.com>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210805005218.2912076-12-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210823195409-mutt-send-email-mst@kernel.org>
 <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
 <YSSay4zGjLaNMOh1@infradead.org>
 <2747d96f-5063-7c63-5a47-16ea299fa195@linux.intel.com>
 <20210829113023-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20210829113023-mutt-send-email-mst@kernel.org>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Christoph Hellwig <hch@infradead.org>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>

> All this makes sense but ioremap is such a random place to declare
> driver has been audited, and it's baked into the binary with no way for
> userspace to set policy.
>
> Again all we will end up with is gradual replacement of all ioremap
> calls with ioremap_shared as people discover a given driver does not
> work in a VM.

No the device filter will prevent that. They would need to submit 
patches to the central list.

Or they can override it at the command line, but there is already an 
option to force all ioremaps to be shared. So if you just want some 
driver to run without caring about security you can already do that 
without modifying it.

Besides the shared concept only makes sense for virtual devices, so if 
you don't have a device model for a device this will never happen either.

So I don't think your scenario of all ioremaps becoming shared will ever 
happen.


> How are you going to know driver has actually been
> audited? what the quality of the audit was? did the people doing the
> auditing understand what they are auditing for?  No way, right?

First the primary purpose of the ioremap policy is to avoid messing with 
all the legacy drivers (which is 99+% of the code base)

How to handle someone maliciously submitting a driver to the kernel is a 
completely different problem. To some degree there is trust of course. 
If someone says they audited and a maintainer trusts them with their 
statement, but they actually didn't there is a problem, but it's larger 
than just TDX. But in such a case the community code audit will also 
focus on such areas, and people interested in confidential computing 
security will also start taking a look.

And we're also working on fuzzing, so these drivers will be fuzzed at 
some point, so mistakes will be eventually found.

But in any case the ioremap policy is mainly to prevent having to handle 
this for all legacy drivers.

I would rather change the few drivers that are actually needed, than all 
the other drivers.

That's really the fundamental problem this is addressing: how to get 
reasonable security with all the legacy drivers out of the box without 
touching them.


-Andi


