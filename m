From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 11/30] um: Improve panic notifiers consistency and
 ordering
Date: Wed, 11 May 2022 17:22:22 -0300
Message-ID: <4b003501-f5c3-cd66-d222-88d98c93e141@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-12-gpiccoli@igalia.com> <Ynp2hRodh04K3pzK@alley>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=LCKlEcL/+gLbho7zoJo89g9MDYx2GFkg8N7n1nlW+0g=; b=MQpyMZ3nMM+SlSF0Ic+7AggIHS
        wWCWxLFJNdpcNC/qKw1wNJR3uSo8xMkfiJlq7d2aikSbZG9yuq1pfGOyawWDcFgWnRsla4fbF455Y
        3RXCIUoMIO9o6uix81B+J++RZraHoxYIg5AFTEzg2KmNpXSrs7BEjvRicrp5TYhs6s3mYN27kkyAz
        njPDxaRSeQ75fkZPzqisnL9xIuav4szhmycF8VItK7avDyCoEE8U/Zs7xTZO8x+jizmxi0qGskMhG
        GsWdK7oyZ7kJDFhpPsgWAmAhF7aiE+T5aNpN2RQ5WYTzC7ql7jtRy3esjCfYNiJNCeB+2D6JHceeB
        Ayva3vz 
Content-Language: en-US
In-Reply-To: <Ynp2hRodh04K3pzK@alley>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Petr Mladek <pmladek@suse.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, Richard Weinberger <richard@nod.at>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j

On 10/05/2022 11:28, Petr Mladek wrote:
> [...]
> It is not clear to me why user mode linux should not care about
> the other notifiers. It might be because I do not know much
> about the user mode linux.
> 
> Is the because they always create core dump or are never running
> in a hypervisor or ...?
> 
> AFAIK, the notifiers do many different things. For example, there
> is a notifier that disables RCU watchdog, print some extra
> information. Why none of them make sense here?
>

Hi Petr, my understanding is that UML is a form of running Linux as a
regular userspace process for testing purposes. With that said, as soon
as we exit in the error path, less "pollution" would happen, so users
can use GDB to debug the core dump for example.

In later patches of this series (when we split the panic notifiers in 3
lists) these UML notifiers run in the pre-reboot list, so they run after
the informational notifiers for example (in the default level).
But without the list split we cannot order properly, so my gut feeling
is that makes sense to run them rather earlier than later in the panic
process...

Maybe Anton / Johannes / Richard could give their opinions - appreciate
that, I'm not attached to the priority here, it's more about users'
common usage of UML I can think of...

Cheers,


Guilherme
