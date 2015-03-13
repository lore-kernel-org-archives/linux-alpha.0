From: Alex Dowad <alexinbeijing@gmail.com>
Subject: [PATCH 02/32] alpha: copy_thread(): rename 'arg' argument to 'kthread_arg'
Date: Fri, 13 Mar 2015 20:04:17 +0200
Message-ID: <1426269888-25600-2-git-send-email-alexinbeijing@gmail.com>
References: <1426269888-25600-1-git-send-email-alexinbeijing@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YnNOe9SyuwjOpZMxmNZWab/XoJhD1NXqDcIR8Rm8xuw=;
        b=yaRz/uIspiinMPHV0Kve7vDs6C9hQuWcY98zvK/9wkl8PMrYYswJo2R4h6DD4rV25U
         BSGhn3rCkTyVc0jY5s+lu0dHCZVeR/fySrGYSW0bSb67W9KkhSaVmxk5lrt7ewAt8UZE
         FBu+3KgjT7r7VI90h1yLwg+fhG+nuaUX5UoVQTHJQBCHk5YUe47MIwSNTdpTxBMPbTZu
         yiJxRvbsUtYtUzIYQkfXZHiO9hzy1+SQwcv6ztY9yfJC31+GWqt+7HIown9QOAumrnXs
         tlKIuEieb5w9LakLsvttMrg1VaQp2L7BSMnzL2R0nlktyb0cjmIkaxkMp6mrlPwhbupR
         xIzw==
In-Reply-To: <1426269888-25600-1-git-send-email-alexinbeijing@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vget.kernel.org
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

The 'arg' argument to copy_thread() is only ever used when forking a new
kernel thread. Hence, rename it to 'kthread_arg' for clarity (and consistency
with do_fork() and other arch-specific implementations of copy_thread()).

Signed-off-by: Alex Dowad <alexinbeijing@gmail.com>
---
 arch/alpha/kernel/process.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 1941a07..84d1326 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -236,12 +236,11 @@ release_thread(struct task_struct *dead_task)
 }
 
 /*
- * Copy an alpha thread..
+ * Copy architecture-specific thread state
  */
-
 int
 copy_thread(unsigned long clone_flags, unsigned long usp,
-	    unsigned long arg,
+	    unsigned long kthread_arg,
 	    struct task_struct *p)
 {
 	extern void ret_from_fork(void);
@@ -262,7 +261,7 @@ copy_thread(unsigned long clone_flags, unsigned long usp,
 			sizeof(struct switch_stack) + sizeof(struct pt_regs));
 		childstack->r26 = (unsigned long) ret_from_kernel_thread;
 		childstack->r9 = usp;	/* function */
-		childstack->r10 = arg;
+		childstack->r10 = kthread_arg;
 		childregs->hae = alpha_mv.hae_cache,
 		childti->pcb.usp = 0;
 		return 0;
-- 
2.0.0.GIT
