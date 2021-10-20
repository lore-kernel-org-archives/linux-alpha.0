From: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v5 06/16] x86/tdx: Make DMA pages shared
Date: Wed, 20 Oct 2021 12:22:41 -0500
Message-ID: <0b06e686-b0d8-9485-ae00-b23f805916d9@amd.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-7-sathyanarayanan.kuppuswamy@linux.intel.com>
 <654455db-a605-5069-d652-fe822ae066b0@amd.com>
 <66acafb6-7659-7d76-0f52-d002cfae9cc8@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1qZpG8ptqbie5y77VPiOpqV1HQb5pLUVW03iOwOHMo=;
 b=GOb/6zhVrHzjmrBhricdL6DE8hZrQMoRxIsdnR/sW28BuI82g2CQGZJpYPKWCnOoj2KXWcR9cqjxL0AetvMGLgj9ocQnMvUFcawoXImj5sVx3P5ByyDQFNN2Nk6Fc3U2RPvBBFHtsffe1tdQkjEGjuij+fYIVU56c45/emN7iFw=
In-Reply-To: <66acafb6-7659-7d76-0f52-d002cfae9cc8@linux.intel.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe@r>
Cc: Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>, Andi Kleen <ak@linux.intel.com>, Kirill Shutemov <kirill.shutemov@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org

On 10/20/21 11:45 AM, Sathyanarayanan Kuppuswamy wrote:
> On 10/20/21 9:33 AM, Tom Lendacky wrote:
>> On 10/8/21 7:37 PM, Kuppuswamy Sathyanarayanan wrote:

...

