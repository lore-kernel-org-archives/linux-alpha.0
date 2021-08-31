From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Date: Mon, 30 Aug 2021 17:23:17 -0700
Message-ID: <69fc30f4-e3e2-add7-ec13-4db3b9cc0cbd@linux.intel.com>
References: <20210823195409-mutt-send-email-mst@kernel.org>
 <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
 <CAPcyv4iJVQKJ3bVwZhD08c8GNEP0jW2gx=H504NXcYK5o2t01A@mail.gmail.com>
 <d992b5af-8d57-6aa6-bd49-8e2b8d832b19@linux.intel.com>
 <20210824053830-mutt-send-email-mst@kernel.org>
 <d21a2a2d-4670-ba85-ce9a-fc8ea80ef1be@linux.intel.com>
 <20210829112105-mutt-send-email-mst@kernel.org>
 <09b340dd-c8a8-689c-4dad-4fe0e36d39ae@linux.intel.com>
 <20210829181635-mutt-send-email-mst@kernel.org>
 <3a88a255-a528-b00a-912b-e71198d5f58f@linux.intel.com>
 <20210830163723-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <20210830163723-mutt-send-email-mst@kernel.org>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Dan Williams <dan.j.williams@intel.com>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Kirill Shutemov <kirill.shutemov@lin>


On 8/30/2021 1:59 PM, Michael S. Tsirkin wrote:
>
>> Or we can add _audited to the name. ioremap_shared_audited?
> But it's not the mapping that has to be done in handled special way.
> It's any data we get from device, not all of it coming from IO, e.g.
> there's DMA and interrupts that all have to be validated.
> Wouldn't you say that what is really wanted is just not running
> unaudited drivers in the first place?


Yes.


>
>> And we've been avoiding that drivers can self declare auditing, we've been
>> trying to have a separate centralized list so that it's easier to enforce
>> and avoids any cut'n'paste mistakes.
>>
>> -Andi
> Now I'm confused. What is proposed here seems to be basically that,
> drivers need to declare auditing by replacing ioremap with
> ioremap_shared.

Auditing is declared on the device model level using a central allow list.

But this cannot do anything to initcalls that run before probe, that's 
why an extra level of defense of ioremap opt-in is useful. But it's not 
the primary mechanism to declare a driver audited, that's the allow 
list. The ioremap is just another mechanism to avoid having to touch a 
lot of legacy drivers.

If we agree on that then the original proposed semantics of 
"ioremap_shared" may be acceptable?

-Andi



