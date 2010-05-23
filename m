From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 017/199] arch/alpha/boot/bootpz.c: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:04 +0200
Message-ID: <1274644466-24577-2-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=O8jXVHmv0uPeDfMYFLmAQT20tqJd+caQQGiMfWsq2iQ=;
        b=r8hgUQ/YEaJ5KCIu1W6/KrSqHHHDw6zwOVgvjVFwtbnQydgyuyPcDLria4ZfkeQwJP
         aNQgKq5F1jsd6qehz6Q3YyR59b70mcY/u40MYJARPmcNHRdBrpCpnncqO3iH6rx+VoDW
         Oc3ZAbQzBm0H0FXqqlk9XlKKCEl2beLHkeSTM=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Tejun Heo <tj@kernel.org>, Michal Marek <mmarek@suse.cz>, Christoph Lameter <cl@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, linux-alpha@vger.kernel.org

arch/alpha/boot/bootpz.c:45: ERROR: "foo * bar" should be "foo *bar"
arch/alpha/boot/bootpz.c:48: ERROR: "foo* bar" should be "foo *bar"
arch/alpha/boot/bootpz.c:73: ERROR: trailing whitespace
arch/alpha/boot/bootpz.c:86: ERROR: that open brace { should be on the previous line
arch/alpha/boot/bootpz.c:89: ERROR: that open brace { should be on the previous line
arch/alpha/boot/bootpz.c:119: ERROR: "foo * bar" should be "foo *bar"
arch/alpha/boot/bootpz.c:120: ERROR: "foo * bar" should be "foo *bar"
arch/alpha/boot/bootpz.c:202: ERROR: trailing whitespace
arch/alpha/boot/bootpz.c:209: ERROR: trailing whitespace
arch/alpha/boot/bootpz.c:232: WARNING: please, no space before tabs
arch/alpha/boot/bootpz.c:299: ERROR: code indent should use tabs where possible
arch/alpha/boot/bootpz.c:313: WARNING: braces {} are not necessary for single statement blocks
arch/alpha/boot/bootpz.c:348: ERROR: that open brace { should be on the previous line
arch/alpha/boot/bootpz.c:361: ERROR: that open brace { should be on the previous line
arch/alpha/boot/bootpz.c:377: ERROR: that open brace { should be on the previous line
arch/alpha/boot/bootpz.c:381: CHECK: if this code is redundant consider removing it
arch/alpha/boot/bootpz.c:403: ERROR: code indent should use tabs where possible
arch/alpha/boot/bootpz.c:446: ERROR: trailing whitespace
arch/alpha/boot/bootpz.c:451: ERROR: "(foo*)" should be "(foo *)"
arch/alpha/boot/bootpz.c:452: ERROR: "(foo*)" should be "(foo *)"
---
 arch/alpha/boot/bootpz.c |   54 +++++++++++++++++++++------------------------
 1 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index ade3f12..da33a73 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -42,10 +42,10 @@
 #undef DEBUG_LAST_STEPS
 
 extern unsigned long switch_to_osf_pal(unsigned long nr,
-	struct pcb_struct * pcb_va, struct pcb_struct * pcb_pa,
+	struct pcb_struct *pcb_va, struct pcb_struct *pcb_pa,
 	unsigned long *vptb);
 
-extern int decompress_kernel(void* destination, void *source,
+extern int decompress_kernel(void *destination, void *source,
 			     size_t ksize, size_t kzsize);
 
 extern void move_stack(unsigned long new_stack);
@@ -70,7 +70,7 @@ find_pa(unsigned long address)
 	result <<= 13;
 	result |= address & 0x1fff;
 	return result;
-}	
+}
 
 int
 check_range(unsigned long vstart, unsigned long vend,
@@ -116,8 +116,8 @@ void
 pal_init(void)
 {
 	unsigned long i, rev;
-	struct percpu_struct * percpu;
-	struct pcb_struct * pcb_pa;
+	struct percpu_struct *percpu;
+	struct pcb_struct *pcb_pa;
 
 	/* Create the dummy PCB.  */
 	pcb_va->ksp = 0;
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
@@ -215,21 +215,21 @@ extern char _end;
    Oh, and do NOT forget the STACK, which appears to be placed virtually
    beyond the end of the loaded image.
 */
-#define V_BOOT_IMAGE_START	BOOT_ADDR
-#define V_BOOT_IMAGE_END	SP_on_entry
+#define V_BOOT_IMAGE_START		BOOT_ADDR
+#define V_BOOT_IMAGE_END		SP_on_entry
 
 /* Virtual addresses for just the bootstrapper part of the BOOTP image. */
 #define V_BOOTSTRAPPER_START	BOOT_ADDR
-#define V_BOOTSTRAPPER_END	KERNEL_ORIGIN
+#define V_BOOTSTRAPPER_END		KERNEL_ORIGIN
 
 /* Virtual addresses for just the data part of the BOOTP
    image. This may also include the INITRD image, but always
    includes the STACK.
 */
-#define V_DATA_START		KERNEL_ORIGIN
-#define V_INITRD_START		(KERNEL_ORIGIN + KERNEL_Z_SIZE)
-#define V_INTRD_END		(V_INITRD_START + REAL_INITRD_SIZE)
-#define V_DATA_END	 	V_BOOT_IMAGE_END
+#define V_DATA_START			KERNEL_ORIGIN
+#define V_INITRD_START			(KERNEL_ORIGIN + KERNEL_Z_SIZE)
+#define V_INTRD_END				(V_INITRD_START + REAL_INITRD_SIZE)
+#define V_DATA_END				V_BOOT_IMAGE_END
 
 /* KSEG addresses for the uncompressed kernel.
 
@@ -237,9 +237,9 @@ extern char _end;
    Note also that the DATA_START address is ZERO_PGE, to which we write
    just before jumping to the kernel image at START_ADDR.
  */
-#define K_KERNEL_DATA_START	ZERO_PGE
+#define K_KERNEL_DATA_START		ZERO_PGE
 #define K_KERNEL_IMAGE_START	START_ADDR
-#define K_KERNEL_IMAGE_END	(START_ADDR + KERNEL_SIZE)
+#define K_KERNEL_IMAGE_END		(START_ADDR + KERNEL_SIZE)
 
 /* Define to where we may have to decompress the kernel image, before
    we move it to the final position, in case of overlap. This will be
@@ -296,7 +296,7 @@ start_kernel(void)
 	/* Validity check the HWRPB. */
 	if (INIT_HWRPB->pagesize != 8192) {
 		srm_printk("Expected 8kB pages, got %ldkB\n",
-		           INIT_HWRPB->pagesize >> 10);
+					INIT_HWRPB->pagesize >> 10);
 		return;
 	}
 	if (INIT_HWRPB->vptb != (unsigned long) VPTB) {
@@ -310,9 +310,8 @@ start_kernel(void)
 
 	/* Get the parameter list from the console environment variable. */
 	nbytes = callback_getenv(ENV_BOOTED_OSFLAGS, envval, sizeof(envval));
-	if (nbytes < 0 || nbytes >= sizeof(envval)) {
+	if (nbytes < 0 || nbytes >= sizeof(envval))
 		nbytes = 0;
-	}
 	envval[nbytes] = '\0';
 
 #ifdef DEBUG_ADDRESSES
@@ -346,8 +345,7 @@ start_kernel(void)
 	   in conflict.
 	 */
 	if (check_range(V_BOOTSTRAPPER_START, V_BOOTSTRAPPER_END,
-			K_KERNEL_DATA_START, K_KERNEL_IMAGE_END))
-	{
+			K_KERNEL_DATA_START, K_KERNEL_IMAGE_END)) {
 		srm_printk("FATAL ERROR: overlap of bootstrapper code\n");
 		__halt();
 	}
@@ -359,8 +357,7 @@ start_kernel(void)
 	   execution.
 	 */
 	if (check_range(V_DATA_START, V_DATA_END,
-			K_KERNEL_IMAGE_START, K_COPY_IMAGE_END))
-	{
+			K_KERNEL_IMAGE_START, K_COPY_IMAGE_END)) {
 #ifdef DEBUG_ADDRESSES
 		srm_printk("OVERLAP: cannot decompress in place\n");
 #endif
@@ -376,8 +373,7 @@ start_kernel(void)
 		*/
 		while (check_range(V_DATA_START, V_DATA_END,
 				   uncompressed_image_start,
-				   uncompressed_image_end))
-		{
+				   uncompressed_image_end)) {
 #if 0
 			uncompressed_image_start += K_COPY_IMAGE_SIZE;
 			uncompressed_image_end += K_COPY_IMAGE_SIZE;
@@ -400,7 +396,7 @@ start_kernel(void)
 		   uncompressed_image_start,
 		   KERNEL_SIZE);
 #endif
-        decompress_kernel((void *)uncompressed_image_start,
+	decompress_kernel((void *)uncompressed_image_start,
 			  (void *)V_DATA_START,
 			  KERNEL_SIZE, KERNEL_Z_SIZE);
 
@@ -443,13 +439,13 @@ start_kernel(void)
 		memcpy((void *)K_KERNEL_IMAGE_START,
 		       (void *)uncompressed_image_start, KERNEL_SIZE);
 	}
-	
+
 	/* Clear the zero page, then move the argument list in. */
 #ifdef DEBUG_LAST_STEPS
 	srm_printk("Preparing ZERO_PGE...\n");
 #endif
-	memset((char*)ZERO_PGE, 0, PAGE_SIZE);
-	strcpy((char*)ZERO_PGE, envval);
+	memset((char *)ZERO_PGE, 0, PAGE_SIZE);
+	strcpy((char *)ZERO_PGE, envval);
 
 #ifdef INITRD_IMAGE_SIZE
 
-- 
1.7.1.251.gf80a2

