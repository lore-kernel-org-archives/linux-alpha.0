From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Date: Tue, 12 Oct 2021 14:28:29 -0700
Message-ID: <bca75b04-f084-5bda-c071-249fd91aaa1e@linux.intel.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org>
 <CAPcyv4hDhjRXYCX_aiOboLF0eaTo6VySbZDa5NQu2ed9Ty2Ekw@mail.gmail.com>
 <0e6664ac-cbb2-96ff-0106-9301735c0836@linux.intel.com>
 <CAPcyv4g0v0YHZ-okxf4wwVCYxHotxdKwsJpZGkoT+fhvvAJEFg@mail.gmail.com>
 <9302f1c2-b3f8-2c9e-52c5-d5a4a2987409@linux.intel.com>
 <CAPcyv4hG0HcbUO8Mb=ccDp5Bz3RJNkAJwKwNzRkQ1gCMpp_OMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <CAPcyv4hG0HcbUO8Mb=ccDp5Bz3RJNkAJwKwNzRkQ1gCMpp_OMQ@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dan Williams <dan.j.williams@intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe@re>


>> But that was due to performance problems in hot paths. Nothing of this
>> applies here.
> It applies because a new API that individual driver authors is being
> proposed and that's an ongoing maintenance burden that might be
> mitigated by hiding that implementation detail from leaf drivers.

Right now we're only talking about 2 places to change, and none of those 
are actually in individual drivers, but in the virtio generic code and 
in the MSI code.

While there might be drivers in the future that do it directly it will 
be always the exception, normal drivers don't have to deal with this.



>> For me it both seems very straight forward and simple (but then I'm biased)
> You seem to be having a difficult time iterating this proposal toward
> consensus. I don't think the base principles are being contested as
> much as the semantics, scope, and need for the proposed API that is in
> the purview of all leaf driver developers.
Right now there is no leaf driver changed at all.
>
>>> I'd rather see more concerted efforts focused/limited core changes
>>> rather than leaf driver changes until there is a clearer definition of
>>> hardened.
>> A hardened driver is a driver that
>>
>> - Had similar security (not API) oriented review of its IO operations
>> (mainly MMIO access, but also PCI config space) as a non privileged user
>> interface (like a ioctl). That review should be focused on memory safety.
>>
>> - Had some fuzzing on these IO interfaces using to be released tools.
> What is the intersection of ioremap() users that are outside of the
> proposed probe authorization regime AND want confidential computing
> support?


Right now it's zero I believe.

That is there is other low level code that sets memory shared, but it's 
not using ioremap, but some other mechanisms.

>
> are needed
>>>> for booting. For example in TDX we can't print something to the console
>>>> with this mechanism, so you would never get any output before the
>>>> initrd. Just seems like a nightmare for debugging anything. There really
>>>> needs to be an authorization mechanism that works reasonably early.
>>>>
>>>> I can see a point of having user space overrides though, but we need to
>>>> have a sane kernel default that works early.
>>> Right, as I suggested [1], just enough early authorization to
>>> bootstrap/debug initramfs and then that can authorize the remainder.
>> But how do you debug the kernel then? Making early undebuggable seems
>> just bad policy to me.
> I am not proposing making the early undebuggable.


That's the implication of moving the policy into initrd.


If only initrd can authorize then it won't be possible to authorize 
before initrd, thus the early console won't work.

-Andi


