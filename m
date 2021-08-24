From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Date: Tue, 24 Aug 2021 13:50:00 -0700
Message-ID: <bb8c6f96-2597-bb80-bd08-7958405e1bf5@linux.intel.com>
References: <20210824203115.GA3492097@bjorn-Precision-5520>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20210824203115.GA3492097@bjorn-Precision-5520>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Dan Williams <dan.j.williams@intel.com>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>


On 8/24/2021 1:31 PM, Bjorn Helgaas wrote:
> On Tue, Aug 24, 2021 at 01:14:02PM -0700, Andi Kleen wrote:
>> On 8/24/2021 11:55 AM, Bjorn Helgaas wrote:
>>> [+cc Rajat; I still don't know what "shared memory with a hypervisor
>>> in a confidential guest" means,
>> A confidential guest is a guest which uses memory encryption to isolate
>> itself from the host. It doesn't trust the host. But it still needs to
>> communicate with the host for IO, so it has some special memory areas that
>> are explicitly marked shared. These are used to do IO with the host. All
>> their usage needs to be carefully hardened to avoid any security attacks on
>> the guest, that's why we want to limit this interaction only to a small set
>> of hardened drivers. For MMIO, the set is currently only virtio and MSI-X.
> Good material for the commit log next time around.  Thanks!

This is all in the patch intro too, which should make it into the merge 
commits.

I don't think we can reexplain the basic concepts for every individual 
patch in a large patch kit.


-Andi

