From: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 11/30] um: Improve panic notifiers consistency and
 ordering
Date: Sun, 15 May 2022 19:12:55 -0300
Message-ID: <178a456d-3961-9bc2-83d2-2b9457d45fbd@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-12-gpiccoli@igalia.com> <Ynp2hRodh04K3pzK@alley>
 <4b003501-f5c3-cd66-d222-88d98c93e141@igalia.com>
 <1760d499824f9ef053af7a8dac04b48ab7d7fd3d.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YHVcpMpwO8nyb8k3/FdyFSCMjS4nrs3MtFW4fah9gBU=; b=or/Fp90JrKe5WlMtL6cMgrtDTd
        KlQ8Vj1tprmMn4SD+c397HC1ukULCsTvCB4iLkFWE/e5eO3HFfAEwKhrKkKAtUd9klk2EZdbn6mIN
        Qd+4SALGR19YAeq7zzTYslQNi14hCF7XYTbP7jST+WF88j+/yFKclHfwZStwWLlezXivWrxaH8IdO
        FFInQai4LoqHg4Is254olZSUcp3WbX0NojyrclkAFtXk81MOkLDyQLJPvTXx/jJ5o9GkRAlJzHqhs
        Xl4VBJVpr4ONcW/qU5LapKJAeqGhxtirFucuu9tYQZm2MIj3QsWcao7mjJyCDthsv8RdX0nMP6hLP
        SN2gr77 
Content-Language: en-US
In-Reply-To: <1760d499824f9ef053af7a8dac04b48ab7d7fd3d.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>, Anton Ivanov <anton.ivanov-eaSgp5hN2EAtwqFdIEgyzdBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, rcu-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-dev-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org, kernel-WeLdAqEWwDvk1uMJSBkQmQ@public.gmane.org, halves-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, fabiomirmar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alejandro.j

On 13/05/2022 11:44, Johannes Berg wrote:
> [...]
>> Maybe Anton / Johannes / Richard could give their opinions - appreciate
>> that, I'm not attached to the priority here, it's more about users'
>> common usage of UML I can think of...
> 
> It's hard to say ... In a sense I'm not sure it matters?
> 
> OTOH something like the ftrace dump notifier (kernel/trace/trace.c)
> might still be useful to run before the mconsole and coredump ones, even
> if you could probably use gdb to figure out the information.
> 
> Personally, I don't have a scenario where I'd care about the trace
> buffers though, and most of the others I found would seem irrelevant
> (drivers that aren't even compiled, hung tasks won't really happen since
> we exit immediately, and similar.)
> 
> johannes

Thanks Johannes, I agree with you.

We don't have great ordering now, one thing we need to enforce is the
order between the 2 UML notifiers, and this patch is doing that..trying
to order against other callbacks like the ftrace dumper is messy in the
current code.

OTOH if this patch set is accepted at some point, we'll likely have 3
lists, and with that we can improve ordering a lot - this notifier for
instance would run in the pre-reboot list, *after* the ftrace dumper (if
a kmsg dumper is set).

So, my intention is to keep this patch as is for V2 (with some changes
Johannes suggested before), unless Petr or the other maintainers want
something different.
Cheers,


Guilherme
