From: Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH] alpha: Wire up syscalls new to 2.6.39
Date: Wed,  4 May 2011 20:14:50 +1200
Message-ID: <1304496890-7725-1-git-send-email-mcree@orcon.net.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

Wire up the syscalls:
   name_to_handle_at
   open_by_handle_at
   clock_adjtime
   syncfs
and adjust some whitespace in the neighbourhood to align commments.

Signed-off-by: Michael Cree <mcree@orcon.net.nz>
---
 arch/alpha/include/asm/unistd.h |    6 +++++-
 arch/alpha/kernel/systbls.S     |   14 +++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/include/asm/unistd.h b/arch/alpha/include/asm/unistd.h
index 058937b..b183416 100644
--- a/arch/alpha/include/asm/unistd.h
+++ b/arch/alpha/include/asm/unistd.h
@@ -452,10 +452,14 @@
 #define __NR_fanotify_init		494
 #define __NR_fanotify_mark		495
 #define __NR_prlimit64			496
+#define __NR_name_to_handle_at		497
+#define __NR_open_by_handle_at		498
+#define __NR_clock_adjtime		499
+#define __NR_syncfs			500
 
 #ifdef __KERNEL__
 
-#define NR_SYSCALLS			497
+#define NR_SYSCALLS			501
 
 #define __ARCH_WANT_IPC_PARSE_VERSION
 #define __ARCH_WANT_OLD_READDIR
diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
index a6a1de9..c77a8fc 100644
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@ -498,24 +498,28 @@ sys_call_table:
 	.quad sys_ni_syscall			/* sys_timerfd */
 	.quad sys_eventfd
 	.quad sys_recvmmsg
-	.quad sys_fallocate				/* 480 */
+	.quad sys_fallocate			/* 480 */
 	.quad sys_timerfd_create
 	.quad sys_timerfd_settime
 	.quad sys_timerfd_gettime
 	.quad sys_signalfd4
-	.quad sys_eventfd2				/* 485 */
+	.quad sys_eventfd2			/* 485 */
 	.quad sys_epoll_create1
 	.quad sys_dup3
 	.quad sys_pipe2
 	.quad sys_inotify_init1
-	.quad sys_preadv				/* 490 */
+	.quad sys_preadv			/* 490 */
 	.quad sys_pwritev
 	.quad sys_rt_tgsigqueueinfo
 	.quad sys_perf_event_open
 	.quad sys_fanotify_init
-	.quad sys_fanotify_mark				/* 495 */
+	.quad sys_fanotify_mark			/* 495 */
 	.quad sys_prlimit64
-
+	.quad sys_name_to_handle_at
+	.quad sys_open_by_handle_at
+	.quad sys_clock_adjtime
+	.quad sys_syncfs			/* 500 */
+	
 	.size sys_call_table, . - sys_call_table
 	.type sys_call_table, @object
 
-- 
1.7.4.3
