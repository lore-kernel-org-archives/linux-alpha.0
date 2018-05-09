From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 2/2] alpha: simplify get_arch_dma_ops
Date: Wed,  9 May 2018 16:04:52 +0200
Message-ID: <20180509140452.20716-3-hch@lst.de>
References: <20180509140452.20716-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=References:In-Reply-To:Message-Id:
	Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6YsxktIFApfljqDxCaSnQ3rBiukrtF50KorjTad9lzY=;
	b=kxqCzb9hqZnni0Cx056/JOegv
	Pl9y2fdM5WvYbz6hHhkBJhylWc3jbyFkeAGqXdVt3IvUb7Brcw+Ql5YICG2ImNR/d8JCm7WmVfmDL
	/Ebf11e6FY0aCDRf7dxdcMQrLVGdnOv4bo9THIKB4s9DQc9qHnANpxASqDwV6Hpn031bb6R4h2zIc
	W4U+a6aH6sUD4NsiIH5eUpfRhIcaf0enzKKvfiUUUYyhkDPqDwYYWpW2zS/0qu5XHw//PBQK2VSZa
	BprS+b4VFrykeqom+BT7hfd99fZrGfRVe/ikGqIL+6Ksh6vIch1kGcniRK2cmS3k00tp7Arv96uB/
	nDTpXXQdA==;
In-Reply-To: <20180509140452.20716-1-hch-jcswGhMUV9g@public.gmane.org>
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
To: ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org, mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Remove the dma_ops indirection.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 arch/alpha/include/asm/dma-mapping.h | 4 ++--
 arch/alpha/kernel/pci_iommu.c        | 4 +---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/include/asm/dma-mapping.h b/arch/alpha/include/asm/dma-mapping.h
index 76ce923ecca1..8beeafd4f68e 100644
--- a/arch/alpha/include/asm/dma-mapping.h
+++ b/arch/alpha/include/asm/dma-mapping.h
@@ -2,14 +2,14 @@
 #ifndef _ALPHA_DMA_MAPPING_H
 #define _ALPHA_DMA_MAPPING_H
 
-extern const struct dma_map_ops *dma_ops;
+extern const struct dma_map_ops alpha_pci_ops;
 
 static inline const struct dma_map_ops *get_arch_dma_ops(struct bus_type *bus)
 {
 #ifdef CONFIG_ALPHA_JENSEN
 	return &dma_direct_ops;
 #else
-	return dma_ops;
+	return &alpha_pci_ops;
 #endif
 }
 
diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 83b34b9188ea..6923b0d9c1e1 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -950,6 +950,4 @@ const struct dma_map_ops alpha_pci_ops = {
 	.mapping_error		= alpha_pci_mapping_error,
 	.dma_supported		= alpha_pci_supported,
 };
-
-const struct dma_map_ops *dma_ops = &alpha_pci_ops;
-EXPORT_SYMBOL(dma_ops);
+EXPORT_SYMBOL(alpha_pci_ops);
-- 
2.17.0
