From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH REPOST] alpha: Replace bogus in_interrupt()
Date: Sat, 14 Nov 2020 10:39:35 -0800
Message-ID: <20201114103935.6b7d0f55e2cd6dce536d304f@linux-foundation.org>
References: <20201113135832.2202833-1-bigeasy@linutronix.de>
        <20201113162535.92435b319c69b435f379ddbe@linux-foundation.org>
        <87o8k0icsr.fsf@depni.sinp.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605379176;
        bh=gKAwNLWav5Eg7IQnxrKeTRXqeDZpQaBu8bjAgQtXDO0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=1S+inGsCwRDTW3naJurs3oQAW++Ij9XarhAOHrOA2296cVIyD0tCo/xhzqCm0ha5v
         RnVYWXhP3dhXv3tnH/YF29a0uW8UZS7q2KigAtRwpEtQn7qI1p5radW9YSyo7ZlsxC
         tUvHiXL06YQQ7/O9BtuHDBXV3KLlDbeiOaAglq78=
In-Reply-To: <87o8k0icsr.fsf@depni.sinp.msu.ru>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Serge Belyshev <belyshev@depni.sinp.msu.ru>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-alpha@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

On Sat, 14 Nov 2020 11:05:08 +0300 Serge Belyshev <belyshev@depni.sinp.msu.ru> wrote:

> Andrew Morton <akpm@linux-foundation.org> writes:
> 
> > On Fri, 13 Nov 2020 14:58:32 +0100 Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
> >
> >> From: Thomas Gleixner <tglx@linutronix.de>
> >> 
> >> in_interrupt() is true for a variety of things including bottom half
> >> disabled regions. Deducing hard interrupt context from it is dubious at
> >> best.
> >> 
> >> Use in_irq() which is true if called in hard interrupt context. Otherwise
> >> calling irq_exit() would do more harm than good.
> >> 
> >
> > Gee, how to test it.  Does anyone run current kernels on alpha?
> 
> Hold my beer:
> 
> --- a/arch/alpha/kernel/process.c
> +++ b/arch/alpha/kernel/process.c
> @@ -134,8 +134,10 @@ common_shutdown_1(void *generic_ptr)
>  #ifdef CONFIG_DUMMY_CONSOLE
>                 /* If we've gotten here after SysRq-b, leave interrupt
>                    context before taking over the console. */
> -               if (in_irq())
> +               if (in_irq()) {
> +                       printk ("in_irq(): true\n");
>                         irq_exit();
> +               }
>                 /* This has the effect of resetting the VGA video origin.  */
>                 console_lock();
>                 do_take_over_console(&dummy_con, 0, MAX_NR_CONSOLES-1, 1);
> 
> 
> and then sysrq-b over serial console:
> 
> [   56.531250] sysrq: Resetting
> [   56.531250] in_irq(): true
> [   56.531250] Console: switching to colour dummy device 80x25
> 
> halted CPU 0
> 
> halt code = 5
> HALT instruction executed
> PC = fffffc0000310040
> Resetting I/O buses...
> >>>
> 
> Tested-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>

Thanks ;)

Here, have that beer back - I kept some for you.

