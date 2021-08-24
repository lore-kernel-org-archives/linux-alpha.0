From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Date: Tue, 24 Aug 2021 14:05:25 -0700
Message-ID: <CAPcyv4jjonArG94PbuMPTZefxqnFr+PEG7Gjem0Taa_iGRmSDA@mail.gmail.com>
References: <20210824203115.GA3492097@bjorn-Precision-5520> <bb8c6f96-2597-bb80-bd08-7958405e1bf5@linux.intel.com>
Mime-Version: 1.0
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=50KgIimgoHn2hLRecJ9xsYP+KbZzb8N9bfDIuPfzvjQ=;
        b=NvAgKb0THlkdDUQ0aRx+9mednYqLHP6M3XIYjenGeve36GswyogqqyEtfltG9odhSS
         sXNl+nzWb/jgjnohkyON1TK0N4HUhwZj7aRcTxvirbX0hPedZ8o7Xo7c5YpxKjNNzQYr
         zyJiMtdKa9NltLOObRsERtWbUkAqlgZSPFS2egovwI2a4M3yx8YiJOFhAZDgyiFWM4Tr
         bAb4DagRmpCRfU/tqemlilYyGEtImDNJKoZmeV/8h3FeicEkU17ZO2s8oFIsfzw7ghCP
         W7IqcpYk1aL3JziP3HtHww5os2Qnu25hR/eXZFgKZ3PqWWua0S27ru9KI2z3Lojktzjy
         vK+Q==
In-Reply-To: <bb8c6f96-2597-bb80-bd08-7958405e1bf5@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>

On Tue, Aug 24, 2021 at 1:50 PM Andi Kleen <ak@linux.intel.com> wrote:
>
>
> On 8/24/2021 1:31 PM, Bjorn Helgaas wrote:
> > On Tue, Aug 24, 2021 at 01:14:02PM -0700, Andi Kleen wrote:
> >> On 8/24/2021 11:55 AM, Bjorn Helgaas wrote:
> >>> [+cc Rajat; I still don't know what "shared memory with a hypervisor
> >>> in a confidential guest" means,
> >> A confidential guest is a guest which uses memory encryption to isolate
> >> itself from the host. It doesn't trust the host. But it still needs to
> >> communicate with the host for IO, so it has some special memory areas that
> >> are explicitly marked shared. These are used to do IO with the host. All
> >> their usage needs to be carefully hardened to avoid any security attacks on
> >> the guest, that's why we want to limit this interaction only to a small set
> >> of hardened drivers. For MMIO, the set is currently only virtio and MSI-X.
> > Good material for the commit log next time around.  Thanks!
>
> This is all in the patch intro too, which should make it into the merge
> commits.
>
> I don't think we can reexplain the basic concepts for every individual
> patch in a large patch kit.

Maybe not the whole cover letter, but how about just a line in this
one that says "Recall that 'shared' in this context refers to memory
that lacks confidentiality and integrity protection from the VMM so
that it can communicate with the VM." Although I think
ioremap_noprotect() might be clearer than shared for the protected
guest use case?
