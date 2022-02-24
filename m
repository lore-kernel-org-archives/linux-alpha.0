From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 00/16] Remove usage of the deprecated "pci-dma-compat.h"
 API
Date: Wed, 23 Feb 2022 22:25:16 -0800
Message-ID: <YhckzJp5/x9zW4uQ@infradead.org>
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
 <YhXmQwvjMFPQFPUr@infradead.org>
 <ddf6010e-417d-8da7-8e11-1b4a55f92fff@wanadoo.fr>
Mime-Version: 1.0
Return-path: <linux-media-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=0xdJtLbIyGaTkVrOoFrs1oCqE4SKHuV2ypN1+yGx8FU=; b=plqHsoA9r6qv2vcyoZWmADrMG/
        5OPFbItTU7dR/wJsGyZ44TU7xCGfQQi8sj15lLsmxdJKWXugYw9BJI825zqqtRxeT2vsvlVL1+L+4
        Z4s86+FCMNrdAqVn80iGGZAgP1Tib8fDL9OlFVl6nNO623T8ympgHtoeQ8BY5GKQooyK/3WKhc0OJ
        RZfyDYV0j3SviZJjYHW+23G9QvaHR2MEStY2hyxNGAakVOAap9o8FDNl4jQHwk6i6bgcOGcNyf81N
        7qkWtXciB2p6k8Q5Hv/7mbngKMtgV1QAQWdv1kadJpK9io105nqZXvfHdj7kmdHBz/G8wD2sYCdtb
        3ygJbvwQ==;
Content-Disposition: inline
In-Reply-To: <ddf6010e-417d-8da7-8e11-1b4a55f92fff@wanadoo.fr>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Christoph Hellwig <hch@infradead.org>, arnd@arndb.de, akpm@linux-foundation.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, davem@davemloft.net, airlied@linux.ie, vkoul@kernel.org, hao.wu@intel.com, trix@redhat.com, mdf@kernel.org, yilun.xu@intel.com, awalls@md.metrocast.net, mchehab@kernel.org, sathya.prakash@broadcom.com, sreekanth.reddy@broadcom.com, suganath-prabu.subramani@broadcom.com, mporter@kernel.crashing.org, alex.bou9@gmail.com, bhelgaas@google.com, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, dmaengine@vger.kernel.org, linux-fpga@vger.kernel.org, linux-media@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, linux-pci@vger.ke

On Wed, Feb 23, 2022 at 09:26:56PM +0100, Christophe JAILLET wrote:
> Patch 01, 04, 05, 06, 08, 09 have not reached -next yet.
> They all still apply cleanly.
> 
> 04 has been picked it up for inclusion in the media subsystem for 5.18.
> The other ones all have 1 or more Reviewed-by:/Acked-by: tags.
> 
> Patch 16 must be resubmitted to add "#include <linux/dma-mapping.h>" in
> order not to break builds.

So how about this:  I'll pick up 1, 5,6,8 and 9 for the dma-mapping
tree.  After -rc1 when presumably all other patches have reached
mainline your resubmit one with the added include and we finish this
off?

Thanks a lot for all your work already!
