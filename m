From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Date: Fri, 29 Apr 2022 15:04:22 -0300
Message-ID: <0147d038-571b-0802-c210-ccd4d52cd5dd@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com>
 <PH0PR21MB30256260CCF4CAB713BBB11ED7FC9@PH0PR21MB3025.namprd21.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=CfgJSltNTETfm69VgWZeJ1xxMOJuVJJeVDaV1//hOM4=; b=slyIgXmeUq77MnrSUr5lBtJx9z
        m86cp15BT6gKICc3jCqWbY2B0tpa99u5bAed7DYYXL/rMf6XHJRMLSIrTGUcJCHpVtGl/+APLcmrh
        RXQpa9HZXWVydxhVU95+hp+ZiaA0uHFZXPx5zEc5qg8trUY5PT1GKrapnos8zeTpFOAoQJEAx9vvn
        efpqnWK3jhpJIbXy7DD12LOMiGnr6GupNgQCAiVUmjcrI2J6NMnifvEjcuVQUbIlOFxyQL8HlLyj5
        ydadfwYuZkTNnyuPFseli5ffoVSkxD0MS5bvuilrJblEdywU2jKWaFEjPPnVXRJf3ScYrp3fr3KhT
        ij4JQKS 
Content-Language: en-US
In-Reply-To: <PH0PR21MB30256260CCF4CAB713BBB11ED7FC9@PH0PR21MB3025.namprd21.prod.outlook.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "bhe@redhat.com" <bhe@redhat.com>, "pmladek@suse.com" <pmladek@suse.com>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-tegra@vger.kernel.org" <li>

On 29/04/2022 14:30, Michael Kelley (LINUX) wrote:
> From: Guilherme G. Piccoli <gpiccoli@igalia.com> Sent: Wednesday, April 27, 2022 3:49 PM
>> [...]
>>
>> @@ -2843,7 +2843,7 @@ static void __exit vmbus_exit(void)
>>  	if (ms_hyperv.misc_features & HV_FEATURE_GUEST_CRASH_MSR_AVAILABLE) {
>>  		kmsg_dump_unregister(&hv_kmsg_dumper);
>>  		unregister_die_notifier(&hyperv_die_report_block);
>> -		atomic_notifier_chain_unregister(&panic_notifier_list,
>> +		atomic_notifier_chain_unregister(&panic_hypervisor_list,
>>  						&hyperv_panic_report_block);
>>  	}
>>
> 
> Using the hypervisor_list here produces a bit of a mismatch.  In many cases
> this notifier will do nothing, and will defer to the kmsg_dump() mechanism
> to notify the hypervisor about the panic.   Running the kmsg_dump()
> mechanism is linked to the info_list, so I'm thinking the Hyper-V panic report
> notifier should be on the info_list as well.  That way the reporting behavior
> is triggered at the same point in the panic path regardless of which
> reporting mechanism is used.
> 

Hi Michael, thanks for your feedback! I agree that your idea could work,
but...there is one downside: imagine the kmsg_dump() approach is not set
in some Hyper-V guest, then we would rely in the regular notification
mechanism [hv_die_panic_notify_crash()], right?
But...you want then to run this notifier in the informational list,
which...won't execute *by default* before kdump if no kmsg_dump() is
set. So, this logic is convoluted when you mix it with the default level
concept + kdump.

May I suggest something? If possible, take a run with this patch set +
DEBUG_NOTIFIER=y, in *both* cases (with and without the kmsg_dump()
set). I did that and they run almost at the same time...I've checked the
notifiers called, it's like almost nothing runs in-between.

I feel the panic notification mechanism does really fit with a
hypervisor list, it's a good match with the nature of the list, which
aims at informing the panic notification to the hypervisor/FW.
Of course we can modify it if you prefer...but please take into account
the kdump case and how it complicates the logic.

Let me know your considerations, in case you can experiment with the
patch set as-is.
Cheers,


Guilherme
