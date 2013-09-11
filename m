From: Jiang Liu <liuj97@gmail.com>
Subject: [RFC PATCH v2 02/25] smp, alpha: kill SMP single function call interrupt
Date: Thu, 12 Sep 2013 00:07:06 +0800
Message-ID: <1378915649-16395-3-git-send-email-liuj97@gmail.com>
References: <1378915649-16395-1-git-send-email-liuj97@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=McJ2qw13iFTIc9vcFtnvyQ8uGbJvWbr0k2DulJPlHP0=;
        b=ZdOnMvYcnmUjLFr1qNgLy2Z/0lAYQ8XMfvIjuZjPvoBdFp64rLUXZZlvL2O4nJxuq6
         kipLHhGjsqQjkwLsvfCd+/4uPtDDwDj+Z/VfbbjQ2yu4af2KFwWZHfHOCSmpm8gt01Rh
         KrZnHWdvT8tduWzSu40ZH8x0Jmre+2GQ9773MuH0BR/ri2fUjteCRf987roLOiviahQe
         QAsgrJYDZypOS/zz5upEuzYrbpFc1EZUCKsf33ck+7PHAtUqkECjcIqzZgm7TMpdhkxk
         3tcuYvMSW1383shdg/6OgszcsYZeiisIbjnQATQB4YZlPlXB/0BAsMMjftjfcDVWBx50
         bNPw==
In-Reply-To: <1378915649-16395-1-git-send-email-liuj97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Shaohua Li <shli@kernel.org>
Cc: liuj97@gmail.com, Jiang Liu <jiang.liu@huawei.com>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Steven Rostedt <rostedt@goodmis.org>, Jiri Kosina <trivial@kernel.org>, Wang YanQing <udknight@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org

From: Jiang Liu <jiang.liu@huawei.com>

Commit 9a46ad6d6df3b54 "smp: make smp_call_function_many() use logic
similar to smp_call_function_single()" has unified the way to handle
single and multiple cross-CPU function calls. Now only one interrupt
is needed for architecture specific code to support generic SMP function
call interfaces, so kill the redundant single function call interrupt.

Signed-off-by: Jiang Liu <jiang.liu@huawei.com>
Cc: Jiang Liu <liuj97@gmail.com>
---
 arch/alpha/kernel/smp.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 9dbbcb3..71d5c7d 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -63,7 +63,6 @@ static struct {
 enum ipi_message_type {
 	IPI_RESCHEDULE,
 	IPI_CALL_FUNC,
-	IPI_CALL_FUNC_SINGLE,
 	IPI_CPU_STOP,
 };
 
@@ -498,7 +497,6 @@ smp_cpus_done(unsigned int max_cpus)
 	       ((bogosum + 2500) / (5000/HZ)) % 100);
 }
 
-
 void
 smp_percpu_timer_interrupt(struct pt_regs *regs)
 {
@@ -533,7 +531,6 @@ setup_profiling_timer(unsigned int multiplier)
 	return -EINVAL;
 }
 
-
 static void
 send_ipi_message(const struct cpumask *to_whom, enum ipi_message_type operation)
 {
@@ -579,10 +576,6 @@ handle_ipi(struct pt_regs *regs)
 			generic_smp_call_function_interrupt();
 			break;
 
-		case IPI_CALL_FUNC_SINGLE:
-			generic_smp_call_function_single_interrupt();
-			break;
-
 		case IPI_CPU_STOP:
 			halt();
 
@@ -633,7 +626,7 @@ void arch_send_call_function_ipi_mask(const struct cpumask *mask)
 
 void arch_send_call_function_single_ipi(int cpu)
 {
-	send_ipi_message(cpumask_of(cpu), IPI_CALL_FUNC_SINGLE);
+	send_ipi_message(cpumask_of(cpu), IPI_CALL_FUNC);
 }
 
 static void
-- 
1.8.1.2
