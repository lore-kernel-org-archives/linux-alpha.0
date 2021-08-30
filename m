From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Date: Mon, 30 Aug 2021 16:59:50 -0400
Message-ID: <20210830163723-mutt-send-email-mst@kernel.org>
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630357199;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZDgZoaGxuF8+VxsBt8mWUj6L6RMapnQD42kDmE3TNZQ=;
        b=GH03Om/445Kfh0spCpfgBXGkgopeKaJKIqsbbIqGNoDmAlnZTvAthA2tI2dz9Aq5cuTnHb
        S/4bNzDF2aRH+g5BXDAau4HDRE6CwBE5H4ZiUVX0kxknRtFixsmYk2gTkESXfR+1kQusEc
        NugrIp20O33foRVdV+QJ3G9RR3jW/9o=
Content-Disposition: inline
In-Reply-To: <3a88a255-a528-b00a-912b-e71198d5f58f@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andi Kleen <ak@linux.intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Kirill Shutemov <kirill.shutemov@lin>

On Sun, Aug 29, 2021 at 10:11:46PM -0700, Andi Kleen wrote:
>=20
> On 8/29/2021 3:26 PM, Michael S. Tsirkin wrote:
> > On Sun, Aug 29, 2021 at 09:17:53AM -0700, Andi Kleen wrote:
> > > Also I changing this single call really that bad? It's not that we ch=
anging
> > > anything drastic here, just give the low level subsystem a better hin=
t about
> > > the intention. If you don't like the function name, could make it an
> > > argument instead?
> > My point however is that the API should say that the
> > driver has been audited,
>=20
> We have that status in the struct device. If you want to tie the ioremap =
to
> that we could define a ioremap_device() with a device argument and decide
> based on that.

But it's not the device that is audited. And it's not the device
that might be secure or insecure. It's the driver.

> Or we can add _audited to the name. ioremap_shared_audited?

But it's not the mapping that has to be done in handled special way.
It's any data we get from device, not all of it coming from IO, e.g.
there's DMA and interrupts that all have to be validated.
Wouldn't you say that what is really wanted is just not running
unaudited drivers in the first place?

>=20
> > not that the mapping has been
> > done in some special way. For example the mapping can be
> > in some kind of wrapper, not directly in the driver.
> > However you want the driver validated, not the wrapper.
> >=20
> > Here's an idea:
>=20
>=20
> I don't think magic differences of API behavior based on some define are a
> good idea.=A0 That's easy to miss.

Well ... my point is that actually there is no difference in API
behaviour. the map is the same map, exactly same data goes to device. If
anything any non-shared map is special in that encrypted data goes to
device.

>=20
> That's a "COME FROM" in API design.
>=20
> Also it wouldn't handle the case that a driver has both private and shared
> ioremaps, e.g. for BIOS structures.

Hmm. Interesting.  It's bios maps that are unusual and need to be private t=
hough ...

> And we've been avoiding that drivers can self declare auditing, we've been
> trying to have a separate centralized list so that it's easier to enforce
> and avoids any cut'n'paste mistakes.
>=20
> -Andi

Now I'm confused. What is proposed here seems to be basically that,
drivers need to declare auditing by replacing ioremap with
ioremap_shared.

--=20
MST

