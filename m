From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Date: Wed, 18 May 2022 09:58:18 +0200
Message-ID: <YoSnGmBJ3kYs5WMf@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com>
 <YoJZVZl/MH0KiE/J@alley>
 <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com>
 <YoOpyW1+q+Z5as78@alley>
Mime-Version: 1.0
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652860701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QH8rZRpDaB1rKzYBSvbHTkuJfXIZgq5PPOEyov0S61g=;
	b=T0gGp12c0pU5b8b1i3GTuIGm3SeP3EhRpXPECQNn/enftlsKdapz4VZkfCcS2uIPqM17q+
	/PBA3AVHUNLBKEckN04LlFAw1RfXD18Ad2wMfhhColdg9InPjS0Cl4zZnO5bfZL0Ln9Soj
	5NqvLRJqL5BZI+4DmlPHTXzoYIVJS4o=
Content-Disposition: inline
In-Reply-To: <YoOpyW1+q+Z5as78@alley>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: David Gow <davidgow@google.com>, Evan Green <evgreen@chromium.org>, Julius Werner <jwerner@chromium.org>, Scott Branden <scott.branden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclin

On Tue 2022-05-17 15:57:34, Petr Mladek wrote:
> On Mon 2022-05-16 12:06:17, Guilherme G. Piccoli wrote:
> > >> --- a/drivers/soc/bcm/brcmstb/pm/pm-arm.c
> > >> +++ b/drivers/soc/bcm/brcmstb/pm/pm-arm.c
> > >> @@ -814,7 +814,7 @@ static int brcmstb_pm_probe(struct platform_device *pdev)
> > >>  		goto out;
> > >>  	}
> > >>  
> > >> -	atomic_notifier_chain_register(&panic_notifier_list,
> > >> +	atomic_notifier_chain_register(&panic_hypervisor_list,
> > >>  				       &brcmstb_pm_panic_nb);
> > > 
> > > I am not sure about this one. It instruct some HW to preserve DRAM.
> > > IMHO, it better fits into pre_reboot category but I do not have
> > > strong opinion.
> > 
> > Disagree here, I'm CCing Florian for information.
> > 
> > This notifier preserves RAM so it's *very interesting* if we have
> > kmsg_dump() for example, but maybe might be also relevant in case kdump
> > kernel is configured to store something in a persistent RAM (then,
> > without this notifier, after kdump reboots the system data would be lost).
> 
> I see. It is actually similar problem as with
> drivers/firmware/google/gsmi.c.

As discussed in the other other reply, it seems that both affected
notifiers do not store kernel logs and should stay in the "hypervisor".

> I does similar things like kmsg_dump() so it should be called in
> the same location (after info notifier list and before kdump).
>
> A solution might be to put it at these notifiers at the very
> end of the "info" list or make extra "dump" notifier list.

I just want to point out that the above idea has problems.
Notifiers storing kernel log need to be treated as kmsg_dump().
In particular, we would  need to know if there are any.
We do not need to call "info" notifier list before kdump
when there is no kernel log dumper registered.

Best Regards,
Petr

