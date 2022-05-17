From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Date: Tue, 17 May 2022 13:45:51 -0300
Message-ID: <599b72f6-76a4-8e6d-5432-56fb1ffd7e0b@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com> <YoJgcC8c6LaKADZV@alley>
 <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
 <bed66b9467254a5a8bafc1983dad643a@intel.com>
 <e895ce94-e6b9-caf6-e5d3-06bf0149445c@igalia.com> <YoOs9GJ5Ovq63u5Q@alley>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=SayoV/bDRPXgJ3Ch+E1XrP+3ZKBsDTlU6fUN8lp8tUA=; b=NFkpBbcNKXWz56FUYb1Bkzyxr7
        6pY/CyDxLh4gcyoAU547/3Tabh/NOqK7gz3NyBwq82xJqiEBF4takjF5Ea4MxM1+r5wku8pOVYUcB
        ywM/ZaJlNeBGlkQDKAAkvdKcd6hk5MAb9a5XNcjDCG3MlNSgk+v7vfXWUOesl/qG/NSZ4K/pjk0dM
        SubvLJBNURMO5WMoXdrxUQfhd0uSTHup7fDjOSHoKefOTjSKlQG/UGn8QEvdGVnYTtMgbwm4d3/K8
        B+J9kKyINLLhiDLqbwoDlrvd49iM915Hk5YhXi74qG93lapXX9eWm/gnnOawNxBPCH4bdsTvQIyr9
        Yagr/AQ 
Content-Language: en-US
In-Reply-To: <YoOs9GJ5Ovq63u5Q@alley>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Petr Mladek <pmladek@suse.com>, "Luck, Tony" <tony.luck@intel.com>, Dinh Nguyen <dinguyen@kernel.org>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "bhe@redhat.com" <bhe@redhat.com>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, linux

On 17/05/2022 11:11, Petr Mladek wrote:
> [...]
>>> Then notifiers could make an informed choice on whether to deep dive to
>>> get all the possible details (when there is no kdump) or just skim the high
>>> level stuff (to maximize chance of getting a successful kdump).
>>>
>>> -Tony
>>
>> Good idea Tony! What if I wire a kexec_crash_loaded() in the notifier?
> 
> I like this idea.
> 
> One small problem is that kexec_crash_loaded() has valid result
> only under kexec_mutex. On the other hand, it should stay true
> once loaded so that the small race window should be innocent.
> 
>> With that, are you/Petr/Dinh OK in moving it for the info list?
> 
> Sounds good to me.
> 
> Best Regards,
> Petr

Perfect, I'll do that for V2 then =)

Tony / Dinh - can I just *skip* this notifier *if kdump* is set or else
we run the code as-is? Does that make sense to you?

I'll postpone it to run almost in the end of info list (last position is
for panic_print).

Thanks,


Guilherme
