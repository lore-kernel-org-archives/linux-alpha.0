From: "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Date: Mon, 23 Aug 2021 17:30:54 -0700
Message-ID: <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210805005218.2912076-12-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210823195409-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20210823195409-mutt-send-email-mst@kernel.org>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>, Andi Kleen <ak@linux.intel.com>, Kirill Shutemov <kirill.shutemov@linux.intel.com>, Sean Christopherson <seanjc@g>



On 8/23/21 4:56 PM, Michael S. Tsirkin wrote:
>> Add a new variant of pci_iomap for mapping all PCI resources
>> of a devices as shared memory with a hypervisor in a confidential
>> guest.
>>
>> Signed-off-by: Andi Kleen<ak@linux.intel.com>
>> Signed-off-by: Kuppuswamy Sathyanarayanan<sathyanarayanan.kuppuswamy@linux.intel.com>
> I'm a bit puzzled by this part. So why should the guest*not*  map
> pci memory as shared? And if the answer is never (as it seems to be)
> then why not just make regular pci_iomap DTRT?

It is in the context of confidential guest (where VMM is un-trusted). So
we don't want to make all PCI resource as shared. It should be allowed
only for hardened drivers/devices.

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
