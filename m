From: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 02/30] ARM: kexec: Disable IRQs/FIQs also on crash CPUs
 shutdown path
Date: Fri, 29 Apr 2022 18:38:19 -0300
Message-ID: <71d829c4-b280-7d6e-647d-79a1baf9408b@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-3-gpiccoli@igalia.com> <87mtg392fm.wl-maz@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=zaZR6AionffdB1xNnJGX+2SLzxIRGHxmDTzkdAsF8Lw=; b=f2se15ohqCxFdZ9Cbwp90MFGzT
        jTOap9gxEPPT4aTyNt5E3ZHiiiT+V3lzyiVXivZvxSS+ElUToKTRjGns0j7W5gu+rUZwjHaY5hGeN
        otkXyAwqu6HD3avUoXVIxjGs+UlKUlBOe/StJroDKFugT/kZL7npThsCdsHpDWufEk+wh4fOOIDQw
        l7OyKb0Jm89RaQG7TSk5bTRs2tlRpACA1IvBqK2eiZLAu6g1+MyYc/cQwPm5SUuYLGV0bPXJdES3s
        lnyV4bPi3phdA0er49wiR1R3K1IMQcdtRi5k8Pou9s9nypOSId//IHiPuzLjmzkdZNlZyJjIhfVzV
        toxHByU 
Content-Language: en-US
In-Reply-To: <87mtg392fm.wl-maz-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc Zyngier <maz-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Michael Kelley (LINUX)" <mikelley-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, pmladek-IBi9RG/b67k@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, rcu-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-dev-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org, kernel-WeLdAqEWwDvk1uMJSBkQmQ@public.gmane.org, halves@c

Thanks Marc and Michael for the review/discussion.

On 29/04/2022 15:20, Marc Zyngier wrote:
> [...]

> My expectations would be that, since we're getting here using an IPI,
> interrupts are already masked. So what reenabled them the first place?
> 
> Thanks,
> 
> 	M.
> 

Marc, I did some investigation in the code (and tried/failed in the ARM
documentation as well heh), but this is still not 100% clear for me.

You're saying IPI calls disable IRQs/FIQs by default in the the target
CPUs? Where does it happen? I'm a bit confused if this a processor
mechanism, or it's in code.

Looking the smp_send_stop() in arch/arm/, it does IPI the CPUs, with the
flag IPI_CPU_STOP, eventually calling ipi_cpu_stop(), and the latter
does disable IRQ/FIQ in code - that's where I stole my code from.

But crash_smp_send_stop() is different, it seems to IPI the other CPUs
with the flag IPI_CALL_FUNC, which leads to calling
generic_smp_call_function_interrupt() - does it disable interrupts/FIQs
as well? I couldn't find it.

Appreciate your clarifications about that, thanks again.
Cheers,


Guilherme
