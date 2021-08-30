From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Date: Sun, 29 Aug 2021 22:11:46 -0700
Message-ID: <3a88a255-a528-b00a-912b-e71198d5f58f@linux.intel.com>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210805005218.2912076-12-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210823195409-mutt-send-email-mst@kernel.org>
 <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
 <CAPcyv4iJVQKJ3bVwZhD08c8GNEP0jW2gx=H504NXcYK5o2t01A@mail.gmail.com>
 <d992b5af-8d57-6aa6-bd49-8e2b8d832b19@linux.intel.com>
 <20210824053830-mutt-send-email-mst@kernel.org>
 <d21a2a2d-4670-ba85-ce9a-fc8ea80ef1be@linux.intel.com>
 <20210829112105-mutt-send-email-mst@kernel.org>
 <09b340dd-c8a8-689c-4dad-4fe0e36d39ae@linux.intel.com>
 <20210829181635-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <20210829181635-mutt-send-email-mst@kernel.org>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Dan Williams <dan.j.williams@intel.com>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Kirill Shutemov <kirill.shutemov@lin>


On 8/29/2021 3:26 PM, Michael S. Tsirkin wrote:
> On Sun, Aug 29, 2021 at 09:17:53AM -0700, Andi Kleen wrote:
>> Also I changing this single call really that bad? It's not that we chang=
ing
>> anything drastic here, just give the low level subsystem a better hint a=
bout
>> the intention. If you don't like the function name, could make it an
>> argument instead?
> My point however is that the API should say that the
> driver has been audited,

We have that status in the struct device. If you want to tie the ioremap=20
to that we could define a ioremap_device() with a device argument and=20
decide based on that.

Or we can add _audited to the name. ioremap_shared_audited?

> not that the mapping has been
> done in some special way. For example the mapping can be
> in some kind of wrapper, not directly in the driver.
> However you want the driver validated, not the wrapper.
>
> Here's an idea:


I don't think magic differences of API behavior based on some define are=20
a good idea.=C2=A0 That's easy to miss.

That's a "COME FROM" in API design.

Also it wouldn't handle the case that a driver has both private and=20
shared ioremaps, e.g. for BIOS structures.

And we've been avoiding that drivers can self declare auditing, we've=20
been trying to have a separate centralized list so that it's easier to=20
enforce and avoids any cut'n'paste mistakes.

-Andi

