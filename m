From: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 20/30] panic: Add the panic informational notifier list
Date: Mon, 16 May 2022 11:28:10 -0300
Message-ID: <c6a55df0-11f5-21ae-8a61-b37141d2436b@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-21-gpiccoli@igalia.com> <YoJbeuTNBXOIypSH@alley>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=dr1+fxlRa10p1m+vrzAuj1y5TNI2rJf4d/f63MyjB+M=; b=fYzY4ecO4EXD3ATClVXmZ0bJur
        Dv8wK0czHKvUOBFU8VuldwMBw90SyqpgmdhMVGQ8nXO736KAANyIsoQXQP33B+3yyoD0JCNk+aqdE
        wV4BChThAKeGVlTD0SJGL4Vxo4e8WEaw/u07Aef0GJ4zliM2Txb1MiVoO17nGrOaES7KtCdKD9gb0
        sGHl/FYmvmjU5t6Sh9/lpO3xyoHOnkZh2Wlu5eWU81axQTiGRY/vWICGCkOGZAWHyJcpjaIpuAOez
        xXU+abi85zQz75A1GTgWOD+LFSEreERO76kWgkEOfnkbC3cJ3TOsglz2ZOZKp2XuFNlT0F2Yx1p5e
        +2fZkv1 
Content-Language: en-US
In-Reply-To: <YoJbeuTNBXOIypSH@alley>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, rcu-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-dev-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org, kernel-WeLdAqEWwDvk1uMJSBkQmQ@public.gmane.org, halves-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, fabiomirmar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alejandro.j

On 16/05/2022 11:11, Petr Mladek wrote:
> [...]
> 
> All notifiers moved in this patch seems to fit well the "info"
> notifier list. The patch looks good from this POV.
> 
> I still have to review the rest of the patches to see if it
> is complete.
> 
> Best Regards,
> Petr

Thanks a bunch for the review =)
