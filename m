From: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 04/30] firmware: google: Convert regular spinlock into
 trylock on panic path
Date: Wed, 4 May 2022 09:45:31 -0300
Message-ID: <9581851d-6c61-a2ef-a3c4-6e2ce05eab12@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-5-gpiccoli@igalia.com>
 <CAE=gft5Pq25L4KFoPWbftkPF-JN1ex2yws77mMJ4GQnn9W0L2g@mail.gmail.com>
 <adcf6d0e-c37c-6ede-479e-29959d03d8c0@igalia.com>
 <CAE=gft623NxqetRssrZnaRmJLSP4BT5=-sVVwtYoHuspO_gULQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=UDxTzr/LbFPHIhZF1U36kLmGFtpbBGYhm6tD7CfQBjM=; b=KDrxDW8Mnr1qToRh0yGaDv25Fu
        TWpgQRScRF3dRjjU3pakegMZLqUHmycIdjATA6DbY60uPfya2zQOAwJ0e5erFJc5BJn7o3eV3sQ41
        Tox4yunn4/jA8a3IjyUJT/sI3KcoYtb2p2FNUwcMM3f1g/ex9W0DrY0odKixjZjudGtrtbA3G1JPw
        m7Nny7DVsQFLh+HpvU/q7Yc8/k1hRGwJeSWIAUBYmqnc5ZdThCMVxiKgVNOsyAMWZdrNHmIgXn40c
        w6AF2HzVr+D+OvvIusg4XzuOUWHoF2AYp44ZOOo2CAb1BDljEp1qf8qc23J8WoJ9sqhtbxFJxmFVB
        8aeUFBa 
Content-Language: en-US
In-Reply-To: <CAE=gft623NxqetRssrZnaRmJLSP4BT5=-sVVwtYoHuspO_gULQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, pmladek-IBi9RG/b67k@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux PM <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, rcu-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-dev-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org, kernel-WeLdAqEWwDvk1uMJSBkQmQ@public.gmane.org, halv

On 03/05/2022 18:56, Evan Green wrote:
> Hi Guilherme,
> [...] 
>> Do you agree with that, or prefer really a parameter in
>> gsmi_shutdown_reason() ? I'll follow your choice =)
> 
> I'm fine with either, thanks for the link. Mostly I want to make sure
> other paths to gsmi_shutdown_reason() aren't also converted to a try.

Hi Evan, thanks for the prompt response! So, I'll proceed like I did in
s390, for consistency.

> [...]
>> Reasoning: the problem with your example is that, by default, secondary
>> CPUs are disabled in the panic path, through an IPI mechanism. IPIs take
>> precedence and interrupt the work in these CPUs, effectively
>> interrupting the "polite work" with the lock held heh
> 
> The IPI can only interrupt a CPU with irqs disabled if the IPI is an
> NMI. I haven't looked before to see if we use NMI IPIs to corral the
> other CPUs on panic. On x86, I grepped my way down to
> native_stop_other_cpus(), which looks like it does a normal IPI, waits
> 1 second, then does an NMI IPI. So, if a secondary CPU has the lock
> held, on x86 it has roughly 1s to finish what it's doing and re-enable
> interrupts before smp_send_stop() brings the NMI hammer down. I think
> this should be more than enough time for the secondary CPU to get out
> and release the lock.
> 
> So then it makes sense to me that you're fixing cases where we
> panicked with the lock held, or hung with the lock held. Given the 1
> second grace period x86 gives us, I'm on board, as that helps mitigate
> the risk that we bailed out early with the try and should have spun a
> bit longer instead. Thanks.
> 
> -Evan

Well, in the old path without "crash_kexec_post_notifiers", we indeed
end-up relying on native_stop_other_cpus() for x86 as you said, and the
"1s rule" makes sense. But after this series (or even before, if the
kernel parameter "crash_kexec_post_notifiers" was used) the function
used to stop CPUs in the panic path is crash_smp_send_stop(), and the
call chain is like:

Main CPU:
crash_smp_send_stop()
--kdump_nmi_shootdown_cpus()
----nmi_shootdown_cpus()

Then, in each CPU (except the main one, running panic() path),
we execute kdump_nmi_callback() in NMI context.

So, we seem to indeed interrupt any context (even with IRQs disabled),
increasing the likelihood of the potential lockups due to stopped CPUs
holding the locks heheh

Thanks again for the good discussion, let me know if anything I'm saying
doesn't make sense - this crash path is a bit convoluted, specially in
x86, I might have understood something wrongly =)
Cheers,


Guilherme
