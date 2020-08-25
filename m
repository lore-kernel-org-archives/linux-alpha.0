From: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [RFT][PATCH 0/7] Avoid overflow at boundary_size
Date: Tue, 25 Aug 2020 12:16:27 +0200
Message-ID: <4321af30-9554-6897-5281-05afd88f2631@linux.ibm.com>
References: <20200820231923.23678-1-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=EOBUoNumc+lfxeSxOyM8nxTJchcZ8SasJG/UKpKCePc=;
 b=FLMfaI34xTiJCIrm5uFNqbuk0uT2DGykGFonCKV9ValbKJI3Gb8aJ1pjUCvH1rBMViHH
 a+46qMxkOoSEKYil9BF1E0fCNjqHrqN02uE3u63nGbSY/ajxgIwKwmxxu46FESXlA2nM
 CSrGWVcVfhlmX34vqVger2iojhSeXB+dFv+4FsmjCV6iJGBcX6jS2sIknOsTSUArI8jv
 pWnbWazaY41s/AVuWDg2oC/WN57VTsUafbWj+P2oGiWZap4gTf8wGpUUY7J7pjuNx8tf
 G6kTrWxeMCgWUXkLDaUJi/CEnjLBtbu0oz+Lo59EIPqzoCxSQsIPS9X7KAhGXPUvR8Iv 7g== 
In-Reply-To: <20200820231923.23678-1-nicoleotsuka@gmail.com>
Content-Language: en-US
Sender: sparclinux-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nicolin Chen <nicoleotsuka@gmail.com>, mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, tony.luck@intel.com, fenghua.yu@intel.com, gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com, James.Bottomley@HansenPartnership.com, deller@gmx.de
Cc: sfr@canb.auug.org.au, hch@lst.de, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org



On 8/21/20 1:19 AM, Nicolin Chen wrote:
> We are expending the default DMA segmentation boundary to its
> possible maximum value (ULONG_MAX) to indicate that a device
> doesn't specify a boundary limit. So all dma_get_seg_boundary
> callers should take a precaution with the return values since
> it would easily get overflowed.
> 
> I scanned the entire kernel tree for all the existing callers
> and found that most of callers may get overflowed in two ways:
> either "+ 1" or passing it to ALIGN() that does "+ mask".
> 
> According to kernel defines:
>     #define ALIGN_MASK(x, mask) (((x) + (mask)) & ~(mask))
>     #define ALIGN(x, a)	ALIGN_MASK(x, (typeof(x))(a) - 1)
> 
> We can simplify the logic here:
>   ALIGN(boundary + 1, 1 << shift) >> shift
> = ALIGN_MASK(b + 1, (1 << s) - 1) >> s
> = {[b + 1 + (1 << s) - 1] & ~[(1 << s) - 1]} >> s
> = [b + 1 + (1 << s) - 1] >> s
> = [b + (1 << s)] >> s
> = (b >> s) + 1
> 
> So this series of patches fix the potential overflow with this
> overflow-free shortcut.

Hi Nicolin,

haven't seen any other feedback from other maintainers,
so I guess you will resend this?
On first glance it seems to make sense.
I'm a little confused why it is only a "potential overflow"
while this part

"We are expending the default DMA segmentation boundary to its
 possible maximum value (ULONG_MAX) to indicate that a device
 doesn't specify a boundary limit"

sounds to me like ULONG_MAX is actually used, does that
mean there are currently no devices which do not specify a
boundary limit?


> 
> As I don't think that I have these platforms, marking RFT.
> 
> Thanks
> Nic
> 
> Nicolin Chen (7):
>   powerpc/iommu: Avoid overflow at boundary_size
>   alpha: Avoid overflow at boundary_size
>   ia64/sba_iommu: Avoid overflow at boundary_size
>   s390/pci_dma: Avoid overflow at boundary_size
>   sparc: Avoid overflow at boundary_size
>   x86/amd_gart: Avoid overflow at boundary_size
>   parisc: Avoid overflow at boundary_size
> 
>  arch/alpha/kernel/pci_iommu.c    | 10 ++++------
>  arch/ia64/hp/common/sba_iommu.c  |  4 ++--
>  arch/powerpc/kernel/iommu.c      | 11 +++++------
>  arch/s390/pci/pci_dma.c          |  4 ++--
>  arch/sparc/kernel/iommu-common.c |  9 +++------
>  arch/sparc/kernel/iommu.c        |  4 ++--
>  arch/sparc/kernel/pci_sun4v.c    |  4 ++--
>  arch/x86/kernel/amd_gart_64.c    |  4 ++--
>  drivers/parisc/ccio-dma.c        |  4 ++--
>  drivers/parisc/sba_iommu.c       |  4 ++--
>  10 files changed, 26 insertions(+), 32 deletions(-)
> 
