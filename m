From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 01/10] perf/core: Add macro to test for event exclusion
 flags
Date: Mon, 19 Nov 2018 13:58:07 +0100
Message-ID: <20181119125807.GD9761@hirez.programming.kicks-ass.net>
References: <1542363853-13849-1-git-send-email-andrew.murray@arm.com>
 <1542363853-13849-2-git-send-email-andrew.murray@arm.com>
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
	List-Owner; bh=29FfJGpLaRjzySxZarD/2Lg4zsNJkAr0fp71mtve8Sk=; b=C97tCZpZTcbcOR
	kmajfP1ajknZ+80h26p+Yz73RlPIthvvvY/xd9A5gNV6flyF8cDCC83nxbVZHMqOVcQ3wVkZ8gNjg
	XIbxe/6gccm55/Yb1P+M2ZaK0GgNJo03THwzItHxs+pj2gnzBmS0agdddUKT4XYvRChCw7xypIcNF
	R1sZNZg/d6jGF08IetoCYtFl3QyGTdMGHGuMD65FlUmKEyT4sPXXr86Ef7Q2N/pgQq0tzcnzgA0/P
	R+sawNqlQGsSZmfn8lYfZFYnCZPvaegZK0Wj8xONjdfzc1aHsJtjxs7Ip7lok/7Q6Z0UJJAdBFgrp
	syg6158B8lFkn9FpQnIw==;
Content-Disposition: inline
In-Reply-To: <1542363853-13849-2-git-send-email-andrew.murray@arm.com>
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

On Fri, Nov 16, 2018 at 10:24:04AM +0000, Andrew Murray wrote:
> Add a macro that tests if any of the perf event exclusion flags
> are set on a given event.

It is in fact an inline function, not a CPP macro.

> Signed-off-by: Andrew Murray <andrew.murray@arm.com>
> ---
>  include/linux/perf_event.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 53c500f..89ee7fa 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1004,6 +1004,15 @@ perf_event__output_id_sample(struct perf_event *event,
>  extern void
>  perf_log_lost_samples(struct perf_event *event, u64 lost);
>  
> +static inline bool event_has_exclude_flags(struct perf_event *event)
> +{
> +	struct perf_event_attr *attr = &event->attr;
> +
> +	return attr->exclude_idle || attr->exclude_user ||
> +	       attr->exclude_kernel || attr->exclude_hv ||
> +	       attr->exclude_guest || attr->exclude_host;
> +}
> +
>  static inline bool is_sampling_event(struct perf_event *event)
>  {
>  	return event->attr.sample_period != 0;
> -- 
> 2.7.4
> 
