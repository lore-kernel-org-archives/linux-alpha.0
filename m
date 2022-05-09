From: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 24/30] panic: Refactor the panic path
Date: Mon, 9 May 2022 11:25:06 -0300
Message-ID: <260dccd8-a4f6-882c-8767-5bc27576df14@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com>
 <4fe85e9c-4e96-e9d5-9fd8-f062bafcda4f@infradead.org>
 <7518924e-5bb4-e6e9-0e3e-3f5cb03bf946@igalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
        Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=P7ItdBTC+KXB0aqEwbSMXisX2R2Wb9V+tpF+BUJ3fMQ=; b=afqWOj15+1L7ZOehgz4TDp3T9b
        MarVdwm0LTk8+i9B4YSy7xFp7vHwG1/w4WbfDff1U5lUjMxS0vk2DRuV0fJ7wbVLLeaMw89VjYM5x
        WVJwpPzVyva0X5NmUi/i4nuSyMS2YeO8WasLcgi1Y8xImc6fOPpwaaWR9ocIpTn6nZEFaqdopezXx
        OHjXA1hjw9QuPDRbTOoKOwl5vTqszrquVcmDp1xGYYzEdEOTzOi8SiNmSxJjEIE9o/SJMrBbQG4MO
        b+UdR8rUhoog9dM2StftHOG35g7VaJwxTPUyd5VBoTJ128N6lfMi0IgW+WU1FzuWQA7pga9h2J0Nf
        78MmVTa 
Content-Language: en-US
In-Reply-To: <7518924e-5bb4-e6e9-0e3e-3f5cb03bf946-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, rcu-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-dev-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org, kernel-WeLdAqEWwDvk1uMJSBkQmQ@public.gmane.org, halves-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, fabiomirmar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alejandro.j.jimenez

On 29/04/2022 13:04, Guilherme G. Piccoli wrote:
> On 27/04/2022 21:28, Randy Dunlap wrote:
>>
>>
>> On 4/27/22 15:49, Guilherme G. Piccoli wrote:
>>> +	crash_kexec_post_notifiers
>>> +			This was DEPRECATED - users should always prefer the
>>
>> 			This is DEPRECATED - users should always prefer the
>>
>>> +			parameter "panic_notifiers_level" - check its entry
>>> +			in this documentation for details on how it works.
>>> +			Setting this parameter is exactly the same as setting
>>> +			"panic_notifiers_level=4".
>>
> 
> Thanks Randy, for your suggestion - but I confess I couldn't understand
> it properly. It's related to spaces/tabs, right? What you suggest me to
> change in this formatting? Just by looking the email I can't parse.
> 
> Cheers,
> 
> 
> Guilherme

Complete lack of attention from me, apologies!
The suggestions was s/was/is - already fixed for V2, thanks Randy.
