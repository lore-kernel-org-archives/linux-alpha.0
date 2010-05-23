From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 016/199] arch/alpha/boot/bootp.c: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:03 +0200
Message-ID: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer;
        bh=CmeMoCnSKx+WEezUE67RCImEhkOiKYpFJsLQQCwvplo=;
        b=Y2ah7V+92/pMckJbl5Ib5M7rCRlBclIXnqsNA0tbOLbS41Yl+yvgh9/GKerRFOZYRD
         iX48K5xuSVTZWhhvDl3nE2cfyv98oFxyjkpnGoVrUaXv8HNltgdC8ipN4l+EjeXFnTy5
         Ci3rYMzlKJ78ZssJWNeS8aSCZxi2TTNrh8A1k=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Tejun Heo <tj@kernel.org>, Michal Marek <mmarek@suse.cz>, Christoph Lameter <cl@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, linux-alpha@vger.kernel.org

arch/alpha/boot/bootp.c:25: WARNING: externs should be avoided in .c files
arch/alpha/boot/bootp.c:26: ERROR: "foo * bar" should be "foo *bar"
arch/alpha/boot/bootp.c:29: WARNING: externs should be avoided in .c files
arch/alpha/boot/bootp.c:51: ERROR: trailing whitespace
arch/alpha/boot/bootp.c:71: ERROR: "foo * bar" should be "foo *bar"
arch/alpha/boot/bootp.c:72: ERROR: "foo * bar" should be "foo *bar"
arch/alpha/boot/bootp.c:103: CHECK: multiple assignments should be avoided
arch/alpha/boot/bootp.c:129: WARNING: externs should be avoided in .c files
arch/alpha/boot/bootp.c:155: ERROR: code indent should use tabs where possible
arch/alpha/boot/bootp.c:165: ERROR: trailing whitespace
arch/alpha/boot/bootp.c:180: WARNING: braces {} are not necessary for single statement blocks
arch/alpha/boot/bootp.c:203: ERROR: code indent should use tabs where possible
arch/alpha/boot/bootp.c:204: ERROR: code indent should use tabs where possible
arch/alpha/boot/bootp.c:206: ERROR: "(foo*)" should be "(foo *)"
arch/alpha/boot/bootp.c:207: ERROR: "(foo*)" should be "(foo *)"

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/boot/bootp.c |   23 +++++++++++------------
 1 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/alpha/boot/bootp.c b/arch/alpha/boot/bootp.c
index 3c8d1b2..a85041a 100644
--- a/arch/alpha/boot/bootp.c
+++ b/arch/alpha/boot/bootp.c
@@ -23,7 +23,7 @@
 #include "ksize.h"
 
 extern unsigned long switch_to_osf_pal(unsigned long nr,
-	struct pcb_struct * pcb_va, struct pcb_struct * pcb_pa,
+	struct pcb_struct *pcb_va, struct pcb_struct *pcb_pa,
 	unsigned long *vptb);
 
 extern void move_stack(unsigned long new_stack);
@@ -48,7 +48,7 @@ find_pa(unsigned long *vptb, void *ptr)
 	result <<= 13;
 	result |= address & 0x1fff;
 	return (void *) result;
-}	
+}
 
 /*
  * This function moves into OSF/1 pal-code, and has a temporary
@@ -68,8 +68,8 @@ void
 pal_init(void)
 {
 	unsigned long i, rev;
-	struct percpu_struct * percpu;
-	struct pcb_struct * pcb_pa;
+	struct percpu_struct *percpu;
+	struct pcb_struct *pcb_pa;
 
 	/* Create the dummy PCB.  */
 	pcb_va->ksp = 0;
@@ -152,7 +152,7 @@ start_kernel(void)
 	srm_printk("Linux/AXP bootp loader for Linux " UTS_RELEASE "\n");
 	if (INIT_HWRPB->pagesize != 8192) {
 		srm_printk("Expected 8kB pages, got %ldkB\n",
-		           INIT_HWRPB->pagesize >> 10);
+					INIT_HWRPB->pagesize >> 10);
 		return;
 	}
 	if (INIT_HWRPB->vptb != (unsigned long) VPTB) {
@@ -162,7 +162,7 @@ start_kernel(void)
 	}
 	pal_init();
 
-	/* The initrd must be page-aligned.  See below for the 
+	/* The initrd must be page-aligned.  See below for the
 	   cause of the magic number 5.  */
 	initrd_start = ((START_ADDR + 5*KERNEL_SIZE + PAGE_SIZE) |
 			(PAGE_SIZE-1)) + 1;
@@ -177,9 +177,8 @@ start_kernel(void)
 	move_stack(initrd_start - PAGE_SIZE);
 
 	nbytes = callback_getenv(ENV_BOOTED_OSFLAGS, envval, sizeof(envval));
-	if (nbytes < 0 || nbytes >= sizeof(envval)) {
+	if (nbytes < 0 || nbytes >= sizeof(envval))
 		nbytes = 0;
-	}
 	envval[nbytes] = '\0';
 	srm_printk("Loading the kernel...'%s'\n", envval);
 
@@ -200,11 +199,11 @@ start_kernel(void)
 #ifdef INITRD_IMAGE_SIZE
 	load(initrd_start, KERNEL_ORIGIN+KERNEL_SIZE, INITRD_IMAGE_SIZE);
 #endif
-        load(START_ADDR+(4*KERNEL_SIZE), KERNEL_ORIGIN, KERNEL_SIZE);
-        load(START_ADDR, START_ADDR+(4*KERNEL_SIZE), KERNEL_SIZE);
+	load(START_ADDR+(4*KERNEL_SIZE), KERNEL_ORIGIN, KERNEL_SIZE);
+	load(START_ADDR, START_ADDR+(4*KERNEL_SIZE), KERNEL_SIZE);
 
-	memset((char*)ZERO_PGE, 0, PAGE_SIZE);
-	strcpy((char*)ZERO_PGE, envval);
+	memset((char *)ZERO_PGE, 0, PAGE_SIZE);
+	strcpy((char *)ZERO_PGE, envval);
 #ifdef INITRD_IMAGE_SIZE
 	((long *)(ZERO_PGE+256))[0] = initrd_start;
 	((long *)(ZERO_PGE+256))[1] = INITRD_IMAGE_SIZE;
-- 
1.7.1.251.gf80a2

