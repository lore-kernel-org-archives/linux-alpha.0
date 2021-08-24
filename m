From: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Date: Tue, 24 Aug 2021 14:56:25 -0700
Message-ID: <CACK8Z6E+__kZqU8mVUnYhFc0wz_e81qBLO3ffqSDghVtztNeQw@mail.gmail.com>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210805005218.2912076-12-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210823195409-mutt-send-email-mst@kernel.org> <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
 <CAPcyv4iJVQKJ3bVwZhD08c8GNEP0jW2gx=H504NXcYK5o2t01A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JA7HjuVr8UM0YrbUtH7xcK5mGIk2G9+Axy1XWOoFNYg=;
        b=WsBX54BBkcv11FQPj9OpoaF+eiQb8uX8aKiArIgUDrBIDwtG3b3K65ZX6ebBjitNbN
         w4lUM9y8oGz/tR3k3Zes2iqrAer9nCavy8Gef4NMWt8VTh8WP99eVbvwz7tkCjz4bHrq
         vAbZ8Ec6ssdwu8Vug8/ZEHTYcy8EBLuOfy6qwkqNjb6xNwc80u1Guda8rci8qOfunYZ0
         tpvzRodESKY7xx/aQWat6XsESTC/QWfHfZ+7nW5YmDN2ExMsidGq069RxDz3mdPWGeXC
         OP3Af9IIu+FHi8O+HMr5M/iBE1ePbCqYmUUW9YDYLHWdc0H+pZXOSjb/GoYe4tnuXRJP
         7sjw==
In-Reply-To: <CAPcyv4iJVQKJ3bVwZhD08c8GNEP0jW2gx=H504NXcYK5o2t01A@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>
Cc: "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Andi Kleen <ak@linux.intel.com>

On Mon, Aug 23, 2021 at 6:06 PM Dan Williams <dan.j.williams@intel.com> wrote:
>
> On Mon, Aug 23, 2021 at 5:31 PM Kuppuswamy, Sathyanarayanan
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> >
> >
> >
> > On 8/23/21 4:56 PM, Michael S. Tsirkin wrote:
> > >> Add a new variant of pci_iomap for mapping all PCI resources
> > >> of a devices as shared memory with a hypervisor in a confidential
> > >> guest.
> > >>
> > >> Signed-off-by: Andi Kleen<ak@linux.intel.com>
> > >> Signed-off-by: Kuppuswamy Sathyanarayanan<sathyanarayanan.kuppuswamy@linux.intel.com>
> > > I'm a bit puzzled by this part. So why should the guest*not*  map
> > > pci memory as shared? And if the answer is never (as it seems to be)
> > > then why not just make regular pci_iomap DTRT?
> >
> > It is in the context of confidential guest (where VMM is un-trusted). So
> > we don't want to make all PCI resource as shared. It should be allowed
> > only for hardened drivers/devices.
>
> That's confusing, isn't device authorization what keeps unaudited
> drivers from loading against untrusted devices? I'm feeling like
> Michael that this should be a detail that drivers need not care about
> explicitly, in which case it does not need to be exported because the
> detail can be buried in lower levels.
>
> Note, I specifically said "unaudited", not "hardened" because as Greg
> mentioned the kernel must trust drivers, its devices that may not be
> trusted.

Can you please point me to the thread where this discussion with Greg
is ongoing?

Thanks,

Rajat
