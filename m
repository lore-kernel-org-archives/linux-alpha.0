From: Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH] Wire up preadv and pwritev on Alpha.
Date: Mon, 19 Oct 2009 21:11:08 +1300
Message-ID: <1255939868-5050-2-git-send-email-mcree@orcon.net.nz>
References: <1255939868-5050-1-git-send-email-mcree@orcon.net.nz>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1255939868-5050-1-git-send-email-mcree@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Michael Cree <mcree@orcon.net.nz>

---
 arch/alpha/include/asm/unistd.h |    4 +++-
 arch/alpha/kernel/systbls.S     |    2 ++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/include/asm/unistd.h b/arch/alpha/include/asm/unistd.h
index 5b5c174..bba503a 100644
--- a/arch/alpha/include/asm/unistd.h
+++ b/arch/alpha/include/asm/unistd.h
@@ -433,10 +433,12 @@
 #define __NR_signalfd			476
 #define __NR_timerfd			477
 #define __NR_eventfd			478
+#define __NR_preadv			479
+#define __NR_pwritev			480
 
 #ifdef __KERNEL__
 
-#define NR_SYSCALLS			479
+#define NR_SYSCALLS			481
 
 #define __ARCH_WANT_IPC_PARSE_VERSION
 #define __ARCH_WANT_OLD_READDIR
diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
index 95c9aef..8182792 100644
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@ -497,6 +497,8 @@ sys_call_table:
 	.quad sys_signalfd
 	.quad sys_ni_syscall
 	.quad sys_eventfd
+	.quad sys_preadv
+	.quad sys_pwritev			/* 480 */
 
 	.size sys_call_table, . - sys_call_table
 	.type sys_call_table, @object
-- 
1.6.3.3

