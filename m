From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v3 00/12] perf/core: Generalise event exclusion checking
Date: Fri, 7 Dec 2018 17:25:17 +0000
Message-ID: <20181207172516.GB2044@edgewater-inn.cambridge.arm.com>
References: <1544114849-47266-1-git-send-email-andrew.murray@arm.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544114849-47266-1-git-send-email-andrew.murray@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Murray <andrew.murray@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Russell King <linux@armlinux.org.uk>, suzuki.poulose@arm.com, robin.murphy@arm.com, Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org

On Thu, Dec 06, 2018 at 04:47:17PM +0000, Andrew Murray wrote:
> Many PMU drivers do not have the capability to exclude counting events
> that occur in specific contexts such as idle, kernel, guest, etc. These
> drivers indicate this by returning an error in their event_init upon
> testing the events attribute flags.
> 
> However this approach requires that each time a new event modifier is
> added to perf, all the perf drivers need to be modified to indicate that
> they don't support the attribute. This results in additional boiler-plate
> code common to many drivers that needs to be maintained. Furthermore the
> drivers are not consistent with regards to the error value they return
> when reporting unsupported attributes.
> 
> This patchset allow PMU drivers to advertise their inability to exclude
> based on context via a new capability: PERF_PMU_CAP_NO_EXCLUDE. This
> allows the perf core to reject requests for exclusion events where there
> is no support in the PMU.
> 
> This is a functional change, in particular:
> 
>  - Some drivers will now additionally (but correctly) report unsupported
>    exclusion flags. It's typical for existing userspace tools such as
>    perf to handle such errors by retrying the system call without the
>    unsupported flags.
> 
>  - Drivers that do not support any exclusion that previously reported
>    -EPERM or -EOPNOTSUPP will now report -EINVAL - this is consistent
>    with the majority and results in userspace perf retrying without
>    exclusion.
> 
> All drivers touched by this patchset have been compile tested.

For the bits under arch/arm/ and drivers/perf:

Acked-by: Will Deacon <will.deacon@arm.com>

Note that I've queued the TX2 uncore PMU for 4.21 [1], which could also
benefit from your new flag.

Will

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?h=for-next/perf&id=69c32972d59388c041268e8206e8eb1acff29b9a
