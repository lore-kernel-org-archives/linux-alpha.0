From: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 2/2] alpha: Add sched_set/getattr and renameat2 syscalls
Date: Wed, 30 Jul 2014 11:42:32 -1000
Message-ID: <1406756552-23864-3-git-send-email-rth@twiddle.net>
References: <1406756552-23864-1-git-send-email-rth@twiddle.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NPkB3qW8UVCXt9qw4WfxMVGG9+iuHyuimz9tp4LHn5Q=;
        b=OOIu0Cl3wdjjDRg1Z9LSSeTszUayDdOYsESgVhefxHSQ7W5iOwnYh2C+DNWHe1qIHc
         dpMWinruOQD826s9y9Gw/Vr3rC+Ea/nx9K/aMPcU2d3XRqPTo7+Tikx7Iw4q26zkanWn
         +acFwANpDIkvwJOq8Ch8hP8q4fv1u2xhtc3CRC+ryIJx2s/xqZ+0H4juRuzyMkAvPXK9
         BrJXvDnvjx0PSQljHEmYqVc6/b4kKQ/6g1ddZKyUWQZRS6PP8c+jCPVCx0OwT8xt8Q4x
         xTlw8RQMyE6m09vD7j4bMHT4N2qGYL7vx0LTK8sL28o5V9+fGjizoigtmfSjbZM/nwyu
         oQ0w==
In-Reply-To: <1406756552-23864-1-git-send-email-rth@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: mcree@orcon.net.nz, linux-alpha@vger.kernel.org

Signed-off-by: Richard Henderson <rth@twiddle.net>
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
1.9.3
