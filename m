From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 4/5] alpha: Fix complex marco definitions
Date: Tue, 15 Jul 2014 15:18:09 -0400
Message-ID: <1405451890-6057-4-git-send-email-xerofoify@gmail.com>
References: <1405451890-6057-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j1/E/PEik8+MiiNwOvB86kDSiGY7Jqx6ypF8t+7YXVg=;
        b=XF14hFDvyPu0CHnrqEq6ry7J5m6tHL6ZJTKrwuJgR7NuVI7r7auRVVc2ICF4IBGqZa
         2iw93DLe6UaNphM5f+WB7mUjRyE6q+n0CLpUnsuB79iYjS8ar6wTfUJkLVDloGFzTl+S
         9JBnimjbdF8SlS0ouNMNAQe+NacBZTps9Ee9Bu3IRomrO4QyFWjSy/+poL2SGU1unh/7
         s67GYq9eZH9QAU23axVtJYlneLhQATMaNN/UDMEE0UN/MFAnkPS7ZciCIL3Gf2ZvwPMN
         5eFtS78/pZ2/q7DkmoNdiW6tervlqmX0IGk4GFi9TO3j+WbApCsL4UCyDjZZpQ46kU4l
         URQQ==
In-Reply-To: <1405451890-6057-1-git-send-email-xerofoify@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This patch fixes all macro defintions that need parthesises as stated
by checkpatch when run against this file.
---
 arch/alpha/boot/misc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/boot/misc.c b/arch/alpha/boot/misc.c
index 174b7c6..886e469 100644
--- a/arch/alpha/boot/misc.c
+++ b/arch/alpha/boot/misc.c
@@ -23,7 +23,7 @@
 
 #include <asm/uaccess.h>
 
-#define memzero (s, n)	memset((s), 0 , (n))
+#define memzero { (s, n)	memset((s), 0 , (n)) }
 #define puts		srm_printk
 extern long srm_printk(const char *, ...)
 	__attribute__ ((format (printf, 1, 2)));
@@ -61,8 +61,8 @@ static unsigned outcnt;		/* bytes in output buffer */
 
 /* Diagnostic functions */
 #ifdef DEBUG
-#  define Assert (cond, msg) {if (!(cond)) error(msg) ; }
-#  define Trace(x) fprintf x
+#  define Assert { (cond, msg) {if (!(cond)) error(msg) ; } }
+#  define Trace { (x) fprintf x }
 #  define Tracev(x) {if (verbose) fprintf x ; }
 #  define Tracevv(x) {if (verbose > 1) fprintf x ; }
 #  define Tracec(c, x) {if (verbose && (c)) fprintf x ; }
-- 
1.9.1
