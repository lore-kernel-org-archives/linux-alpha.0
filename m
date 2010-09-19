From: Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH] alpha: Shift perf event pending work earlier in timer interrupt
Date: Sun, 19 Sep 2010 14:05:40 +1200
Message-ID: <1284861940-6571-1-git-send-email-mcree@orcon.net.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mattst88@gmail.com
Cc: Michael Cree <mcree@orcon.net.nz>, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, mingo@redhat.com, a.p.zijlstra@chello.nl, linux-alpha@vger.kernel.org

Pending work from the performance event subsystem is executed in
the timer interrupt.  This patch shifts the call to
perf_event_do_pending() before the call to update_process_times()
as the latter may call back into the perf event subsystem and it
is prudent to have the pending work executed first.

Signed-off-by: Michael Cree <mcree@orcon.net.nz>
---
 arch/alpha/kernel/time.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/kernel/time.c b/arch/alpha/kernel/time.c
index eacceb2..396af17 100644
--- a/arch/alpha/kernel/time.c
+++ b/arch/alpha/kernel/time.c
@@ -191,16 +191,16 @@ irqreturn_t timer_interrupt(int irq, void *dev)
 
 	write_sequnlock(&xtime_lock);
 
-#ifndef CONFIG_SMP
-	while (nticks--)
-		update_process_times(user_mode(get_irq_regs()));
-#endif
-
 	if (test_perf_event_pending()) {
 		clear_perf_event_pending();
 		perf_event_do_pending();
 	}
 
+#ifndef CONFIG_SMP
+	while (nticks--)
+		update_process_times(user_mode(get_irq_regs()));
+#endif
+
 	return IRQ_HANDLED;
 }
 
-- 
1.7.1
