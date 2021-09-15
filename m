From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 3/4] alpha: Move setup.h out of uapi
Date: Tue, 14 Sep 2021 20:52:26 -0700
Message-ID: <20210915035227.630204-4-linux@roeck-us.net>
References: <20210915035227.630204-1-linux@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3aaPF5vSGERQCaEoUNmmtyNjkH4NB7gnK3IgOPR3RPc=;
        b=eSchhtH2NEH2+tJRmJu694dKY96qWoqIr+byFRhjZ0JtBGo6K0a51DfHqbpC8U70n8
         J21fy+wOMHTVOZw3AL5RIXBVjhOP94A8qWIeozYRduDnrTClsTbfIOSpclyShMdAct/2
         x5yCdIE9hWc0uY7w3OW0zoUQI58Mx8rBue/60ygP6ANECaDrJHeERWSyhAEBH4Yc9QBt
         6cfzkfr2u1yCGwKa1NaFh4Rscusxu86BFipQIZrw9WutQSHjGQW2ilaYFmE1BCRQDpLT
         5nriXqiLA08Q7iESCzgOw+38MzMlKylsSnk/mFx4hFg43e/inPhlwPQ2ZuEsc39/hNwp
         dMwg==
Sender: Guenter Roeck <groeck7@gmail.com>
In-Reply-To: <20210915035227.630204-1-linux@roeck-us.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-sparse@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

Most of the contents of setup.h have no value for userspace
applications. The file was probably moved to uapi accidentally.

Keep the file in uapi to define the alpha-specific COMMAND_LINE_SIZE.
Move all other defines to arch/alpha/include/asm/setup.h.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added patch

 arch/alpha/include/asm/setup.h      | 43 +++++++++++++++++++++++++++++
 arch/alpha/include/uapi/asm/setup.h | 42 ++--------------------------
 2 files changed, 46 insertions(+), 39 deletions(-)
 create mode 100644 arch/alpha/include/asm/setup.h

diff --git a/arch/alpha/include/asm/setup.h b/arch/alpha/include/asm/setup.h
new file mode 100644
index 000000000000..58fe3f45a235
--- /dev/null
+++ b/arch/alpha/include/asm/setup.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ALPHA_SETUP_H
+#define __ALPHA_SETUP_H
+
+#include <uapi/asm/setup.h>
+
+/*
+ * We leave one page for the initial stack page, and one page for
+ * the initial process structure. Also, the console eats 3 MB for
+ * the initial bootloader (one of which we can reclaim later).
+ */
+#define BOOT_PCB	0x20000000
+#define BOOT_ADDR	0x20000000
+/* Remove when official MILO sources have ELF support: */
+#define BOOT_SIZE	(16*1024)
+
+#ifdef CONFIG_ALPHA_LEGACY_START_ADDRESS
+#define KERNEL_START_PHYS	0x300000 /* Old bootloaders hardcoded this.  */
+#else
+#define KERNEL_START_PHYS	0x1000000 /* required: Wildfire/Titan/Marvel */
+#endif
+
+#define KERNEL_START	(PAGE_OFFSET+KERNEL_START_PHYS)
+#define SWAPPER_PGD	KERNEL_START
+#define INIT_STACK	(PAGE_OFFSET+KERNEL_START_PHYS+0x02000)
+#define EMPTY_PGT	(PAGE_OFFSET+KERNEL_START_PHYS+0x04000)
+#define EMPTY_PGE	(PAGE_OFFSET+KERNEL_START_PHYS+0x08000)
+#define ZERO_PGE	(PAGE_OFFSET+KERNEL_START_PHYS+0x0A000)
+
+#define START_ADDR	(PAGE_OFFSET+KERNEL_START_PHYS+0x10000)
+
+/*
+ * This is setup by the secondary bootstrap loader.  Because
+ * the zero page is zeroed out as soon as the vm system is
+ * initialized, we need to copy things out into a more permanent
+ * place.
+ */
+#define PARAM			ZERO_PGE
+#define COMMAND_LINE		((char *)(PARAM + 0x0000))
+#define INITRD_START		(*(unsigned long *) (PARAM+0x100))
+#define INITRD_SIZE		(*(unsigned long *) (PARAM+0x108))
+
+#endif
diff --git a/arch/alpha/include/uapi/asm/setup.h b/arch/alpha/include/uapi/asm/setup.h
index 13b7ee465b0e..f881ea5947cb 100644
--- a/arch/alpha/include/uapi/asm/setup.h
+++ b/arch/alpha/include/uapi/asm/setup.h
@@ -1,43 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef __ALPHA_SETUP_H
-#define __ALPHA_SETUP_H
+#ifndef _UAPI__ALPHA_SETUP_H
+#define _UAPI__ALPHA_SETUP_H
 
 #define COMMAND_LINE_SIZE	256
 
-/*
- * We leave one page for the initial stack page, and one page for
- * the initial process structure. Also, the console eats 3 MB for
- * the initial bootloader (one of which we can reclaim later).
- */
-#define BOOT_PCB	0x20000000
-#define BOOT_ADDR	0x20000000
-/* Remove when official MILO sources have ELF support: */
-#define BOOT_SIZE	(16*1024)
-
-#ifdef CONFIG_ALPHA_LEGACY_START_ADDRESS
-#define KERNEL_START_PHYS	0x300000 /* Old bootloaders hardcoded this.  */
-#else
-#define KERNEL_START_PHYS	0x1000000 /* required: Wildfire/Titan/Marvel */
-#endif
-
-#define KERNEL_START	(PAGE_OFFSET+KERNEL_START_PHYS)
-#define SWAPPER_PGD	KERNEL_START
-#define INIT_STACK	(PAGE_OFFSET+KERNEL_START_PHYS+0x02000)
-#define EMPTY_PGT	(PAGE_OFFSET+KERNEL_START_PHYS+0x04000)
-#define EMPTY_PGE	(PAGE_OFFSET+KERNEL_START_PHYS+0x08000)
-#define ZERO_PGE	(PAGE_OFFSET+KERNEL_START_PHYS+0x0A000)
-
-#define START_ADDR	(PAGE_OFFSET+KERNEL_START_PHYS+0x10000)
-
-/*
- * This is setup by the secondary bootstrap loader.  Because
- * the zero page is zeroed out as soon as the vm system is
- * initialized, we need to copy things out into a more permanent
- * place.
- */
-#define PARAM			ZERO_PGE
-#define COMMAND_LINE		((char*)(PARAM + 0x0000))
-#define INITRD_START		(*(unsigned long *) (PARAM+0x100))
-#define INITRD_SIZE		(*(unsigned long *) (PARAM+0x108))
-
-#endif
+#endif /* _UAPI__ALPHA_SETUP_H */
-- 
2.33.0

