From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 10/30] alpha: Clean-up the panic notifier code
Date: Tue, 10 May 2022 16:16:06 +0200
Message-ID: <YnpzpkfuwzJYbPYj@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-11-gpiccoli@igalia.com>
 <f6def662-5742-b3a8-544f-bf15c636d83d@igalia.com>
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
	t=1652192171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A8/NZJeBAhTKLHLb3PoAvlXD/AvbEgaBaR5HXaRNdkM=;
	b=BeTzacf3mS4VoGHK6i1jVn2p93FIleajbiX/lqLZYQzEPT5BuEThdtby46ST2AJUboj/I/
	VqEG9r83Q4xijGW9lCE2hweKm6E7raa+vKstZ+w2OtTvG5P31Un3HT5rf7nvpJdK7CHBFy
	VZPQPYk1mnBdJ3vUcDiFbXkwBcjlkRU=
Content-Disposition: inline
In-Reply-To: <f6def662-5742-b3a8-544f-bf15c636d83d@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, rth@gcc.gnu.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, bhe@redhat.com, kexec@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.

On Mon 2022-05-09 11:13:17, Guilherme G. Piccoli wrote:
> On 27/04/2022 19:49, Guilherme G. Piccoli wrote:
> > The alpha panic notifier has some code issues, not following
> > the conventions of other notifiers. Also, it might halt the
> > machine but still it is set to run as early as possible, which
> > doesn't seem to be a good idea.

Yeah, it is pretty strange behavior.

I looked into the history. This notifier was added into the alpha code
in 2.4.0-test2pre2. In this historic code, the default panic() code
either rebooted after a timeout or ended in a infinite loop. There
was not crasdump at that times.

The notifier allowed to change the behavior. There were 3 notifiers:

   + mips and mips64 ended with blinking in panic()
   + alpha did __halt() in this srm case

They both still do this. I guess that it is some historic behavior
that people using these architectures are used to.

Anyway, it makes sense to do this as the last notifier after
dumping other information.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

