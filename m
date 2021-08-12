From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v4 09/15] pci: Consolidate pci_iomap* and pci_iomap*wc
Date: Thu, 12 Aug 2021 15:11:39 -0700
Message-ID: <bc5d4268-2304-5c1d-8311-24d141cb5ced@linux.intel.com>
References: <20210812194330.GA2500473@bjorn-Precision-5520>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20210812194330.GA2500473@bjorn-Precision-5520>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bjorn Helgaas <helgaas@kernel.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "Michael S . Tsirkin" <mst@redhat.com>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>, Kirill Shutemov <kirill.shutemov@linux.intel.com>, Sean Christopherson <s>


> Why is it safe to make pci_iomap_wc_range() support IO ports when it
> didn't before?  That might be desirable, but I think it *is* a
> functional change here.

None of the callers use it to map IO ports, so it will be a no-op for 
them. But you're right, it's a (minor) functional change.

-Andi




