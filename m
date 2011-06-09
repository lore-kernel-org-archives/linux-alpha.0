From: Jay Estabrook <jay.estabrook@gmail.com>
Subject: [PATCH 3/3] alpha, drm: Add Alpha support to Radeon DRM code
Date: Thu, 9 Jun 2011 18:20:21 -0400
Message-ID: <20110609182021.73726ea3.jay.estabrook_gmail.com@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:message-id:x-mailer
         :mime-version:content-type:content-transfer-encoding;
        bh=AYY/g27HmYxMdi9PN7uYlQJw3DOlVP5+LquD7dWAWsI=;
        b=KzIccJzZrXz68CPR3njc5daVrX/RArlsAH2ZNGCgEG7edHd3fdTMSIG6wVuBj1XDNo
         8TnwK/V1sNzqfVHUxf9SB6eyus+yfx30sMpDwms5KFljN6pNhOlfdvOx1VntXZj0aJU1
         bXr/2Odu9n2lwPCcFLNWQcebBkKVJ2/IIVinM=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha <linux-alpha@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
Cc: Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jay Estabrook <jay.estabrook@gmail.com>, airlied@linux.ie


Alpha needs to have the system bus address for the device's local
memory available, so that it can be returned to user-level, where
it may be used in an mmap(). So, we make bus.addr hold the ioremap()
return for kernel use, and then we can modify bus.base appropriately.

Signed-off-by: Jay Estabrook <jay.estabrook@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff -Naurp a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
--- a/drivers/gpu/drm/radeon/radeon_ttm.c	2011-04-26 23:48:50.000000000 -0400
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c	2011-05-03 18:24:27.000000000 -0400
@@ -450,6 +450,29 @@ static int radeon_ttm_io_mem_reserve(str
 			return -EINVAL;
 		mem->bus.base = rdev->mc.aper_base;
 		mem->bus.is_iomem = true;
+#ifdef __alpha__
+		/*
+		 * Alpha: use bus.addr to hold the ioremap() return,
+		 * so we can modify bus.base below.
+		 */
+		if (mem->placement & TTM_PL_FLAG_WC)
+			mem->bus.addr =
+				ioremap_wc(mem->bus.base + mem->bus.offset,
+					   mem->bus.size);
+		else
+			mem->bus.addr =
+				ioremap_nocache(mem->bus.base + mem->bus.offset,
+						mem->bus.size);
+
+		/*
+		 * Alpha: Take just the bus offset and
+		 * add the hose/domain memory base.
+		 * Then, bus.base can be returned
+		 * for use in an mmap() call.
+		 */
+		mem->bus.base = (mem->bus.base & 0x0ffffffffUL) +
+			rdev->ddev->hose->dense_mem_base;
+#endif
 		break;
 	default:
 		return -EINVAL;

---
