From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 126/199] arch/alpha/lib/stacktrace.c: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:20 +0200
Message-ID: <1274644466-24577-18-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=LluWYSJRidR4IN6CNvlm5Ne99iddo8NdAbvkzZr7LBw=;
        b=FmfQSB7nMyX/TJgbdtowfNPqCW+kEPR6S8KSIsDF/lQADD80e3Vqu27Fugt8/Vc7fx
         Y2O5NfkD9TWw5rQ/jp/blvXeYQ792IoUkTb7MVAN7JQc1G9MHhAkxnG0aYbHF+/j2H/9
         TlIHSZYaUqx23U5SmsvXh1GjKDS1TG2wJs95M=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/lib/stacktrace.c:49: ERROR: "foo * bar" should be "foo *bar"
arch/alpha/lib/stacktrace.c:51: ERROR: "foo * bar" should be "foo *bar"
arch/alpha/lib/stacktrace.c:68: ERROR: "foo * bar" should be "foo *bar"
arch/alpha/lib/stacktrace.c:78: ERROR: "foo * bar" should be "foo *bar"
arch/alpha/lib/stacktrace.c:93: ERROR: "foo * bar" should be "foo *bar"
arch/alpha/lib/stacktrace.c:95: ERROR: "foo * bar" should be "foo *bar"

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/lib/stacktrace.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/alpha/lib/stacktrace.c b/arch/alpha/lib/stacktrace.c
index 6d432e4..3d3c632 100644
--- a/arch/alpha/lib/stacktrace.c
+++ b/arch/alpha/lib/stacktrace.c
@@ -46,9 +46,9 @@ static char reg_name[][4] = {
 
 
 static instr *
-display_stored_regs(instr * pro_pc, unsigned char * sp)
+display_stored_regs(instr *pro_pc, unsigned char *sp)
 {
-	instr * ret_pc = 0;
+	instr *ret_pc = 0;
 	int reg;
 	unsigned long value;
 
@@ -65,7 +65,7 @@ display_stored_regs(instr * pro_pc, unsigned char * sp)
 }
 
 static instr *
-seek_prologue(instr * pc)
+seek_prologue(instr *pc)
 {
 	while (!STK_ALLOC_MATCH(*pc))
 		--pc;
@@ -75,7 +75,7 @@ seek_prologue(instr * pc)
 }
 
 static long
-stack_increment(instr * prologue_pc)
+stack_increment(instr *prologue_pc)
 {
 	while (!STK_ALLOC_MATCH(*prologue_pc))
 		++prologue_pc;
@@ -90,9 +90,9 @@ stack_increment(instr * prologue_pc)
 void
 stacktrace(void)
 {
-	instr * ret_pc;
-	instr * prologue = (instr *)stacktrace;
-	register unsigned char * sp __asm__ ("$30");
+	instr *ret_pc;
+	instr *prologue = (instr *)stacktrace;
+	register unsigned char *sp __asm__ ("$30");
 
 	printk("\tstack trace:\n");
 	do {
-- 
1.7.1.251.gf80a2

