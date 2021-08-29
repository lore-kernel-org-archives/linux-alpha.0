From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Date: Sun, 29 Aug 2021 09:17:53 -0700
Message-ID: <09b340dd-c8a8-689c-4dad-4fe0e36d39ae@linux.intel.com>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210805005218.2912076-12-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210823195409-mutt-send-email-mst@kernel.org>
 <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
 <CAPcyv4iJVQKJ3bVwZhD08c8GNEP0jW2gx=H504NXcYK5o2t01A@mail.gmail.com>
 <d992b5af-8d57-6aa6-bd49-8e2b8d832b19@linux.intel.com>
 <20210824053830-mutt-send-email-mst@kernel.org>
 <d21a2a2d-4670-ba85-ce9a-fc8ea80ef1be@linux.intel.com>
 <20210829112105-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20210829112105-mutt-send-email-mst@kernel.org>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Dan Williams <dan.j.williams@intel.com>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Kirill Shutemov <kirill.shutemov@lin>


> Let's be frank, even without encryption disabling most drivers -
> especially weird ones that poke at hardware before probe -
> is far safer than keeping them, but one loses a bunch of features.

Usually we don't lose features at all. None of the legacy drivers are 
needed on a guest (or even a modern native system). It's all just all 
for old hardware. Maybe in 20+ years it can be all removed, but we can't 
wait that long.

> IOW all this hardening is nice but which security/feature tradeoff
> to take it a policy decision, not something kernel should do
> imho.

There's no mechanism to push this kind of policy to user space. Users 
don't have control what initcalls run. At the time they execute there 
isn't even any user space yet.

Even if they could somehow control them it's very unlikely they would 
understand them and make an informed decision.

Doing it at build time is not feasible either since we want to run on 
standard distribution kernels.

For modules we have a policy mechanism (prevent udev probing by 
preventing enumeration), and that is implemented, but only handling 
modules is not enough. The compiled in drivers have to be handled too, 
otherwise you have gaping holes in the protection. We don't prevent 
users manually loading modules that might probe, but that is a policy 
decision that users actually sensibly make in user space.

Also I changing this single call really that bad? It's not that we 
changing anything drastic here, just give the low level subsystem a 
better hint about the intention. If you don't like the function name, 
could make it an argument instead?

-Andi



>
