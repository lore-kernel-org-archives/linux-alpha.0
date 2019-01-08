From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH v4 11/13] x86: perf/core: use PERF_PMU_CAP_NO_EXCLUDE for
 exclude incapable PMUs
Date: Tue, 8 Jan 2019 13:08:43 +0000
Message-ID: <20190108130842.GD56789@e119886-lin.cambridge.arm.com>
References: <1546878450-20341-1-git-send-email-andrew.murray@arm.com>
 <1546878450-20341-12-git-send-email-andrew.murray@arm.com>
 <20190108104940.GE6808@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190108104940.GE6808@hirez.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Russell King <linux@armlinux.org.uk>, suzuki.poulose@arm.com, robin.murphy@arm.com, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org

On Tue, Jan 08, 2019 at 11:49:40AM +0100, Peter Zijlstra wrote:
> On Mon, Jan 07, 2019 at 04:27:28PM +0000, Andrew Murray wrote:
> 
> This patch has the exact same subject as the previous one.. that seems
> sub-optimal.

Ah yes, I'll update that in subsquent revisions. (The reason for two patches
was to separate functional vs non-functional changes).

Andrew Murray
