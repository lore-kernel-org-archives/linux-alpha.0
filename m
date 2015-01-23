From: Jiang Liu <jiang.liu@linux.intel.com>
Subject: [Resend Patch v4 01/16] smp, alpha: Kill SMP single function call interrupt
Date: Fri, 23 Jan 2015 13:36:40 +0800
Message-ID: <1421991416-20297-2-git-send-email-jiang.liu@linux.intel.com>
References: <1421991416-20297-1-git-send-email-jiang.liu@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421991416-20297-1-git-send-email-jiang.liu@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Jiang Liu <jiang.liu@linux.intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

Commit 9a46ad6d6df3b54 "smp: make smp_call_function_many() use logic
similar to smp_call_function_single()" has unified the way to handle
single and multiple cross-CPU function calls. Now only one interrupt
is needed for architecture specific code to support generic SMP function
call interfaces, so kill the redundant single function call interrupt.

Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Jiang Liu <jiang.liu@linux.intel.com>
---
 arch/alpha/kernel/smp.c |    8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 99ac36d5de4e..2f24447fef92 100644
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
1.7.10.4
