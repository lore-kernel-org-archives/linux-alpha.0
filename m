From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Date: Fri, 29 Apr 2022 09:04:39 -0700
Message-ID: <CAMo8BfKzA+oy-Qun9-aO3xCr4Jy_rfdjYqMX=W9xONCSX8O51Q@mail.gmail.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com> <20220427224924.592546-22-gpiccoli@igalia.com>
Mime-Version: 1.0
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MQcZ21ZXrJjtfh7JWVyd82OFreqrUf57vyzG9uXB95s=;
        b=NQuHjq75yTcETqoe5MFxchlZ/6p7R23s4Uh/eK6M8cjCLKjgK4aZLK94enM9k42z9z
         9olN5ZP+vAQmeXTs3TpSIt0NzvMdqABegG4qz96TEt/HS/xzZxrOdtT3s38HXa8rxQCC
         //y1nGWR49pl0bI4BXJikvhyEOuRN9x7yyhQG6wmlGrFanhXAWznrpMOX2TZU06+jYUn
         nIWU94QXvKkXMgCPv2tcj5gD6bKy2psqRCjrFUOKa8Bl/tDHLN4JOX0rshY1mFgS6Dj8
         yb9QNW2JBzYk707yzx4X/QadG8x7UesXEXLRQ21ibqXwVr/gFDYqh338pCxNErks0fTt
         i5PQ==
In-Reply-To: <20220427224924.592546-22-gpiccoli@igalia.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, bhe@redhat.com, Petr Mladek <pmladek@suse.com>, kexec@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390 <linux-s390@vger.kernel.org>, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, netdev <netdev@vger.kern>

On Wed, Apr 27, 2022 at 3:55 PM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> This patch renames the panic_notifier_list to panic_pre_reboot_list;
> the idea is that a subsequent patch will refactor the panic path
> in order to better split the notifiers, running some of them very
> early, some of them not so early [but still before kmsg_dump()] and
> finally, the rest should execute late, after kdump. The latter ones
> are now in the panic pre-reboot list - the name comes from the idea
> that these notifiers execute before panic() attempts rebooting the
> machine (if that option is set).
>
> We also took the opportunity to clean-up useless header inclusions,
> improve some notifier block declarations (e.g. in ibmasm/heartbeat.c)
> and more important, change some priorities - we hereby set 2 notifiers
> to run late in the list [iss_panic_event() and the IPMI panic_event()]
> due to the risks they offer (may not return, for example).
> Proper documentation is going to be provided in a subsequent patch,
> that effectively refactors the panic path.

[...]

>  arch/xtensa/platforms/iss/setup.c     |  4 ++--For xtensa:

For xtensa:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
