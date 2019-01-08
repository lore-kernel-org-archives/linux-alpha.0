From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v4 10/13] x86: perf/core: use PERF_PMU_CAP_NO_EXCLUDE for
 exclude incapable PMUs
Date: Tue, 8 Jan 2019 19:49:01 +0100
Message-ID: <20190108184901.GA1900@hirez.programming.kicks-ass.net>
References: <1546878450-20341-1-git-send-email-andrew.murray@arm.com>
 <1546878450-20341-11-git-send-email-andrew.murray@arm.com>
 <20190108104841.GD6808@hirez.programming.kicks-ass.net>
 <7300f0af-b532-5546-a6f4-fec69cb91a0f@oracle.com>
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
	List-Owner; bh=vI4m8dpHuhnGOjCUNLS66rzPB2jUOYp/33FPowtJz4A=; b=KHElCv2qbdMDkM
	mNCSCeVEYhKq+01ujq2IcTRPmdcpRpvgVJPXNtQP3mFlvuiGRmggv62eWbgRyiDjMzdsEshRg4CV+
	PnK24UhV24dzSz88fqDMuSVoLZlX2LEE8HtWDR5lQHdJDcX/MRp6FAC4gL05H3aA/YIFFxoE5ZSq3
	afQph6pGCkhPBHTasCgBoqwkIJ9g16DHsW6S5a/89ihoxfKiVeH7Ef+6NzxyFmTD2YMJUJw/hKB3D
	IEFDdDo//fQ3Gi4g7w0kOc7FGC32nSA2FRxGY+HEBky2jSKmMzJRqLfC8z3r1OqhKk3e0vUkN//Ji
	s8hJGrhk/hlFdddqEw0w==;
Content-Disposition: inline
In-Reply-To: <7300f0af-b532-5546-a6f4-fec69cb91a0f@oracle.com>
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
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Will Deacon <will.deacon@arm.com>, Paul Mackerras <paulus@samba.org>, Shawn Guo <shawnguo@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, suzuki.poulose@arm.com, Sascha Hauer <s.hauer@pengutronix.de>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Andrew Murray <andrew.murray@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>, jgross@suse.com, robin.murphy@arm.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org

On Tue, Jan 08, 2019 at 11:36:33AM -0500, Boris Ostrovsky wrote:
> On 1/8/19 5:48 AM, Peter Zijlstra wrote:

> > On the various exclude options; they are as follows (IIUC):
> >
> >   - exclude_guest: we're a HV/host-kernel and we don't want the counter
> >                    to run when we run a guest context.
> >
> >   - exclude_host: we're a HV/host-kernel and we don't want the counter
> >                   to run when we run in host context.
> >
> >   - exclude_hv: we're a guest and don't want the counter to run in HV
> >                 context.
> >
> > Now, KVM always implies exclude_hv afaict (for guests), I'm not sure
> > what, if anything Xen does on x86 (IIRC Brendan Gregg once said perf
> > works on Xen) -- nor quite sure who to ask, Boris, Jeurgen?
> 
> perf does work inside guests.
> 
> VPMU is managed by the Xen and it presents to the guest only samples
> that are associated with the guest. So from that perspective exclude_hv
> doesn't seem to be needed.
> 
> There is a VPMU mode that allows profiling whole system (host and
> guests) from dom0, and this where exclude_hv might be useful. But this
> mode, ahem, needs some work.

Thanks Boris!
