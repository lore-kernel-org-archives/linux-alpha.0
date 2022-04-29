From: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 13/30] s390/consoles: Improve panic notifiers reliability
Date: Fri, 29 Apr 2022 16:31:00 -0300
Message-ID: <039cdf14-efc5-383b-3f3d-294a5ed9243e@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-14-gpiccoli@igalia.com> <YmwyjMtT7QTZiHaa@osiris>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=juYOl8ucSjuSHKXBe+1Ir5OPZr6pZdgx66h4OReE1Ko=; b=pi8CeEHRcdz9D2M05lfyhONNOe
        Il5P/FNtKNDpfNnQvQkUO53LGYEhZ3HsOKcMT79tXUkEM7BDaPWYeiTRxruHlFJpgYZGLdkNZ+Vsx
        oyZivn3CQn+HYfOJsn02OXmy5/HYryfVse/FM/IqF31FwAMG26clpYwK7OV3zBWRhtbMoUne9k8x/
        cgyBslKy2FDshbzCm4dWwDcEIOqWM+BTXUAPCGsxBvDFlTKuVtiafdc18oTYk2LsBlxeiWqHf76sU
        fr20/x47wOCPaQYIMtyh+VGeHVXZk4bWHmVx7ebZUj8zme4Hs0U5M9F5U1lcdb0DAeivSR+YRjiw8
        sBGOVwO 
Content-Language: en-US
In-Reply-To: <YmwyjMtT7QTZiHaa@osiris>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Heiko Carstens <hca-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, pmladek-IBi9RG/b67k@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, rcu-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-dev-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org, kernel-WeLdAqEWwDvk1uMJSBkQmQ@public.gmane.org, halves-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, fabiomirmar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

On 29/04/2022 15:46, Heiko Carstens wrote:
> [...]
> 
> Code looks good, and everything still seems to work. I applied this
> internally for the time being, and if it passes testing, I'll schedule
> it for the next merge window.
> 
> Thanks!

Perfect Heiko, thanks a bunch for your review and tests!
Let me know if anything breaks heh
Cheers,


Guilherme
