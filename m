From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] alpha: add support for TIF_NOTIFY_SIGNAL
Date: Thu, 5 Nov 2020 09:19:56 -0700
Message-ID: <1d7ff5d2-a44a-d968-1072-e2160200a6bf@kernel.dk>
References: <e04d1f77-9131-15b4-321a-ba0d9c22ff52@kernel.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=kXwLcH9t+0eJDCUNwZd4GJMyLTOultsm92dhCeYpXEg=;
        b=MJSznFJATOaoKOnfNI/7M/gh+pGJuGzkSCf8cEVaq8YkuLdRqAnO0xYqpnqyqeClL8
         P0LikcuE7xZExEAJuPU0pmGAA5/seTFJ293hlKGV/kTGpiAwa3I3ETHwu83juhaAXG3p
         XDWxTjLHp/AGY/m4gFTe+T5zIF9nozCEY5Bl0MGZYf2yrmEyksxe6DtoLqiUZKQy3u+7
         QWLk085VqYAVvgBKR5iRVph3HUNvFpM4LKRgEov3cX7IFzSrE5dy5vMFqmMarFbkB9lc
         FR0XOTGBT7G7dIeBTyCtLBGBJXaaTD6tNqGp/iTAshfkwEfoO+Z9q8fwG2UCjzgyLARx
         9epQ==
In-Reply-To: <e04d1f77-9131-15b4-321a-ba0d9c22ff52@kernel.dk>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org

Gentle nudge on this one.

On 10/29/20 10:00 AM, Jens Axboe wrote:
> Wire up TIF_NOTIFY_SIGNAL handling for alpha.
> 
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> ---
> 
> 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
> for details:
> 
> https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/
> 
> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
> as that will enable a set of cleanups once all of them support it. I'm
> happy carrying this patch if need be, or it can be funelled through the
> arch tree. Let me know.
> 
>  arch/alpha/include/asm/thread_info.h | 2 ++
>  arch/alpha/kernel/entry.S            | 2 +-
>  arch/alpha/kernel/signal.c           | 2 +-
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
> index 807d7b9a1860..2592356e3215 100644
> --- a/arch/alpha/include/asm/thread_info.h
> +++ b/arch/alpha/include/asm/thread_info.h
> @@ -62,6 +62,7 @@ register struct thread_info *__current_thread_info __asm__("$8");
>  #define TIF_SIGPENDING		2	/* signal pending */
>  #define TIF_NEED_RESCHED	3	/* rescheduling necessary */
>  #define TIF_SYSCALL_AUDIT	4	/* syscall audit active */
> +#define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
>  #define TIF_DIE_IF_KERNEL	9	/* dik recursion lock */
>  #define TIF_MEMDIE		13	/* is terminating due to OOM killer */
>  #define TIF_POLLING_NRFLAG	14	/* idle is polling for TIF_NEED_RESCHED */
> @@ -71,6 +72,7 @@ register struct thread_info *__current_thread_info __asm__("$8");
>  #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
>  #define _TIF_NOTIFY_RESUME	(1<<TIF_NOTIFY_RESUME)
>  #define _TIF_SYSCALL_AUDIT	(1<<TIF_SYSCALL_AUDIT)
> +#define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
>  #define _TIF_POLLING_NRFLAG	(1<<TIF_POLLING_NRFLAG)
>  
>  /* Work to do on interrupt/exception return.  */
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index 2e09248f8324..6a90d05cae1f 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -544,7 +544,7 @@ $ret_success:
>  	.align	4
>  	.type	work_pending, @function
>  work_pending:
> -	and	$17, _TIF_NOTIFY_RESUME | _TIF_SIGPENDING, $2
> +	and	$17, _TIF_NOTIFY_RESUME | _TIF_SIGPENDING, | _TIF_NOTIFY_SIGNAL, $2
>  	bne	$2, $work_notifysig
>  
>  $work_resched:
> diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
> index 3739efce1ec0..948b89789da8 100644
> --- a/arch/alpha/kernel/signal.c
> +++ b/arch/alpha/kernel/signal.c
> @@ -527,7 +527,7 @@ do_work_pending(struct pt_regs *regs, unsigned long thread_flags,
>  			schedule();
>  		} else {
>  			local_irq_enable();
> -			if (thread_flags & _TIF_SIGPENDING) {
> +			if (thread_flags & (_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)) {
>  				do_signal(regs, r0, r19);
>  				r0 = 0;
>  			} else {
> 


-- 
Jens Axboe