>>>   bool force_dma_unencrypted(struct device *dev)
>>>   {
>>> -    return amd_force_dma_unencrypted(dev);
>>> +    if (cc_platform_has(CC_ATTR_GUEST_TDX) &&
>>> +        cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
>>> +        return true;
>>> +
>>> +    if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) ||
>>> +        cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
>>> +        return amd_force_dma_unencrypted(dev);
>>> +
>>> +    return false;
>>
>> Assuming the original force_dma_unencrypted() function was moved here or 
>> cc_platform.c, then you shouldn't need any changes. Both SEV and TDX 
>> require true be returned if CC_ATTR_GUEST_MEM_ENCRYPT returns true. And 
>> then TDX should never return true for CC_ATTR_HOST_MEM_ENCRYPT.
> 
> 
> For non TDX case, in CC_ATTR_HOST_MEM_ENCRYPT, we should still call
> amd_force_dma_unencrypted() right?

What I'm saying is that you wouldn't have amd_force_dma_unencrypted(). I 
think the whole force_dma_unencrypted() can exist as-is in a different 
file, whether that's cc_platform.c or mem_encrypt_common.c.

It will return true for an SEV or TDX guest, true for an SME host based on 
the DMA mask or else false. That should work just fine for TDX.

Thanks,
Tom

> 
>>
>>>   }
>>> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
>>> index 527957586f3c..6c531d5cb5fd 100644
>>> --- a/arch/x86/mm/pat/set_memory.c
>>> +++ b/arch/x86/mm/pat/set_memory.c
>>> @@ -30,6 +30,7 @@
>>>   #include <asm/proto.h>
>>>   #include <asm/memtype.h>
>>>   #include <asm/set_memory.h>
>>> +#include <asm/tdx.h>
>>>   #include "../mm_internal.h"
>>> @@ -1981,8 +1982,10 @@ int set_memory_global(unsigned long addr, int 
>>> numpages)
>>>                       __pgprot(_PAGE_GLOBAL), 0);
>>>   }
>>> -static int __set_memory_enc_dec(unsigned long addr, int numpages, bool 
>>> enc)
>>> +static int __set_memory_protect(unsigned long addr, int numpages, bool 
>>> protect)
>>>   {
>>> +    pgprot_t mem_protected_bits, mem_plain_bits;
>>> +    enum tdx_map_type map_type;
>>>       struct cpa_data cpa;
>>>       int ret;
>>> @@ -1997,8 +2000,25 @@ static int __set_memory_enc_dec(unsigned long 
>>> addr, int numpages, bool enc)
>>>       memset(&cpa, 0, sizeof(cpa));
>>>       cpa.vaddr = &addr;
>>>       cpa.numpages = numpages;
>>> -    cpa.mask_set = enc ? __pgprot(_PAGE_ENC) : __pgprot(0);
>>> -    cpa.mask_clr = enc ? __pgprot(0) : __pgprot(_PAGE_ENC);
>>> +
>>> +    if (cc_platform_has(CC_ATTR_GUEST_SHARED_MAPPING_INIT)) {
>>> +        mem_protected_bits = __pgprot(0);
>>> +        mem_plain_bits = pgprot_cc_shared_mask();
>>
>> How about having generic versions for both shared and private that 
>> return the proper value for SEV or TDX. Then this remains looking 
>> similar to as it does now, just replacing the __pgprot() calls with the 
>> appropriate pgprot_cc_{shared,private}_mask().
> 
> Makes sense.
> 
>>
>> Thanks,
>> Tom
>>
>>> +    } else {
>>> +        mem_protected_bits = __pgprot(_PAGE_ENC);
>>> +        mem_plain_bits = __pgprot(0);
>>> +    }
>>> +
>>> +    if (protect) {
>>> +        cpa.mask_set = mem_protected_bits;
>>> +        cpa.mask_clr = mem_plain_bits;
>>> +        map_type = TDX_MAP_PRIVATE;
>>> +    } else {
>>> +        cpa.mask_set = mem_plain_bits;
>>> +        cpa.mask_clr = mem_protected_bits;
>>> +        map_type = TDX_MAP_SHARED;
>>> +    }
>>> +
>>>       cpa.pgd = init_mm.pgd;
>>>       /* Must avoid aliasing mappings in the highmem code */
>>> @@ -2006,9 +2026,17 @@ static int __set_memory_enc_dec(unsigned long 
>>> addr, int numpages, bool enc)
>>>       vm_unmap_aliases();
>>>       /*
>>> -     * Before changing the encryption attribute, we need to flush caches.
>>> +     * Before changing the encryption attribute, flush caches.
>>> +     *
>>> +     * For TDX, guest is responsible for flushing caches on 
>>> private->shared
>>> +     * transition. VMM is responsible for flushing on shared->private.
>>>        */
>>> -    cpa_flush(&cpa, !this_cpu_has(X86_FEATURE_SME_COHERENT));
>>> +    if (cc_platform_has(CC_ATTR_GUEST_TDX)) {
>>> +        if (map_type == TDX_MAP_SHARED)
>>> +            cpa_flush(&cpa, 1);
>>> +    } else {
>>> +        cpa_flush(&cpa, !this_cpu_has(X86_FEATURE_SME_COHERENT));
>>> +    }
>>>       ret = __change_page_attr_set_clr(&cpa, 1);
>>> @@ -2021,18 +2049,21 @@ static int __set_memory_enc_dec(unsigned long 
>>> addr, int numpages, bool enc)
>>>        */
>>>       cpa_flush(&cpa, 0);
>>> +    if (!ret && cc_platform_has(CC_ATTR_GUEST_SHARED_MAPPING_INIT))
>>> +        ret = tdx_hcall_gpa_intent(__pa(addr), numpages, map_type);
>>> +
>>>       return ret;
>>>   }
>>>   int set_memory_encrypted(unsigned long addr, int numpages)
>>>   {
>>> -    return __set_memory_enc_dec(addr, numpages, true);
>>> +    return __set_memory_protect(addr, numpages, true);
>>>   }
>>>   EXPORT_SYMBOL_GPL(set_memory_encrypted);
>>>   int set_memory_decrypted(unsigned long addr, int numpages)
>>>   {
>>> -    return __set_memory_enc_dec(addr, numpages, false);
>>> +    return __set_memory_protect(addr, numpages, false);
>>>   }
>>>   EXPORT_SYMBOL_GPL(set_memory_decrypted);
>>>
> 
