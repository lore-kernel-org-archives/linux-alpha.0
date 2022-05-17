From: Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Date: Tue, 17 May 2022 15:28:20 +0200
Message-ID: <YoOi9PFK/JnNwH+D@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com>
 <YoJZVZl/MH0KiE/J@alley>
 <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com>
 <CAE=gft7ds+dHfEkRz8rnSH1EbTpGTpKbi5Wxj9DW0Jr5mX_j4w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652794103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=m8eH28qbE+2Xy0DKW3X9feLJxxFiFeYxt7IWdkwBacU=;
        b=D3nbGBAQ9bCKnB1WwjJRY0SPMWZeGE7s6okektsDFoMjSCg4MWkDlGu0CaIrnv72L2dSjB
        TH4hbCd7WNPBQBo5APMhOgzqiXxMfJKdv72h+T8GhDipQ36bscz5ULSJq0aGA9QxAaz7ZE
        2DHOtfp4NZ3vqG8gLdmAnQza/SAFmg4=
Content-Disposition: inline
In-Reply-To: <CAE=gft7ds+dHfEkRz8rnSH1EbTpGTpKbi5Wxj9DW0Jr5mX_j4w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>, David Gow <davidgow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux PM <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegr

On Mon 2022-05-16 09:02:10, Evan Green wrote:
> On Mon, May 16, 2022 at 8:07 AM Guilherme G. Piccoli
> <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org> wrote:
> >
> > Thanks for the review!
> >
> > I agree with the blinking stuff, I can rework and add all LED/blinking
> > stuff into the loop list, it does make sense. I'll comment a bit in the
> > others below...
> >
> > On 16/05/2022 11:01, Petr Mladek wrote:
> > > [...]
> > >> --- a/arch/mips/sgi-ip22/ip22-reset.c
> > >> +++ b/arch/mips/sgi-ip22/ip22-reset.c
> > >> @@ -195,7 +195,7 @@ static int __init reboot_setup(void)
> > >>      }
> > >>
> > >>      timer_setup(&blink_timer, blink_timeout, 0);
> > >> -    atomic_notifier_chain_register(&panic_notifier_list, &panic_block);
> > >> +    atomic_notifier_chain_register(&panic_hypervisor_list, &panic_block);
> > >
> > > This notifier enables blinking. It is not much safe. It calls
> > > mod_timer() that takes a lock internally.
> > >
> > > This kind of functionality should go into the last list called
> > > before panic() enters the infinite loop. IMHO, all the blinking
> > > stuff should go there.
> > > [...]
> > >> --- a/arch/mips/sgi-ip32/ip32-reset.c
> > >> +++ b/arch/mips/sgi-ip32/ip32-reset.c
> > >> @@ -145,7 +144,7 @@ static __init int ip32_reboot_setup(void)
> > >>      pm_power_off = ip32_machine_halt;
> > >>
> > >>      timer_setup(&blink_timer, blink_timeout, 0);
> > >> -    atomic_notifier_chain_register(&panic_notifier_list, &panic_block);
> > >> +    atomic_notifier_chain_register(&panic_hypervisor_list, &panic_block);
> > >
> > > Same here. Should be done only before the "loop".
> > > [...]
> >
> > Ack.
> >
> >
> > >> --- a/drivers/firmware/google/gsmi.c
> > >> +++ b/drivers/firmware/google/gsmi.c
> > >> @@ -1034,7 +1034,7 @@ static __init int gsmi_init(void)
> > >>
> > >>      register_reboot_notifier(&gsmi_reboot_notifier);
> > >>      register_die_notifier(&gsmi_die_notifier);
> > >> -    atomic_notifier_chain_register(&panic_notifier_list,
> > >> +    atomic_notifier_chain_register(&panic_hypervisor_list,
> > >>                                     &gsmi_panic_notifier);
> > >
> > > I am not sure about this one. It looks like some logging or
> > > pre_reboot stuff.
> > >
> >
> > Disagree here. I'm looping Google maintainers, so they can comment.
> > (CCed Evan, David, Julius)
> >
> > This notifier is clearly a hypervisor notification mechanism. I've fixed
> > a locking stuff there (in previous patch), I feel it's low-risk but even
> > if it's mid-risk, the class of such callback remains a perfect fit with
> > the hypervisor list IMHO.
>
> This logs a panic to our "eventlog", a tiny logging area in SPI flash
> for critical and power-related events. In some cases this ends up
> being the only clue we get in a Chromebook feedback report that a
> panic occurred, so from my perspective moving it to the front of the
> line seems like a good idea.

IMHO, this would really better fit into the pre-reboot notifier list:

   + the callback stores the log so it is similar to kmsg_dump()
     or console_flush_on_panic()

   + the callback should be proceed after "info" notifiers
     that might add some other useful information.

Honestly, I am not sure what exactly hypervisor callbacks do. But I
think that they do not try to extract the kernel log because they
would need to handle the internal format.

Best Regards,
Petr
