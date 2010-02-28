From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH] alpha: use __ratelimit
Date: Sun, 28 Feb 2010 19:58:13 +0900
Message-ID: <1267354697-6456-1-git-send-email-akinobu.mita@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=yGuf6Qxxsxdgs97oGcKsKl5C+KgZVR+ypKo5qyBSA/w=;
        b=Xfs9Lc/nlkG55FlZGS41SbWPEpkdmKxhUVn7BE6L6G9Ni+DBGZYgWnX4XZ0/R/kb5H
         +sDjeZDI8YToIj0QzPTxQdA1wl5kbwD2pd44T0FiTd65L0q52UW9iQZHJda5E6uTjh3E
         pDfa8RLr13T+YefcEXbngmJHc2DzeF8kZf9hA=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

Replace open-coded rate limiting logic with __ratelimit().

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
---
 arch/alpha/kernel/traps.c |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
index 6ee7655..b14f015 100644
--- a/arch/alpha/kernel/traps.c
+++ b/arch/alpha/kernel/traps.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/kallsyms.h>
+#include <linux/ratelimit.h>
 
 #include <asm/gentrap.h>
 #include <asm/uaccess.h>
@@ -771,8 +772,7 @@ asmlinkage void
 do_entUnaUser(void __user * va, unsigned long opcode,
 	      unsigned long reg, struct pt_regs *regs)
 {
-	static int cnt = 0;
-	static unsigned long last_time;
+	static DEFINE_RATELIMIT_STATE(ratelimit, 5 * HZ, 5);
 
 	unsigned long tmp1, tmp2, tmp3, tmp4;
 	unsigned long fake_reg, *reg_addr = &fake_reg;
@@ -783,15 +783,11 @@ do_entUnaUser(void __user * va, unsigned long opcode,
 	   with the unaliged access.  */
 
 	if (!test_thread_flag (TIF_UAC_NOPRINT)) {
-		if (cnt >= 5 && time_after(jiffies, last_time + 5 * HZ)) {
-			cnt = 0;
-		}
-		if (++cnt < 5) {
+		if (__ratelimit(&ratelimit)) {
 			printk("%s(%d): unaligned trap at %016lx: %p %lx %ld\n",
 			       current->comm, task_pid_nr(current),
 			       regs->pc - 4, va, opcode, reg);
 		}
-		last_time = jiffies;
 	}
 	if (test_thread_flag (TIF_UAC_SIGBUS))
 		goto give_sigbus;
-- 
1.6.0.6

