From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH v4 10/13] x86: perf/core: use PERF_PMU_CAP_NO_EXCLUDE for
 exclude incapable PMUs
Date: Tue, 8 Jan 2019 13:12:47 +0000
Message-ID: <20190108131247.GE56789@e119886-lin.cambridge.arm.com>
References: <1546878450-20341-1-git-send-email-andrew.murray@arm.com>
 <1546878450-20341-11-git-send-email-andrew.murray@arm.com>
 <20190108104841.GD6808@hirez.programming.kicks-ass.net>
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
	List-Owner; bh=vmXp2S5z996Z01AWlHX9T/jxf9qrJl+4g+0ULdPqcSY=; b=rJlPvKcFzcdyqV
	e2WzBRY4LF3MIBCKFziV0m7OlVVcRF1BO/fZXiuARohLWTvAvL6frIgu2oilssOCmMxk4zVuV9cHX
	Yvg4DP/d51gK/lntcr3HYX9GKIPX8vtdxaQn2JYlQnzH18fH9zGB4cJTROr67GOFd3vEFeFkGkUJx
	7DM+nPdacglI14DX92P1TpZ35jbXM5Ox2nl8reg1X6m6PtK9VqopHNn+2pDdpfi7KTxlRmTSMRxAk
	FhXhvLifC7IrY44tolEEiFKt82Li5mA1ncETpvPxbGfOLJswEAOm8dr8Sl+s+YAzf2JePKYhB1jOA
	j22bz3cOxeUDu3vC09Ag==;
Content-Disposition: inline
In-Reply-To: <20190108104841.GD6808@hirez.programming.kicks-ass.net>
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
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Will Deacon <will.deacon@arm.com>, Paul Mackerras <paulus@samba.org>, Shawn Guo <shawnguo@kernel.org>, boris.ostrovsky@oracle.com, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, suzuki.poulose@arm.com, Sascha Hauer <s.hauer@pengutronix.de>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>, jgross@suse.com, robin.murphy@arm.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org

On Tue, Jan 08, 2019 at 11:48:41AM +0100, Peter Zijlstra wrote:
> On Mon, Jan 07, 2019 at 04:27:27PM +0000, Andrew Murray wrote:
> > For drivers that do not support context exclusion let's advertise the
> > PERF_PMU_CAP_NOEXCLUDE capability. This ensures that perf will
> > prevent us from handling events where any exclusion flags are set.
> > Let's also remove the now unnecessary check for exclusion flags.
> > 
> > Signed-off-by: Andrew Murray <andrew.murray@arm.com>
> > ---
> >  arch/x86/events/amd/ibs.c          | 13 +------------
> >  arch/x86/events/amd/power.c        | 10 ++--------
> >  arch/x86/events/intel/cstate.c     | 12 +++---------
> >  arch/x86/events/intel/rapl.c       |  9 ++-------
> >  arch/x86/events/intel/uncore_snb.c |  9 ++-------
> >  arch/x86/events/msr.c              | 10 ++--------
> >  6 files changed, 12 insertions(+), 51 deletions(-)
> 
> You (correctly) don't add CAP_NO_EXCLUDE to the main x86 pmu code, but
> then you also don't check if it handles all the various exclude options
> correctly/consistently.
> 
> Now; I must admit that that is a bit of a maze, but I think we can at
> least add exclude_idle and exclude_hv fails in there, nothing uses those
> afaict.

Yes it took me some time to make sense of it.

As per my comments in the other patch, I think you're suggesting that I
add additional checks to x86. I think they are needed but I'd prefer to
make functional changes in a separate series, I'm happy to do this.

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
> Now, KVM always implies exclude_hv afaict (for guests),

It certaintly does for ARM.

> I'm not sure
> what, if anything Xen does on x86 (IIRC Brendan Gregg once said perf
> works on Xen) -- nor quite sure who to ask, Boris, Jeurgen?

Thanks,

Andrew Murray
> 
