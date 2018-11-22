From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 00/10] perf/core: Generalise event exclusion checking
Date: Thu, 22 Nov 2018 13:26:37 +0100
Message-ID: <20181122122637.GS2131@hirez.programming.kicks-ass.net>
References: <1542363853-13849-1-git-send-email-andrew.murray@arm.com>
 <20181119130800.GE9761@hirez.programming.kicks-ass.net>
 <20181122122142.GI42987@e119886-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kEFtOT4RTJY4e0mJ07FmlOG9z27KAJvYhoqqyOw8siY=; b=mLBd+fAyUoLqNJ
	S/bjzy5eSv9ANB7RADL8DXpD86j8Eq/oC/KahulrIvVIwAyulOwg+8Kp5jOPJjgTguA+7Er4IoPBM
	GLtX1A6suGyWFGto37rqH+x7uSVwpSkvitItNA34YY1VrAI8Egdgi/JSYX7fwKs2av0d8zwdCseF+
	llc+dsGgGkMyBqIV1pglusrRoKS+5vBQCQjNFTrETatPpcI6+5plLABL2vRojJXnSDdLTQMiEQl6b
	FbmFTrKFX1SH8HvAXRV65Vr+S7K2qx78qLCw9xcALu54/lYkBM6ms06uXtOT/ZWPhzfnsDz8JciFP
	nRHnNVLhBPIy4vE0+Nfg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6GoQshdtTCtgMebtwlHObzPjr944dMKihJzDk8JnA+E=; b=gN8XvJOLSMf9Ga/u/ly10Llmm
 d94ZfD94B0B6/m6mCzv91TIyY3eHgeFCJL9dj5fuS93nGq7DX+i8Y/H/a3UzqrpyuLk6nLAbUoibz
 jFwPpe1WGtzIzPWssrpuIWEWzsayQsj2a9+m+cSKL3e8BQ6v8073C2AsmNS4QxtsSb8E44vmMhFcu
 au6wPlvaM6ksRF/BkswOOa1rYEsi/HVInl7A0PNOie2KYXkxJxLYQSrNnaKoKFBIZUkaZ3rktsycV
 iaKN4IdixwWgG7LgClwd5g0QSrNQ4FVwLAyV1IPpvfzP031JzYzlPfPl+O5p3oaes5Qa76i3cweT+
 2vWyx7Lvw==;
Content-Disposition: inline
In-Reply-To: <20181122122142.GI42987@e119886-lin.cambridge.arm.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Murray <andrew.murray@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Sascha Hauer <s.hauer@pengutronix.de>, x86@kernel.org, Will Deacon <will.deacon@arm.com>, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, linux-alpha@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org

On Thu, Nov 22, 2018 at 12:21:43PM +0000, Andrew Murray wrote:
> On Mon, Nov 19, 2018 at 02:08:00PM +0100, Peter Zijlstra wrote:

> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index 84530ab358c3..d76b724177b9 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -9772,6 +9772,14 @@ static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
> >  	if (ctx)
> >  		perf_event_ctx_unlock(event->group_leader, ctx);
> >  
> > +	if (!ret) {
> > +		if ((pmu->capabilities & PERF_PMU_CAP_EXCLUDE) ||
> > +		    event_has_exclude_flags(event)) {
> > +			event->destroy(event);
> > +			ret = -EINVAL;
> > +		}
> > +	}
> > +
> 
> I don't quite follow this logic. Should that not have been:
> 
> if (!(pmu->capabilities & PERF_PMU_CAP_EXCLUDE) &&
>      event_has_exclude_flags(event)) {
> 
> Meaning that if an event has any exclude flags but the pmu doesn't
> have the capability to handle them then error.

Uhm, yes. Brainfart on my side that.

> If you're happy with my proposed logic, then would it also make
> sense to move this before the call to the pmu->event_init ?

I'm not sure that can work; I think we need ->event_init() first such
that it can -ENOENT. Only after ->event_init() returns success can we be
certain of @pmu.
