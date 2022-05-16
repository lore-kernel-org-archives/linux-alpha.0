From: Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>
Subject: Re: [PATCH 23/30] printk: kmsg_dump: Introduce helper to inform
 number of dumpers
Date: Mon, 16 May 2022 16:50:12 +0200
Message-ID: <YoJkpAp8XdS7ROgd@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-24-gpiccoli@igalia.com>
 <20220510134014.3923ccba@gandalf.local.home>
 <c8818906-f113-82b6-b58b-d47ae0c16b4f@igalia.com>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652712613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KQiIlBeAtlsgCeLOjjHzTpkuGh7+XAuIIUDB14idFd4=;
        b=S4QT9bHIulh2DX7+Td1E1eHZ8ylXqLGd87dgOU5qON7f0TC2viT1I31ABT9u1YFo+zVF7s
        CRf1jIcOXQaAUTOOLTnLyfyBeX0en2TY7mgyp7gvJnFWNhPu01YU8FRcK1p4/UGj8Io8lk
        XM2tY8ZdnQQ59J0fQXUB5igw6KG7gMQ=
Content-Disposition: inline
In-Reply-To: <c8818906-f113-82b6-b58b-d47ae0c16b4f-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
Cc: Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, rcu-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-dev-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org, kernel-WeLdAqEWwDvk1uMJSBkQmQ@public.gmane.org, halves@canonical.c

On Wed 2022-05-11 17:03:51, Guilherme G. Piccoli wrote:
> On 10/05/2022 14:40, Steven Rostedt wrote:
> > On Wed, 27 Apr 2022 19:49:17 -0300
> > "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org> wrote:
> > 
> >> Currently we don't have a way to check if there are dumpers set,
> >> except counting the list members maybe. This patch introduces a very
> >> simple helper to provide this information, by just keeping track of
> >> registered/unregistered kmsg dumpers. It's going to be used on the
> >> panic path in the subsequent patch.
> > 
> > FYI, it is considered "bad form" to reference in the change log "this
> > patch". We know this is a patch. The change log should just talk about what
> > is being done. So can you reword your change logs (you do this is almost
> > every patch). Here's what I would reword the above to be:
> > 
> >  Currently we don't have a way to check if there are dumpers set, except
> >  perhaps by counting the list members. Introduce a very simple helper to
> >  provide this information, by just keeping track of registered/unregistered
> >  kmsg dumpers. This will simplify the refactoring of the panic path.
> 
> Thanks for the hint, you're right - it's almost in all of my patches.
> I'll reword all of them (except the ones already merged) to remove this
> "bad form".

Shame on me that I do not care that much about the style of the commit
message :-)

Anyway, the code looks good to me. With the better commit message:

Reviewed-by: Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>

Best Regards,
Petr
