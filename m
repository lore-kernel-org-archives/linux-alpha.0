From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 05/30] misc/pvpanic: Convert regular spinlock into
 trylock on panic path
Date: Tue, 10 May 2022 14:14:16 +0200
Message-ID: <YnpXGOXicwdy1E6n@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-6-gpiccoli@igalia.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652184859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=z0qCXGbgchboCgbitrJZObbFnXC/YqP7fhEXmnIw2vY=;
        b=OcxDFXmKKoVdDJUxSKREkD35h3cfh7L/UHzdGP/cbflejeipwrciY4AbOjnQu6DKNCs7aq
        Tea2QFXBj209QcyaHp7BuefH2IIusivsxr3vlgfi6p9lZaMFpVOppWn8lIP/+rweBZrcrm
        +Lwt8IUC7jK6VwI0ouYkElgPt01wPwE=
Content-Disposition: inline
In-Reply-To: <20220427224924.592546-6-gpiccoli@igalia.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net

On Wed 2022-04-27 19:48:59, Guilherme G. Piccoli wrote:
> The pvpanic driver relies on panic notifiers to execute a callback
> on panic event. Such function is executed in atomic context - the
> panic function disables local IRQs, preemption and all other CPUs
> that aren't running the panic code.
> 
> With that said, it's dangerous to use regular spinlocks in such path,
> as introduced by commit b3c0f8774668 ("misc/pvpanic: probe multiple instances").
> This patch fixes that by replacing regular spinlocks with the trylock
> safer approach.

It seems that the lock is used just to manipulating a list. A super
safe solution would be to use the rcu API: rcu_add_rcu() and
list_del_rcu() under rcu_read_lock(). The spin lock will not be
needed and the list will always be valid.

The advantage would be that it will always call members that
were successfully added earlier. That said, I am not familiar
with pvpanic and am not sure if it is worth it.

> It also fixes an old comment (about a long gone framebuffer code) and
> the notifier priority - we should execute hypervisor notifiers early,
> deferring this way the panic action to the hypervisor, as expected by
> the users that are setting up pvpanic.

This should be done in a separate patch. It changes the behavior.
Also there might be a discussion whether it really should be
the maximal priority.

Best Regards,
Petr
