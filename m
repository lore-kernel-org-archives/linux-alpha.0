From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH] alpha: fix crash if pthread_create races with signal
 delivery
Date: Wed, 3 Jan 2018 22:12:01 +1300
Message-ID: <20180103091201.fu6v5zjxsoru7ox5@tower>
References: <alpine.LRH.2.02.1801021400340.12797@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.1801021400340.12797@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jan 02, 2018 at 02:01:34PM -0500, Mikulas Patocka wrote:
> On alpha, a process will crash if it attempts to start a thread and a
> signal is delivered at the same time. The crash can be reproduced with
> this program: https://cygwin.com/ml/cygwin/2014-11/msg00473.html
> 
> The reason for the crash is this:
> * we call the clone syscall
> * we go to the function copy_process
> * copy process calls copy_thread_tls, it is a wrapper around copy_thread
> * copy_thread sets the tls pointer: childti->pcb.unique = regs->r20
> * copy_thread sets regs->r20 to zero
> * we go back to copy_process
> * copy process checks "if (signal_pending(current))" and returns
>   -ERESTARTNOINTR
> * the clone syscall is restarted, but this time, regs->r20 is zero, so
>   the new thread is created with zero tls pointer
> * the new thread crashes in start_thread when attempting to access tls
> 
> The comment in the code says that setting the register r20 is some
> compatibility with OSF/1. But OSF/1 doesn't use the CLONE_SETTLS flag, so
> we don't have to zero r20 if CLONE_SETTLS is set. This patch fixes the bug
> by zeroing regs->r20 only if CLONE_SETTLS is not set.

This bug was identified some three years ago; it triggers a failure
in the glibc nptl/tst-eintr3 test.  See:

https://marc.info/?l=linux-alpha&m=140610647213217&w=2

and a fix was proposed by RTH, namely:

https://marc.info/?l=linux-alpha&m=140675667715872&w=2

but was never included in the kernel because someone objected to
breaking the ability to run OSF/1 executables.  That patch also
deleted the line to set childregs->r20 to 1 which I mark below.

> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org
> 
> ---
>  arch/alpha/kernel/process.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Index: linux-stable/arch/alpha/kernel/process.c
> ===================================================================
> --- linux-stable.orig/arch/alpha/kernel/process.c	2017-12-31 17:42:12.000000000 +0100
> +++ linux-stable/arch/alpha/kernel/process.c	2018-01-02 18:06:24.000000000 +0100
> @@ -265,12 +265,13 @@ copy_thread(unsigned long clone_flags, u
>  	   application calling fork.  */
>  	if (clone_flags & CLONE_SETTLS)
>  		childti->pcb.unique = regs->r20;
> +	else
> +		regs->r20 = 0;	/* OSF/1 has some strange fork() semantics.  */
>  	childti->pcb.usp = usp ?: rdusp();
>  	*childregs = *regs;
>  	childregs->r0 = 0;
>  	childregs->r19 = 0;
>  	childregs->r20 = 1;	/* OSF/1 has some strange fork() semantics.  */

This line.  Is it not also problematic?

Cheers
Michael.

> -	regs->r20 = 0;
>  	stack = ((struct switch_stack *) regs) - 1;
>  	*childstack = *stack;
>  	childstack->r26 = (unsigned long) ret_from_fork;
> --
> To unsubscribe from this list: send the line "unsubscribe linux-alpha" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
