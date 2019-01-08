From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v4 05/13] arm: perf: conditionally use
 PERF_PMU_CAP_NO_EXCLUDE
Date: Tue, 8 Jan 2019 11:28:02 +0100
Message-ID: <20190108102802.GC6808@hirez.programming.kicks-ass.net>
References: <1546878450-20341-1-git-send-email-andrew.murray@arm.com>
 <1546878450-20341-6-git-send-email-andrew.murray@arm.com>
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
	List-Owner; bh=oMBLFd89C2/hVGSi0mMxruVu9U3oHiKzDTCGVUgJDfY=; b=rpMU8q1o6QT72m
	NoGK8XqjJlKjuMjoa7C1tF1M+gexstFcwsDG/a2F5ljhWYnkn5Ob8klmTIQxP3cHV4HyBigvjcwf3
	y4D2Q/ITIiBDwkkzXmeIcBXKNTwjHCgjXEdylGs1EEwEQtRE1yf3C+PUiXAScQckV6F1IFEZznm7+
	RjA4BXh8hzvqMq+/QsaidH8x8ysTQTAu3eBJmWE/yNVlBVKAfQjrE+IhN90itfs91PqfqQVI7A4Kf
	kO9iJ7+ZxeIP59B4McBksbhdkv8y/R6K33zukCx68BaUZBTHwouF/YGYIFVFqJeWSl5myOBCGc16D
	YODLWJsA8o7bjD+Gf16A==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a3kU5k+u673a2t4p3kZsUUxiSNyKyt8voZTb8FPfGoU=; b=KtPkx1CiOsfJMDgrKwdFT06Wg
 RsxgG+HhPdWeZT2jQM2eF/RrXNalETBM4ZFaA9Xy6HS5tx8TknXTI7JkPDwPyc4ZoykiCuM6OwVDu
 c26g/Pna8g9b7AFhFeYOFo2ukav88impf1E5/f4d7VQwaZTuh7jVHc4jXGEb/Vvv3cY8ajOmEtH0y
 2SZrEjNZ2fytGuPTc+WTgg0NywS0Gj50L6jsHOpV6/GeEiuDYHSUZ9ji+/Mp027aMTj2leFSsF7+U
 G5va0gYlsmkGWKPArWaKBMWLO2kI/qb25k/EdrXhEl8oE6q22epOoF2ZUVaKJvBPvWtqywRNO3PMf
 NLCUwZRng==;
Content-Disposition: inline
In-Reply-To: <1546878450-20341-6-git-send-email-andrew.murray@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Will Deacon <will.deacon@arm.com>, Paul Mackerras <paulus@samba.org>, Shawn Guo <shawnguo@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, suzuki.poulose@arm.com, Sascha Hauer <s.hauer@pengutronix.de>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>, robin.murphy@arm.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org

On Mon, Jan 07, 2019 at 04:27:22PM +0000, Andrew Murray wrote:
> @@ -393,9 +386,8 @@ __hw_perf_event_init(struct perf_event *event)
>  	/*
>  	 * Check whether we need to exclude the counter from certain modes.
>  	 */
> +	if (armpmu->set_event_filter &&
> +	    armpmu->set_event_filter(hwc, &event->attr)) {
>  		pr_debug("ARM performance counters do not support "
>  			 "mode exclusion\n");
>  		return -EOPNOTSUPP;

This then requires all set_event_filter() implementations to check all
the various exclude options; also, set_event_filter() failing then
returns with -EOPNOTSUPP instead of the -EINVAL the CAP_NO_EXCLUDE
generates, which is again inconsitent.

If I look at (the very first git-grep found me)
armv7pmu_set_event_filter(), then I find it returning -EPERM (again
inconsistent but irrelevant because the actual value is not preserved)
for exclude_idle.

But it doesn't seem to check exclude_host at all for example.

> @@ -867,6 +859,9 @@ int armpmu_register(struct arm_pmu *pmu)
>  	if (ret)
>  		return ret;
>  
> +	if (!pmu->set_event_filter)
> +		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
> +
>  	ret = perf_pmu_register(&pmu->pmu, pmu->name, -1);
>  	if (ret)
>  		goto out_destroy;
> -- 
> 2.7.4
> 
