From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Date: Tue, 24 Aug 2021 10:04:26 -0700
Message-ID: <2747d96f-5063-7c63-5a47-16ea299fa195@linux.intel.com>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210805005218.2912076-12-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210823195409-mutt-send-email-mst@kernel.org>
 <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
 <YSSay4zGjLaNMOh1@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <virtualization-bounces@lists.linux-foundation.org>
In-Reply-To: <YSSay4zGjLaNMOh1@infradead.org>
Content-Language: en-US
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christoph Hellwig <hch@infradead.org>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Dave Hansen <dave.hansen@intel.com>, Peter H Anvin <hpa@zytor.com>, sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, virtualization@lists.linux-foundation.org, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org


On 8/24/2021 12:07 AM, Christoph Hellwig wrote:
> On Mon, Aug 23, 2021 at 05:30:54PM -0700, Kuppuswamy, Sathyanarayanan wrote:
>>
>> On 8/23/21 4:56 PM, Michael S. Tsirkin wrote:
>>>> Add a new variant of pci_iomap for mapping all PCI resources
>>>> of a devices as shared memory with a hypervisor in a confidential
>>>> guest.
>>>>
>>>> Signed-off-by: Andi Kleen<ak@linux.intel.com>
>>>> Signed-off-by: Kuppuswamy Sathyanarayanan<sathyanarayanan.kuppuswamy@linux.intel.com>
>>> I'm a bit puzzled by this part. So why should the guest*not*  map
>>> pci memory as shared? And if the answer is never (as it seems to be)
>>> then why not just make regular pci_iomap DTRT?
>> It is in the context of confidential guest (where VMM is un-trusted). So
>> we don't want to make all PCI resource as shared. It should be allowed
>> only for hardened drivers/devices.
> Well, assuming the host can do any damage when mapped shared that also
> means not mapping it shared will completely break the drivers.

There are several cases:

- We have driver filtering active to protect you against attacks from 
the host against unhardened drivers.

In this case the drivers not working is the intended behavior.

- There is an command allow list override for some new driver, but the 
driver is hardened and shared

The other drivers will still not work, but that's also the intended behavior

- Driver filtering is disabled or the allow list override is used to 
enable some non hardened/enabled driver

There is a command line option to override the ioremap sharing default, 
it will allow all drivers to do ioremap. We would really prefer to make 
it more finegrained, but it's not possible in this case. Other drivers 
are likely attackable.

- Driver filtering is disabled (allowing attacks on the drivers) and the 
command line option for forced sharing is set.

All drivers initialize and can talk to the host through MMIO. Lots of 
unhardened drivers are likely attackable.

-Andi
