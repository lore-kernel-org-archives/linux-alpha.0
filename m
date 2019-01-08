From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH v4 05/13] arm: perf: conditionally use
 PERF_PMU_CAP_NO_EXCLUDE
Date: Tue, 8 Jan 2019 13:13:57 +0000
Message-ID: <20190108131357.GF56789@e119886-lin.cambridge.arm.com>
References: <1546878450-20341-1-git-send-email-andrew.murray@arm.com>
 <1546878450-20341-6-git-send-email-andrew.murray@arm.com>
 <20190108102802.GC6808@hirez.programming.kicks-ass.net>
 <20190108130740.GC56789@e119886-lin.cambridge.arm.com>
 <20190108131031.GG6808@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190108131031.GG6808@hirez.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Russell King <linux@armlinux.org.uk>, suzuki.poulose@arm.com, robin.murphy@arm.com, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org

On Tue, Jan 08, 2019 at 02:10:31PM +0100, Peter Zijlstra wrote:
> On Tue, Jan 08, 2019 at 01:07:41PM +0000, Andrew Murray wrote:
> 
> > Yes I found lots of examples like this across the tree whilst doing this
> > work. However I decided to initially start with simply removing duplicated
> > code as a result of adding this flag and attempting to preserve existing
> > functionality. I thought that if I add missing checks then the patchset
> > will get much bigger and be harder to merge. I would like to do this though
> > as another non-cross-arch series.
> > 
> > Can we limit this patch series to the minimal changes required to fully
> > use PERF_PMU_CAP_NO_EXCLUDE and then attempt to fix these existing problems
> > in subsequent patch sets?
> 
> Ok, but it would've been nice to see that mentioned somewhere.

I'll update the cover leter on any next revision. I'll try to be clearer next
time with my intentions.

Andrew Murray
