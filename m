From: Chen Gang <xili_gchen_5257@hotmail.com>
Subject: [PATCH v2] alpha: Wire up all implemented syscalls
Date: Mon, 18 May 2015 06:21:40 +0800
Message-ID: <BLU437-SMTP947C57B4E36F1AAE9E9BC0B9C50@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, mcree@orcon.net.nz, Dave Jones <davej@codemonkey.org.uk>
Cc: "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

And still left the unimplemented syscalls as warnings. The related
warnings for implemented syscalls are:

    CALL    scripts/checksyscalls.sh
  <stdin>:1241:2: warning: #warning syscall getrandom not implemented [-Wcpp]
  <stdin>:1244:2: warning: #warning syscall memfd_create not implemented [-Wcpp]
  <stdin>:1250:2: warning: #warning syscall execveat not implemented [-Wcpp]

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 arch/alpha/include/asm/unistd.h      | 2 +-
 arch/alpha/include/uapi/asm/unistd.h | 3 +++
 arch/alpha/kernel/systbls.S          | 3 +++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/unistd.h b/arch/alpha/include/asm/unistd.h
index c509d30..a56e608 100644
--- a/arch/alpha/include/asm/unistd.h
+++ b/arch/alpha/include/asm/unistd.h
@@ -3,7 +3,7 @@
 
 #include <uapi/asm/unistd.h>
 
-#define NR_SYSCALLS			511
+#define NR_SYSCALLS			514
 
 #define __ARCH_WANT_OLD_READDIR
 #define __ARCH_WANT_STAT64
diff --git a/arch/alpha/include/uapi/asm/unistd.h b/arch/alpha/include/uapi/asm/unistd.h
index d214a035..aa33bf5 100644
--- a/arch/alpha/include/uapi/asm/unistd.h
+++ b/arch/alpha/include/uapi/asm/unistd.h
@@ -472,5 +472,8 @@
 #define __NR_sched_setattr		508
 #define __NR_sched_getattr		509
 #define __NR_renameat2			510
+#define __NR_getrandom			511
+#define __NR_memfd_create		512
+#define __NR_execveat			513
 
 #endif /* _UAPI_ALPHA_UNISTD_H */
diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
index 2478971..9b62e3f 100644
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@ -529,6 +529,9 @@ sys_call_table:
 	.quad sys_sched_setattr
 	.quad sys_sched_getattr
 	.quad sys_renameat2			/* 510 */
+	.quad sys_getrandom
+	.quad sys_memfd_create
+	.quad sys_execveat
 
 	.size sys_call_table, . - sys_call_table
 	.type sys_call_table, @object
-- 
1.9.3
