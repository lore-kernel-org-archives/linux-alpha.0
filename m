From: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 10/21] powerpc/iommu: return error code from .map_sg() ops
Date: Thu, 29 Jul 2021 14:15:28 -0600
Message-ID: <20210729201539.5602-11-logang@deltatee.com>
References: <20210729201539.5602-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=HMmFCnKiUdZs8XdQrQe+q8n2y8J+pVaubqcncKbrGOc=; b=A77gCyW0d5juDnc7b5J4XOqhxW
 HC57NwrmUkwURjzWQkN9Syh/0vIuAlf3WMVmAPjrtxJ1fn92qxbnJNpgU1MccuVhE2XKvFuqbZ6yb
 s4fF0FP/eLp622wLZAXdLOs1988jAnkVr1m669v4Wlf/syuBk3Ho8Vj55j4bEOpC9EfUgEe0FssYq
 VKgfZMT9ybpjeOvebQMfL0EgOvY+EEEFuQo48AhmPiedYHvJjPv7Cdm5M5k8eo/gt/Fsie7h1kOto
 JwLBrYfbP2HP/+Y3m8ecKhNp5avb4GgJLw2mTfAo1TzqbqlE1K6UMF2u4lpxSzKwZa6Gnvq+ycvAH
 IkOANShw==;
In-Reply-To: <20210729201539.5602-1-logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
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
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Martin Oliveira <martin.oliveira-N4T0u6BTIXMybS5Ee8rs3A@public.gmane.org>, Stephen Bates <sbates-pv7U853sEMVWk0Htik3J/w@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>

From: Martin Oliveira <martin.oliveira-N4T0u6BTIXMybS5Ee8rs3A@public.gmane.org>

The .map_sg() op now expects an error code instead of zero on failure.

Propagate the error up if vio_dma_iommu_map_sg() fails.

ppc_iommu_map_sg() may fail either because of iommu_range_alloc() or
because of tbl->it_ops->set(). The former only supports returning an
error with DMA_MAPPING_ERROR and an examination of the latter indicates
that it may return arch-specific errors (for example,
tce_buildmulti_pSeriesLP()). Hence, coalesce all of those errors into
-EIO, per the documentation on dma_map_sgtable().

Signed-off-by: Martin Oliveira <martin.oliveira-N4T0u6BTIXMybS5Ee8rs3A@public.gmane.org>
Signed-off-by: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
---
 arch/powerpc/kernel/iommu.c             | 4 ++--
 arch/powerpc/platforms/ps3/system-bus.c | 2 +-
 arch/powerpc/platforms/pseries/vio.c    | 5 +++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 2af89a5e379f..a8ec4fe42817 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -473,7 +473,7 @@ int ppc_iommu_map_sg(struct device *dev, struct iommu_table *tbl,
 	BUG_ON(direction == DMA_NONE);
 
 	if ((nelems == 0) || !tbl)
-		return 0;
+		return -EINVAL;
 
 	outs = s = segstart = &sglist[0];
 	outcount = 1;
@@ -599,7 +599,7 @@ int ppc_iommu_map_sg(struct device *dev, struct iommu_table *tbl,
 		if (s == outs)
 			break;
 	}
-	return 0;
+	return -EIO;
 }
 
 
diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index 1a5665875165..c54eb46f0cfb 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -663,7 +663,7 @@ static int ps3_ioc0_map_sg(struct device *_dev, struct scatterlist *sg,
 			   unsigned long attrs)
 {
 	BUG();
-	return 0;
+	return -EINVAL;
 }
 
 static void ps3_sb_unmap_sg(struct device *_dev, struct scatterlist *sg,
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index e00f3725ec96..e31e59c54f30 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -560,7 +560,8 @@ static int vio_dma_iommu_map_sg(struct device *dev, struct scatterlist *sglist,
 	for_each_sg(sglist, sgl, nelems, count)
 		alloc_size += roundup(sgl->length, IOMMU_PAGE_SIZE(tbl));
 
-	if (vio_cmo_alloc(viodev, alloc_size))
+	ret = vio_cmo_alloc(viodev, alloc_size);
+	if (ret)
 		goto out_fail;
 	ret = ppc_iommu_map_sg(dev, tbl, sglist, nelems, dma_get_mask(dev),
 			direction, attrs);
@@ -577,7 +578,7 @@ static int vio_dma_iommu_map_sg(struct device *dev, struct scatterlist *sglist,
 	vio_cmo_dealloc(viodev, alloc_size);
 out_fail:
 	atomic_inc(&viodev->cmo.allocs_failed);
-	return 0;
+	return ret;
 }
 
 static void vio_dma_iommu_unmap_sg(struct device *dev,
-- 
2.20.1
