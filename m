From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 01/10] alpha: Add missing RCU idle APIs on idle loop
Date: Thu, 23 Aug 2012 12:42:11 +0200
Message-ID: <20120823104201.GA18251@somewhere.redhat.com>
References: <1345652628-15060-1-git-send-email-fweisbec@gmail.com>
 <1345652628-15060-2-git-send-email-fweisbec@gmail.com>
 <20120822171930.GE2447@linux.vnet.ibm.com>
 <20120822173542.GD13674@somewhere>
 <20120822190109.GH2447@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=plMAiIfrea5DA8uooHcWvjR85U2o5TXWJ2Mboeo/JGE=;
        b=Y1Ds8eznVghexebU5lFh2TMnBwFHfK/9QpSaDAONnwJETyLEQoXWR98+Wz5vH88dLW
         on9NaIkDQdDjHs6ZySyfvEuBmX3V0YLtJkXGLRUxwxGotRbBtiam/Ra9nz+By8pn+inF
         Y2kK6T4hV4pdeAKEC9e0Uq0SgWc8Tm/Y4tn6y1pbLAue7Tyh1hYT9vRz8zhpwG8DtS8b
         FmJVfS13MVaFA70+/AUITPKE+L3mk6RELIA/XRlucdG+jHC1rmH+UmBLtTR+v7zw2C/Z
         FP/oFhtmuOrM3xKLtzrCi7s78KA+SAxIkEz3mH+EEseol7ySvxi+QYJz/l089lFa6haW
         fqVg==
Content-Disposition: inline
In-Reply-To: <20120822190109.GH2447@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, "3.2.x.." <stable@kernel.org>

On Wed, Aug 22, 2012 at 12:01:09PM -0700, Paul E. McKenney wrote:
> > The current code is preemptable, at least it appears so because it calls
> > schedule() directly. And if I call rcu_idle_enter() in a preemptable section,
> > I'm in trouble because I'll schedule while in extended QS.
> > 
> > Thus I need to disable preemption here at least until I call rcu_idle_exit().
> > 
> > Now this is an endless loop so there is no need to re-enable
> > preemption after the loop. And schedule_preempt_disabled()
> > takes care of enabling preemption before schedule() and redisabling
> > it afterward.
> > 
> > 
> > > 
> > > 							Thanx, Paul
> > > 
> > > >  	while (1) {
> > > >  		/* FIXME -- EV6 and LCA45 know how to power down
> > > >  		   the CPU.  */
> > > > 
> > > > +		rcu_idle_enter();
> > > >  		while (!need_resched())
> > > >  			cpu_relax();
> > > > -		schedule();
> > > > +		rcu_idle_exit();
> > > > +		schedule_preempt_disabled();
> > > >  	}
> 
> Understood, but what I don't understand is why you don't need a
> preempt_enable() right here.

Look, let's inline the content of schedule_preempt_disabled(), the code
then looks like:

void cpu_idle(void)
{
	set_thread_flag(TIF_POLLING_NRFLAG);

	preempt_disable();
	while (1) {
		/* FIXME -- EV6 and LCA45 know how to power down
		   the CPU.  */

		rcu_idle_enter();
		while (!need_resched())
			cpu_relax();
		rcu_idle_exit();

		sched_preempt_enable_no_resched();
	        schedule();
	        preempt_disable();
	}
}

So there is a preempt_enable() before we schedule, then we re-disable
preemption after schedule.

Now I realize cpu_idle() is supposed to be called with preemption disabled
already so I shouldn't add an explicit preempt_disable() or it's going to be worse.
But that means there is an existing bug here in alpha, it should call schedule_preempt_disabled()
instead of schedule(). cpu_idle() is called with preemption disabled on the boot CPU.
And it should as well from the secondary CPUs entry but alpha doesn't seem to do that.

So I need to fix that first. I'll respin.
