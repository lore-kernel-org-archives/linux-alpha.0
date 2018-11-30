From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 01/23] dma-mapping: provide a generic DMA_MAPPING_ERROR
Date: Fri, 30 Nov 2018 14:22:09 +0100
Message-ID: <20181130132231.16512-2-hch@lst.de>
References: <20181130132231.16512-1-hch@lst.de>
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
	bh=uAVVZbZ4lOCyuUE6c3OSSVR5FUxUkQ0rwJ5NpEk5hIk=;
	b=n5su2fb/lbh7rccugjTnBESjHb
	e7pDDvbjoTtHRnlydrXmoI5jaYzjxZBFOuCtvxJbX/9KegeG+EnKnRqkMyevp5xgsaDDA1FIrLpi0
	lp4IUVk7/x61NlgXS9bohj3BZNnuw97xkwasa0TZQgwlq0MnmGAdZmuNy4fJTyt8PoqnDgAd70zp2
	3cvtJjYY+IP1mWWZhb0nzj2enVdGh171jyXEOzNDe6Bd1mO/JnljLRdsLhEgXWP0DNRO+Cue1aYya
	mYCeyTSv12WlmzG7orvm/usmsurjBbQ9ZpyqiJK8D/bJRfCf54Ns2CCHvbOwr8cySDck9RSfafNyX
	T9oDjsHg==;
In-Reply-To: <20181130132231.16512-1-hch-jcswGhMUV9g@public.gmane.org>
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

Error handling of the dma_map_single and dma_map_page APIs is a little
problematic at the moment, in that we use different encodings in the
returned dma_addr_t to indicate an error.  That means we require an
additional indirect call to figure out if a dma mapping call returned
an error, and a lot of boilerplate code to implement these semantics.

Instead return the maximum addressable value as the error.  As long
as we don't allow mapping single-byte ranges with single-byte alignment
this value can never be a valid return.  Additionaly if drivers do
not check the return value from the dma_map* routines this values means
they will generally not be pointed to actual memory.

Once the default value is added here we can start removing the
various mapping_error methods and just rely on this generic check.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 include/linux/dma-mapping.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 0f81c713f6e9..46bd612d929e 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -133,6 +133,8 @@ struct dma_map_ops {
 	u64 (*get_required_mask)(struct device *dev);
 };
 
+#define DMA_MAPPING_ERROR		(~(dma_addr_t)0)
+
 extern const struct dma_map_ops dma_direct_ops;
 extern const struct dma_map_ops dma_virt_ops;
 
@@ -576,6 +578,10 @@ static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
 	debug_dma_mapping_error(dev, dma_addr);
+
+	if (dma_addr == DMA_MAPPING_ERROR)
+		return 1;
+
 	if (ops->mapping_error)
 		return ops->mapping_error(dev, dma_addr);
 	return 0;
-- 
2.19.1
