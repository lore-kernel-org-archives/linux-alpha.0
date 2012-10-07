From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [regression] boot failure on alpha, bisected
Date: Sun, 7 Oct 2012 19:13:00 +0200
Message-ID: <20121007171300.GA10942@redhat.com>
References: <20121006204736.GA1830@ds20.borg.net> <20121007165534.GA8024@redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121007165534.GA8024@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dl8bcu@dl8bcu.de, peterz@infradead.org, mingo@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

On 10/07, Oleg Nesterov wrote:
>
> Hmm. I know nothing about arch/alpha and I can't understand its entry.S.
> But _it seems_ to me that do_notify_resume() is called with irqs disabled.
> If this is true, then imho arch/alpha should be fixed.
>
> Before this commit task_work_run() enabled irqs, but this was the "side
> effect" of spin_lock_irq/spin_unlock_irq, we should not rely on this.

Could you please test the debugging patch below?

Oleg.


--- x/arch/alpha/kernel/signal.c
+++ x/arch/alpha/kernel/signal.c
@@ -567,11 +567,19 @@ do_signal(struct pt_regs * regs, struct 
 		ptrace_set_bpt(current);	/* re-set breakpoint */
 }
 
+#include <linux/ratelimit.h>
+
 void
 do_notify_resume(struct pt_regs *regs, struct switch_stack *sw,
 		 unsigned long thread_info_flags,
 		 unsigned long r0, unsigned long r19)
 {
+	if (irqs_disabled()) {
+		printk_ratelimited(KERN_WARNING
+			"NOTIFY with irqs_disabled:%lx\n", thread_info_flags);
+		local_irq_enable();
+	}
+
 	if (thread_info_flags & _TIF_SIGPENDING)
 		do_signal(regs, sw, r0, r19);
 

