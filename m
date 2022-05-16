From: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Date: Mon, 16 May 2022 12:06:17 -0300
Message-ID: <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com> <YoJZVZl/MH0KiE/J@alley>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=x8rylV2fo2RhFyw7lXZ7iRi1TUSl/qSAgQ1QFQa6Swk=; b=feXctn9xVfAtMOxpqtYyQ3CA85
        BjdcLwwe8TiMsRw2fUykvtPuvzY6hmKnTuAYE+A0XsmmVYSLQ/kcthiUMBKg0mNjJ1yc4l+lLSsmf
        USmCbBkmQnOZm2iGOSrx6Rl0cCpZ73ILK767ZxXmwm6a3QHv/+OS7mfra0PYCo9fNU1O9VQyfm4pw
        6HrCZSPKvKswSfp/Eu6sagLk3Urn9HpvONKk/wFmV32LKFF9WaILoOgpFS5qfU8S7XCa8c/aUXIoQ
        86eaCmPOCcjnQf8OfgMGzWfOoSFt/jwGca1nP55u94yjF/tPVCKn3Ik3vagLqYanseWDcV4ZXGkRO
        T9pShFk 
Content-Language: en-US
In-Reply-To: <YoJZVZl/MH0KiE/J@alley>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>, David Gow <davidgow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, rcu-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-dev-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org, kernel-WeLdAqEWwDvk1uMJSBkQmQ@public.gmane.org, halves-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, fabiomirmar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alejandro.j.jimenez-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, andriy.shevche

Thanks for the review!

I agree with the blinking stuff, I can rework and add all LED/blinking
stuff into the loop list, it does make sense. I'll comment a bit in the
others below...

On 16/05/2022 11:01, Petr Mladek wrote:
> [...]
>> --- a/arch/mips/sgi-ip22/ip22-reset.c
>> +++ b/arch/mips/sgi-ip22/ip22-reset.c
>> @@ -195,7 +195,7 @@ static int __init reboot_setup(void)
>>  	}
>>  
>>  	timer_setup(&blink_timer, blink_timeout, 0);
>> -	atomic_notifier_chain_register(&panic_notifier_list, &panic_block);
>> +	atomic_notifier_chain_register(&panic_hypervisor_list, &panic_block);
> 
> This notifier enables blinking. It is not much safe. It calls
> mod_timer() that takes a lock internally.
> 
> This kind of functionality should go into the last list called
> before panic() enters the infinite loop. IMHO, all the blinking
> stuff should go there.
> [...] 
>> --- a/arch/mips/sgi-ip32/ip32-reset.c
>> +++ b/arch/mips/sgi-ip32/ip32-reset.c
>> @@ -145,7 +144,7 @@ static __init int ip32_reboot_setup(void)
>>  	pm_power_off = ip32_machine_halt;
>>  
>>  	timer_setup(&blink_timer, blink_timeout, 0);
>> -	atomic_notifier_chain_register(&panic_notifier_list, &panic_block);
>> +	atomic_notifier_chain_register(&panic_hypervisor_list, &panic_block);
> 
> Same here. Should be done only before the "loop".
> [...] 

Ack.


