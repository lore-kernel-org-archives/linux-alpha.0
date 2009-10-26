From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] [alpha] Add minimal support for software performance
	events.
Date: Mon, 26 Oct 2009 09:48:54 +0100
Message-ID: <20091026084854.GA26990@elte.hu>
References: <1256545926-6972-1-git-send-email-mcree@orcon.net.nz>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1256545926-6972-1-git-send-email-mcree@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>


* Michael Cree <mcree@orcon.net.nz> wrote:

> In the kernel the patch enables configuration of the perf event 
> option, adds the perf_event_open syscall, and includes a minimal 
> architecture specific asm/perf_event.h header file.
> 
> For the perf tool the patch implements an Alpha specific section
> in the perf.h header file and adjusts options used in the
> Makefile to allow compilation on Alpha.  The -Wcast-align gives
> a "cast increases required alignment of target type" warning for
> the list_for_each_entry() macro. The -fstack-protector-all
> option generates a "not supported for this target" warning which
> with -Werror causes the compiler to abort.
> 
> Signed-off-by: Michael Cree <mcree@orcon.net.nz>
> ---
>  arch/alpha/Kconfig                  |    1 +
>  arch/alpha/include/asm/perf_event.h |    9 +++++++++
>  arch/alpha/include/asm/unistd.h     |    3 ++-
>  arch/alpha/kernel/systbls.S         |    1 +
>  tools/perf/Makefile                 |    5 ++---
>  tools/perf/perf.h                   |    6 ++++++
>  6 files changed, 21 insertions(+), 4 deletions(-)
>  create mode 100644 arch/alpha/include/asm/perf_event.h

Nice!

I've picked up the perf.h bit in an independent commit. Is there a tree 
for Alpha bits?

This portion:

> --- a/tools/perf/Makefile
> +++ b/tools/perf/Makefile
> @@ -201,7 +200,7 @@ EXTRA_WARNINGS := $(EXTRA_WARNINGS) -Wold-style-definition
>  EXTRA_WARNINGS := $(EXTRA_WARNINGS) -Wstrict-prototypes
>  EXTRA_WARNINGS := $(EXTRA_WARNINGS) -Wdeclaration-after-statement
>  
> -CFLAGS = $(MBITS) -ggdb3 -Wall -Wextra -std=gnu99 -Werror -O6 -fstack-protector-all -D_FORTIFY_SOURCE=2 $(EXTRA_WARNINGS)
> +CFLAGS = $(MBITS) -ggdb3 -Wall -Wextra -std=gnu99 -Werror -O6 -D_FORTIFY_SOURCE=2 $(EXTRA_WARNINGS)
>  LDFLAGS = -lpthread -lrt -lelf -lm
>  ALL_CFLAGS = $(CFLAGS)
>  ALL_LDFLAGS = $(LDFLAGS)

Should be done not by removing the stack-protector build unconditionally 
- but by auto-testing whether stackprotector is supported by GCC and 
using it if yes.

Examples can be found n arch/x86/Makefile's use of 
scripts/gcc-*-has-stack-protector.sh.

Thanks,

	Ingo
