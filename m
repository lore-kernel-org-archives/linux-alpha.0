From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Date: Tue, 24 Aug 2021 13:14:02 -0700
Message-ID: <a80fc61a-bc55-b82c-354b-b57863ab03db@linux.intel.com>
References: <20210824185541.GA3485816@bjorn-Precision-5520>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20210824185541.GA3485816@bjorn-Precision-5520>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Dan Williams <dan.j.williams@intel.com>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>


On 8/24/2021 11:55 AM, Bjorn Helgaas wrote:
> [+cc Rajat; I still don't know what "shared memory with a hypervisor
> in a confidential guest" means,

A confidential guest is a guest which uses memory encryption to isolate 
itself from the host. It doesn't trust the host. But it still needs to 
communicate with the host for IO, so it has some special memory areas 
that are explicitly marked shared. These are used to do IO with the 
host. All their usage needs to be carefully hardened to avoid any 
security attacks on the guest, that's why we want to limit this 
interaction only to a small set of hardened drivers. For MMIO, the set 
is currently only virtio and MSI-X.

-Andi


