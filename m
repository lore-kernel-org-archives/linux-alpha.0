From: Jay Estabrook <jay.estabrook@gmail.com>
Subject: [PATCH 3/3 REPOST] alpha, drm: Add Alpha support to Radeon DRM code
Date: Mon, 20 Jun 2011 14:20:59 -0400
Message-ID: <20110620142059.04c3b912.jay.estabrook_gmail.com@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:message-id:x-mailer
         :mime-version:content-type:content-transfer-encoding;
        bh=eXFbBroscKzesZCbvUOExDuKqcsBGOtC0C3pNfVuZ7g=;
        b=jM8AnpDZPY5AEgxEy/iaNlSI0jbmPYQIHD0/I9BHQe8EfNtjKoQkNet5UtSNdiUI9k
         EFAEefjSxVTTv8YHH9+JOTDynD4JPAa55Dmulff5WQPQ/FRyfmuJfVMLTIv+MrUnyohZ
         KVJkqiEgSuulz0xE+B6ApN1ZwDNrBk0pespUg=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: airlied@linux.ie, linux-kernel <linux-kernel@vger.kernel.org>, linux-alpha <linux-alpha@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
Cc: Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jay Estabrook <jay.estabrook@gmail.com>


Alpha needs to have available the system bus address for the Radeon's
local memory, so that it can be used in ttm_bo_vm_fault(), when building
the PTEs for accessing that VRAM.  So, we make bus.addr hold the ioremap()
return, and then we can modify bus.base appropriately for use during page
fault processing.

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
