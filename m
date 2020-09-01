From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH 2/2] dma-mapping: set default segment_boundary_mask to ULONG_MAX
Date: Tue,  1 Sep 2020 15:16:46 -0700
Message-ID: <20200901221646.26491-3-nicoleotsuka@gmail.com>
References: <20200901221646.26491-1-nicoleotsuka@gmail.com>
Return-path: <sparclinux-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8oVSt+XXgts9V9hBX8ORH+AS6m2J43vGA4wo7bjMGSw=;
        b=qlO5fZKXWIaweztfSZt5lscCfMeb95G8MhWsQ/lSaJ+FDb1SNokcNpp+7z3DLE4rF3
         2dysm9rS4OSd3k64RrCb2iDLfTihhQIBsWHIM4pO3zun/ZZiHw5M0ZYz7xotRRp0Vl6H
         gVuKb6zzb+/D4Aziqs+kgokfp0Tdgx+wAi7EGpiAZ/wFNGynAtvTJuP+UbdooYJgbhjP
         o7AepCWbCypJyziUVIcTQr08TEiIxGgWthqCZQfDFV+gKNvojJajEcK9KwneuTuD6th6
         msoaUb3F3Quj/oIp2iNYcujpjaBrVxAyuvNikmWWuoEg7qjTdOjx5lIdZ2jVaiaUQPfR
         XRDQ==
In-Reply-To: <20200901221646.26491-1-nicoleotsuka@gmail.com>
Sender: sparclinux-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hch@lst.de
Cc: sfr@canb.auug.org.au, mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, tony.luck@intel.com, fenghua.yu@intel.com, linux-ia64@vger.kernel.org, schnelle@linux.ibm.com, gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com, linux-s390@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com, James.Bottomley@HansenPartnership.com, deller@gmx.de, linux-parisc@vger.kernel.org

The default segment_boundary_mask was set to DMA_BIT_MAKS(32)
a decade ago by referencing SCSI/block subsystem, as a 32-bit
mask was good enough for most of the devices.

Now more and more drivers set dma_masks above DMA_BIT_MAKS(32)
while only a handful of them call dma_set_seg_boundary(). This
means that most drivers have a 4GB segmention boundary because
DMA API returns a 32-bit default value, though they might not
really have such a limit.

The default segment_boundary_mask should mean "no limit" since
the device doesn't explicitly set the mask. But a 32-bit mask
certainly limits those devices capable of 32+ bits addressing.

So this patch sets default segment_boundary_mask to ULONG_MAX.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 include/linux/dma-mapping.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index faab0a8210b9..df0bff2ea750 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -629,7 +629,7 @@ static inline unsigned long dma_get_seg_boundary(struct device *dev)
 {
 	if (dev->dma_parms && dev->dma_parms->segment_boundary_mask)
 		return dev->dma_parms->segment_boundary_mask;
-	return DMA_BIT_MASK(32);
+	return ULONG_MAX;
 }
 
 /**
-- 
2.17.1

