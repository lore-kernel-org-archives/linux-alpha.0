From: Jiang Liu <liuj97@gmail.com>
Subject: [PATCH v3 [resend] 03/18] smp, alpha: kill SMP single function call interrupt
Date: Mon, 16 Dec 2013 00:36:25 +0800
Message-ID: <1387125400-28849-4-git-send-email-liuj97@gmail.com>
References: <1387125400-28849-1-git-send-email-liuj97@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3tv+TEu3PvaEt4IngtbVcr9kjD1W46ZP8DACa2QJQbU=;
        b=OEIPyRyYoCbiJ51UOPuMezsw4JGrYG5VROHMxhv26dWTomSIglaAMOOmLIrEMTidhJ
         cRupIBc3eEJUdGuha8+li0QMezP/AeMcGPoPszCar8RaUUGnn7JsbuBkxB/5jMN7XlZN
         EstbfAVShZfAfRmsmvc2XbLlp8pXThKRzU01aksCY/f8POIKRjNlQhm8fP02ti9X/Nvq
         yi7eMRvudbnd0qM4LcmMWk97UKJcXtxDd6DmhnXCZTKFKarfWvW8sHKOqvQExbJOW2BA
         IlA860Q0bmhUSOW6HZ5+vy6nirZqkT1m4ZO/96S3PfmSIdydUFYd0aVoQ64+GFruMYXg
         E9Og==
In-Reply-To: <1387125400-28849-1-git-send-email-liuj97@gmail.com>
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
