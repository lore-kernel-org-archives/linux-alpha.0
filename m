From: Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Date: Wed, 18 May 2022 09:33:57 +0200
Message-ID: <YoShZVYNAdvvjb7z@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com>
 <YoJZVZl/MH0KiE/J@alley>
 <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com>
 <CAE=gft7ds+dHfEkRz8rnSH1EbTpGTpKbi5Wxj9DW0Jr5mX_j4w@mail.gmail.com>
 <YoOi9PFK/JnNwH+D@alley>
 <b9ec2fc8-216f-f261-8417-77b6dd95e25c@igalia.com>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652859243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YR5rOhmSURb4d/IKXy5VZg8z1ImD01Us4xBpVFtyoqU=;
        b=apiSUoAwUbqeAccPNQ19K+RPeAfjpiC+Kw09kP9gYD08Bjqn9sy6l8W4iwyq6IQeI6Aplp
        +YIfJeRJqbcdQptzveOcUb8Q0R7nuJcbMiyUrGxQWxZdDf/W1Ubmr612J8Zmj7lPwrkx5l
        wG1cTFsW35nAwzkY9hs+1GgrMVmINpw=
Content-Disposition: inline
In-Reply-To: <b9ec2fc8-216f-f261-8417-77b6dd95e25c-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
Cc: Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gow <davidgow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux PM <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue 2022-05-17 13:37:58, Guilherme G. Piccoli wrote:
> On 17/05/2022 10:28, Petr Mladek wrote:
> > [...]
> >>> Disagree here. I'm looping Google maintainers, so they can comment.
> >>> (CCed Evan, David, Julius)
> >>>
> >>> This notifier is clearly a hypervisor notification mechanism. I've fixed
> >>> a locking stuff there (in previous patch), I feel it's low-risk but even
> >>> if it's mid-risk, the class of such callback remains a perfect fit with
> >>> the hypervisor list IMHO.
> >>
> >> This logs a panic to our "eventlog", a tiny logging area in SPI flash
> >> for critical and power-related events. In some cases this ends up
 > >> being the only clue we get in a Chromebook feedback report that a
> >> panic occurred, so from my perspective moving it to the front of the
> >> line seems like a good idea.
> > 
> > IMHO, this would really better fit into the pre-reboot notifier list:
> > 
> >    + the callback stores the log so it is similar to kmsg_dump()
> >      or console_flush_on_panic()
> > 
> >    + the callback should be proceed after "info" notifiers
> >      that might add some other useful information.
> > 
> > Honestly, I am not sure what exactly hypervisor callbacks do. But I
> > think that they do not try to extract the kernel log because they
> > would need to handle the internal format.
> > 
> 
> I guess the main point in your response is : "I am not sure what exactly
> hypervisor callbacks do". We need to be sure about the semantics of such
> list, and agree on that.
> 
> So, my opinion about this first list, that we call "hypervisor list",
> is: it contains callbacks that
> 
> (1) should run early, preferably before kdump (or even if kdump isn't
> set, should run ASAP);
> 
> (2) these callbacks perform some communication with an abstraction that
> runs "below" the kernel, like a firmware or hypervisor. Classic example:
> pvpanic, that communicates with VMM (usually qemu) and allow such VMM to
> snapshot the full guest memory, for example.
> 
> (3) Should be low-risk. What defines risk is the level of reliability of
> subsequent operations - if the callback have 50% of chance of "bricking"
> the system totally and prevent kdump / kmsg_dump() / reboot , this is
> high risk one for example.
> 
> Some good fits IMO: pvpanic, sstate_panic_event() [sparc], fadump in
> powerpc, etc.
> 
> So, this is a good case for the Google notifier as well - it's not
> collecting data like the dmesg (hence your second bullet seems to not
> apply here, info notifiers won't add info to be collected by gsmi). It
> is a firmware/hypervisor/whatever-gsmi-is notification mechanism, that
> tells such "lower" abstraction a panic occurred. It seems low risk and
> we want it to run ASAP, if possible.

" 
> >> This logs a panic to our "eventlog", a tiny logging area in SPI flash
> >> for critical and power-related events. In some cases this ends up

I see. I somehow assumed that it was about the kernel log because
Evans wrote:

  "This logs a panic to our "eventlog", a tiny logging area in SPI flash
   for critical and power-related events. In some cases this ends up"


Anyway, I would distinguish it the following way.

  + If the notifier is preserving kernel log then it should be ideally
    treated as kmsg_dump().

  + It the notifier is saving another debugging data then it better
    fits into the "hypervisor" notifier list.


Regarding the reliability. From my POV, any panic notifier enabled
in a generic kernel should be reliable with more than 99,9%.
Otherwise, they should not be in the notifier list at all.

An exception would be a platform-specific notifier that is
called only on some specific platform and developers maintaining
this platform agree on this.

The value "99,9%" is arbitrary. I am not sure if it is realistic
even in the other code, for example, console_flush_on_panic()
or emergency_restart(). I just want to point out that the border
should be rather high. Otherwise we would back in the situation
where people would want to disable particular notifiers.

Best Regards,
Petr
