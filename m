From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 01/23] alpha/time: Migrate to new 'set-state' interface
Date: Thu, 16 Jul 2015 16:56:13 +0530
Message-ID: <cf58aab697e42e20563c848901ef601dd4898879.1437044517.git.viresh.kumar@linaro.org>
References: <cover.1437044517.git.viresh.kumar@linaro.org>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <cover.1437044517.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1437044517.git.viresh.kumar@linaro.org>
References: <cover.1437044517.git.viresh.kumar@linaro.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linaro-kernel@lists.linaro.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Christoph Lameter <cl@linux.com>, linux-alpha@vger.kernel.org, Tejun Heo <tj@kernel.org>

Migrate alpha driver to the new 'set-state' interface provided by
clockevents core, the earlier 'set-mode' interface is marked obsolete
now.

This also enables us to implement callbacks for new states of clockevent
devices, for example: ONESHOT_STOPPED.

rtc clockevent device wasn't doing anything in set-mode and so its
set-state callbacks aren't implemented.

Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Christoph Lameter <cl@linux.com>
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/alpha/kernel/time.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/alpha/kernel/time.c b/arch/alpha/kernel/time.c
index 643a9dcdf093..5b6202a825ff 100644
--- a/arch/alpha/kernel/time.c
+++ b/arch/alpha/kernel/time.c
@@ -93,7 +93,7 @@ rtc_timer_interrupt(int irq, void *dev)
 	struct clock_event_device *ce = &per_cpu(cpu_ce, cpu);
 
 	/* Don't run the hook for UNUSED or SHUTDOWN.  */
-	if (likely(ce->mode == CLOCK_EVT_MODE_PERIODIC))
+	if (likely(clockevent_state_periodic(ce)))
 		ce->event_handler(ce);
 
 	if (test_irq_work_pending()) {
@@ -104,13 +104,6 @@ rtc_timer_interrupt(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static void
-rtc_ce_set_mode(enum clock_event_mode mode, struct clock_event_device *ce)
-{
-	/* The mode member of CE is updated in generic code.
-	   Since we only support periodic events, nothing to do.  */
-}
-
 static int
 rtc_ce_set_next_event(unsigned long evt, struct clock_event_device *ce)
 {
@@ -129,7 +122,6 @@ init_rtc_clockevent(void)
 		.features = CLOCK_EVT_FEAT_PERIODIC,
 		.rating = 100,
 		.cpumask = cpumask_of(cpu),
-		.set_mode = rtc_ce_set_mode,
 		.set_next_event = rtc_ce_set_next_event,
 	};
 
@@ -161,12 +153,12 @@ static struct clocksource qemu_cs = {
  * The QEMU alarm as a clock_event_device primitive.
  */
 
-static void
-qemu_ce_set_mode(enum clock_event_mode mode, struct clock_event_device *ce)
+static int qemu_ce_shutdown(struct clock_event_device *ce)
 {
 	/* The mode member of CE is updated for us in generic code.
 	   Just make sure that the event is disabled.  */
 	qemu_set_alarm_abs(0);
+	return 0;
 }
 
 static int
@@ -197,7 +189,9 @@ init_qemu_clockevent(void)
 		.features = CLOCK_EVT_FEAT_ONESHOT,
 		.rating = 400,
 		.cpumask = cpumask_of(cpu),
-		.set_mode = qemu_ce_set_mode,
+		.set_state_shutdown = qemu_ce_shutdown,
+		.set_state_oneshot = qemu_ce_shutdown,
+		.tick_resume = qemu_ce_shutdown,
 		.set_next_event = qemu_ce_set_next_event,
 	};
 
-- 
2.4.0

