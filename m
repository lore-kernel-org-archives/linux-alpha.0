From: Sathyanarayanan Kuppuswamy 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v5 01/16] x86/mm: Move force_dma_unencrypted() to common
 code
Date: Wed, 20 Oct 2021 09:43:43 -0700
Message-ID: <f7ede3f4-7280-38da-3744-32ecd8fdfcb1@linux.intel.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-2-sathyanarayanan.kuppuswamy@linux.intel.com>
 <72b8be39-b4e2-5d77-524c-a2ea0c750ab1@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <72b8be39-b4e2-5d77-524c-a2ea0c750ab1@amd.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>, Andi Kleen <ak@linux.intel.com>, Kirill Shutemov <kirill.shutemov@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org



On 10/20/21 9:11 AM, Tom Lendacky wrote:
>> Intel TDX doesn't allow VMM to access guest private memory. Any memory
>> that is required for communication with VMM must be shared explicitly
>> by setting the bit in page table entry. After setting the shared bit,
>> the conversion must be completed with MapGPA hypercall. Details about
>> MapGPA hypercall can be found in [1], sec 3.2.
>>
>> The call informs VMM about the conversion between private/shared
>> mappings. The shared memory is similar to unencrypted memory in AMD
>> SME/SEV terminology but the underlying process of sharing/un-sharing
>> the memory is different for Intel TDX guest platform.
>>
>> SEV assumes that I/O devices can only do DMA to "decrypted" physical
>> addresses without the C-bit set. In order for the CPU to interact with
>> this memory, the CPU needs a decrypted mapping. To add this support,
>> AMD SME code forces force_dma_unencrypted() to return true for
>> platforms that support AMD SEV feature. It will be used for DMA memory
>> allocation API to trigger set_memory_decrypted() for platforms that
>> support AMD SEV feature.
>>
>> TDX is similar. So, to communicate with I/O devices, related pages need
>> to be marked as shared. As mentioned above, shared memory in TDX
>> architecture is similar to decrypted memory in AMD SME/SEV. So similar
>> to AMD SEV, force_dma_unencrypted() has to forced to return true. This
>> support is added in other patches in this series.
>>
>> So move force_dma_unencrypted() out of AMD specific code and call AMD
>> specific (amd_force_dma_unencrypted()) initialization function from it.
>> force_dma_unencrypted() will be modified by later patches to include
>> Intel TDX guest platform specific initialization.
>>
>> Also, introduce new config option X86_MEM_ENCRYPT_COMMON that has to be
>> selected by all x86 memory encryption features. This will be selected
>> by both AMD SEV and Intel TDX guest config options.
>>
>> This is preparation for TDX changes in DMA code and it has no
>> functional change.
> 
> Can force_dma_unencrypted() be moved to arch/x86/kernel/cc_platform.c, 
> instead of creating a new file? It might fit better with patch #6.

Please check the final version of mem_encrypt_common.c

https://github.com/intel/tdx/blob/guest/arch/x86/mm/mem_encrypt_common.c

I am not sure whether it is alright to move mem_encrypt_init() and
arch_has_restricted_virtio_memory_access() to cc_platform.c

If this is fine, I can get rid of mem_encrypt_common.c

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
