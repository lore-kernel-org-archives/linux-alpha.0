From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [tip:perf/core] perf: Rework the PMU methods
Date: Mon, 13 Sep 2010 14:15:53 +0200
Message-ID: <1284380153.2275.261.camel@laptop>
References: <new-submission>
	 <tip-a4eaf7f14675cb512d69f0c928055e73d0c6d252@git.kernel.org>
	 <4C8B3AD3.5050309@orcon.net.nz> <1284198035.2251.29.camel@laptop>
	 <4C8C6611.20206@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4C8C6611.20206@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <mcree@orcon.net.nz>
Cc: mingo@redhat.com, dengcheng.zhu@gmail.com, yanmin_zhang@linux.intel.com, gorcunov@gmail.com, fweisbec@gmail.com, robert.richter@amd.com, ming.m.lin@intel.com, tglx@linutronix.de, hpa@zytor.com, paulus@samba.org, linux-kernel@vger.kernel.org, eranian@googlemail.com, will.deacon@arm.com, lethal@linux-sh.org, davem@davemloft.net, mingo@elte.hu, linux-alpha@vger.kernel.org

On Sun, 2010-09-12 at 17:33 +1200, Michael Cree wrote:

> Yes, done.  I also took the liberty to fix an undefined variable and 
> multiple defined variable errors that were exposed by compilation.  Will 
> reply to this with the patch.

Thanks, and sorry for messing up Alpha that bad.. I have an alpha
compiler and I really through I compile tested it :/

> I've also tested it on a UP alpha.  It worked well for a little while 
> but after running 'perf top' for a number of seconds I got the following 
> warning:

<snip warn>

> which is from the line in alpha_pmu_start() that checks that 
> PERF_HES_STOPPED is set.
> 
> I see that the backtrace is from the Alpha timer_interrupt() code which 
> goes something like this:
> 
> [do some stuff updating timer deltas then...]
> 
> #ifndef CONFIG_SMP
>          while (nticks--)
>                  update_process_times(user_mode(get_irq_regs()));
> #endif
> 
>          if (test_perf_event_pending()) {
>                  clear_perf_event_pending();
>                  perf_event_do_pending();
>          }
> 
>          return IRQ_HANDLED;
> }
> 
> 
> When I added the code for handle pending events to the timer interrupt I 
> hadn't realised that update_process_times() could call back into the 
> perf code.  I'm speculating here, but could it be that there is pending 
> work to stop the HW counter, but the call to re-start it is beating the 
> call to stop it?

Right, so the ->start() call came from perf_ctx_adjust_freq(), which
depending on whether perf_adjust_period() gets inlined, can have two
such calls.

Assuming it didn't inline (there's two callsites, which should defeat
the inline static functions with a single callsite heuristic), you hit
the unthrottle() call.

Ahh, the alpha throttle call should be using the fancy new stop function
too (will fold into your earlier patch if it indeed works):

As to the point you raised above, yes, I think it would be prudent to
call perf_event_do_pending() before update_process_times().


Signed-off-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
---
Index: linux-2.6/arch/alpha/kernel/perf_event.c
===================================================================
--- linux-2.6.orig/arch/alpha/kernel/perf_event.c
+++ linux-2.6/arch/alpha/kernel/perf_event.c
@@ -825,14 +825,14 @@ static void alpha_perf_event_irq_handler
 			break;
 	}
 
+	event = cpuc->event[j];
+
 	if (unlikely(j == cpuc->n_events)) {
 		/* This can occur if the event is disabled right on a PMC overflow. */
-		wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
+		alpha_pmu_stop(event, 0);
 		return;
 	}
 
-	event = cpuc->event[j];
-
 	if (unlikely(!event)) {
 		/* This should never occur! */
 		irq_err_count++;

