From: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 16/21] parisc: return error code from .map_sg() ops
Date: Fri, 23 Jul 2021 11:50:03 -0600
Message-ID: <20210723175008.22410-17-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=fB/z94v+Zqx6MpbGppBoixHLzAQycdh8k5f4rRFmrO0=; b=PvIVsf2jJdjk6A970FfEEgio21
 C/GMm/RBk6KYroHH2dZOmLXdmLkBew5HHh4ogJ4P2/jEv02L00NKiJaxWDVBVdI85Fvgv3Vr6zuz1
 cUHgUTOcWG9J5J9uaCEQqP3EHXfbGhr2Ne5j9gcnyqOw4irFL91qML0lTF0/IWJN4kHlrWfjjR3wN
 hQ4+y7+g/5FaYW+hEGmzZqEuoaouyuHCmMgvesyPjw7aA8hV9KjB8TONVSEjVHcTPSuNw8lgf4Z8B
 OAbdFLIqDvFcxElYIiNYLpJtj4l9uUBc/8qDpgwPEhQ1nG1iZt/LOiAHcmHRyh06r9hB2YuqjLowo
 E+cwXFgQ==;
In-Reply-To: <20210723175008.22410-1-logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
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
Cc: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>, Martin Oliveira <martin.oliveira-N4T0u6BTIXMybS5Ee8rs3A@public.gmane.org>, Stephen Bates <sbates-pv7U853sEMVWk0Htik3J/w@public.gmane.org>, "James E.J. Bottomley" <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>

From: Martin Oliveira <martin.oliveira-N4T0u6BTIXMybS5Ee8rs3A@public.gmane.org>

The .map_sg() op now expects an error code instead of zero on failure.
Return -EINVAL if the ioc cannot be obtained.

Signed-off-by: Martin Oliveira <martin.oliveira-N4T0u6BTIXMybS5Ee8rs3A@public.gmane.org>
Signed-off-by: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Cc: "James E.J. Bottomley" <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>
Cc: Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>
---
 drivers/parisc/ccio-dma.c  | 2 +-
 drivers/parisc/sba_iommu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index b5f9ee81a46c..452e72b7bd01 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -918,7 +918,7 @@ ccio_map_sg(struct device *dev, struct scatterlist *sglist, int nents,
 	BUG_ON(!dev);
 	ioc = GET_IOC(dev);
 	if (!ioc)
-		return 0;
+		return -EINVAL;
 	
 	DBG_RUN_SG("%s() START %d entries\n", __func__, nents);
 
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index dce4cdf786cd..e60690d38d67 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -947,7 +947,7 @@ sba_map_sg(struct device *dev, struct scatterlist *sglist, int nents,
 
 	ioc = GET_IOC(dev);
 	if (!ioc)
-		return 0;
+		return -EINVAL;
 
 	/* Fast path single entry scatterlists. */
 	if (nents == 1) {
-- 
2.20.1
