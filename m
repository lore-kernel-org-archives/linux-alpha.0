From: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v5 07/16] x86/kvm: Use bounce buffers for TD guest
Date: Wed, 20 Oct 2021 12:26:31 -0500
Message-ID: <591e0566-59e1-71d1-684a-fd1240b2eedc@amd.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-8-sathyanarayanan.kuppuswamy@linux.intel.com>
 <42f17b60-9bd4-a8bc-5164-d960e54cd30b@amd.com>
 <0a9c6485-74d8-e0fc-d261-097380272e07@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <sparclinux-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpAcJkx2zC8LdsbwxMe8SN9vYo8iAQp6cKmAWVC/V6A=;
 b=UKda+SsuhxDvTLK7mdrtpGFB9XPdmWqRDIHRSndnPmcm3yq4yAzuEy2NJ+WDokKOmtwu3Hcj/BbsF4pcASPc51kT6S5aQKobvR+dR0FBA/YofBivBVV8FYA6+6wZTlx/t1gIxMpAZlwqhVkM5LjwfPjwV1GwOA649aurQoN5rM8=
In-Reply-To: <0a9c6485-74d8-e0fc-d261-097380272e07@linux.intel.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe@r>
Cc: Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>, Andi Kleen <ak@linux.intel.com>, Kirill Shutemov <kirill.shutemov@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org

