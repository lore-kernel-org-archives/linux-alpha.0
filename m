From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: Shift perf event pending work earlier in timer interrupt
Date: Sun, 19 Sep 2010 00:51:18 -0400
Message-ID: <AANLkTimoyT7KLtrNL3Wkvcxg1Da6-EdHP5MaKBbh0B1e@mail.gmail.com>
References: <1284861940-6571-1-git-send-email-mcree@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=qey6SAlEdY0Ej5WIwCgQpxxnJ2Y863ABT8Q5knZqUT8=;
        b=aM2NB9CZYBv3ppWBfw0wHxx/uamKbRZTE4xGLkdPA1f76dgfQh3TZAzO/92l3f1Peu
         jnB2KPm8GuDmjuCAzLeA3wKJHWowO1RhqYJwqoCw7XP4BU9vH2fHaR1DFCsJRmjCE/aY
         /VEWFfTBhApAzCPTBBv+3P6IlyXRrzMFPxfis=
In-Reply-To: <1284861940-6571-1-git-send-email-mcree@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, mingo@redhat.com, a.p.zijlstra@chello.nl, linux-alpha@vger.kernel.org

On Sat, Sep 18, 2010 at 10:05 PM, Michael Cree <mcree@orcon.net.nz> wro=
te:
> Pending work from the performance event subsystem is executed in
> the timer interrupt. =A0This patch shifts the call to
> perf_event_do_pending() before the call to update_process_times()
> as the latter may call back into the perf event subsystem and it
> is prudent to have the pending work executed first.
>
> Signed-off-by: Michael Cree <mcree@orcon.net.nz>
> ---
> =A0arch/alpha/kernel/time.c | =A0 10 +++++-----
> =A01 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/alpha/kernel/time.c b/arch/alpha/kernel/time.c
> index eacceb2..396af17 100644
> --- a/arch/alpha/kernel/time.c
> +++ b/arch/alpha/kernel/time.c
> @@ -191,16 +191,16 @@ irqreturn_t timer_interrupt(int irq, void *dev)
>
> =A0 =A0 =A0 =A0write_sequnlock(&xtime_lock);
>
> -#ifndef CONFIG_SMP
> - =A0 =A0 =A0 while (nticks--)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 update_process_times(user_mode(get_irq_=
regs()));
> -#endif
> -
> =A0 =A0 =A0 =A0if (test_perf_event_pending()) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clear_perf_event_pending();
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0perf_event_do_pending();
> =A0 =A0 =A0 =A0}
>
> +#ifndef CONFIG_SMP
> + =A0 =A0 =A0 while (nticks--)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 update_process_times(user_mode(get_irq_=
regs()));
> +#endif
> +
> =A0 =A0 =A0 =A0return IRQ_HANDLED;
> =A0}
>
> --
> 1.7.1

Thanks! Added to my tree and sent to Linus.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
