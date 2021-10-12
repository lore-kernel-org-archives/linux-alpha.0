From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Date: Tue, 12 Oct 2021 11:35:04 -0700
Message-ID: <9302f1c2-b3f8-2c9e-52c5-d5a4a2987409@linux.intel.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org>
 <CAPcyv4hDhjRXYCX_aiOboLF0eaTo6VySbZDa5NQu2ed9Ty2Ekw@mail.gmail.com>
 <0e6664ac-cbb2-96ff-0106-9301735c0836@linux.intel.com>
 <CAPcyv4g0v0YHZ-okxf4wwVCYxHotxdKwsJpZGkoT+fhvvAJEFg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <virtualization-bounces@lists.linux-foundation.org>
Content-Language: en-US
In-Reply-To: <CAPcyv4g0v0YHZ-okxf4wwVCYxHotxdKwsJpZGkoT+fhvvAJEFg@mail.gmail.com>
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
To: Dan Williams <dan.j.williams@intel.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Linux PCI <linux-pci@vger.kernel.org>, X86 ML <x86@kernel.org>, linux-mips@vger.kernel.org, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Dave Hansen <dave.hansen@intel.com>, Peter H Anvin <hpa@zytor.com>, sparclinux@vger.kernel.org, "Reshetova, Elena" <elena.reshetova@intel.com>, Andrea Arcangeli <aarcange@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Th


> The "better safe-than-sorry" argument is hard to build consensus
> around. The spectre mitigations ran into similar problems where the
> community rightly wanted to see the details and instrument the
> problematic paths rather than blanket sprinkle lfence "just to be
> safe".

But that was due to performance problems in hot paths. Nothing of this 
applies here.

> In this case the rules about when a driver is suitably
> "hardened" are vague and the overlapping policy engines are confusing.

What is confusing exactly?

For me it both seems very straight forward and simple (but then I'm biased)

The policy is:

- Have an allow list at driver registration.

- Have an additional opt-in for MMIO mappings (and potentially config 
space, but that's not currently there) to cover init calls completely.

>
> I'd rather see more concerted efforts focused/limited core changes
> rather than leaf driver changes until there is a clearer definition of
> hardened.

A hardened driver is a driver that

- Had similar security (not API) oriented review of its IO operations 
(mainly MMIO access, but also PCI config space) as a non privileged user 
interface (like a ioctl). That review should be focused on memory safety.

- Had some fuzzing on these IO interfaces using to be released tools.

Right now it's only three virtio drivers (console, net, block)

Really it's no different than what we do for every new unprivileged user 
interface.


> I.e. instead of jumping to the assertion that fixing up
> these init-path vulnerabilities are too big to fix, dig to the next
> level to provide more evidence that per-driver opt-in is the only
> viable option.
>
> For example, how many of these problematic paths are built-in to the
> average kernel config?

I don't think arguments from "the average kernel config" (if such a 
thing even exists) are useful. That's would be just hand waving.


> A strawman might be to add a sprinkling error
> exits in the module_init() of the problematic drivers, and only fail
> if the module is built-in, and let modprobe policy handle the rest.


That would be already hundreds of changes. I have no idea how such a 
thing could be maintained or sustained either.

Really I don't even see how these alternatives can be considered. Tree 
sweeps should always be last resort. They're a pain for everyone. But 
here they're casually thrown around as alternatives to straight forward 
one or two line changes.




>
>> Default policy in user space just seems to be a bad idea here. Who
>> should know if a driver is hardened other than the kernel? Maintaining
>> the list somewhere else just doesn't make sense to me.
> I do not understand the maintenance burden correlation of where the
> policy is driven vs where the list is maintained?

All the hardening and auditing happens in the kernel tree. So it seems 
the natural place to store the result is in the kernel tree.

But there's no single package for initrd, so you would need custom 
configurations for all the supported distros.

Also we're really arguing about a list that currently has three entries.


>   Even if I agreed
> with the contention that out-of-tree userspace would have a hard time
> tracking the "hardened" driver list there is still an in-tree
> userspace path to explore. E.g. perf maintains lists of things tightly
> coupled to the kernel, this authorized device list seems to be in the
> same category of data.

You mean the event list? perf is in the kernel tree, so it's maintained 
together with the kernel.

But we don't have a kernel initrd.



>
>> Also there is the more practical problem that some devices are needed
>> for booting. For example in TDX we can't print something to the console
>> with this mechanism, so you would never get any output before the
>> initrd. Just seems like a nightmare for debugging anything. There really
>> needs to be an authorization mechanism that works reasonably early.
>>
>> I can see a point of having user space overrides though, but we need to
>> have a sane kernel default that works early.
> Right, as I suggested [1], just enough early authorization to
> bootstrap/debug initramfs and then that can authorize the remainder.

But how do you debug the kernel then? Making early undebuggable seems 
just bad policy to me.

And if you fix if for the console why not add the two more entries for 
virtio net and block too?


-Andi
