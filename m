From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Date: Sun, 10 Oct 2021 15:22:39 -0700
Message-ID: <cec62ebb-87d7-d725-1096-2c97c5eedbc3@linux.intel.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <20211009053103-mutt-send-email-mst@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Michael S. Tsirkin" <mst@redhat.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>


> To which Andi replied
> 	One problem with removing the ioremap opt-in is that
> 	it's still possible for drivers to get at devices without going through probe.
>
> To which Greg replied:
> https://lore.kernel.org/all/YVXBNJ431YIWwZdQ@kroah.com/
> 	If there are in-kernel PCI drivers that do not do this, they need to be
> 	fixed today.
>
> Can you guys resolve the differences here?


I addressed this in my other mail, but we may need more discussion.


>
> And once they are resolved, mention this in the commit log so
> I don't get to re-read the series just to find out nothing
> changed in this respect?
>
> I frankly do not believe we are anywhere near being able to harden
> an arbitrary kernel config against attack.

Why not? Device filter and the opt-ins together are a fairly strong 
mechanism.

And it's not that they're a lot of code or super complicated either.

You're essentially objecting to a single line change in your subsystem here.


> How about creating a defconfig that makes sense for TDX then?

TDX can be used in many different ways, I don't think a defconfig is 
practical.

In theory you could do some Kconfig dependency (at the pain point of 
having separate kernel binariees), but why not just do it at run time 
then if you maintain the list anyways. That's much easier and saner for 
everyone. In the past we usually always ended up with runtime mechanism 
for similar things anyways.

Also it turns out that the filter mechanisms are needed for some arch 
drivers which are not even configurable, so alone it's probably not enough,


> Anyone deviating from that better know what they are doing,
> this API tweaking is just putting policy into the kernel  ...

Hardening drivers is kernel policy. It cannot be done anywhere else.


-Andi
