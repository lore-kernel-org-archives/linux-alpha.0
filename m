From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 01/10] alpha: Add missing RCU idle APIs on idle loop
Date: Thu, 23 Aug 2012 05:25:21 -0700
Message-ID: <20120823122521.GF31059@linux.vnet.ibm.com>
References: <1345652628-15060-1-git-send-email-fweisbec@gmail.com>
 <1345652628-15060-2-git-send-email-fweisbec@gmail.com>
 <20120822171930.GE2447@linux.vnet.ibm.com>
 <20120822173542.GD13674@somewhere>
 <20120822190109.GH2447@linux.vnet.ibm.com>
 <20120823104201.GA18251@somewhere.redhat.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120823104201.GA18251@somewhere.redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, "3.2.x.." <stable@kernel.org>

On Thu, Aug 23, 2012 at 12:42:11PM +0200, Frederic Weisbecker wrote:
> On Wed, Aug 22, 2012 at 12:01:09PM -0700, Paul E. McKenney wrote:
> > > The current code is preemptable, at least it appears so because it calls
> > > schedule() directly. And if I call rcu_idle_enter() in a preemptable section,
> > > I'm in trouble because I'll schedule while in extended QS.
> > > 
> > > Thus I need to disable preemption here at least until I call rcu_idle_exit().
> > > 
> > > Now this is an endless loop so there is no need to re-enable
> > > preemption after the loop. And schedule_preempt_disabled()
> > > takes care of enabling preemption before schedule() and redisabling
> > > it afterward.
> > > 
> > > 
> > > > 
> > > > 							Thanx, Paul
> > > > 
> > > > >  	while (1) {
> > > > >  		/* FIXME -- EV6 and LCA45 know how to power down
> > > > >  		   the CPU.  */
> > > > > 
> > > > > +		rcu_idle_enter();
> > > > >  		while (!need_resched())
> > > > >  			cpu_relax();
> > > > > -		schedule();
> > > > > +		rcu_idle_exit();
> > > > > +		schedule_preempt_disabled();
> > > > >  	}
> > 
> > Understood, but what I don't understand is why you don't need a
> > preempt_enable() right here.
> 
> Look, let's inline the content of schedule_preempt_disabled(), the code
> then looks like:
> 
> void cpu_idle(void)
> {
> 	set_thread_flag(TIF_POLLING_NRFLAG);
> 
> 	preempt_disable();
> 	while (1) {
> 		/* FIXME -- EV6 and LCA45 know how to power down
> 		   the CPU.  */
> 
> 		rcu_idle_enter();
> 		while (!need_resched())
> 			cpu_relax();
> 		rcu_idle_exit();
> 
> 		sched_preempt_enable_no_resched();
> 	        schedule();
> 	        preempt_disable();
> 	}

	preempt_enable();  /* Why is this not needed? */

> }
> 
> So there is a preempt_enable() before we schedule, then we re-disable
> preemption after schedule.
> 
> Now I realize cpu_idle() is supposed to be called with preemption disabled
> already so I shouldn't add an explicit preempt_disable() or it's going to be worse.
> But that means there is an existing bug here in alpha, it should call schedule_preempt_disabled()
> instead of schedule(). cpu_idle() is called with preemption disabled on the boot CPU.
> And it should as well from the secondary CPUs entry but alpha doesn't seem to do that.
> 
> So I need to fix that first. I'll respin.

OK, look forward to seeing the respin.

							Thanx, Paul

