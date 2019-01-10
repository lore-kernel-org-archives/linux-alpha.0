From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4 10/13] x86: perf/core: use PERF_PMU_CAP_NO_EXCLUDE for exclude incapable PMUs
Date: Fri, 11 Jan 2019 00:15:13 +1100
Message-ID: <87ef9kslge.fsf@concordia.ellerman.id.au>
References: <1546878450-20341-1-git-send-email-andrew.murray@arm.com> <1546878450-20341-11-git-send-email-andrew.murray@arm.com> <20190108104841.GD6808@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108104841.GD6808@hirez.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Andrew Murray <andrew.murray@arm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Russell King <linux@armlinux.org.uk>, suzuki.poulose@arm.com, robin.murphy@arm.com, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.c

Peter Zijlstra <peterz@infradead.org> writes:

> On Mon, Jan 07, 2019 at 04:27:27PM +0000, Andrew Murray wrote:
>> For drivers that do not support context exclusion let's advertise the
>> PERF_PMU_CAP_NOEXCLUDE capability. This ensures that perf will
>> prevent us from handling events where any exclusion flags are set.
>> Let's also remove the now unnecessary check for exclusion flags.
>> 
>> Signed-off-by: Andrew Murray <andrew.murray@arm.com>
>> ---
>>  arch/x86/events/amd/ibs.c          | 13 +------------
>>  arch/x86/events/amd/power.c        | 10 ++--------
>>  arch/x86/events/intel/cstate.c     | 12 +++---------
>>  arch/x86/events/intel/rapl.c       |  9 ++-------
>>  arch/x86/events/intel/uncore_snb.c |  9 ++-------
>>  arch/x86/events/msr.c              | 10 ++--------
>>  6 files changed, 12 insertions(+), 51 deletions(-)
>
> You (correctly) don't add CAP_NO_EXCLUDE to the main x86 pmu code, but
> then you also don't check if it handles all the various exclude options
> correctly/consistently.
>
> Now; I must admit that that is a bit of a maze, but I think we can at
> least add exclude_idle and exclude_hv fails in there, nothing uses those
> afaict.
>
> On the various exclude options; they are as follows (IIUC):
>
>   - exclude_guest: we're a HV/host-kernel and we don't want the counter
>                    to run when we run a guest context.
>
>   - exclude_host: we're a HV/host-kernel and we don't want the counter
>                   to run when we run in host context.
>
>   - exclude_hv: we're a guest and don't want the counter to run in HV
>                 context.
>
> Now, KVM always implies exclude_hv afaict (for guests)

On Power it mostly does.

There's some host code that can run in real mode (MMU off) and therefore
doesn't do a full context switch out of the guest (including the PMU),
so that's host code that is running while the guest PMCs are still
counting.

cheers
