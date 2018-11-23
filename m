From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH 01/10] perf/core: Add macro to test for event exclusion
 flags
Date: Fri, 23 Nov 2018 14:32:13 +0000
Message-ID: <20181123143213.GB1617@e119886-lin.cambridge.arm.com>
References: <1542363853-13849-1-git-send-email-andrew.murray@arm.com>
 <1542363853-13849-2-git-send-email-andrew.murray@arm.com>
 <87sgzw0yzh.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87sgzw0yzh.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On Tue, Nov 20, 2018 at 10:28:34PM +1100, Michael Ellerman wrote:
> Andrew Murray <andrew.murray@arm.com> writes:
> 
> > Add a macro that tests if any of the perf event exclusion flags
> > are set on a given event.
> >
> > Signed-off-by: Andrew Murray <andrew.murray@arm.com>
> > ---
> >  include/linux/perf_event.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> > index 53c500f..89ee7fa 100644
> > --- a/include/linux/perf_event.h
> > +++ b/include/linux/perf_event.h
> > @@ -1004,6 +1004,15 @@ perf_event__output_id_sample(struct perf_event *event,
> >  extern void
> >  perf_log_lost_samples(struct perf_event *event, u64 lost);
> >  
> > +static inline bool event_has_exclude_flags(struct perf_event *event)
> > +{
> > +	struct perf_event_attr *attr = &event->attr;
> > +
> > +	return attr->exclude_idle || attr->exclude_user ||
> > +	       attr->exclude_kernel || attr->exclude_hv ||
> > +	       attr->exclude_guest || attr->exclude_host;
> > +}
> 
> Sorry to be a total PITA, but using "flags" plural suggests that it only
> returns true if there is more than one exclude flag set.
> 
> A better name would be event_has_exclude_flag() or maybe
> event_has_any_exclude_flag().
> 
> If you're doing a respin anyway it'd be nice to fix the name, but
> obviously it's not high priority.

No problem - I'll go with event_has_any_exclude_flag.

Thanks,

Andrew Murray

> 
> cheers
