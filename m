From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 2/5] alpha: Fix spacing in misc.c
Date: Tue, 15 Jul 2014 15:18:07 -0400
Message-ID: <1405451890-6057-2-git-send-email-xerofoify@gmail.com>
References: <1405451890-6057-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=m4G2drf1oCrFxWlgKee5QbICw2Z43D02yPQpjjVfu4w=;
        b=iNaDHLiFGLbBdeg1xa1Wd3x/Go62JnJaFi6gbGVEIl4ziYgmtjP/4wxXzl14cBQhBw
         V3jKfzZSgF3OJ9XZsQfu74EOgYuNxqeQ/V4TBS2967AQVQ4H4ZOj0T69v0UCq2PHOAQ+
         1Qg4qcvbGiuaw/mp/wNkLoKMKjHMm+to1bKMIHnQpWc23SmR2pcjdCpCgORtOg+qaJTu
         7d9YEMPl3cuis2LEuFTA1pNyXgCCMPiYtnanB4k7Cm8laGAo0zAowAbB0Ei/V76LoRqV
         ThVfWZsjikVeljH9lChTTPD7vOXUJcmHibuLMLBLWdMTAPl/3/LwMFlagK5HvNENmI2f
         wDbg==
In-Reply-To: <1405451890-6057-1-git-send-email-xerofoify@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Due to errors with checkpatch in this file I am checking certain defintions
spacing to pass checkpatch for spacing issues.
---
 arch/alpha/boot/misc.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/alpha/boot/misc.c b/arch/alpha/boot/misc.c
index 3f86c3e..119d500 100644
--- a/arch/alpha/boot/misc.c
+++ b/arch/alpha/boot/misc.c
@@ -23,10 +23,10 @@
 
 #include <asm/uaccess.h>
 
-#define memzero(s,n)	memset ((s),0,(n))
+#define memzero (s, n)	memset((s), 0 , (n))
 #define puts		srm_printk
 extern long srm_printk(const char *, ...)
-     __attribute__ ((format (printf, 1, 2)));
+	__attribute__ ((format (printf, 1, 2)));
 
 /*
  * gzip delarations
@@ -61,19 +61,19 @@ static unsigned outcnt;		/* bytes in output buffer */
 
 /* Diagnostic functions */
 #ifdef DEBUG
-#  define Assert(cond,msg) {if(!(cond)) error(msg);}
+#  define Assert (cond, msg) {if (!(cond)) error(msg) ; }
 #  define Trace(x) fprintf x
-#  define Tracev(x) {if (verbose) fprintf x ;}
-#  define Tracevv(x) {if (verbose>1) fprintf x ;}
-#  define Tracec(c,x) {if (verbose && (c)) fprintf x ;}
-#  define Tracecv(c,x) {if (verbose>1 && (c)) fprintf x ;}
+#  define Tracev(x) {if (verbose) fprintf x ; }
+#  define Tracevv(x) {if (verbose > 1) fprintf x ; }
+#  define Tracec(c, x) {if (verbose && (c)) fprintf x ; }
+#  define Tracecv(c, x) {if (verbose > 1 && (c)) fprintf x ; }
 #else
-#  define Assert(cond,msg)
+#  define Assert(cond, msg)
 #  define Trace(x)
 #  define Tracev(x)
 #  define Tracevv(x)
-#  define Tracec(c,x)
-#  define Tracecv(c,x)
+#  define Tracec(c, x)
+#  define Tracecv(c, x)
 #endif
 
 static int  fill_inbuf(void);
@@ -144,7 +144,8 @@ static void error(char *x)
 	puts(x);
 	puts("\n\n -- System halted");
 
-	while(1);	/* Halt */
+	while (1);	
+	/* Halt */
 }
 
 unsigned int
-- 
1.9.1
