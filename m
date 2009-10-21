From: Daniele Calore <orkaan@orkaan.org>
Subject: [PATCH] alpha: Wire up missing/new syscalls
Date: Wed, 21 Oct 2009 16:44:31 +0200
Message-ID: <20091021164431.6193d96b@buddha>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: orkaan@orkaan.org

This wire up the: fallocate, timerfd_create, timerfd_settime, timerfd_gettime
signalfd4, eventfd2, epoll_create1, dup3, pipe2, inotify_init1, preadv,
pwritev and rt_tgsigqueueinfo syscalls for the alpha port.

For umount2, alpha have an "old" and "new" version called: oldumount and umount;
so ignore umount2.

Signed-off-by: Daniele Calore <orkaan@orkaan.org>
    
---
diff --git a/arch/alpha/include/asm/unistd.h b/arch/alpha/include/asm/unistd.h
index 5b5c174..17f72b7 100644
--- a/arch/alpha/include/asm/unistd.h
+++ b/arch/alpha/include/asm/unistd.h
@@ -247,6 +247,7 @@
 #define __IGNORE_pause
 #define __IGNORE_time
 #define __IGNORE_utime
+#define __IGNORE_umount2
 
 /*
  * Linux-specific system calls begin at 300
@@ -433,10 +434,23 @@
 #define __NR_signalfd			476
 #define __NR_timerfd			477
 #define __NR_eventfd			478
+#define __NR_fallocate			479
+#define __NR_timerfd_create		480
+#define __NR_timerfd_settime		481
+#define __NR_timerfd_gettime		482
+#define __NR_signalfd4			483
+#define __NR_eventfd2			484
+#define __NR_epoll_create1		485
+#define __NR_dup3			486
+#define __NR_pipe2			487
+#define __NR_inotify_init1		488
+#define __NR_preadv			489
+#define __NR_pwritev			490
+#define __NR_rt_tgsigqueueinfo		491
 
 #ifdef __KERNEL__
 
-#define NR_SYSCALLS			479
+#define NR_SYSCALLS			492
 
 #define __ARCH_WANT_IPC_PARSE_VERSION
 #define __ARCH_WANT_OLD_READDIR
diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
index 95c9aef..78199b9 100644
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@ -495,8 +495,21 @@ sys_call_table:
 	.quad sys_epoll_pwait
 	.quad sys_utimensat			/* 475 */
 	.quad sys_signalfd
-	.quad sys_ni_syscall
+	.quad sys_ni_syscall			/* sys_timerfd */
 	.quad sys_eventfd
+	.quad sys_fallocate
+	.quad sys_timerfd_create		/* 480 */
+	.quad sys_timerfd_settime
+	.quad sys_timerfd_gettime
+	.quad sys_signalfd4
+	.quad sys_eventfd2
+	.quad sys_epoll_create1			/* 485 */
+	.quad sys_dup3
+	.quad sys_pipe2
+	.quad sys_inotify_init1
+	.quad sys_preadv
+	.quad sys_pwritev			/* 490 */
+	.quad sys_rt_tgsigqueueinfo
 
 	.size sys_call_table, . - sys_call_table
 	.type sys_call_table, @object
