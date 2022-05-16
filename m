From: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Date: Mon, 16 May 2022 13:33:51 -0300
Message-ID: <e895ce94-e6b9-caf6-e5d3-06bf0149445c@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com> <YoJgcC8c6LaKADZV@alley>
 <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
 <bed66b9467254a5a8bafc1983dad643a@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=XzoH5iutkh5O9t0pH+ypA1lIfMmiHtlRHdYp+UCsrGU=; b=WepOMKgEKhpR+t0vOgpE/YwZDW
        g57IfgGh3nzpJ2ZtHEZUcsTnwsDP6I2/FDZ4vnLGZ0Qw7F/Mn84yHkJf4BXJ/OpxzJ1p70t/N3EaQ
        3PmdLprDUfYS48zPyb3blZ6UPVVkXH0bl8D3dn+A0vPKMKqgzgV2PkJylwkbN3xzE2jIxJLk5t9Xh
        Ean6ag10EMxBmLMIVJGXD8wgUW7usVSQYiFjIPvG61RcLN+veFIRifMeScPdiuTNjKo2kRxG2B83U
        8p8XJXLR0CD8m0oqdI8PKIctIPo5el7u/X3BJM63/kcmCM4vsP6tEoNCn+7qkwfuh6KJplRNa4LRS
        5jGHUhP 
Content-Language: en-US
In-Reply-To: <bed66b9467254a5a8bafc1983dad643a-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Luck, Tony" <tony.luck-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org" <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux

On 16/05/2022 13:18, Luck, Tony wrote:
>> [...]
> Would it be possible to have some global "kdump is configured + enabled" flag?
> 
> Then notifiers could make an informed choice on whether to deep dive to
> get all the possible details (when there is no kdump) or just skim the high
> level stuff (to maximize chance of getting a successful kdump).
> 
> -Tony

Good idea Tony! What if I wire a kexec_crash_loaded() in the notifier?

With that, are you/Petr/Dinh OK in moving it for the info list?
Cheers,


Guilherme
