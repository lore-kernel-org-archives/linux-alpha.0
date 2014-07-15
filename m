From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 2/6] alpha: Fix spaces to tabs
Date: Tue, 15 Jul 2014 14:18:20 -0400
Message-ID: <1405448304-3724-2-git-send-email-xerofoify@gmail.com>
References: <1405448304-3724-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vCeHwlueJQYrbqfPfbZ80p6o4UzCmlIyyc1Lh/g0VG8=;
        b=UKZAzcDQTE9opDg5uS0NBcoCRsD79p6BnycLuO3G8HaaMZJ+MuPJJRUPEnT6O1km/G
         waInoHscxjacvG4d10qsb5XCBbhRaycDGzfW+W3Q+73+kNScYSMjRmpNjdqTNtjk8NKe
         udfG0Q+/nlWvLmjlHqGkoyVmphv6KrCE94oAO18CVHtPiWCHbplpkkb2df9JAfoez7d2
         m0RJwm0bi67cUYhEqvR/uJyAoq6/dcWTn7KsFp1O+NKB68P9tVYJNaZX7AeJhGx1Rb6Y
         RIN7A0DoUk0wE5kCovEAF5sFodIspDSE3uW/SkdCtDmA6z2EvqBcX/lgv8sp/8qBI7Bq
         Z51A==
In-Reply-To: <1405448304-3724-1-git-send-email-xerofoify@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This patch fixes all errors for this file related to using spaces
instead of tabs.
---
 arch/alpha/boot/bootpz.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index 64a0da6..15c16fe 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -252,11 +252,11 @@ extern char _end;
 #define K_COPY_IMAGE_START	NEXT_PAGE(K_KERNEL_IMAGE_END)
 /* Reserve one page below INITRD for the new stack. */
 #define K_INITRD_START \
-    NEXT_PAGE(K_COPY_IMAGE_START + KERNEL_SIZE + PAGE_SIZE)
+	NEXT_PAGE(K_COPY_IMAGE_START + KERNEL_SIZE + PAGE_SIZE)
 #define K_COPY_IMAGE_END \
-    (K_INITRD_START + REAL_INITRD_SIZE + MALLOC_AREA_SIZE)
+	(K_INITRD_START + REAL_INITRD_SIZE + MALLOC_AREA_SIZE)
 #define K_COPY_IMAGE_SIZE \
-    NEXT_PAGE(K_COPY_IMAGE_END - K_COPY_IMAGE_START)
+	NEXT_PAGE(K_COPY_IMAGE_END - K_COPY_IMAGE_START)
 
 void
 start_kernel(void)
@@ -400,7 +400,7 @@ start_kernel(void)
 		   uncompressed_image_start,
 		   KERNEL_SIZE);
 #endif
-        decompress_kernel((void *)uncompressed_image_start,
+	decompress_kernel((void *)uncompressed_image_start,
 			  (void *)V_DATA_START,
 			  KERNEL_SIZE, KERNEL_Z_SIZE);
 
-- 
1.9.1
