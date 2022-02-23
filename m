From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 00/16] Remove usage of the deprecated "pci-dma-compat.h"
 API
Date: Tue, 22 Feb 2022 23:46:11 -0800
Message-ID: <YhXmQwvjMFPQFPUr@infradead.org>
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=iy5Ofm6AWn5S0+TPzZqllkgh84EUFfIT9WUD1UClXn4=; b=KuGl+SxVwgaXgh5hLAVT1UAi4x
        Mdf6Uz6m2y23+0SrvtSnU9O8BhDGXxKAatQH1UV+1HLTZS6EKiTcNTlvQr6XJI6pv0KEXE3xvFiKZ
        R/Jky7QdCF8UDa+v3Z/QM6f/ERD1b/x8syFTQf7TpLLbwqST8AacGpmpD66qiLMZMpUOKXyZjimX2
        dqd43SyR3QIvd4Ydjgs3/d/7SKJAn7H0MEg/DJhCNfnBiuUH1CugGaRKAQv+oCwF98QBvMo4HOU/T
        ucaRKTd4ozFy8kNCn3ThNjnNyyDuUTB+nnvKoGQIx86jvBLxFv0AD8qU8mHYnOj4lkd3DtKX03IFR
        DEkug9Yw==;
Content-Disposition: inline
In-Reply-To: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: arnd@arndb.de, hch@infradead.org, akpm@linux-foundation.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, davem@davemloft.net, airlied@linux.ie, vkoul@kernel.org, hao.wu@intel.com, trix@redhat.com, mdf@kernel.org, yilun.xu@intel.com, awalls@md.metrocast.net, mchehab@kernel.org, sathya.prakash@broadcom.com, sreekanth.reddy@broadcom.com, suganath-prabu.subramani@broadcom.com, mporter@kernel.crashing.org, alex.bou9@gmail.com, bhelgaas@google.com, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, dmaengine@vger.kernel.org, linux-fpga@vger.kernel.org, linux-media@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, linux-pci@vger.kernel.org, l

Hi Christophe,

do you know what the state is in current linux-next?

I think we'll just want to queue up anything left at this point in the
dma-mapping or PCI tree and get it done.
