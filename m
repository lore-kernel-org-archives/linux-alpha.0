From: Anshul <anshulusr@gmail.com>
Subject: [PATCH] fixed formatting issues
Date: Mon, 28 Aug 2023 12:48:25 +0530
Message-ID: <20230828071829.64366-1-anshulusr@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693207260; x=1693812060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yix1QIvYkCVrQqH7rnPkzsKqXcnw1nS6UvJEKq5/GR4=;
        b=aJYAzMMgyY65Hpr7rJ2lcMhc6IHd+uAt46IatMESb1+OBRo7t0vq6f5aYnaKulMPtQ
         QtkTPp7MoQdlWJ5UHq6E+v5qwO9A4238hvk1vi0jAqYiLEj0JUFHdtPODz+aBUSWtsv3
         8PrAH/d6RDzFF2BG4aOu70Jqt158DghCvyxt3eQrwX+F1PiQ1zubYpt7VB6r28XKYtzG
         QZp4ruiFMJMLa9KwBk7tKO8jCTkcLCsXunSFZsh6v+mwD7WNnpZNl7vLMBHBtY92glb/
         TsAQFh12+DU5hroXAF47nCSOVN2UouQEgeiq3Ccfz8do9AgQZcqlhVo5PL1+All5vgPB
         D/bw==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com
Cc: Anshul <anshulusr@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org

Fixed minor formatting issues as per `scripts/checkpatch.pl`

Six changes to the file and their severity are as follows:
* [WARNING] Removed unnecessary braces from single statement blocks
* [ERROR]   5 fixes are to pointer formatting
* [ERROR]   Removed a trailing whitespace

6 errors and 1 warning of the previously present 6 errors and 5
warnings have been fixed.

Signed-off-by: Anshul <anshulusr@gmail.com>
---
 arch/alpha/boot/main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/alpha/boot/main.c b/arch/alpha/boot/main.c
index 22a1cb026..f609c3a83 100644
--- a/arch/alpha/boot/main.c
+++ b/arch/alpha/boot/main.c
@@ -20,8 +20,9 @@
 #include "ksize.h"
 
 extern unsigned long switch_to_osf_pal(unsigned long nr,
-	struct pcb_struct * pcb_va, struct pcb_struct * pcb_pa,
-	unsigned long *vptb);
+				       struct pcb_struct *pcb_va,
+				       struct pcb_struct *pcb_pa,
+				       unsigned long *vptb);
 struct hwrpb_struct *hwrpb = INIT_HWRPB;
 static struct pcb_struct pcb_va[1];
 
@@ -42,7 +43,7 @@ find_pa(unsigned long *vptb, void *ptr)
 	result <<= 13;
 	result |= address & 0x1fff;
 	return (void *) result;
-}	
+}
 
 /*
  * This function moves into OSF/1 pal-code, and has a temporary
@@ -62,8 +63,8 @@ void
 pal_init(void)
 {
 	unsigned long i, rev;
-	struct percpu_struct * percpu;
-	struct pcb_struct * pcb_pa;
+	struct percpu_struct *percpu;
+	struct pcb_struct *pcb_pa;
 
 	/* Create the dummy PCB.  */
 	pcb_va->ksp = 0;
@@ -176,11 +177,10 @@ void start_kernel(void)
 	}
 
 	nbytes = callback_getenv(ENV_BOOTED_OSFLAGS, envval, sizeof(envval));
-	if (nbytes < 0) {
+	if (nbytes < 0)
 		nbytes = 0;
-	}
 	envval[nbytes] = '\0';
-	strcpy((char*)ZERO_PGE, envval);
+	strcpy((char *)ZERO_PGE, envval);
 
 	srm_printk(" Ok\nNow booting the kernel\n");
 	runkernel();
-- 
2.42.0

