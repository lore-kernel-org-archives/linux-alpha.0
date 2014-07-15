From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 1/6] alpha: Remove whiterrors related to uneeded characters and lines
Date: Tue, 15 Jul 2014 14:18:19 -0400
Message-ID: <1405448304-3724-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=z6AfKzsowuc8LSQaMasur9fcb6Px3jr5/cQATxyiAWc=;
        b=WyhOyR2gayGBSKz1h8dE8DvZwmhw3WJ3zpwbYemHz4n7zaCosSC9Xv200e0rahFYv9
         5D9n/3zZuB9zNwjRSWcNVpmsw94fUuxDH3IKQDFL9ZwOKFZuXGlkJLt8m5CQ+Tw30/Ds
         AhhqFyeB53QnlZswVJSXV8FpLBayimggdj0+NWzw/NIV1FxyGx1ugypRR2wlX55PF2s6
         xmShS2fhvxHugTo9ZIgVJZgKzzXD5v6UXczbWtTbT8EhgUveDJ2ZvSnYaS3Cg7sEA+6j
         ngavJB+VmacxcI0Xdhzd5oKTrxe+DfadCFZvi2psgCR7R3Xc3ldFh+jtbrJ8X0xIsynO
         i5Bw==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This file has multipe cleanpatch errors. This patch is the first in
a series to clean them up. This one removes uneeded characters and
lines from this file.
---
 arch/alpha/boot/bootpz.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index d6ad191..64a0da6 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -70,7 +70,7 @@ find_pa(unsigned long address)
 	result <<= 13;
 	result |= address & 0x1fff;
 	return result;
-}	
+}
 
 int
 check_range(unsigned long vstart, unsigned long vend,
@@ -199,14 +199,14 @@ extern char _end;
 
 	START_ADDR	KSEG address of the entry point of kernel code.
 
-	ZERO_PGE	KSEG address of page full of zeroes, but 
+	ZERO_PGE	KSEG address of page full of zeroes, but
 			upon entry to kerne cvan be expected
 			to hold the parameter list and possible
 			INTRD information.
 
    These are used in the local defines below.
 */
-  
+
 
 /* Virtual addresses for the BOOTP image. Note that this includes the
    bootstrapper code as well as the compressed kernel image, and
@@ -229,7 +229,7 @@ extern char _end;
 #define V_DATA_START		KERNEL_ORIGIN
 #define V_INITRD_START		(KERNEL_ORIGIN + KERNEL_Z_SIZE)
 #define V_INTRD_END		(V_INITRD_START + REAL_INITRD_SIZE)
-#define V_DATA_END	 	V_BOOT_IMAGE_END
+#define V_DATA_END		V_BOOT_IMAGE_END
 
 /* KSEG addresses for the uncompressed kernel.
 
@@ -296,7 +296,7 @@ start_kernel(void)
 	/* Validity check the HWRPB. */
 	if (INIT_HWRPB->pagesize != 8192) {
 		srm_printk("Expected 8kB pages, got %ldkB\n",
-		           INIT_HWRPB->pagesize >> 10);
+	INIT_HWRPB->pagesize >> 10);
 		return;
 	}
 	if (INIT_HWRPB->vptb != (unsigned long) VPTB) {
@@ -443,7 +443,7 @@ start_kernel(void)
 		memcpy((void *)K_KERNEL_IMAGE_START,
 		       (void *)uncompressed_image_start, KERNEL_SIZE);
 	}
-	
+
 	/* Clear the zero page, then move the argument list in. */
 #ifdef DEBUG_LAST_STEPS
 	srm_printk("Preparing ZERO_PGE...\n");
-- 
1.9.1

