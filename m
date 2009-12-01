From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: Wire up missing/new syscalls
Date: Mon, 30 Nov 2009 23:08:51 -0500
Message-ID: <b4198de60911302008g5c25c9f3id36fe3748ad7d666@mail.gmail.com>
References: <20091021164431.6193d96b@buddha>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=IWn/6rakBpmVaxzA1GCNE0ZhpmAuseXoKOQFRQzW00Y=;
        b=m63YgZkYyG/cwWJUn6QMbQ6aZpvgjg8W4TbZAujseuDjUCQUGwAGOW62K4eQ/2YPfi
         eQ4kpDigSV1WzW1o3P8P5FCxjxb84aRR68Ultgn3/hbgyqKpmLjd3p0RVT0zSfzdgR+y
         dWHiNNs1RxYBi23IEAAvr4/vMCqz+cqcwhBdI=
In-Reply-To: <20091021164431.6193d96b@buddha>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Daniele Calore <orkaan@orkaan.org>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 21, 2009 at 9:44 AM, Daniele Calore <orkaan@orkaan.org> wro=
te:
> This wire up the: fallocate, timerfd_create, timerfd_settime, timerfd=
_gettime
> signalfd4, eventfd2, epoll_create1, dup3, pipe2, inotify_init1, pread=
v,
> pwritev and rt_tgsigqueueinfo syscalls for the alpha port.
>
> For umount2, alpha have an "old" and "new" version called: oldumount =
and umount;
> so ignore umount2.
>
> Signed-off-by: Daniele Calore <orkaan@orkaan.org>
>
> ---
> diff --git a/arch/alpha/include/asm/unistd.h b/arch/alpha/include/asm=
/unistd.h
> index 5b5c174..17f72b7 100644
> --- a/arch/alpha/include/asm/unistd.h
> +++ b/arch/alpha/include/asm/unistd.h
> @@ -247,6 +247,7 @@
> =A0#define __IGNORE_pause
> =A0#define __IGNORE_time
> =A0#define __IGNORE_utime
> +#define __IGNORE_umount2
>
> =A0/*
> =A0* Linux-specific system calls begin at 300
> @@ -433,10 +434,23 @@
> =A0#define __NR_signalfd =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0476
> =A0#define __NR_timerfd =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 477
> =A0#define __NR_eventfd =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 478
> +#define __NR_fallocate =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 479
> +#define __NR_timerfd_create =A0 =A0 =A0 =A0 =A0 =A0480
> +#define __NR_timerfd_settime =A0 =A0 =A0 =A0 =A0 481
> +#define __NR_timerfd_gettime =A0 =A0 =A0 =A0 =A0 482
> +#define __NR_signalfd4 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 483
> +#define __NR_eventfd2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0484
> +#define __NR_epoll_create1 =A0 =A0 =A0 =A0 =A0 =A0 485
> +#define __NR_dup3 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0486
> +#define __NR_pipe2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 487
> +#define __NR_inotify_init1 =A0 =A0 =A0 =A0 =A0 =A0 488
> +#define __NR_preadv =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0489
> +#define __NR_pwritev =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 490
> +#define __NR_rt_tgsigqueueinfo =A0 =A0 =A0 =A0 491
>
> =A0#ifdef __KERNEL__
>
> -#define NR_SYSCALLS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0479
> +#define NR_SYSCALLS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0492
>
> =A0#define __ARCH_WANT_IPC_PARSE_VERSION
> =A0#define __ARCH_WANT_OLD_READDIR
> diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.=
S
> index 95c9aef..78199b9 100644
> --- a/arch/alpha/kernel/systbls.S
> +++ b/arch/alpha/kernel/systbls.S
> @@ -495,8 +495,21 @@ sys_call_table:
> =A0 =A0 =A0 =A0.quad sys_epoll_pwait
> =A0 =A0 =A0 =A0.quad sys_utimensat =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 /* 475 */
> =A0 =A0 =A0 =A0.quad sys_signalfd
> - =A0 =A0 =A0 .quad sys_ni_syscall
> + =A0 =A0 =A0 .quad sys_ni_syscall =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0/* sys_timerfd */
> =A0 =A0 =A0 =A0.quad sys_eventfd
> + =A0 =A0 =A0 .quad sys_fallocate
> + =A0 =A0 =A0 .quad sys_timerfd_create =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
/* 480 */
> + =A0 =A0 =A0 .quad sys_timerfd_settime
> + =A0 =A0 =A0 .quad sys_timerfd_gettime
> + =A0 =A0 =A0 .quad sys_signalfd4
> + =A0 =A0 =A0 .quad sys_eventfd2
> + =A0 =A0 =A0 .quad sys_epoll_create1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 /* 485 */
> + =A0 =A0 =A0 .quad sys_dup3
> + =A0 =A0 =A0 .quad sys_pipe2
> + =A0 =A0 =A0 .quad sys_inotify_init1
> + =A0 =A0 =A0 .quad sys_preadv
> + =A0 =A0 =A0 .quad sys_pwritev =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 /* 490 */
> + =A0 =A0 =A0 .quad sys_rt_tgsigqueueinfo
>
> =A0 =A0 =A0 =A0.size sys_call_table, . - sys_call_table
> =A0 =A0 =A0 =A0.type sys_call_table, @object
> --

Applied to alpha-2.6.git. Thanks!

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
