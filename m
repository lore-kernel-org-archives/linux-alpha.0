From: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 09/30] coresight: cpu-debug: Replace mutex with
 mutex_trylock on panic notifier
Date: Mon, 9 May 2022 10:09:21 -0300
Message-ID: <65f24bc5-2211-0139-ee12-b2608e81ceb1@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-10-gpiccoli@igalia.com>
 <3cafe4fd-8a0b-2633-44a3-2995abd6c38c@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=c6E44QfcLWCPcpfVVn8DZm/tazb9qDNjecxU8jgjjwM=; b=JQ1X+XDjDPRoAxPLkbe9tWes8w
        l11iC7oa/HVnyRK3qB7UvK9JEgQqPIREqD5654T0lMLes3kGheOm/R45s0nxu4hyBPxmCTVnzlJkN
        ZvlwDaZFuWVIh4IaLUzoP+QdJvpm215SH2+0rVomODoRdVpIAavgxOQl3rDnkTMN+fyPnfNOV7B7S
        PwRkKHJor0sF94EKnip9+x+OMSUvYBWlrOB2NiCodRGVM8ztswBp00gdyDLuMLY0TLuRV/nOMh+Z7
        dku4FKzrs/p9E3LkAgwz4nFi/oHL/EcQWXaMAdDUro5POIL0/IvuDCL2llWo8K6mm9F1PYJhGhMV8
        hibQS8t 
Content-Language: en-US
In-Reply-To: <3cafe4fd-8a0b-2633-44a3-2995abd6c38c-5wv7dgnIgG8@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, pmladek-IBi9RG/b67k@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, rcu-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-dev-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org, kernel-WeLdAqEWwDvk1uMJSBkQmQ@public.gmane.org, halves-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, fabiomirmar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alejandro.j.jimenez@ora

On 28/04/2022 05:11, Suzuki K Poulose wrote:
> Hi Guilherme,
> 
> On 27/04/2022 23:49, Guilherme G. Piccoli wrote:
>> The panic notifier infrastructure executes registered callbacks when
>> a panic event happens - such callbacks are executed in atomic context,
>> with interrupts and preemption disabled in the running CPU and all other
>> CPUs disabled. That said, mutexes in such context are not a good idea.
>>
>> This patch replaces a regular mutex with a mutex_trylock safer approach;
>> given the nature of the mutex used in the driver, it should be pretty
>> uncommon being unable to acquire such mutex in the panic path, hence
>> no functional change should be observed (and if it is, that would be
>> likely a deadlock with the regular mutex).
>>
>> Fixes: 2227b7c74634 ("coresight: add support for CPU debug module")
>> Cc: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
>> Signed-off-by: Guilherme G. Piccoli <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
> 
> How would you like to proceed with queuing this ? I am happy
> either way. In case you plan to push this as part of this
> series (I don't see any potential conflicts) :
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>

Hi Suzuki, some other maintainers are taking the patches to their next
branches for example. I'm working on V2, and I guess in the end would be
nice to reduce the size of the series a bit.

So, do you think you could pick this one for your coresight/next branch
(or even for rc cycle, your call - this is really a fix)?
This way, I won't re-submit this one in V2, since it's gonna be merged
already in your branch.

Thanks in advance,


Guilherme
