From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Date: Mon, 18 Oct 2021 14:08:33 +0200
Message-ID: <YW1jwc44EIx6/VAu@kroah.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org>
 <CAPcyv4hDhjRXYCX_aiOboLF0eaTo6VySbZDa5NQu2ed9Ty2Ekw@mail.gmail.com>
 <0e6664ac-cbb2-96ff-0106-9301735c0836@linux.intel.com>
Mime-Version: 1.0
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634558916;
        bh=vkWcBlEDJXGIxjZypm/BJbICnDvEF+3H0d23MuRGm0Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xFY0CQIXOwGC6S/lmBC22FQvTURuAJbwgyviVkrlrX8Mn/O9HkF0JIeIpzI+IH/lx
         W6qI1WdW7TfVaU0Vrbbwe8qJBYNXdjvL3Akm8XpeqHPq/DcFsw1XJTuGpuaK9GQ+Ym
         PR6IHySueEDqDoLJehztNpkbl1O34b4exMMmwGpY=
Content-Disposition: inline
In-Reply-To: <0e6664ac-cbb2-96ff-0106-9301735c0836@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@linux.intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange>

On Sun, Oct 10, 2021 at 03:11:23PM -0700, Andi Kleen wrote:
> 
> On 10/9/2021 1:39 PM, Dan Williams wrote:
> > On Sat, Oct 9, 2021 at 2:53 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > On Fri, Oct 08, 2021 at 05:37:07PM -0700, Kuppuswamy Sathyanarayanan wrote:
> > > > From: Andi Kleen <ak@linux.intel.com>
> > > > 
> > > > For Confidential VM guests like TDX, the host is untrusted and hence
> > > > the devices emulated by the host or any data coming from the host
> > > > cannot be trusted. So the drivers that interact with the outside world
> > > > have to be hardened by sharing memory with host on need basis
> > > > with proper hardening fixes.
> > > > 
> > > > For the PCI driver case, to share the memory with the host add
> > > > pci_iomap_host_shared() and pci_iomap_host_shared_range() APIs.
> > > > 
> > > > Signed-off-by: Andi Kleen <ak@linux.intel.com>
> > > > Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> > > So I proposed to make all pci mappings shared, eliminating the need
> > > to patch drivers.
> > > 
> > > To which Andi replied
> > >          One problem with removing the ioremap opt-in is that
> > >          it's still possible for drivers to get at devices without going through probe.
> > > 
> > > To which Greg replied:
> > > https://lore.kernel.org/all/YVXBNJ431YIWwZdQ@kroah.com/
> > >          If there are in-kernel PCI drivers that do not do this, they need to be
> > >          fixed today.
> > > 
> > > Can you guys resolve the differences here?
> > I agree with you and Greg here. If a driver is accessing hardware
> > resources outside of the bind lifetime of one of the devices it
> > supports, and in a way that neither modrobe-policy nor
> > device-authorization -policy infrastructure can block, that sounds
> > like a bug report.
> 
> The 5.15 tree has something like ~2.4k IO accesses (including MMIO and
> others) in init functions that also register drivers (thanks Elena for the
> number)
> 
> Some are probably old drivers that could be fixed, but it's quite a few
> legitimate cases. For example for platform or ISA drivers that's the only
> way they can be implemented because they often have no other enumeration
> mechanism. For PCI drivers it's rarer, but also still can happen. One
> example that comes to mind here is the x86 Intel uncore drivers, which
> support a mix of MSR, ioremap and PCI config space accesses all from the
> same driver. This particular example can (and should be) fixed in other
> ways, but similar things also happen in other drivers, and they're not all
> broken. Even for the broken ones they're usually for some crufty old devices
> that has very few users, so it's likely untestable in practice.
> 
> My point is just that the ecosystem of devices that Linux supports is messy
> enough that there are legitimate exceptions from the "First IO only in probe
> call only" rule.

No, there should not be for PCI drivers.  If there is, that is a bug
that you can, and should, fix.

> And we can't just fix them all. Even if we could it would be hard to
> maintain.

Not true at all, you can fix them, and write a simple coccinelle rule to
prevent them from ever coming back in.

> Using a "firewall model" hooking into a few strategic points like we're
> proposing here is much saner for everyone.

No it is not.  It is "easier" for you because you all do not want to fix
up all of the drivers and want to add additional code complexity on top
of the current mess that we have and then you can claim that you have
"hardened" the drivers you care about.

Despite no one ever explaining exactly what "hardened" means to me.

Again, fix the existing drivers, you have the whole source, if this is
something that you all care about, it should not be hard to do.

Stop making excuses.

greg k-h
