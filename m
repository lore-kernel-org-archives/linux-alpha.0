From: Sathyanarayanan Kuppuswamy 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v5 06/16] x86/tdx: Make DMA pages shared
Date: Wed, 20 Oct 2021 10:26:29 -0700
Message-ID: <930ec8e0-669d-8501-af66-38e4cab60a1f@linux.intel.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-7-sathyanarayanan.kuppuswamy@linux.intel.com>
 <654455db-a605-5069-d652-fe822ae066b0@amd.com>
 <66acafb6-7659-7d76-0f52-d002cfae9cc8@linux.intel.com>
 <0b06e686-b0d8-9485-ae00-b23f805916d9@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-owner@vger.kernel.org>
In-Reply-To: <0b06e686-b0d8-9485-ae00-b23f805916d9@amd.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>, Andi Kleen <ak@linux.intel.com>, Kirill Shutemov <kirill.shutemov@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org



On 10/20/21 10:22 AM, Tom Lendacky wrote:
>>
>> For non TDX case, in CC_ATTR_HOST_MEM_ENCRYPT, we should still call
>> amd_force_dma_unencrypted() right?
> 
> What I'm saying is that you wouldn't have amd_force_dma_unencrypted(). I 
> think the whole force_dma_unencrypted() can exist as-is in a different 
> file, whether that's cc_platform.c or mem_encrypt_common.c.
> 
> It will return true for an SEV or TDX guest, true for an SME host based 
> on the DMA mask or else false. That should work just fine for TDX.

Got it. Thanks for clarifying it.

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
