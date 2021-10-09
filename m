From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(), pci_iomap_host_shared_range()
Date: Sat, 9 Oct 2021 13:39:57 -0700
Message-ID: <CAPcyv4hDhjRXYCX_aiOboLF0eaTo6VySbZDa5NQu2ed9Ty2Ekw@mail.gmail.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com> <20211009053103-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PNkbI6CC4MPwch06xoRoPuOpZuZRykTcMawJcvuLIGc=;
        b=Muu3r0eHUqB/dNHg2SbcMZBR59fyebiqEBsvk6PezrQlxQGwEI1ZicQJ1XHU8yb+jR
         kHSIW8u2KEJn+hh/8bqD+oSUoLGTMzHi2MKjMWxijaluyFQ9X/HFL9QP8jG3kJvP1+yC
         MFrvKW7dOAqDY1UzAuwqQRxVpGtbg2xoYhxoIQminXJgv3DKYb4mwO0GqHZDYiNWBRPr
         zX9FmLpjC1P17blRe4cxwK4BawnSAcTVigJTMtvWGUVR4Krw0LhW/yHMyjDs7LwJths0
         zTeiN6ZgCa7R3RDBLb9WPt7ZUqU0TGXpSpq1OOroQI9pRt1DcheHTMwoozKzKGHc51Jc
         ai5Q==
In-Reply-To: <20211009053103-mutt-send-email-mst@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Peter H Anvin <hpa@zytor.com>

On Sat, Oct 9, 2021 at 2:53 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Oct 08, 2021 at 05:37:07PM -0700, Kuppuswamy Sathyanarayanan wrote:
> > From: Andi Kleen <ak@linux.intel.com>
> >
> > For Confidential VM guests like TDX, the host is untrusted and hence
> > the devices emulated by the host or any data coming from the host
> > cannot be trusted. So the drivers that interact with the outside world
> > have to be hardened by sharing memory with host on need basis
> > with proper hardening fixes.
> >
> > For the PCI driver case, to share the memory with the host add
> > pci_iomap_host_shared() and pci_iomap_host_shared_range() APIs.
> >
> > Signed-off-by: Andi Kleen <ak@linux.intel.com>
> > Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>
> So I proposed to make all pci mappings shared, eliminating the need
> to patch drivers.
>
> To which Andi replied
>         One problem with removing the ioremap opt-in is that
>         it's still possible for drivers to get at devices without going through probe.
>
> To which Greg replied:
> https://lore.kernel.org/all/YVXBNJ431YIWwZdQ@kroah.com/
>         If there are in-kernel PCI drivers that do not do this, they need to be
>         fixed today.
>
> Can you guys resolve the differences here?

I agree with you and Greg here. If a driver is accessing hardware
resources outside of the bind lifetime of one of the devices it
supports, and in a way that neither modrobe-policy nor
device-authorization -policy infrastructure can block, that sounds
like a bug report. Fix those drivers instead of sprinkling
ioremap_shared in select places and with unclear rules about when a
driver is allowed to do "shared" mappings. Let the new
device-authorization mechanism (with policy in userspace) be the
central place where all of these driver "trust" issues are managed.

> And once they are resolved, mention this in the commit log so
> I don't get to re-read the series just to find out nothing
> changed in this respect?
>
> I frankly do not believe we are anywhere near being able to harden
> an arbitrary kernel config against attack.
> How about creating a defconfig that makes sense for TDX then?
> Anyone deviating from that better know what they are doing,
> this API tweaking is just putting policy into the kernel  ...

Right, userspace authorization policy and select driver fixups seems
to be the answer to the raised concerns.
