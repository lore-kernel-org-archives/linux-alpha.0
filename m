From: Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH] alpha: Wire up sched_setattr, sched_getattr, and renameat2 syscalls.
Date: Fri,  2 May 2014 21:27:00 +1200
Message-ID: <1399022820-8096-1-git-send-email-mcree@orcon.net.nz>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, Michael Cree <mcree@orcon.net.nz>

Signed-off-by: Michael Cree <mcree@orcon.net.nz>
---
 arch/alpha/include/asm/unistd.h      | 2 +-
 arch/alpha/include/uapi/asm/unistd.h | 3 +++
 arch/alpha/kernel/systbls.S          | 3 +++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/unistd.h b/arch/alpha/include/asm/unistd.h
index f2c94402e2c8..c509d306db45 100644
--- a/arch/alpha/include/asm/unistd.h
+++ b/arch/alpha/include/asm/unistd.h
@@ -3,7 +3,7 @@
 
 #include <uapi/asm/unistd.h>
 
-#define NR_SYSCALLS			508
+#define NR_SYSCALLS			511
 
 #define __ARCH_WANT_OLD_READDIR
 #define __ARCH_WANT_STAT64
diff --git a/arch/alpha/include/uapi/asm/unistd.h b/arch/alpha/include/uapi/asm/unistd.h
index 53ae7bb1bfd1..d214a0358100 100644
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
index dca9b3fb0071..24789713f1ea 100644
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
2.0.0.rc0