On 10/20/21 11:50 AM, Sathyanarayanan Kuppuswamy wrote:
> 
> 
> On 10/20/21 9:39 AM, Tom Lendacky wrote:
>> On 10/8/21 7:37 PM, Kuppuswamy Sathyanarayanan wrote:
>>> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>>>
>>> Intel TDX doesn't allow VMM to directly access guest private memory.
>>> Any memory that is required for communication with VMM must be shared
>>> explicitly. The same rule applies for any DMA to and from TDX guest.
>>> All DMA pages had to marked as shared pages. A generic way to achieve
>>> this without any changes to device drivers is to use the SWIOTLB
>>> framework.
>>>
>>> This method of handling is similar to AMD SEV. So extend this support
>>> for TDX guest as well. Also since there are some common code between
>>> AMD SEV and TDX guest in mem_encrypt_init(), move it to
>>> mem_encrypt_common.c and call AMD specific init function from it
>>>
>>> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>>> Reviewed-by: Andi Kleen <ak@linux.intel.com>
>>> Reviewed-by: Tony Luck <tony.luck@intel.com>
>>> Signed-off-by: Kuppuswamy Sathyanarayanan 
>>> <sathyanarayanan.kuppuswamy@linux.intel.com>
>>> ---
>>>
>>> Changes since v4:
>>>   * Replaced prot_guest_has() with cc_guest_has().
>>>
>>> Changes since v3:
>>>   * Rebased on top of Tom Lendacky's protected guest
>>>     changes 
>>> (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fpatchwork%2Fcover%2F1468760%2F&amp;data=04%7C01%7Cthomas.lendacky%40amd.com%7Cad852703670a44b1e29108d993e9dcc2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637703454904800065%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=lXwd5%2Fhnmd5QYaIElQ%2BtVT%2B62JHq%2Bimno5VIjTILaig%3D&amp;reserved=0) 
>>>
>>>
>>> Changes since v1:
>>>   * Removed sme_me_mask check for amd_mem_encrypt_init() in 
>>> mem_encrypt_init().
>>>
>>>   arch/x86/include/asm/mem_encrypt_common.h |  3 +++
>>>   arch/x86/kernel/tdx.c                     |  2 ++
>>>   arch/x86/mm/mem_encrypt.c                 |  5 +----
>>>   arch/x86/mm/mem_encrypt_common.c          | 14 ++++++++++++++
>>>   4 files changed, 20 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/x86/include/asm/mem_encrypt_common.h 
>>> b/arch/x86/include/asm/mem_encrypt_common.h
>>> index 697bc40a4e3d..bc90e565bce4 100644
>>> --- a/arch/x86/include/asm/mem_encrypt_common.h
>>> +++ b/arch/x86/include/asm/mem_encrypt_common.h
>>> @@ -8,11 +8,14 @@
>>>   #ifdef CONFIG_AMD_MEM_ENCRYPT
>>>   bool amd_force_dma_unencrypted(struct device *dev);
>>> +void __init amd_mem_encrypt_init(void);
>>>   #else /* CONFIG_AMD_MEM_ENCRYPT */
>>>   static inline bool amd_force_dma_unencrypted(struct device *dev)
>>>   {
>>>       return false;
>>>   }
>>> +
>>> +static inline void amd_mem_encrypt_init(void) {}
>>>   #endif /* CONFIG_AMD_MEM_ENCRYPT */
>>>   #endif
>>> diff --git a/arch/x86/kernel/tdx.c b/arch/x86/kernel/tdx.c
>>> index 433f366ca25c..ce8e3019b812 100644
>>> --- a/arch/x86/kernel/tdx.c
>>> +++ b/arch/x86/kernel/tdx.c
>>> @@ -12,6 +12,7 @@
>>>   #include <asm/insn.h>
>>>   #include <asm/insn-eval.h>
>>>   #include <linux/sched/signal.h> /* force_sig_fault() */
>>> +#include <linux/swiotlb.h>
>>>   /* TDX Module call Leaf IDs */
>>>   #define TDX_GET_INFO            1
>>> @@ -577,6 +578,7 @@ void __init tdx_early_init(void)
>>>       pv_ops.irq.halt = tdx_halt;
>>>       legacy_pic = &null_legacy_pic;
>>> +    swiotlb_force = SWIOTLB_FORCE;
>>>       cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "tdx:cpu_hotplug",
>>>                 NULL, tdx_cpu_offline_prepare);
>>> diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
>>> index 5d7fbed73949..8385bc4565e9 100644
>>> --- a/arch/x86/mm/mem_encrypt.c
>>> +++ b/arch/x86/mm/mem_encrypt.c
>>> @@ -438,14 +438,11 @@ static void print_mem_encrypt_feature_info(void)
>>>   }
>>>   /* Architecture __weak replacement functions */
>>> -void __init mem_encrypt_init(void)
>>> +void __init amd_mem_encrypt_init(void)
>>>   {
>>>       if (!sme_me_mask)
>>>           return;
>>> -    /* Call into SWIOTLB to update the SWIOTLB DMA buffers */
>>> -    swiotlb_update_mem_attributes();
>>> -
>>>       /*
>>>        * With SEV, we need to unroll the rep string I/O instructions,
>>>        * but SEV-ES supports them through the #VC handler.
>>> diff --git a/arch/x86/mm/mem_encrypt_common.c 
>>> b/arch/x86/mm/mem_encrypt_common.c
>>> index 119a9056efbb..6fe44c6cb753 100644
>>> --- a/arch/x86/mm/mem_encrypt_common.c
>>> +++ b/arch/x86/mm/mem_encrypt_common.c
>>> @@ -10,6 +10,7 @@
>>>   #include <asm/mem_encrypt_common.h>
>>>   #include <linux/dma-mapping.h>
>>>   #include <linux/cc_platform.h>
>>> +#include <linux/swiotlb.h>
>>>   /* Override for DMA direct allocation check - 
>>> ARCH_HAS_FORCE_DMA_UNENCRYPTED */
>>>   bool force_dma_unencrypted(struct device *dev)
>>> @@ -24,3 +25,16 @@ bool force_dma_unencrypted(struct device *dev)
>>>       return false;
>>>   }
>>> +
>>> +/* Architecture __weak replacement functions */
>>> +void __init mem_encrypt_init(void)
>>> +{
>>> +    /*
>>> +     * For TDX guest or SEV/SME, call into SWIOTLB to update
>>> +     * the SWIOTLB DMA buffers
>>> +     */
>>> +    if (sme_me_mask || cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
>>
>> Can't you just make this:
>>
>>      if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
>>
>> SEV will return true if sme_me_mask is not zero and TDX should only 
>> return true if it is TDX guest, right?
> 
> Yes. It can be simplified.
> 
> But where shall we leave this function cc_platform.c or here?

Either one works...  all depends on how the maintainers feel about 
creating/using mem_encrypt_common.c or using cc_platform.c.

Thanks,
Tom

> 
>>
>> Thanks,
>> Tom
>>
>>> +        swiotlb_update_mem_attributes();
>>> +
>>> +    amd_mem_encrypt_init();
>>> +}
>>>
> 
