From: Mikael Pettersson <mikpe@it.uu.se>
Subject: [PATCH] wire up fanotify and prlimit64 syscalls on Alpha
Date: Thu, 16 Sep 2010 16:12:55 +0200
Message-ID: <19602.9703.537889.99030@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org

The 2.6.36-rc kernel added three new system calls:
fanotify_init, fanotify_mark, and prlimit64.  This
patch wires them up on Alpha.

Built and booted on an XP900.  Untested beyond that.

Signed-off-by: Mikael Pettersson <mikpe@it.uu.se>
---
 arch/alpha/include/asm/unistd.h |    5 ++++-
 arch/alpha/kernel/systbls.S     |    3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff -rupN linux-2.6.36-rc4/arch/alpha/include/asm/unistd.h linux-2.6.36-rc4.alpha-fanotify+prlimit64-syscalls/arch/alpha/include/asm/unistd.h
--- linux-2.6.36-rc4/arch/alpha/include/asm/unistd.h	2010-02-25 14:45:00.000000000 +0100
+++ linux-2.6.36-rc4.alpha-fanotify+prlimit64-syscalls/arch/alpha/include/asm/unistd.h	2010-09-16 15:50:45.000000000 +0200
@@ -449,10 +449,13 @@
 #define __NR_pwritev			491
 #define __NR_rt_tgsigqueueinfo		492
 #define __NR_perf_event_open		493
+#define __NR_fanotify_init		494
+#define __NR_fanotify_mark		495
+#define __NR_prlimit64			496
 
 #ifdef __KERNEL__
 
-#define NR_SYSCALLS			494
+#define NR_SYSCALLS			497
 
 #define __ARCH_WANT_IPC_PARSE_VERSION
 #define __ARCH_WANT_OLD_READDIR
diff -rupN linux-2.6.36-rc4/arch/alpha/kernel/systbls.S linux-2.6.36-rc4.alpha-fanotify+prlimit64-syscalls/arch/alpha/kernel/systbls.S
--- linux-2.6.36-rc4/arch/alpha/kernel/systbls.S	2010-02-25 14:45:00.000000000 +0100
+++ linux-2.6.36-rc4.alpha-fanotify+prlimit64-syscalls/arch/alpha/kernel/systbls.S	2010-09-16 15:50:45.000000000 +0200
@@ -512,6 +512,9 @@ sys_call_table:
 	.quad sys_pwritev
 	.quad sys_rt_tgsigqueueinfo
 	.quad sys_perf_event_open
+	.quad sys_fanotify_init
+	.quad sys_fanotify_mark				/* 495 */
+	.quad sys_prlimit64
 
 	.size sys_call_table, . - sys_call_table
 	.type sys_call_table, @object
