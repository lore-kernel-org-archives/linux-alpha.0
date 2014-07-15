From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 4/6] alpha: Remove bracket errors in bootpz.c
Date: Tue, 15 Jul 2014 14:18:22 -0400
Message-ID: <1405448304-3724-4-git-send-email-xerofoify@gmail.com>
References: <1405448304-3724-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JB2P/t3RYGpG8d/Jbf0V9DcneaZvCSJtiM+t6PaBEb0=;
        b=SdDvU+KBMIi6CZHUgstvaJnPSSH4dtaT6iSGZE1ASygpSmT7viJbODWGE1sbe9Cvmo
         zdTafE3ATl4wJcpEHS82KWGft3Bn3YlNDwqcdjxCyQI9RDpzhsqHtx8RnStMjNgWhySr
         hlLBDqJYuj3CKhQ6johnVHZfCNmKTxcoDJ27Y94KUQPL+qS+Hqmi4cIPdA0ZydmErRa7
         j8owzpGabnSbqkw9sMQnV4AK3nd1N4Igl557EHOcgMLJrDJ9EIBnecRM3TumEObHpDE7
         /C8BzXrLM9fF6uPNBvBoQ65Wjb30Q3iSeS8c57z+7htycqRbf/LjC3CWdHSgJazjCadS
         eWeA==
In-Reply-To: <1405448304-3724-1-git-send-email-xerofoify@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This patch removes all errors related to brackets not being placed
correctly in this file as declared when running checkpatch on it.
---
 arch/alpha/boot/bootpz.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index 0b5c978..6dd34e4 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -83,11 +83,9 @@ check_range(unsigned long vstart, unsigned long vend,
 		   vstart, vend, kstart, kend);
 #endif
 	/* do some range checking for detecting an overlap... */
-	for (vaddr = vstart; vaddr <= vend; vaddr += PAGE_SIZE)
-	{
+	for (vaddr = vstart; vaddr <= vend; vaddr += PAGE_SIZE) {
 		kaddr = (find_pa(vaddr) | PAGE_OFFSET);
-		if (kaddr >= kstart && kaddr <= kend)
-		{
+		if (kaddr >= kstart && kaddr <= kend) {
 #ifdef DEBUG_CHECK_RANGE
 			srm_printk("OVERLAP: vaddr 0x%lx kaddr 0x%lx"
 				   " [0x%lx:0x%lx]\n",
@@ -310,9 +308,8 @@ start_kernel(void)
 
 	/* Get the parameter list from the console environment variable. */
 	nbytes = callback_getenv(ENV_BOOTED_OSFLAGS, envval, sizeof(envval));
-	if (nbytes < 0 || nbytes >= sizeof(envval)) {
+	if (nbytes < 0 || nbytes >= sizeof(envval))
 		nbytes = 0;
-	}
 	envval[nbytes] = '\0';
 
 #ifdef DEBUG_ADDRESSES
@@ -346,8 +343,7 @@ start_kernel(void)
 	   in conflict.
 	 */
 	if (check_range(V_BOOTSTRAPPER_START, V_BOOTSTRAPPER_END,
-			K_KERNEL_DATA_START, K_KERNEL_IMAGE_END))
-	{
+			K_KERNEL_DATA_START, K_KERNEL_IMAGE_END)) {
 		srm_printk("FATAL ERROR: overlap of bootstrapper code\n");
 		__halt();
 	}
@@ -359,8 +355,7 @@ start_kernel(void)
 	   execution.
 	 */
 	if (check_range(V_DATA_START, V_DATA_END,
-			K_KERNEL_IMAGE_START, K_COPY_IMAGE_END))
-	{
+			K_KERNEL_IMAGE_START, K_COPY_IMAGE_END)) {
 #ifdef DEBUG_ADDRESSES
 		srm_printk("OVERLAP: cannot decompress in place\n");
 #endif
@@ -376,8 +371,7 @@ start_kernel(void)
 		*/
 		while (check_range(V_DATA_START, V_DATA_END,
 				   uncompressed_image_start,
-				   uncompressed_image_end))
-		{
+				   uncompressed_image_end)) {
 #if 0
 			uncompressed_image_start += K_COPY_IMAGE_SIZE;
 			uncompressed_image_end += K_COPY_IMAGE_SIZE;
-- 
1.9.1
