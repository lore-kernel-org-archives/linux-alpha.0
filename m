From: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 1/7] alpha: Add kcmp and finit_module syscalls
Date: Tue, 16 Jul 2013 10:04:34 -0700
Message-ID: <1373994280-12047-2-git-send-email-rth@twiddle.net>
References: <1373994280-12047-1-git-send-email-rth@twiddle.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=6VPNClRPXaQebTS1cMghdhBWWAZpK59SZEpdj/8FwE4=;
        b=w6AYHgUCxZnQkj9xDcOpfdhO+QH4N9iBpTu47GgIGoFq/CRgvdhAQ7LBnlB/TXPlsK
         g+MOUuB9XRQTZnhpuN3TPyRx5o4b1309LJViUM96I4ZJlElZZwGKxV6wmeJdGPS+GCA3
         44m4Wa6cOzIL9gVsEMFdjKjhO58DvbTNj0M6pA9jyQwPAT+srvrBGfDLobe9+JbPhKzG
         iEoNDkie4nJi6uVYjuNKEIlHjWsq6F4ATjS9hjjx1caducTCggOzG6L9k/CpoMe/9EwB
         w/p5Ula0u4JHicfaklxUT5Ve5+Dg5aCTx8g8Qv2kQbIHArJ2ZrrNi3NZkV50WA//bUbo
         U/Bw==
In-Reply-To: <1373994280-12047-1-git-send-email-rth@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/alpha/include/asm/unistd.h      | 3 +--
 arch/alpha/include/uapi/asm/unistd.h | 2 ++
 arch/alpha/kernel/systbls.S          | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/unistd.h b/arch/alpha/include/asm/unistd.h
index 43baee1..f2c9440 100644
--- a/arch/alpha/include/asm/unistd.h
+++ b/arch/alpha/include/asm/unistd.h
@@ -3,8 +3,7 @@
 
 #include <uapi/asm/unistd.h>
 
-
-#define NR_SYSCALLS			506
+#define NR_SYSCALLS			508
 
 #define __ARCH_WANT_OLD_READDIR
 #define __ARCH_WANT_STAT64
diff --git a/arch/alpha/include/uapi/asm/unistd.h b/arch/alpha/include/uapi/asm/unistd.h
index 801d28b..53ae7bb 100644
--- a/arch/alpha/include/uapi/asm/unistd.h
+++ b/arch/alpha/include/uapi/asm/unistd.h
@@ -467,5 +467,7 @@
 #define __NR_sendmmsg			503
 #define __NR_process_vm_readv		504
 #define __NR_process_vm_writev		505
+#define __NR_kcmp			506
+#define __NR_finit_module		507
 
 #endif /* _UAPI_ALPHA_UNISTD_H */
diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
index 4284ec7..dca9b3f 100644
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@ -524,6 +524,8 @@ sys_call_table:
 	.quad sys_sendmmsg
 	.quad sys_process_vm_readv
 	.quad sys_process_vm_writev		/* 505 */
+	.quad sys_kcmp
+	.quad sys_finit_module
 
 	.size sys_call_table, . - sys_call_table
 	.type sys_call_table, @object
-- 
1.8.1.4
