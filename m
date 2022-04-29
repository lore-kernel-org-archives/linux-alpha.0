From: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Date: Fri, 29 Apr 2022 12:18:29 -0300
Message-ID: <31248811-d3ed-63dd-e255-c3be07fb1434@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com>
 <20220428162616.GE442787@minyard.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=PkGMRtr7ZOpuAUYdkK5YcnBWQgNByIkM+TF/PhPSt00=; b=McsgIEmWszU/NtZ864aphbd05/
        AA+Hs7uyIJtJtMr4867fKRnrcDZ/B0ve7meILjRDqPYrpj2SCcZq87R4becMzN/EmmpSkGxa2bXfq
        pUhMsFJRA7hiMl/hulL8uwaQ3NgTviAzyrP9F3cuPytnlSXUcQgJY1SVDx/EfT4PyEI3blubrtgBl
        Y/qFy6eJFuUH765RC4uiwWYgWdDuIIe2xttNarhTtSLeO0f5vFGPmxPe8sb1rSPH9MLQ8MhCgLKVk
        8Yh9XWbluokYf/vW7/yQXLp3HdC2BoK3CBL6+DlGPNeddie6sMCK3FiVbeA/PpCZCA2PeX8k9qatt
        P0Tqe4T 
Content-Language: en-US
In-Reply-To: <20220428162616.GE442787-cSpEYAXvYQ3R7s880joybQ@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: minyard-HInyCGIudOg@public.gmane.org, elder-EkmVulN54Sk@public.gmane.org, Alex Elder <elder-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, cminyard-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, pmladek-IBi9RG/b67k@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, rcu-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-dev-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org, kernel-WeLdAqEWwDvk1uMJSBkQmQ@public.gmane.org, halves-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, fabiomirmar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

On 28/04/2022 13:26, Corey Minyard wrote:
> [...]
> 
> For the IPMI portion:
> 
> Acked-by: Corey Minyard <cminyard-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>

Thanks Alex and Corey for the ACKs!

> 
> Note that the IPMI panic_event() should always return, but it may take
> some time, especially if the IPMI controller is no longer functional.
> So the risk of a long delay is there and it makes sense to move it very
> late.
> 

Thanks, I agree - the patch moves it to the (latest - 1) position, since
some arch code might run as the latest and effectively stops the machine.
Cheers,


Guilherme
