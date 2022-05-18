From: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Date: Wed, 18 May 2022 10:16:20 -0300
Message-ID: <fbbd0a8d-2ef4-4a39-4b75-354918e85778@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com> <YoJZVZl/MH0KiE/J@alley>
 <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com> <YoOpyW1+q+Z5as78@alley>
 <YoSnGmBJ3kYs5WMf@alley>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=OR5WoGq1CiBDAgHBnMc6HRC3gZH7AlGvCLosZhpaTuo=; b=TbYUoDwLrw469UplQy2vOqzaUT
        pf9sYNhexiBEPGvwhLTHv/6lRpXHwZ6JfGGGGlsulYDVL6Ab6bTmmTfDu2arTCnucsnl3GTbcEJxy
        upUnjbTokylG1GlBlNoIFnEYhQoJuUa0AZWIVQLFFH54ECZKBuEMlIuh1SegIV664GotghzpLED+P
        tR0zE2dTdCcBKJ1ysKdatz+cCxii4k2F+OmNsFrEsRpmHW6NOWBwJw1oxdcsL+W3TvLq2ZgOX3GYp
        M0Pw2BUK0uK+s/Hb66H/45XrhqyaGuP4iDdvJd10W7kvlAK6+nwFNgEfr5ANXylTesYuPYEKJpUan
        NoQkEgF 
Content-Language: en-US
In-Reply-To: <YoSnGmBJ3kYs5WMf@alley>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>
Cc: David Gow <davidgow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org

On 18/05/2022 04:58, Petr Mladek wrote:
> [...]
>> I does similar things like kmsg_dump() so it should be called in
>> the same location (after info notifier list and before kdump).
>>
>> A solution might be to put it at these notifiers at the very
>> end of the "info" list or make extra "dump" notifier list.
> 
> I just want to point out that the above idea has problems.
> Notifiers storing kernel log need to be treated as kmsg_dump().
> In particular, we would  need to know if there are any.
> We do not need to call "info" notifier list before kdump
> when there is no kernel log dumper registered.
> 

Notifiers respect the priority concept, which is just a number that
orders the list addition (and the list is called in order).

I've used the last position to panic_print() [in patch 25] - one idea
here is to "reserve" the last position (represented by INT_MIN) for
notifiers that act like kmsg_dump(). I couldn't find any IIRC, but that
doesn't prevent us to save this position and comment about that.

Makes sense to you ?
Cheers!
