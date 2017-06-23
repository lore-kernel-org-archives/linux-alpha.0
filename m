From: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 1/3] alpha: Update for new syscalls
Date: Fri, 23 Jun 2017 14:19:59 -0700
Message-ID: <20170623212001.2785-2-rth@twiddle.net>
References: <20170623212001.2785-1-rth@twiddle.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZnHrZ7grLWEUqIvu2zO4z302Ina71CRvdJJRyxB3+iI=;
        b=AQMUTL+x74Ch2t6OUApUijhcv7C4YTjdk+Qgk+NX7WVdDuQkLSPA5vg/EedeZjR0zb
         yJ+zwCIsu7njIR5+ci9ZHr36AcxNCemhm9p6zDrQSrHJHnptLqR6M28H5uMojrX9aS+x
         aZsjBfZ3bDdtA4u1d6LlpphW0CO569zOGzatboCRWn6qlJkBvnCyq/mmyuAF6eYwBbD9
         kUqodI2FQSRL/uYmXyuZmhUtAZHUvfGgYl+BO3sW7PsHgevqHiWZ5p59/7UkpxveuhsY
         amwN4xmicITZ6YEMvV+w1EFTduMqCvGtlbW1sWFOwKPBK/F+0+KRZWw7fx1sDO2RDZ6x
         PEiw==
In-Reply-To: <20170623212001.2785-1-rth@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/alpha/include/asm/unistd.h      |  2 +-
 arch/alpha/include/uapi/asm/unistd.h | 14 ++++++++++++++
 arch/alpha/kernel/systbls.S          |  9 +++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/unistd.h b/arch/alpha/include/asm/unistd.h
index a56e608..64fcf55 100644
--- a/arch/alpha/include/asm/unistd.h
+++ b/arch/alpha/include/asm/unistd.h
@@ -3,7 +3,7 @@
 
 #include <uapi/asm/unistd.h>
 
-#define NR_SYSCALLS			514
+#define NR_SYSCALLS			523
 
 #define __ARCH_WANT_OLD_READDIR
 #define __ARCH_WANT_STAT64
diff --git a/arch/alpha/include/uapi/asm/unistd.h b/arch/alpha/include/uapi/asm/unistd.h
index aa33bf5..a2945fe 100644
--- a/arch/alpha/include/uapi/asm/unistd.h
+++ b/arch/alpha/include/uapi/asm/unistd.h
@@ -475,5 +475,19 @@
 #define __NR_getrandom			511
 #define __NR_memfd_create		512
 #define __NR_execveat			513
+#define __NR_seccomp			514
+#define __NR_bpf			515
+#define __NR_userfaultfd		516
+#define __NR_membarrier			517
+#define __NR_mlock2			518
+#define __NR_copy_file_range		519
+#define __NR_preadv2			520
+#define __NR_pwritev2			521
+#define __NR_statx			522
+
+/* Alpha doesn't have protection keys. */
+#define __IGNORE_pkey_mprotect
+#define __IGNORE_pkey_alloc
+#define __IGNORE_pkey_free
 
 #endif /* _UAPI_ALPHA_UNISTD_H */
diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
index 9b62e3f..5b4514a 100644
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@ -532,6 +532,15 @@ sys_call_table:
 	.quad sys_getrandom
 	.quad sys_memfd_create
 	.quad sys_execveat
+	.quad sys_seccomp
+	.quad sys_bpf				/* 515 */
+	.quad sys_userfaultfd
+	.quad sys_membarrier
+	.quad sys_mlock2
+	.quad sys_copy_file_range
+	.quad sys_preadv2			/* 520 */
+	.quad sys_pwritev2
+	.quad sys_statx
 
 	.size sys_call_table, . - sys_call_table
 	.type sys_call_table, @object
-- 
2.9.4

