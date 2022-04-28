From: Alex Elder <elder@ieee.org>
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Date: Thu, 28 Apr 2022 09:13:19 -0500
Message-ID: <4cae140c-982a-6b9f-661c-4e0fdfa3297b@ieee.org>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bCT2JlxzOcDaE6ycYVbjB0p6hzfQxFS5OmPVl0XHT4A=;
        b=ByPVeKDwQRcuSB47O0Zefv/dFt5S0aRWMNs2oJF7maE4wXnsormuysnBE3KE+1D9p9
         PB3FB3BjkOR/97x+74MBqA5RA9WqHK53ukE6KnmiwNvHyxwXKz6iLxoZSM4bciItAhHz
         gddQYhhdQpsolBOdwDYZPGvNMFMyqb4ql/QD0=
Content-Language: en-US
In-Reply-To: <20220427224924.592546-22-gpiccoli@igalia.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@ora

On 4/27/22 5:49 PM, Guilherme G. Piccoli wrote:
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
> 
> Cc: Alex Elder <elder@kernel.org>

For "drivers/net/ipa/ipa_smp2p.c":

Acked-by: Alex Elder <elder@kernel.org>

> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Corey Minyard <minyard@acm.org>
> Cc: Dexuan Cui <decui@microsoft.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: "K. Y. Srinivasan" <kys@microsoft.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Robert Richter <rric@kernel.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Stephen Hemminger <sthemmin@microsoft.com>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Wei Liu <wei.liu@kernel.org>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
> 

. . .
