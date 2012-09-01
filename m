From: Josh Triplett <josh@joshtriplett.org>
Subject: Re: [PATCH tip/core/rcu 16/26] alpha: Add missing RCU idle APIs on
 idle loop
Date: Fri, 31 Aug 2012 17:00:56 -0700
Message-ID: <20120901000055.GN11771@jtriplet-mobl1>
References: <20120830210520.GA2824@linux.vnet.ibm.com>
 <1346360743-3628-1-git-send-email-paulmck@linux.vnet.ibm.com>
 <1346360743-3628-16-git-send-email-paulmck@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1346360743-3628-16-git-send-email-paulmck@linux.vnet.ibm.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, mingo@elte.hu, laijs@cn.fujitsu.com, dipankar@in.ibm.com, akpm@linux-foundation.org, mathieu.desnoyers@polymtl.ca, niv@us.ibm.com, tglx@linutronix.de, peterz@infradead.org, rostedt@goodmis.org, Valdis.Kletnieks@vt.edu, dhowells@redhat.com, eric.dumazet@gmail.com, darren@dvhart.com, fweisbec@gmail.com, sbw@mit.edu, patches@linaro.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Michael Cree <mcree@orcon.net.nz>, "3.2.x.." <stable@vger.kernel.org>

On Thu, Aug 30, 2012 at 02:05:33PM -0700, Paul E. McKenney wrote:
> From: Frederic Weisbecker <fweisbec@gmail.com>
> 
> In the old times, the whole idle task was considered
> as an RCU quiescent state. But as RCU became more and
> more successful overtime, some RCU read side critical
> section have been added even in the code of some
> architectures idle tasks, for tracing for example.
> 
> So nowadays, rcu_idle_enter() and rcu_idle_exit() must
> be called by the architecture to tell RCU about the part
> in the idle loop that doesn't make use of rcu read side
> critical sections, typically the part that puts the CPU
> in low power mode.
> 
> This is necessary for RCU to find the quiescent states in
> idle in order to complete grace periods.
> 
> Add this missing pair of calls in the Alpha's idle loop.
> 
> Reported-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: alpha <linux-alpha@vger.kernel.org>
> Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Cc: Michael Cree <mcree@orcon.net.nz>
> Cc: 3.2.x.. <stable@vger.kernel.org>

Reviewed-by: Josh Triplett <josh@joshtriplett.org>

>  arch/alpha/kernel/process.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
> index eac5e01..eb9558c 100644
> --- a/arch/alpha/kernel/process.c
> +++ b/arch/alpha/kernel/process.c
> @@ -28,6 +28,7 @@
>  #include <linux/tty.h>
>  #include <linux/console.h>
>  #include <linux/slab.h>
> +#include <linux/rcupdate.h>
>  
>  #include <asm/reg.h>
>  #include <asm/uaccess.h>
> @@ -54,9 +55,11 @@ cpu_idle(void)
>  		/* FIXME -- EV6 and LCA45 know how to power down
>  		   the CPU.  */
>  
> +		rcu_idle_enter();
>  		while (!need_resched())
>  			cpu_relax();
>  
> +		rcu_idle_exit();
>  		schedule_preempt_disabled();
>  	}
>  }
> -- 
> 1.7.8
> 
