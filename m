From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 00/16] Remove usage of the deprecated "pci-dma-compat.h"
 API
Date: Wed, 23 Feb 2022 21:26:56 +0100
Message-ID: <ddf6010e-417d-8da7-8e11-1b4a55f92fff@wanadoo.fr>
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
 <YhXmQwvjMFPQFPUr@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <YhXmQwvjMFPQFPUr@infradead.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Christoph Hellwig <hch@infradead.org>
Cc: arnd@arndb.de, akpm@linux-foundation.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, davem@davemloft.net, airlied@linux.ie, vkoul@kernel.org, hao.wu@intel.com, trix@redhat.com, mdf@kernel.org, yilun.xu@intel.com, awalls@md.metrocast.net, mchehab@kernel.org, sathya.prakash@broadcom.com, sreekanth.reddy@broadcom.com, suganath-prabu.subramani@broadcom.com, mporter@kernel.crashing.org, alex.bou9@gmail.com, bhelgaas@google.com, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, dmaengine@vger.kernel.org, linux-fpga@vger.kernel.org, linux-media@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, linux-pci@vger.kernel.org

Le 23/02/2022 à 08:46, Christoph Hellwig a écrit :
> Hi Christophe,
> 
> do you know what the state is in current linux-next?
> 
> I think we'll just want to queue up anything left at this point in the
> dma-mapping or PCI tree and get it done.
> 

Hi,

Patch 01, 04, 05, 06, 08, 09 have not reached -next yet.
They all still apply cleanly.

04 has been picked it up for inclusion in the media subsystem for 5.18.
The other ones all have 1 or more Reviewed-by:/Acked-by: tags.

Patch 16 must be resubmitted to add "#include <linux/dma-mapping.h>" in 
order not to break builds.


All the other patches have landed in -next.

CJ
