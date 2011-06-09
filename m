From: Jay Estabrook <jay.estabrook@gmail.com>
Subject: [PATCH 1/3] alpha, drm: Cleanup Alpha support in DRM generic code
Date: Thu, 9 Jun 2011 18:18:39 -0400
Message-ID: <20110609181839.7ca8838a.jay.estabrook_gmail.com@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:message-id:x-mailer
         :mime-version:content-type:content-transfer-encoding;
        bh=wvKG8rF1SE+deIXNG6LTAp4N0BdHChdfnRVExLJP8S4=;
        b=IQIH+r/ah8MDF3IizqSA6r3wu2vnWF2jG3/Wy7DizFHNnMjDzQl61Nv7yGcfT9beVH
         wsOrEX6kA5TdqFG2YPJVIRQo0Us7ZiaQL3SZNgSevsGSrnSA3VvmdHF9kfk/nTFp8ipt
         NL11IRu/eTcfgDJ92Y5x4V+dyblRv+xXgakvk=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha <linux-alpha@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Jay Estabrook <jay.estabrook@gmail.com>, airlied@linux.ie


Remove an obsolete Alpha adjustment, and modify another,
to go with the current Alpha architecture support.

Signed-off-by: Jay Estabrook <jay.estabrook@gmail.com>
---
 drivers/gpu/drm/drm_bufs.c    |    3 ---
 drivers/gpu/drm/drm_vm.c      |    2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff -Naurp a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
--- a/drivers/gpu/drm/drm_bufs.c	2011-04-26 23:48:50.000000000 -0400
+++ b/drivers/gpu/drm/drm_bufs.c	2011-05-02 11:51:48.000000000 -0400
@@ -183,9 +183,6 @@ static int drm_addmap_core(struct drm_de
 			return -EINVAL;
 		}
 #endif
-#ifdef __alpha__
-		map->offset += dev->hose->mem_space->start;
-#endif
 		/* Some drivers preinitialize some maps, without the X Server
 		 * needing to be aware of it.  Therefore, we just return success
 		 * when the server tries to create a duplicate map.
diff -Naurp a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
--- a/drivers/gpu/drm/drm_vm.c	2011-04-26 23:48:50.000000000 -0400
+++ b/drivers/gpu/drm/drm_vm.c	2011-05-02 11:51:48.000000000 -0400
@@ -526,7 +526,7 @@ static int drm_mmap_dma(struct file *fil
 static resource_size_t drm_core_get_reg_ofs(struct drm_device *dev)
 {
 #ifdef __alpha__
-	return dev->hose->dense_mem_base - dev->hose->mem_space->start;
+	return dev->hose->dense_mem_base;
 #else
 	return 0;
 #endif

---
