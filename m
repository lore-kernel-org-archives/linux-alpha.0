From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH 00/16] Remove usage of the deprecated "pci-dma-compat.h"
 API
Date: Tue, 18 Jan 2022 23:06:09 -0500
Message-ID: <164256513502.31841.5177778968152773786.b4-ty@oracle.com>
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=bGCfCt6vCAi9RXyrfJqfylamdOtbNoBkaaat0IE/Mnw=;
 b=lJnCGbChCBWiNCJ81/oD1H2AgQZqUQa5nCeYEKv3GgIDNnniyAqdpYR6Amtq5UVy85+S
 bSf1F6fc782Zb3Hp+C/dNgfwXSix7WwLstwfNiw/46TSej1TijDQQYxcpVwee5QgPbXs
 7qRvvqYwp1E1ZgJdwTidvqkrmMa2mDn9jRoaeO55cbOsT0QqUIBAR9kF8p5ggelQCa3G
 c12qT81DvBC9DrU2d50H1hksN5JKryq7e54/MdXUueGoXHOe0qsRXmf5/407TnolSx/k
 mH6KSOS3qms9+4ReTKr2kzH+nGTE/NnAmFSQ7vRhRr/fL6whaOCHGPK4AnnXhPGdKH9a 5A== 
In-Reply-To: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
To: sreekanth.reddy@broadcom.com, mchehab@kernel.org, mdf@kernel.org, mpe@ellerman.id.au, mporter@kernel.crashing.org, hch@infradead.org, bhelgaas@google.com, airlied@linux.ie, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, benh@kernel.crashing.org, ink@jurassic.park.msu.ru, davem@davemloft.net, akpm@linux-foundation.org, hao.wu@intel.com, vkoul@kernel.org, sathya.prakash@broadcom.com, paulus@samba.org, trix@redhat.com, arnd@arndb.de, yilun.xu@intel.com, suganath-prabu.subramani@broadcom.com, alex.bou9@gmail.com, awalls@md.metrocast.net, rth@twiddle.net, mattst88@gmail.com
Cc: kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, linuxppc-dev@lists.ozlabs.org, linux-fpga@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org

On Thu, 6 Jan 2022 22:45:13 +0100, Christophe JAILLET wrote:

> This serie axes all the remaining usages of the deprecated "pci-dma-compat.h"
> API.
> 
> All these patches have already been posted.
> 
> They have been generated with a coccinelle script.
> The tricky parts are patches that use dma_alloc_coherent() because the correct
> GFP flag has to be used in place of the previous embedded GFP_ATOMIC.
> 
> [...]

Applied to 5.17/scsi-queue, thanks!

[10/16] scsi: message: fusion: Remove usage of the deprecated "pci-dma-compat.h" API
        https://git.kernel.org/mkp/scsi/c/b114dda6f2f1
[11/16] scsi: mptbase: Use dma_alloc_coherent() in 'mpt_alloc_fw_memory()'
        https://git.kernel.org/mkp/scsi/c/2d50607260a6
[12/16] scsi: mptbase: Use dma_alloc_coherent()
        https://git.kernel.org/mkp/scsi/c/5c5e6b6f61e0
[13/16] scsi: mptsas: Use dma_alloc_coherent() in mptsas_exp_repmanufacture_info()
        https://git.kernel.org/mkp/scsi/c/7a960b3a5e37
[14/16] scsi: mptsas: Use dma_alloc_coherent()
        https://git.kernel.org/mkp/scsi/c/76a334d756c5
[15/16] scsi: mptctl: Use dma_alloc_coherent()
        https://git.kernel.org/mkp/scsi/c/706dc3b91989

-- 
Martin K. Petersen	Oracle Linux Engineering
