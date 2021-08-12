From: "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v4 09/15] pci: Consolidate pci_iomap* and pci_iomap*wc
Date: Thu, 12 Aug 2021 15:29:42 -0700
Message-ID: <fbce6e80-07e3-8b95-dff6-1ade6be58b29@linux.intel.com>
References: <20210812194330.GA2500473@bjorn-Precision-5520>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20210812194330.GA2500473@bjorn-Precision-5520>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "Michael S . Tsirkin" <mst@redhat.com>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>, Andi Kleen <ak@linux.intel.com>, Kirill Shutemov <kirill.shutemov@linux.i>



On 8/12/21 12:43 PM, Bjorn Helgaas wrote:
> Is there a branch with all of this applied?  I was going to apply this

Its is maintained in following tree.

https://github.com/intel/tdx/commit/93fd5b655172ba9e3350487995102a8b2c41de27

> to help take a look at it, but it doesn't apply to v5.14-rc1.  I know

This patch can be applied independently. I have just applied it on top
of v5.14-rc5, and it seems to apply clean. Can you try -rc5?

> you listed some prereqs in the cover letter, but it's a fair amount of
> work to sort all that out.
> 
> On Wed, Aug 04, 2021 at 05:52:12PM -0700, Kuppuswamy Sathyanarayanan wrote:
>> From: Andi Kleen <ak@linux.intel.com>
> 
> If I were applying these, I would silently update the subject lines to
> match previous commits.  Since these will probably be merged via a
> different tree, you can update if there's a v5:
> 
>    PCI: Consolidate pci_iomap_range(), pci_iomap_wc_range()

Yes. I will fix this in next version.

> 
> Also applies to 11/15 and 12/15.

Will do the same.

> 
>> pci_iomap* and pci_iomap*wc are currently duplicated code, except
>> that the _wc variant does not support IO ports. Replace them
>> with a common helper and a callback for the mapping. I used
>> wrappers for the maps because some architectures implement ioremap
>> and friends with macros.
> 
> Maybe spell some of this out:
> 
>    pci_iomap_range() and pci_iomap_wc_range() are currently duplicated
>    code, ...  Implement them using a common helper,
>    pci_iomap_range_map(), ...
> 
> Using "pci_iomap*" obscures the name and doesn't save any space.
> 
> Why is it safe to make pci_iomap_wc_range() support IO ports when it
> didn't before?  That might be desirable, but I think it *is* a
> functional change here.

Agree. Commit log had to be updated. I will include these details
in next submission.

> 
> IIUC, pci_iomap_wc_range() on an IO port range previously returned
> NULL, and after this patch it will work the same as pci_iomap_range(),
> i.e., it will return the result of __pci_ioport_map().
> 
>> This will allow to add more variants without excessive code
>> duplications. This patch should have no behavior change.
>>
>> Signed-off-by: Andi Kleen <ak@linux.intel.com>
>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>> ---
>>   lib/pci_iomap.c | 81 +++++++++++++++++++++++++++----------------------
>>   1 file changed, 44 insertions(+), 37 deletions(-)
>>


-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
