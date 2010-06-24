From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: Problems with alpha/pci + radeon/ttm
Date: Thu, 24 Jun 2010 21:51:40 +1200
Message-ID: <4C232AAC.2010200@orcon.net.nz>
References: <AANLkTinG-5iKW5cigIQHPHRZuAMtG_xY-74XLL6vE5kb@mail.gmail.com>	<20100622145805R.fujita.tomonori@lab.ntt.co.jp> <AANLkTilMfDfy7BPiuAh9u-tR3kw1Vt_SebMziLUtLM6S@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <AANLkTilMfDfy7BPiuAh9u-tR3kw1Vt_SebMziLUtLM6S@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Airlie <airlied@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, mattst88@gmail.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, jbarnes@virtuousgeek.org, linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, alexdeucher@gmail.com, jglisse@redhat.com

On 22/06/10 20:32, Dave Airlie wrote:
> On Tue, Jun 22, 2010 at 3:59 PM, FUJITA Tomonori
> <fujita.tomonori@lab.ntt.co.jp>  wrote:
>> On Mon, 21 Jun 2010 17:19:43 -0400
>> Matt Turner<mattst88@gmail.com>  wrote:
>>
>>> Michael Cree and I have been debugging FDO bug 26403 [1]. I tried
>>> booting with `radeon.test=1` and found this, which I think is related:

Note that my radeon card is PCI whereas I think Matt may be using an AGP 
card.

My logs are very similar to Matt's except I don't see the following line:

>>>> pci_map_single failed: could not allocate dma page tables


>> This happens in the latest git, right?

Indeed, testing 2.6.35-rc3 (plus a couple or so extra patches to fix 
unrelated compile errors).

>> Is this a regression (what kernel version worked)?
>>
>> Seems that the IOMMU can't find 128 pages. It's likely due to:
>>
>> - out of the IOMMU space (possibly someone doesn't free the IOMMU
>>   space).
>>
>> or
>>
>> - the mapping parameters (such as align) aren't appropriate so the
>>   IOMMU can't find space.
>
> I don't think KMS drivers have ever worked on alpha so its not a
> regression, they are working fine on x86 + powerpc and sparc has been
> run at least once.

KMS on the console boot up has worked since about 2.6.32, but starting 
up the X server has always failed and, in my case, the system becomes 
unstable and eventually OOPs.

> I suspect we are simply hitting the limits of the iommu, how big an
> address space does it handle? since generally graphics drivers try to
> bind a lot of things to the GART.

No idea on the address space limit.  I applied the patch of Fujita that 
logs all IOMMU allocations, and also inserted some extra printks in the 
ttm kernel code so that I could see which routines failed and the error 
code returned.  Running the radeon test on boot exhibits the following:

[  238.712768] [drm] Tested GTT->VRAM and VRAM->GTT copy for GTT offset 
0x1a312000
[  239.281127] [drm] Tested GTT->VRAM and VRAM->GTT copy for GTT offset 
0x1a412000
[  239.281127] ttm_tt_bind belched -12
[  239.282104] ttm_bo_handle_move_mem belched -12
[  239.282104] ttm_bo_move_buffer belched -12
[  239.282104] ttm_bo_validate belched -12
[  239.282104] radeon 0000:01:00.0: object_init failed for (1048576, 
0x00000002) err=-12
[  239.282104] [drm:radeon_test_moves] *ERROR* Failed to create GTT 
object 419
[  239.399291] Error while testing BO move.

Note that no IOMMU allocations are printed while radeon_test_moves is 
running so iommu_arena_alloc doesn't appear to be called.  Also the 
error code returned up to radeon_test_moves is -12 which is ENOMEM.  So 
does appear to be some memory limit.

> It might be worth limiting the PCIGART in radeon to 32MB to see if the
> lower limit helps.

So, how does one do that?

Cheers
Michael.
