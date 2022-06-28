From: Michael Schmitz <schmitzmic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Tue, 28 Jun 2022 15:25:58 +1200
Message-ID: <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------EF1F8A9B021AD1B88577153E"
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EDD340483
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29C0340017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 597D1414C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9565414C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=98ncMEofZ3ypmUWB7oKUkuT/bpmjStGksJuUcGKTVGc=;
 b=fMfCg/HOqcbPVSdVNElbV526+23+XdN3LylNezJqkrHb6fVXmxpkunVG3rLT9XcFXw
 HpCMyB7KDRKw245t+OJHw3FQL2gH2icNy1tzXFhyTeE+J9RLZswjB9T1T9XiFFpbERR5
 lCNa01DtHAYHMiVGjinDg8S0v2LUYuJPChTK5IuIdjUFD4GA99cW8qKKeB++ss8Vw+os
 RLW9bmiojBFFCdkwOuQe/CgRlLJtBdmK9G50X0mwzZYxHK7Dxb7Wga9rrrBIp9c5MIyG
 9Sx9MkBVwQuwC4cT7mj+YhgLxFUe+8+CDN6etZdDn0xnYNIAkilvA9GHP+xPdmO3Dj67
 /XjQ==
In-Reply-To: <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Linux-Arch <linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, scsi <linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Miquel van Smoorenburg <mikevs-qWit8jRvyhWsTnJN9+BGXg@public.gmane.org>, linux-m68k <linux-m68k-cunTk1MwBs8S/qaLPR03pWD2FQJk+8+b@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, "Maciej W . Rozycki" <macro-fOkVWZO6G+f10XsdtD+oqA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denis Efremov <efremov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, Mark Salyzyn <salyzyn-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Linux IOMMU <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Matt Wang <wwentao-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Parisc List <linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, alpha <linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Khalid Aziz <khalid-21RPF02GE+GXwddmVfQv5g@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>

This is a multi-part message in MIME format.
--------------EF1F8A9B021AD1B88577153E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hii Geert

Am 28.06.2022 um 09:12 schrieb Michael Schmitz:
> Hi Geert,
>
> On 27/06/22 20:26, Geert Uytterhoeven wrote:
>> Hi Michael,
>>
>> On Sat, Jun 18, 2022 at 3:06 AM Michael Schmitz <schmitzmic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> wrote:
>>> Am 18.06.2022 um 00:57 schrieb Arnd Bergmann:
>>>> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>>>>
>>>> All architecture-independent users of virt_to_bus() and bus_to_virt()
>>>> have been fixed to use the dma mapping interfaces or have been
>>>> removed now.  This means the definitions on most architectures, and the
>>>> CONFIG_VIRT_TO_BUS symbol are now obsolete and can be removed.
>>>>
>>>> The only exceptions to this are a few network and scsi drivers for m68k
>>>> Amiga and VME machines and ppc32 Macintosh. These drivers work
>>>> correctly
>>>> with the old interfaces and are probably not worth changing.
>>> The Amiga SCSI drivers are all old WD33C93 ones, and replacing
>>> virt_to_bus by virt_to_phys in the dma_setup() function there would
>>> cause no functional change at all.
>> FTR, the sgiwd93 driver use dma_map_single().
>
> Thanks! From what I see, it doesn't have to deal with bounce buffers
> though?

Leaving the bounce buffer handling in place, and taking a few other 
liberties - this is what converting the easiest case (a3000 SCSI) might 
look like. Any obvious mistakes? The mvme147 driver would be very 
similar to handle (after conversion to a platform device).

The driver allocates bounce buffers using kmalloc if it hits an 
unaligned data buffer - can such buffers still even happen these days? 
If I understand dma_map_single() correctly, the resulting dma handle 
would be equally misaligned?

To allocate a bounce buffer, would it be OK to use dma_alloc_coherent() 
even though AFAIU memory used for DMA buffers generally isn't consistent 
on m68k?

Thinking ahead to the other two Amiga drivers - I wonder whether 
allocating a static bounce buffer or a DMA pool at driver init is likely 
to succeed if the kernel runs from the low 16 MB RAM chunk? It certainly 
won't succeed if the kernel runs from a higher memory address, so the 
present bounce buffer logic around amiga_chip_alloc() might still need 
to be used here.

Leaves the question whether converting the gvp11 and a2091 drivers is 
actually worth it, if bounce buffers still have to be handled explicitly.

