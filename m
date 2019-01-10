From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v4 13/13] drivers/perf: use PERF_PMU_CAP_NO_EXCLUDE for
 Cavium TX2 PMU
Date: Thu, 10 Jan 2019 11:10:12 +0000
Message-ID: <20190110111012.GB27065@fuggles.cambridge.arm.com>
References: <1546878450-20341-1-git-send-email-andrew.murray@arm.com>
 <1546878450-20341-14-git-send-email-andrew.murray@arm.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546878450-20341-14-git-send-email-andrew.murray@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Murray <andrew.murray@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Russell King <linux@armlinux.org.uk>, suzuki.poulose@arm.com, robin.murphy@arm.com, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org

On Mon, Jan 07, 2019 at 04:27:30PM +0000, Andrew Murray wrote:
> The Cavium ThunderX2 UNCORE PMU driver doesn't support any event
> filtering. Let's advertise the PERF_PMU_CAP_NO_EXCLUDE capability to
> simplify the code.
> 
> Signed-off-by: Andrew Murray <andrew.murray@arm.com>
> ---
>  drivers/perf/thunderx2_pmu.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)

Acked-by: Will Deacon <will.deacon@arm.com>

Thanks for fixing this up.

Will
