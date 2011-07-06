From: Jay Estabrook <jay.estabrook@gmail.com>
Subject: [PATCH 3/3 REPOST #2] alpha, drm: Add Alpha support to Radeon DRM
 code
Date: Wed, 6 Jul 2011 19:57:13 -0400
Message-ID: <20110706195713.48fe25fe.jay.estabrook_gmail.com@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=date:from:to:cc:subject:message-id:x-mailer:mime-version
         :content-type:content-transfer-encoding;
        bh=kP0ENFpz/O8rf4qXps/m1OxLVZ8E6SWB1UGUMqrjF0g=;
        b=G7CQH2OkyTzWI4Ra8ugC5hLngL4lvfj/xfJY+0QiQpViq9lB5RzqHcT7JnYAFUDzpj
         ccDnbuZSE7bD77bbrXe8jhfPxxdn9IHEJ6g15ppuFdMDeY0k9y/ef+8ngel1d6/Npcvc
         gm0fvJIHTwUVMC/Xl6tKlT46flCn2KY110VOk=
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
+		 * Alpha: Use just the bus offset plus
+		 * the hose/domain memory base for bus.base.
+		 * It then can be used to build PTEs for VRAM
+		 * access, as done in ttm_bo_vm_fault().
+		 */
+		mem->bus.base = (mem->bus.base & 0x0ffffffffUL) +
+			rdev->ddev->hose->dense_mem_base;
+#endif
 		break;
 	default:
 		return -EINVAL;
