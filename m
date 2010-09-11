From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [tip:perf/core] perf: Rework the PMU methods
Date: Sat, 11 Sep 2010 20:16:19 +1200
Message-ID: <4C8B3AD3.5050309@orcon.net.nz>
References: <new-submission> <tip-a4eaf7f14675cb512d69f0c928055e73d0c6d252@git.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <tip-a4eaf7f14675cb512d69f0c928055e73d0c6d252@git.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mingo@redhat.com, dengcheng.zhu@gmail.com, a.p.zijlstra@chello.nl, yanmin_zhang@linux.intel.com, gorcunov@gmail.com, fweisbec@gmail.com, robert.richter@amd.com, ming.m.lin@intel.com
Cc: linux-alpha@vger.kernel.org

On 10/09/10 07:50, tip-bot for Peter Zijlstra wrote:
> Commit-ID:  a4eaf7f14675cb512d69f0c928055e73d0c6d252
> Gitweb:     http://git.kernel.org/tip/a4eaf7f14675cb512d69f0c928055e73d0c6d252
> Author:     Peter Zijlstra<a.p.zijlstra@chello.nl>
> AuthorDate: Wed, 16 Jun 2010 14:37:10 +0200
> Committer:  Ingo Molnar<mingo@elte.hu>
> CommitDate: Thu, 9 Sep 2010 20:46:30 +0200
>
> perf: Rework the PMU methods
>
> Replace pmu::{enable,disable,start,stop,unthrottle} with
> pmu::{add,del,start,stop}, all of which take a flags argument.

Regarding the new function alpha_pmu_stop() in 
arch/alpha/kernel/perf_event.c:

> -static void alpha_pmu_unthrottle(struct perf_event *event)
> +static void alpha_pmu_stop(struct perf_event *event, int flags)
>   {
>   	struct hw_perf_event *hwc =&event->hw;
>   	struct cpu_hw_events *cpuc =&__get_cpu_var(cpu_hw_events);
>
> +	if (!(hwc->state&  PERF_HES_STOPPED)) {
> +		cpuc->idx_mask&= !(1UL<<hwc->idx);
                                  ^
Presumably ones complement (rather than logical not) is meant.

> +		hwc->state |= PERF_HES_STOPPED;
> +	}
> +
> +	if ((flags&  PERF_EF_UPDATE)&&  !(hwc->state&  PERF_HES_UPTODATE)) {
> +		alpha_perf_event_update(event, hwc, hwc->idx, 0);
> +		hwc->state |= PERF_HES_UPTODATE;
> +	}
> +
> +	if (cpuc->enabled)
> +		wrperfmon(PERFMON_CMD_ENABLE, (1UL<<hwc->idx));

By the name of the function (alpha_pmu_stop) I assume that the intent is 
to stop the specific PMC here.  The above fails to do that.  When 
wrperfmon() is used with PERFMON_CMD_ENABLE it enables the PMCs with set 
bits in the second argument.  It does not stop the others.  To do that 
wrperfmon() must be called with PERFMON_CMD_DISABLE and the 
corresponding PMC bits set to disable the PMC.

Cheers
Michael.
