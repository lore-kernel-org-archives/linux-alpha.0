From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Date: Tue, 3 May 2022 14:56:27 -0300
Message-ID: <dccb35f9-8fff-8b53-3b31-fbe55b2781c0@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com>
 <PH0PR21MB30256260CCF4CAB713BBB11ED7FC9@PH0PR21MB3025.namprd21.prod.outlook.com>
 <0147d038-571b-0802-c210-ccd4d52cd5dd@igalia.com>
 <PH0PR21MB30257E4E6E16BB8FFDE8F312D7C09@PH0PR21MB3025.namprd21.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=V5OlIrQZACaQuAvW/eyS6B/1Zwik+ew1I16AuySJnIg=; b=gjAznZuoR4/m9kKzzhqzuGrpkT
        xtMc6cJN1cBQNuGvg6XyrPFTI1ixzsXC2Qdeh+HpywC/rv8GnlBjcukr7ohfRrQ9c8Vv3g1C+degf
        BKLK1MQn4ihq1pQ2tLJ4K6bqakBNB70xc08nkdXZEPCNZh6tlfswNgMdLLmr3btmvO+ASGsTB1McO
        bjtFx1IEqa+FJgHwAOYextuGE9H3QAozC9Ow4n5OqOMhRYX1e/PE6FhaxFfCh6NihoHwyZzrtpHli
        GlpKhk1VLnB8Ef855kd7QLHnrR7/smJu3dr6Yo1GdqpDjEKpnWDlt7/NfiaCRZ690xo8EgxQrZVRx
        GY9vS48 
Content-Language: en-US
In-Reply-To: <PH0PR21MB30257E4E6E16BB8FFDE8F312D7C09@PH0PR21MB3025.namprd21.prod.outlook.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "bhe@redhat.com" <bhe@redhat.com>, "pmladek@suse.com" <pmladek@suse.com>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-tegra@vger.kernel.org" <li>

On 03/05/2022 14:44, Michael Kelley (LINUX) wrote:
> [...]
>>
>> Hi Michael, thanks for your feedback! I agree that your idea could work,
>> but...there is one downside: imagine the kmsg_dump() approach is not set
>> in some Hyper-V guest, then we would rely in the regular notification
>> mechanism [hv_die_panic_notify_crash()], right?
>> But...you want then to run this notifier in the informational list,
>> which...won't execute *by default* before kdump if no kmsg_dump() is
>> set. So, this logic is convoluted when you mix it with the default level
>> concept + kdump.
> 
> Yes, you are right.  But to me that speaks as much to the linkage
> between the informational list and kmsg_dump() being the core
> problem.  But as I described in my reply to Patch 24, I can live with
> the linkage as-is.

Thanks for the feedback Michael!

> [...] 
>> I feel the panic notification mechanism does really fit with a
>> hypervisor list, it's a good match with the nature of the list, which
>> aims at informing the panic notification to the hypervisor/FW.
>> Of course we can modify it if you prefer...but please take into account
>> the kdump case and how it complicates the logic.
> 
> I agree that the runtime effect of one list vs. the other is nil.  The
> code works and can stay as you written it.
> 
> I was trying to align from a conceptual standpoint.  It was a bit
> unexpected that one path would be on the hypervisor list, and the
> other path effectively on the informational list.  When I see
> conceptual mismatches like that, I tend to want to understand why,
> and if there is something more fundamental that is out-of-whack.
> 

Totally agree with you here, I am like that as well - try to really
understand the details, this is very important specially in this patch
set, since it's a refactor and affects every user of the notifiers
infrastructure.

Again, just to double-say it: feel free to suggest any change for the
Hyper-V portion (might as well for any patch in the series, indeed) -
you and the other Hyper-V maintainers own this code and I'd be glad to
align with your needs, you are honor citizens in the panic notifiers
area, being one the most heavy users for that =)

Cheers,


Guilherme
