From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 01/24] dma-direct: Make DIRECT_MAPPING_ERROR viable for SWIOTLB
Date: Thu, 22 Nov 2018 15:02:57 +0100
Message-ID: <20181122140320.24080-2-hch@lst.de>
References: <20181122140320.24080-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MtJ8xWA9qUHloLCvIEk/FO/K2KiiWlRZFAUGaRfluEU=;
	b=VBeO4MUyZpT6Uz3BAJpXDOk8Uo
	/FRVCIk1A14IplUDrLhOK/gb7SBRYL4RerbmU9plQ3LHIcmmN4tyiGNuJbB9rz7dJKxSpUS0GHIN1
	Kphn/TXjf55Olgpc9jNDFR+ufftxyVdLXH7aygV7C9ZJ4ZQcFpK8RXniWYx/H/Gw74hoXFLadGVJi
	kPk3z49co61r2z/69Xf+Kwnt0CCYu8afTmAvS2HCKXnUfGAMsWPWbfq1SlkVW17aNYEFT2KzbIysg
	iKoBMFEDulX4iK3g+vTgOhytNYv72XKVdeSZZYSb9qDXmS/znUupeKXJbpLTBYBVKsmSqsvvdz1pu
	1U2moY4Q==;
In-Reply-To: <20181122140320.24080-1-hch-jcswGhMUV9g@public.gmane.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Cc: linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org

From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>

With the overflow buffer removed, we no longer have a unique address
which is guaranteed not to be a valid DMA target to use as an error
token. The DIRECT_MAPPING_ERROR value of 0 tries to at least represent
an unlikely DMA target, but unfortunately there are already SWIOTLB
users with DMA-able memory at physical address 0 which now gets falsely
treated as a mapping failure and leads to all manner of misbehaviour.

The best we can do to mitigate that is flip DIRECT_MAPPING_ERROR to the
other commonly-used error value of all-bits-set, since the last single
byte of memory is by far the least-likely-valid DMA target.

Fixes: dff8d6c1ed58 ("swiotlb: remove the overflow buffer")
Reported-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Tested-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Konrad Rzeszutek Wilk <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 include/linux/dma-direct.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index bd73e7a91410..9e66bfe369aa 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -5,7 +5,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/mem_encrypt.h>
 
-#define DIRECT_MAPPING_ERROR		0
+#define DIRECT_MAPPING_ERROR		(~(dma_addr_t)0)
 
 #ifdef CONFIG_ARCH_HAS_PHYS_TO_DMA
 #include <asm/dma-direct.h>
-- 
2.19.1