>> --- a/drivers/firmware/google/gsmi.c
>> +++ b/drivers/firmware/google/gsmi.c
>> @@ -1034,7 +1034,7 @@ static __init int gsmi_init(void)
>>  
>>  	register_reboot_notifier(&gsmi_reboot_notifier);
>>  	register_die_notifier(&gsmi_die_notifier);
>> -	atomic_notifier_chain_register(&panic_notifier_list,
>> +	atomic_notifier_chain_register(&panic_hypervisor_list,
>>  				       &gsmi_panic_notifier);
> 
> I am not sure about this one. It looks like some logging or
> pre_reboot stuff.
> 

Disagree here. I'm looping Google maintainers, so they can comment.
(CCed Evan, David, Julius)

This notifier is clearly a hypervisor notification mechanism. I've fixed
a locking stuff there (in previous patch), I feel it's low-risk but even
if it's mid-risk, the class of such callback remains a perfect fit with
the hypervisor list IMHO.


> [...] 
>> --- a/drivers/leds/trigger/ledtrig-activity.c
>> +++ b/drivers/leds/trigger/ledtrig-activity.c
>> @@ -247,7 +247,7 @@ static int __init activity_init(void)
>>  	int rc = led_trigger_register(&activity_led_trigger);
>>  
>>  	if (!rc) {
>> -		atomic_notifier_chain_register(&panic_notifier_list,
>> +		atomic_notifier_chain_register(&panic_hypervisor_list,
>>  					       &activity_panic_nb);
> 
> The notifier is trivial. It just sets a variable.
> 
> But still, it is about blinking and should be done
> in the last "loop" list.
> 
> 
>>  		register_reboot_notifier(&activity_reboot_nb);
>>  	}
>> --- a/drivers/leds/trigger/ledtrig-heartbeat.c
>> +++ b/drivers/leds/trigger/ledtrig-heartbeat.c
>> @@ -190,7 +190,7 @@ static int __init heartbeat_trig_init(void)
>>  	int rc = led_trigger_register(&heartbeat_led_trigger);
>>  
>>  	if (!rc) {
>> -		atomic_notifier_chain_register(&panic_notifier_list,
>> +		atomic_notifier_chain_register(&panic_hypervisor_list,
>>  					       &heartbeat_panic_nb);
> 
> Same here. Blinking => loop list.

Ack.


>> [...]
>> diff --git a/drivers/misc/bcm-vk/bcm_vk_dev.c b/drivers/misc/bcm-vk/bcm_vk_dev.c
>> index a16b99bdaa13..d9d5199cdb2b 100644
>> --- a/drivers/misc/bcm-vk/bcm_vk_dev.c
>> +++ b/drivers/misc/bcm-vk/bcm_vk_dev.c
>> @@ -1446,7 +1446,7 @@ static int bcm_vk_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  
>>  	/* register for panic notifier */
>>  	vk->panic_nb.notifier_call = bcm_vk_on_panic;
>> -	err = atomic_notifier_chain_register(&panic_notifier_list,
>> +	err = atomic_notifier_chain_register(&panic_hypervisor_list,
>>  					     &vk->panic_nb);
> 
> It seems to reset some hardware or so. IMHO, it should go into the
> pre-reboot list.

Mixed feelings here, I'm looping Broadcom maintainers to comment.
(CC Scott and Broadcom list)

I'm afraid it breaks kdump if this device is not reset beforehand - it's
a doorbell write, so not high risk I think...

But in case the not-reset device can be probed normally in kdump kernel,
then I'm fine in moving this to the reboot list! I don't have the HW to
test myself.


> [...]
>> --- a/drivers/power/reset/ltc2952-poweroff.c
>> +++ b/drivers/power/reset/ltc2952-poweroff.c
>> @@ -279,7 +279,7 @@ static int ltc2952_poweroff_probe(struct platform_device *pdev)
>>  	pm_power_off = ltc2952_poweroff_kill;
>>  
>>  	data->panic_notifier.notifier_call = ltc2952_poweroff_notify_panic;
>> -	atomic_notifier_chain_register(&panic_notifier_list,
>> +	atomic_notifier_chain_register(&panic_hypervisor_list,
>>  				       &data->panic_notifier);
> 
> I looks like this somehow triggers the reboot. IMHO, it should go
> into the pre_reboot list.

Mixed feeling again here - CCing the maintainers for comments (Sebastian
/ PM folks).

This is setting a variable only, and once it's set (data->kernel_panic
is the bool's name), it just bails out the IRQ handler and a timer
setting - this timer seems kinda tricky, so bailing out ASAP makes sense
IMHO.

But my mixed feeling comes from the fact this notifier really is not a
fit to any list - it's just a "watchdog"/device quiesce in some form.
Since it's very low-risk (IIUC), I've put it here.


> [...]
>> --- a/drivers/soc/bcm/brcmstb/pm/pm-arm.c
>> +++ b/drivers/soc/bcm/brcmstb/pm/pm-arm.c
>> @@ -814,7 +814,7 @@ static int brcmstb_pm_probe(struct platform_device *pdev)
>>  		goto out;
>>  	}
>>  
>> -	atomic_notifier_chain_register(&panic_notifier_list,
>> +	atomic_notifier_chain_register(&panic_hypervisor_list,
>>  				       &brcmstb_pm_panic_nb);
> 
> I am not sure about this one. It instruct some HW to preserve DRAM.
> IMHO, it better fits into pre_reboot category but I do not have
> strong opinion.

Disagree here, I'm CCing Florian for information.

This notifier preserves RAM so it's *very interesting* if we have
kmsg_dump() for example, but maybe might be also relevant in case kdump
kernel is configured to store something in a persistent RAM (then,
without this notifier, after kdump reboots the system data would be lost).

Cheers,


Guilherme
