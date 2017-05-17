From: Tobias Klauser <tklauser@distanz.ch>
Subject: [PATCH] alpha: use generic fb.h
Date: Wed, 17 May 2017 10:29:34 +0200
Message-ID: <20170517082934.1291-1-tklauser@distanz.ch>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

The arch uses a verbatim copy of the asm-generic version and does not
add any own implemntations to the header, so use asm-generic/fb.h
instead of duplicating code.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 arch/alpha/include/asm/Kbuild |  1 +
 arch/alpha/include/asm/fb.h   | 13 -------------
 2 files changed, 1 insertion(+), 13 deletions(-)
 delete mode 100644 arch/alpha/include/asm/fb.h

diff --git a/arch/alpha/include/asm/Kbuild b/arch/alpha/include/asm/Kbuild
index d103db5af5ff..5b974ab8425c 100644
--- a/arch/alpha/include/asm/Kbuild
+++ b/arch/alpha/include/asm/Kbuild
@@ -3,6 +3,7 @@
 generic-y += clkdev.h
 generic-y += exec.h
 generic-y += export.h
+generic-y += fb.h
 generic-y += irq_work.h
 generic-y += mcs_spinlock.h
 generic-y += mm-arch-hooks.h
diff --git a/arch/alpha/include/asm/fb.h b/arch/alpha/include/asm/fb.h
deleted file mode 100644
index fa9bbb96b2b3..000000000000
--- a/arch/alpha/include/asm/fb.h
+++ /dev/null
@@ -1,13 +0,0 @@
-#ifndef _ASM_FB_H_
-#define _ASM_FB_H_
-#include <linux/device.h>
-
-/* Caching is off in the I/O space quadrant by design.  */
-#define fb_pgprotect(...) do {} while (0)
-
-static inline int fb_is_primary_device(struct fb_info *info)
-{
-	return 0;
-}
-
-#endif /* _ASM_FB_H_ */
-- 
2.13.0


