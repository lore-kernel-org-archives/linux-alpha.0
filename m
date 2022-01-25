From: Moritz Fischer <mdf@kernel.org>
Subject: Re: [PATCH 00/16] Remove usage of the deprecated "pci-dma-compat.h"
 API
Date: Tue, 25 Jan 2022 11:28:24 -0800
Message-ID: <YfBPWB9m5TWcZuFY@epycbox.lan>
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: arnd@arndb.de, hch@infradead.org, akpm@linux-foundation.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, davem@davemloft.net, airlied@linux.ie, vkoul@kernel.org, hao.wu@intel.com, trix@redhat.com, mdf@kernel.org, yilun.xu@intel.com, awalls@md.metrocast.net, mchehab@kernel.org, sathya.prakash@broadcom.com, sreekanth.reddy@broadcom.com, suganath-prabu.subramani@broadcom.com, mporter@kernel.crashing.org, alex.bou9@gmail.com, bhelgaas@google.com, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, dmaengine@vger.kernel.org, linux-fpga@vger.kernel.org, linux-media@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, linux-pci@vger.kernel.org, l

On Thu, Jan 06, 2022 at 10:45:13PM +0100, Christophe JAILLET wrote:
> This serie axes all the remaining usages of the deprecated "pci-dma-compat.h"
> API.
> 
> All these patches have already been posted.
> 
> They have been generated with a coccinelle script.
> The tricky parts are patches that use dma_alloc_coherent() because the correct
> GFP flag has to be used in place of the previous embedded GFP_ATOMIC.
> 
> Patches 1-3 are already Reviewed. References to the corresponding mail is
> given below the ---
> 
> Patch 1-2,4-10 are just generated from the coccinelle script. Only too long
> lines have been hand modified. dma_alloc_coherent() modification are NOT part
> of these patches.
> 
> Patch 3 also includes some 'dma_set_mask_and_coherent()' instead of
> 'pci_set_dma_mask()/pci_set_consistent_dma_mask()'.
> I've left this additional modification because it was reviewed with it.
> 
> Patch 10-15 are the tricky parts. Explanation of which GFP flag is the right one
> is given in each patch. It has been divided in several patches to ease review.
> 
> Patch 15 is the only one I'm slighly unsure with. The old code was using a
> GFP_USER flag in the function. I'm not familiar with it.
> I *guess*  that GFP_KERNEL is fine, but maybe it should also be GFP_USER or left
> as GFP_ATOMIC so that nothing is changed.
> 
> Patch 16 is the last step that remove "pci-dma-compat.h" and its only usage.
> 
> 
> All patches, exept 1-2,6 that are architecture specific, have been compile tested.
> 
> 
> After all that, a few rst files, 1 or 2 strings in error messages and some
> error branching labels should still need some attention. 
> This is some minor issues.
> 
> 
> Only the cover letter is sent to every one. Each patch is sent to the
> corresponding maintainer(s) + Andrew Morton, Christoph Hellwig and Arnd Bergmann.
> 
> 
> Best regards.
> 
> 
> Christophe JAILLET (16):
>   alpha: Remove usage of the deprecated "pci-dma-compat.h" API
>   floppy: Remove usage of the deprecated "pci-dma-compat.h" API
>   fpga: dfl: pci: Remove usage of the deprecated "pci-dma-compat.h" API
>   media: Remove usage of the deprecated "pci-dma-compat.h" API
>   agp/intel: Remove usage of the deprecated "pci-dma-compat.h" API
>   sparc: Remove usage of the deprecated "pci-dma-compat.h" API
>   dmaengine: pch_dma: Remove usage of the deprecated "pci-dma-compat.h"
>     API
>   rapidio/tsi721: Remove usage of the deprecated "pci-dma-compat.h" API
>   media: v4l2-pci-skeleton: Remove usage of the deprecated
>     "pci-dma-compat.h" API
>   scsi: message: fusion: Remove usage of the deprecated
>     "pci-dma-compat.h" API
>   scsi: mptbase: Use dma_alloc_coherent() in 'mpt_alloc_fw_memory()'
>   scsi: mptbase: Use dma_alloc_coherent()
>   scsi: mptsas: Use dma_alloc_coherent() in
>     mptsas_exp_repmanufacture_info()
>   scsi: mptsas: Use dma_alloc_coherent()
>   scsi: mptctl: Use dma_alloc_coherent()
>   PCI: Remove usage of the deprecated "pci-dma-compat.h" API
> 
>  arch/alpha/include/asm/floppy.h     |   7 +-
>  arch/alpha/kernel/pci_iommu.c       |  12 +--
>  arch/powerpc/include/asm/floppy.h   |   8 +-
>  arch/sparc/kernel/ioport.c          |   2 +-
>  drivers/char/agp/intel-gtt.c        |  26 ++---
>  drivers/dma/pch_dma.c               |   2 +-
>  drivers/fpga/dfl-pci.c              |  14 +--
>  drivers/media/pci/cx18/cx18-queue.h |   6 +-
>  drivers/media/pci/ivtv/ivtv-queue.h |  25 +++--
>  drivers/media/pci/ivtv/ivtv-udma.h  |   8 +-
>  drivers/message/fusion/mptbase.c    | 149 ++++++++++++++++------------
>  drivers/message/fusion/mptctl.c     |  82 +++++++++------
>  drivers/message/fusion/mptlan.c     |  90 +++++++++--------
>  drivers/message/fusion/mptsas.c     |  94 +++++++++---------
>  drivers/rapidio/devices/tsi721.c    |   8 +-
>  include/linux/pci-dma-compat.h      | 129 ------------------------
>  include/linux/pci.h                 |   3 -
>  samples/v4l/v4l2-pci-skeleton.c     |   2 +-
>  18 files changed, 289 insertions(+), 378 deletions(-)
>  delete mode 100644 include/linux/pci-dma-compat.h
> 
> -- 
> 2.32.0
> 
Applied [03/16] to linux-fpga for-next.

Thanks,
Moritz
