From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Date: Tue, 12 Oct 2021 12:49:06 -0700
Message-ID: <f3002304-ae85-1d88-219d-c67574e80427@linux.intel.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org>
 <CAPcyv4hDhjRXYCX_aiOboLF0eaTo6VySbZDa5NQu2ed9Ty2Ekw@mail.gmail.com>
 <0e6664ac-cbb2-96ff-0106-9301735c0836@linux.intel.com>
 <DM8PR11MB57501C8F8F5C8B315726882EE7B69@DM8PR11MB5750.namprd11.prod.outlook.com>
 <f850d2d6-d427-8aeb-bd38-f9b5eb088191@linux.intel.com>
 <DM8PR11MB57505C520763DF706309E177E7B69@DM8PR11MB5750.namprd11.prod.outlook.com>
 <CAPcyv4g8VjbMaVnXXyWVh8tXNakO9FmDXfANJmPmgvDfZX-OBA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <CAPcyv4g8VjbMaVnXXyWVh8tXNakO9FmDXfANJmPmgvDfZX-OBA@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dan Williams <dan.j.williams@intel.com>, "Reshetova, Elena" <elena.reshetova@intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "Lutomirski, Andy" <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe>


On 10/12/2021 12:13 PM, Dan Williams wrote:
> On Tue, Oct 12, 2021 at 11:57 AM Reshetova, Elena
> <elena.reshetova@intel.com> wrote:
>>
>>> I suspect the true number is even higher because that doesn't include IO
>>> inside calls to other modules and indirect pointers, correct?
>> Actually everything should be included. Smatch has cross-function db and
>> I am using it for getting the call chains and it follows function pointers.
>> Also since I am starting from a list of individual read IOs, every single
>> base read IO in drivers/* should be covered as far as I can see. But if it uses
>> some weird IO wrappers then the actual list might be higher.
> Why analyze individual IO calls? I thought the goal here was to
> disable entire classes of ioremap() users?

This is everything that would need to be moved somewhere else if we 
didn't disable the entire classes of ioremap users.

-Andi

