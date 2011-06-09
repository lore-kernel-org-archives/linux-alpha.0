From: Jay Estabrook <jay.estabrook@gmail.com>
Subject: [PATCH 2/3] alpha, drm: Remove obsolete Alpha support in MGA DRM
 code
Date: Thu, 9 Jun 2011 18:19:12 -0400
Message-ID: <20110609181912.2dfad4fe.jay.estabrook_gmail.com@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:message-id:x-mailer
         :mime-version:content-type:content-transfer-encoding;
        bh=NSRfpNoDRbPfKWC5nkt4Mr5hCJHoMp/uUhbglZ2lp6M=;
        b=iCcqxlesj/olFGbrW4eolH3uB+vFsZT9I7lo0p+IdgViskdcD6lpaJvdmFFDVeq+am
         BbtFGqp2EZ1+YDa519OgyPimScfNTDylJeK6bpGv+PrjwP6X7I+Kvpi8Gi5lV5x7+mJF
         /cF8WQZu6kiIh+NQr2l9HVlA8COdEP7rtXA38=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha <linux-alpha@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
Cc: Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jay Estabrook <jay.estabrook@gmail.com>, airlied@linux.ie


Remove an obsolete Alpha adjustment in the drm for MGA on Alpha.

Signed-off-by: Jay Estabrook <jay.estabrook@gmail.com>
---
 drivers/gpu/drm/mga/mga_drv.h |   19 -------------------
 1 file changed, 19 deletions(-)

diff -Naurp a/drivers/gpu/drm/mga/mga_drv.h b/drivers/gpu/drm/mga/mga_drv.h
--- a/drivers/gpu/drm/mga/mga_drv.h	2011-04-26 23:48:50.000000000 -0400
+++ b/drivers/gpu/drm/mga/mga_drv.h	2011-05-02 11:51:48.000000000 -0400
@@ -195,29 +195,10 @@ extern long mga_compat_ioctl(struct file
 
 #define mga_flush_write_combine()	DRM_WRITEMEMORYBARRIER()
 
-#if defined(__linux__) && defined(__alpha__)
-#define MGA_BASE(reg)		((unsigned long)(dev_priv->mmio->handle))
-#define MGA_ADDR(reg)		(MGA_BASE(reg) + reg)
-
-#define MGA_DEREF(reg)		(*(volatile u32 *)MGA_ADDR(reg))
-#define MGA_DEREF8(reg)		(*(volatile u8 *)MGA_ADDR(reg))
-
-#define MGA_READ(reg)		(_MGA_READ((u32 *)MGA_ADDR(reg)))
-#define MGA_READ8(reg)		(_MGA_READ((u8 *)MGA_ADDR(reg)))
-#define MGA_WRITE(reg, val)	do { DRM_WRITEMEMORYBARRIER(); MGA_DEREF(reg) = val; } while (0)
-#define MGA_WRITE8(reg, val)	do { DRM_WRITEMEMORYBARRIER(); MGA_DEREF8(reg) = val; } while (0)
-
-static inline u32 _MGA_READ(u32 *addr)
-{
-	DRM_MEMORYBARRIER();
-	return *(volatile u32 *)addr;
-}
-#else
 #define MGA_READ8(reg)		DRM_READ8(dev_priv->mmio, (reg))
 #define MGA_READ(reg)		DRM_READ32(dev_priv->mmio, (reg))
 #define MGA_WRITE8(reg, val)	DRM_WRITE8(dev_priv->mmio, (reg), (val))
 #define MGA_WRITE(reg, val)	DRM_WRITE32(dev_priv->mmio, (reg), (val))
-#endif
 
 #define DWGREG0		0x1c00
 #define DWGREG0_END	0x1dff

---
