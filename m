From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Date: Tue, 24 Aug 2021 08:07:55 +0100
Message-ID: <YSSay4zGjLaNMOh1@infradead.org>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210805005218.2912076-12-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210823195409-mutt-send-email-mst@kernel.org>
 <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=yyOWKyVgFnzXQH7hUCU2sLB3yDJPcTOpVipPjz3CdkE=; b=vhbSFZGCSzrdVnS1l48yczaF9K
        SvGLI6rQMV0CT4xfqBFA1Ef8Ep6dM6q2xMdXaRx9S+pjQv+qRWNTnYsJWFL8YUyXFnmmGXijIOv/u
        PmjJy+0bZz71DBJ/UkUMV+6BfLJLvi+0cQKLjAPOl4yUvzdEyDBluDRFXDs9PGsu260PN6t8h9BWS
        H1PEQ3FThNCcxhmfejfOihqbEbqvN5Tz9D5EG6yz3rmvyIp8Jq/WE/Lfa1HosWUPEttO8bNdoTMb3
        MEPPz3NaNDAKI3Hj8hsdNgFtMUO4QPPaCM8IM8adV5zMNm5tB0B7013DPglF0teZ/nW4MFAZoW9MB
        bODkw5sg==;
Content-Disposition: inline
In-Reply-To: <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>, Andi Kleen <ak@linux.intel.com>, Kirill Shutemov <kirill.shutemov@linux.in>

On Mon, Aug 23, 2021 at 05:30:54PM -0700, Kuppuswamy, Sathyanarayanan wrote:
> 
> 
> On 8/23/21 4:56 PM, Michael S. Tsirkin wrote:
> > > Add a new variant of pci_iomap for mapping all PCI resources
> > > of a devices as shared memory with a hypervisor in a confidential
> > > guest.
> > > 
> > > Signed-off-by: Andi Kleen<ak@linux.intel.com>
> > > Signed-off-by: Kuppuswamy Sathyanarayanan<sathyanarayanan.kuppuswamy@linux.intel.com>
> > I'm a bit puzzled by this part. So why should the guest*not*  map
> > pci memory as shared? And if the answer is never (as it seems to be)
> > then why not just make regular pci_iomap DTRT?
> 
> It is in the context of confidential guest (where VMM is un-trusted). So
> we don't want to make all PCI resource as shared. It should be allowed
> only for hardened drivers/devices.

Well, assuming the host can do any damage when mapped shared that also
means not mapping it shared will completely break the drivers.
