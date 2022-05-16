From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 22/30] panic: Introduce the panic post-reboot notifier
 list
Date: Mon, 16 May 2022 16:45:56 +0200
Message-ID: <YoJjpBrz34QO+rn9@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-23-gpiccoli@igalia.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652712357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tG6HOQkoWV3PTxPtSaDR17RqhX4V9rIOdD2egRcz4EQ=;
        b=gFEwFsAV3UIKYYLVyI3mrLhX3TiIMpl9yPWRGPgk48WclnmFw5gYn5O+dNvzDdNjqF+pxI
        IMKpGcGZV7FxvMc95tVdofmJAGyq2tRsWSZoEHDpo+UshHGwcUByHkHpUxr0BHmW9i2Opl
        sUtunVb+gn6OV1DjkoM9JYfMJE7YMOM=
Content-Disposition: inline
In-Reply-To: <20220427224924.592546-23-gpiccoli@igalia.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net

On Wed 2022-04-27 19:49:16, Guilherme G. Piccoli wrote:
> Currently we have 3 notifier lists in the panic path, which will
> be wired in a way to allow the notifier callbacks to run in
> different moments at panic time, in a subsequent patch.
> 
> But there is also an odd set of architecture calls hardcoded in
> the end of panic path, after the restart machinery. They're
> responsible for late time tunings / events, like enabling a stop
> button (Sparc) or effectively stopping the machine (s390).
> 
> This patch introduces yet another notifier list to offer the
> architectures a way to add callbacks in such late moment on
> panic path without the need of ifdefs / hardcoded approaches.

The patch looks good to me. I would just suggest two changes.

1. I would rename the list to "panic_loop_list" instead of
   "panic_post_reboot_list".

   It will be more clear that it includes things that are
   needed before panic() enters the infinite loop.


2. I would move all the notifiers that enable blinking here.

   The blinking should be done only during the infinite
   loop when there is nothing else to do. If we enable
   earlier then it might disturb/break more important
   functionality (dumping information, reboot).

Best Regards,
Petr
