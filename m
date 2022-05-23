From: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Date: Mon, 23 May 2022 11:56:12 -0300
Message-ID: <0fac8c71-6f18-d15c-23f5-075dbc45f3f9@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com> <YoJZVZl/MH0KiE/J@alley>
 <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com> <YoOpyW1+q+Z5as78@alley>
 <d72b9aab-675c-ac89-b73a-b1de4a0b722d@igalia.com>
 <81878a67-21f1-fee8-1add-f381bc8b05df@broadcom.com>
 <edbaa4fa-561c-6f5e-f2ab-43ae68acaede@igalia.com>
 <d1cc0bee-2a98-0c2e-8796-6fb7fae6b803@broadcom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=keKJrvyQ/+r75XOnYYRl19FO+VGyiPJcwICfZxDBkqs=; b=O+C3jDB0Vwu4Y/gkTmW/RCmTwy
        kNqD2emzzlOs/8A7J1xO/TSH5qapt6sCckUwfqeKLJwoCrpUi4pUQfOKCsbI70QtSFMdfNTmFr+H0
        NXT6Oh9iPuG4hVKz84ZvxHpmEirVLNSMQMza54o3VmB+D23FpdTtf7JnpYZ61zk10z8NLp053Dtmb
        5G5TvLT8W+VF+imYpIQccZx+LAQHhkmqjWgwAULVFomENEWSpKhN5UeAVPt+Y1vZC04/4FyRoMtUE
        OHqcld4S4ftUjXzRb6CJS95k+7T+FIlHKMRNj13Qcs75Xk/j3Ix2WaTpEwsP72+2bzr+hEFsSu6v0
        WUJ5ifA 
Content-Language: en-US
In-Reply-To: <d1cc0bee-2a98-0c2e-8796-6fb7fae6b803-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Desmond yan <desmond.yan-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: David Gow <davidgow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, rcu-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel@li

On 19/05/2022 16:20, Scott Branden wrote:
> [...] 
>> Hi Scott / Desmond, thanks for the detailed answer! Is this adapter
>> designed to run in x86 only or you have other architectures' use cases?
> The adapter may be used in any PCIe design that supports DMA.
> So it may be possible to run in arm64 servers.
>>
>> [...]
>> With that said, and given this is a lightweight notifier that ideally
>> should run ASAP, I'd keep this one in the hypervisor list. We can
>> "adjust" the semantic of this list to include lightweight notifiers that
>> reset adapters.
> Sounds the best to keep system operating as tested today.
>>
>> With that said, Petr has a point - not always such list is going to be
>> called before kdump. So, that makes me think in another idea: what if we
>> have another list, but not on panic path, but instead in the custom
>> crash_shutdown()? Drivers could add callbacks there that must execute
>> before kexec/kdump, no matter what.
> It may be beneficial for some other drivers but for our use we would 
> then need to register for the panic path and the crash_shutdown path. 
> We notify the VK card for 2 purposes: one to stop DMA so memory stop 
> changing during a kdump.  And also to get the card into a good state so 
> resets happen cleanly.

Thanks Scott! With that, I guess it's really better to keep this
notifier in this hypervisor/early list - I'm planning to do that for V2.
Unless Petr or somebody has strong feelings against that, of course.

Cheers,


Guilherme
