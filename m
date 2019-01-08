From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH v4 05/13] arm: perf: conditionally use
 PERF_PMU_CAP_NO_EXCLUDE
Date: Tue, 8 Jan 2019 13:07:41 +0000
Message-ID: <20190108130740.GC56789@e119886-lin.cambridge.arm.com>
References: <1546878450-20341-1-git-send-email-andrew.murray@arm.com>
 <1546878450-20341-6-git-send-email-andrew.murray@arm.com>
 <20190108102802.GC6808@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190108102802.GC6808@hirez.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Russell King <linux@armlinux.org.uk>, suzuki.poulose@arm.com, robin.murphy@arm.com, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org

On Tue, Jan 08, 2019 at 11:28:02AM +0100, Peter Zijlstra wrote:
> On Mon, Jan 07, 2019 at 04:27:22PM +0000, Andrew Murray wrote:
> > @@ -393,9 +386,8 @@ __hw_perf_event_init(struct perf_event *event)
> >  	/*
> >  	 * Check whether we need to exclude the counter from certain modes.
> >  	 */
> > +	if (armpmu->set_event_filter &&
> > +	    armpmu->set_event_filter(hwc, &event->attr)) {
> >  		pr_debug("ARM performance counters do not support "
> >  			 "mode exclusion\n");
> >  		return -EOPNOTSUPP;
> 
> This then requires all set_event_filter() implementations to check all
> the various exclude options;

Yes but this isn't a new requirement, this hunk uses the absence of
set_event_filter to blanket indicate that no exclusion flags are supported.


> also, set_event_filter() failing then
> returns with -EOPNOTSUPP instead of the -EINVAL the CAP_NO_EXCLUDE
> generates, which is again inconsitent.

Yes, it's not ideal - but a step in the right direction. I wanted to limit
user visible changes as much as possible, where I've identified them I've
noted it in the commit log.

> 
> If I look at (the very first git-grep found me)
> armv7pmu_set_event_filter(), then I find it returning -EPERM (again
> inconsistent but irrelevant because the actual value is not preserved)
> for exclude_idle.
> 
> But it doesn't seem to check exclude_host at all for example.

Yes I found lots of examples like this across the tree whilst doing this
work. However I decided to initially start with simply removing duplicated
code as a result of adding this flag and attempting to preserve existing
functionality. I thought that if I add missing checks then the patchset
will get much bigger and be harder to merge. I would like to do this though
as another non-cross-arch series.

Can we limit this patch series to the minimal changes required to fully
use PERF_PMU_CAP_NO_EXCLUDE and then attempt to fix these existing problems
in subsequent patch sets?

Thanks,

Andrew Murray

> 
> > @@ -867,6 +859,9 @@ int armpmu_register(struct arm_pmu *pmu)
> >  	if (ret)
> >  		return ret;
> >  
> > +	if (!pmu->set_event_filter)
> > +		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
> > +
> >  	ret = perf_pmu_register(&pmu->pmu, pmu->name, -1);
> >  	if (ret)
> >  		goto out_destroy;
> > -- 
> > 2.7.4
> > 
