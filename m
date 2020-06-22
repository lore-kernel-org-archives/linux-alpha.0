From: Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH 09/17] alpha: switch to copy_thread_tls()
Date: Tue, 23 Jun 2020 01:43:18 +0200
Message-ID: <20200622234326.906346-10-christian.brauner@ubuntu.com>
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200622234326.906346-1-christian.brauner@ubuntu.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Christian Brauner <christian.brauner@ubuntu.com>, linux-alpha@vger.kernel.org

Use the copy_thread_tls() calling convention which passes tls through a
register. This is required so we can remove the copy_thread{_tls}() split
and remove the HAVE_COPY_THREAD_TLS macro.

Cc: linux-alpha@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 arch/alpha/Kconfig          | 1 +
 arch/alpha/kernel/process.c | 9 ++++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 10862c5a8c76..b01515c6b2ed 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -38,6 +38,7 @@ config ALPHA
 	select OLD_SIGSUSPEND
 	select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
 	select MMU_GATHER_NO_RANGE
+	select HAVE_COPY_THREAD_TLS
 	help
 	  The Alpha is a 64-bit general-purpose processor designed and
 	  marketed by the Digital Equipment Corporation of blessed memory,
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index b45f0b0d6511..dfdb6b6ba61c 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -233,10 +233,9 @@ release_thread(struct task_struct *dead_task)
 /*
  * Copy architecture-specific thread state
  */
-int
-copy_thread(unsigned long clone_flags, unsigned long usp,
-	    unsigned long kthread_arg,
-	    struct task_struct *p)
+int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+		    unsigned long kthread_arg, struct task_struct *p,
+		    unsigned long tls)
 {
 	extern void ret_from_fork(void);
 	extern void ret_from_kernel_thread(void);
@@ -267,7 +266,7 @@ copy_thread(unsigned long clone_flags, unsigned long usp,
 	   required for proper operation in the case of a threaded
 	   application calling fork.  */
 	if (clone_flags & CLONE_SETTLS)
-		childti->pcb.unique = regs->r20;
+		childti->pcb.unique = tls;
 	else
 		regs->r20 = 0;	/* OSF/1 has some strange fork() semantics.  */
 	childti->pcb.usp = usp ?: rdusp();
-- 
2.27.0