Untested (except for compile testing), un-checkpatched, don't try this 
on any disk with valuable data ...

Cheers,

	Michael

--------------EF1F8A9B021AD1B88577153E
Content-Type: text/x-diff;
 name="0001-scsi-convert-m68k-WD33C93-drivers-to-DMA-API.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-scsi-convert-m68k-WD33C93-drivers-to-DMA-API.patch"

From e8c6aa068d27901c49dfb7442d4200cc966350a5 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitzmic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Tue, 28 Jun 2022 12:45:08 +1200
Subject: [PATCH] scsi - convert m68k WD33C93 drivers to DMA API

Use dma_map_single() for gvp11 driver (leave bounce buffer logic unchanged).

Compile-tested only.

Signed-off-by: Michael Schmitz <schmitzmic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/scsi/a3000.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/a3000.c b/drivers/scsi/a3000.c
index dd161885eed1..3c62e8bafb8f 100644
--- a/drivers/scsi/a3000.c
+++ b/drivers/scsi/a3000.c
@@ -7,6 +7,7 @@
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
 #include <linux/module.h>
 
 #include <asm/page.h>
@@ -25,8 +26,11 @@
 struct a3000_hostdata {
 	struct WD33C93_hostdata wh;
 	struct a3000_scsiregs *regs;
+	struct device *dev;
 };
 
+#define DMA_DIR(d)   ((d == DATA_OUT_DIR) ? DMA_TO_DEVICE : DMA_FROM_DEVICE)
+
 static irqreturn_t a3000_intr(int irq, void *data)
 {
 	struct Scsi_Host *instance = data;
@@ -49,12 +53,16 @@ static irqreturn_t a3000_intr(int irq, void *data)
 static int dma_setup(struct scsi_cmnd *cmd, int dir_in)
 {
 	struct scsi_pointer *scsi_pointer = WD33C93_scsi_pointer(cmd);
+	unsigned long len = scsi_pointer->this_residual;
 	struct Scsi_Host *instance = cmd->device->host;
 	struct a3000_hostdata *hdata = shost_priv(instance);
 	struct WD33C93_hostdata *wh = &hdata->wh;
 	struct a3000_scsiregs *regs = hdata->regs;
 	unsigned short cntr = CNTR_PDMD | CNTR_INTEN;
-	unsigned long addr = virt_to_bus(scsi_pointer->ptr);
+	dma_addr_t addr;
+
+	addr = dma_map_single(hdata->dev, scsi_pointer->ptr, len, DMA_DIR(dir_in));
+	scsi_pointer->dma_handle = addr;
 
 	/*
 	 * if the physical address has the wrong alignment, or if
@@ -79,7 +87,7 @@ static int dma_setup(struct scsi_cmnd *cmd, int dir_in)
 			       scsi_pointer->this_residual);
 		}
 
-		addr = virt_to_bus(wh->dma_bounce_buffer);
+		addr = virt_to_phys(wh->dma_bounce_buffer);
 	}
 
 	/* setup dma direction */
@@ -166,6 +174,10 @@ static void dma_stop(struct Scsi_Host *instance, struct scsi_cmnd *SCpnt,
 			wh->dma_bounce_len = 0;
 		}
 	}
+	dma_unmap_single(hdata->dev, scsi_pointer->dma_handle,
+			 scsi_pointer->this_residual,
+			 DMA_DIR(wh->dma_dir));
+
 }
 
 static struct scsi_host_template amiga_a3000_scsi_template = {
@@ -193,6 +205,11 @@ static int __init amiga_a3000_scsi_probe(struct platform_device *pdev)
 	wd33c93_regs wdregs;
 	struct a3000_hostdata *hdata;
 
+	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(32))) {
+		dev_warn(&pdev->dev, "cannot use 32 bit DMA\n");
+		return -ENODEV;
+	}
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return -ENODEV;
@@ -216,6 +233,7 @@ static int __init amiga_a3000_scsi_probe(struct platform_device *pdev)
 	wdregs.SCMD = &regs->SCMD;
 
 	hdata = shost_priv(instance);
+	hdata->dev = &pdev->dev;
 	hdata->wh.no_sync = 0xff;
 	hdata->wh.fast = 0;
 	hdata->wh.dma_mode = CTRL_DMA;
-- 
2.17.1


--------------EF1F8A9B021AD1B88577153E
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--------------EF1F8A9B021AD1B88577153E--
