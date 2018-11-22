From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH 00/10] perf/core: Generalise event exclusion checking
Date: Thu, 22 Nov 2018 12:59:00 +0000
Message-ID: <20181122125859.GJ42987@e119886-lin.cambridge.arm.com>
References: <1542363853-13849-1-git-send-email-andrew.murray@arm.com>
 <20181119130800.GE9761@hirez.programming.kicks-ass.net>
 <20181122122142.GI42987@e119886-lin.cambridge.arm.com>
 <20181122122637.GS2131@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181122122637.GS2131@hirez.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On Thu, Nov 22, 2018 at 01:26:37PM +0100, Peter Zijlstra wrote:
> On Thu, Nov 22, 2018 at 12:21:43PM +0000, Andrew Murray wrote:
> > On Mon, Nov 19, 2018 at 02:08:00PM +0100, Peter Zijlstra wrote:
> 
> > > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > > index 84530ab358c3..d76b724177b9 100644
> > > --- a/kernel/events/core.c
> > > +++ b/kernel/events/core.c
> > > @@ -9772,6 +9772,14 @@ static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
> > >  	if (ctx)
> > >  		perf_event_ctx_unlock(event->group_leader, ctx);
> > >  
> > > +	if (!ret) {
> > > +		if ((pmu->capabilities & PERF_PMU_CAP_EXCLUDE) ||
> > > +		    event_has_exclude_flags(event)) {
> > > +			event->destroy(event);
> > > +			ret = -EINVAL;
> > > +		}
> > > +	}
> > > +
> > 
> > I don't quite follow this logic. Should that not have been:
> > 
> > if (!(pmu->capabilities & PERF_PMU_CAP_EXCLUDE) &&
> >      event_has_exclude_flags(event)) {
> > 
> > Meaning that if an event has any exclude flags but the pmu doesn't
> > have the capability to handle them then error.
> 
> Uhm, yes. Brainfart on my side that.
> 
> > If you're happy with my proposed logic, then would it also make
> > sense to move this before the call to the pmu->event_init ?
> 
> I'm not sure that can work; I think we need ->event_init() first such
> that it can -ENOENT. Only after ->event_init() returns success can we be
> certain of @pmu.

Ah yes I see now. Until event_init doesn't return -ENOENT we can't be sure
that this will be the PMU we use (as per the other calls to
perf_try_init_event in perf_init_event).

Thanks,

Andrew Murray
