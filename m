From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 23/23] dma-mapping: return an error code from dma_mapping_error
Date: Fri, 30 Nov 2018 14:22:31 +0100
Message-ID: <20181130132231.16512-24-hch@lst.de>
References: <20181130132231.16512-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=GpxuU5NMbQU4Wkc8ZKHKSzkrwQNnxYoYUsxGInbTqJI=; b=YI7mlrYCbVJ+jK6g2JY+SFG38O
        wWXh6AKYVzcAk3wLIXzDeUVeTZvdQLrU89XK77IpfyY/uWB791aoc5nSdSYK4fcXdca/hWYUUZ7Sx
        3wmcpgRtUw4zspgsHWm+5oamGkUWk6hxtxg8653SzEDMC2s3jhkV2+hAdsfupqmCfZcoe13Zh6dFo
        ycm+hg461cGsrcFrutKM69CLCy9KeuluYsukAS1VOy1+9MDnulKnuRtiHlHzx33DT/PVHRUXwRnft
        zLz7Ptub7hpCkQjDq+H3efciK0ye4KGAYAdGig+hSMsMaiy+cjUwnFE3ItFm3Xl5HPxfcJoaCfETz
    
In-Reply-To: <20181130132231.16512-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: iommu@lists.linux-foundation.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jon Mason <jdmason@kudzu.us>, Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org

Currently dma_mapping_error returns a boolean as int, with 1 meaning
error.  This is rather unusual and many callers have to convert it to
errno value.  The callers are highly inconsistent with error codes
ranging from -ENOMEM over -EIO, -EINVAL and -EFAULT ranging to -EAGAIN.
Return -ENOMEM which seems to be what the largest number of callers
convert it to, and which also matches the typical error case where
we are out of resources.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/dma-mapping.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 2adef56c6069..b5bd25fc1f81 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -576,7 +576,7 @@ static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
 {
 	debug_dma_mapping_error(dev, dma_addr);
 	if (dma_addr == DMA_MAPPING_ERROR)
-		return 1;
+		return -ENOMEM;
 	return 0;
 }
 
-- 
2.19.1

