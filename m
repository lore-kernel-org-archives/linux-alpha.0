From: Chen Gang <xili_gchen_5257@hotmail.com>
Subject: [PATCH] alpha: Wire up missing syscalls
Date: Sun, 10 May 2015 02:33:36 +0800
Message-ID: <BLU436-SMTP115284EEDC94CD99F399465B9DD0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, ink@jurassic.park.msu.ru, "mattst88@gmail.com" <mattst88@gmail.com>
Cc: mcree@orcon.net.nz, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

The related warnings:

    CALL    scripts/checksyscalls.sh
  <stdin>:1238:2: warning: #warning syscall seccomp not implemented [-Wcpp]
  <stdin>:1241:2: warning: #warning syscall getrandom not implemented [-Wcpp]
  <stdin>:1244:2: warning: #warning syscall memfd_create not implemented [-Wcpp]
  <stdin>:1247:2: warning: #warning syscall bpf not implemented [-Wcpp]
  <stdin>:1250:2: warning: #warning syscall execveat not implemented [-Wcpp]


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 arch/alpha/include/asm/unistd.h      | 2 +-
 arch/alpha/include/uapi/asm/unistd.h | 5 +++++
 arch/alpha/kernel/systbls.S          | 5 +++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/unistd.h b/arch/alpha/include/asm/unistd.h
index c509d30..973280c 100644
--- a/arch/alpha/include/asm/unistd.h
+++ b/arch/alpha/include/asm/unistd.h
@@ -3,7 +3,7 @@
 
 #include <uapi/asm/unistd.h>
 
-#define NR_SYSCALLS			511
+#define NR_SYSCALLS			516
 
 #define __ARCH_WANT_OLD_READDIR
 #define __ARCH_WANT_STAT64
diff --git a/arch/alpha/include/uapi/asm/unistd.h b/arch/alpha/include/uapi/asm/unistd.h
index d214a035..1db20e5 100644
--- a/arch/alpha/include/uapi/asm/unistd.h
+++ b/arch/alpha/include/uapi/asm/unistd.h
@@ -472,5 +472,10 @@
 #define __NR_sched_setattr		508
 #define __NR_sched_getattr		509
 #define __NR_renameat2			510
+#define __NR_seccomp			511
+#define __NR_getrandom			512
+#define __NR_memfd_create		513
+#define __NR_bpf			514
+#define __NR_execveat			515
 
 #endif /* _UAPI_ALPHA_UNISTD_H */
diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
index 2478971..5a545d3 100644
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@ -529,6 +529,11 @@ sys_call_table:
 	.quad sys_sched_setattr
 	.quad sys_sched_getattr
 	.quad sys_renameat2			/* 510 */
+	.quad sys_seccomp
+	.quad sys_getrandom
+	.quad sys_memfd_create
+	.quad sys_bpf
+	.quad sys_execveat			/* 515 */
 
 	.size sys_call_table, . - sys_call_table
 	.type sys_call_table, @object
-- 
1.9.3
