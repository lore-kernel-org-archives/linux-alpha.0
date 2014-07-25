From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 1/2] alpha: Wire up sched_setattr, sched_getattr, and renameat2 syscalls.
Date: Thu, 24 Jul 2014 17:53:53 -0700
Message-ID: <1406249634-27136-1-git-send-email-mattst88@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=HSnnA5cg+eaigL6nl8bzd6cQy63fu3FSoIOf3pVGzRo=;
        b=beSKGhxwPtLQORbdcWU30Bsj1rudmWGfcf/ps2OAYWy9LVqYNxz4R4pM4YNXUbHjKl
         7/PE5Bne+xeRhd19vTnx2+KayaESSpEFiwsErvif6Dkr6DgzL99iGNTgML55Dm883ZJH
         ThGC/hY6kBoAiuc5cmzwjA9e6R/79LQ6CPzarqX9PcVRhG+Qp65JKlWg7py+/+st3bQ2
         SI1Lp6FG52Xte1mZUG3eUaRYq7SAmDFlyQTctIOJttb1Pycf/9+92L3RvGSy+RL8IBHb
         vtqNCirSJv+hoFPgrQSECb7CalLJnDtQIWUKHY94LJRycW4t6liVs7EgRHmL6ioVORLP
         EFZg==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Cree <mcree@orcon.net.nz>, Matt Turner <mattst88@gmail.com>

From: Michael Cree <mcree@orcon.net.nz>

Signed-off-by: Michael Cree <mcree@orcon.net.nz>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/unistd.h      | 2 +-
 arch/alpha/include/uapi/asm/unistd.h | 3 +++
 arch/alpha/kernel/systbls.S          | 3 +++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/unistd.h b/arch/alpha/include/asm/unistd.h
index f2c9440..c509d30 100644
--- a/arch/alpha/include/asm/unistd.h
+++ b/arch/alpha/include/asm/unistd.h
@@ -3,7 +3,7 @@
 
 #include <uapi/asm/unistd.h>
 
-#define NR_SYSCALLS			508
+#define NR_SYSCALLS			511
 
 #define __ARCH_WANT_OLD_READDIR
 #define __ARCH_WANT_STAT64
diff --git a/arch/alpha/include/uapi/asm/unistd.h b/arch/alpha/include/uapi/asm/unistd.h
index 53ae7bb..d214a035 100644
--- a/arch/alpha/include/uapi/asm/unistd.h
+++ b/arch/alpha/include/uapi/asm/unistd.h
@@ -469,5 +469,8 @@
 #define __NR_process_vm_writev		505
 #define __NR_kcmp			506
 #define __NR_finit_module		507
+#define __NR_sched_setattr		508
+#define __NR_sched_getattr		509
+#define __NR_renameat2			510
 
 #endif /* _UAPI_ALPHA_UNISTD_H */
diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
index dca9b3f..2478971 100644
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@ -526,6 +526,9 @@ sys_call_table:
 	.quad sys_process_vm_writev		/* 505 */
 	.quad sys_kcmp
 	.quad sys_finit_module
+	.quad sys_sched_setattr
+	.quad sys_sched_getattr
+	.quad sys_renameat2			/* 510 */
 
 	.size sys_call_table, . - sys_call_table
 	.type sys_call_table, @object
-- 
1.8.5.5

