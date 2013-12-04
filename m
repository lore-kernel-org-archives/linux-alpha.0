From: Jiang Liu <liuj97@gmail.com>
Subject: [RFC PATCH v3 03/19] smp, alpha: kill SMP single function call interrupt
Date: Thu,  5 Dec 2013 00:12:54 +0800
Message-ID: <1386173591-28514-4-git-send-email-liuj97@gmail.com>
References: <1386173591-28514-1-git-send-email-liuj97@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3tv+TEu3PvaEt4IngtbVcr9kjD1W46ZP8DACa2QJQbU=;
        b=pZLyeELooOUiA0ts14BiuqIa48QcTDncL7RWenB2q7yO0OGzjEj8sui9Ogr0mFUqs7
         VFCoE63lWUNKHqilgr5QrT/P0ZZQatkKdDEJXm+HSG4COyw2fUF2vqq8E2iZnzG3rxuY
         u7Hzf14z/1cgkI0bj8OqHF3+UxnghMQxIezdj2fgejdH58uzLO+b9ZTy+GDtwkIjldiD
         3NJ8NKRiCKKid1zrHP60ooFMITObEXMTZIgJjuijQutun1LnsahFw+3+Hl+IWvnNgzz+
         Mz/vEMGGzuaaAJCKbouDaYVRcUTM7OMH/Jft+M2rSGkVpnteTz+5cuzPSuXzh8t4GVUT
         TYNA==
In-Reply-To: <1386173591-28514-1-git-send-email-liuj97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Shaohua Li <shli@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Chen Gang <gang.chen@asianux.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jiang Liu <liuj97@gmail.com>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Steven Rostedt <rostedt@goodmis.org>, Jiri Kosina <trivial@kernel.org>, Wang YanQing <udknight@gmail.com>, linux-arch@vger.kernel.org

Commit 9a46ad6d6df3b54 "smp: make smp_call_function_many() use logic
similar to smp_call_function_single()" has unified the way to handle
single and multiple cross-CPU function calls. Now only one interrupt
is needed for architecture specific code to support generic SMP function
call interfaces, so kill the redundant single function call interrupt.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Shaohua Li <shli@kernel.org>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Jiri Kosina <trivial@kernel.org>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Jiang Liu <liuj97@gmail.com>
---
 arch/alpha/kernel/smp.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 99ac36d..2f24447 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -63,7 +63,6 @@ static struct {
 enum ipi_message_type {
 	IPI_RESCHEDULE,
 	IPI_CALL_FUNC,
-	IPI_CALL_FUNC_SINGLE,
 	IPI_CPU_STOP,
 };
 
@@ -506,7 +505,6 @@ setup_profiling_timer(unsigned int multiplier)
 	return -EINVAL;
 }
 
-
 static void
 send_ipi_message(const struct cpumask *to_whom, enum ipi_message_type operation)
 {
@@ -552,10 +550,6 @@ handle_ipi(struct pt_regs *regs)
 			generic_smp_call_function_interrupt();
 			break;
 
-		case IPI_CALL_FUNC_SINGLE:
-			generic_smp_call_function_single_interrupt();
-			break;
-
 		case IPI_CPU_STOP:
 			halt();
 
@@ -606,7 +600,7 @@ void arch_send_call_function_ipi_mask(const struct cpumask *mask)
 
 void arch_send_call_function_single_ipi(int cpu)
 {
-	send_ipi_message(cpumask_of(cpu), IPI_CALL_FUNC_SINGLE);
+	send_ipi_message(cpumask_of(cpu), IPI_CALL_FUNC);
 }
 
 static void
-- 
1.8.1.2
