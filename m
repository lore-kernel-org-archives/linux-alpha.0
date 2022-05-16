From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 25/30] panic, printk: Add console flush parameter and
 convert panic_print to a notifier
Date: Mon, 16 May 2022 16:56:41 +0200
Message-ID: <YoJmKYLzPZqCDDim@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-26-gpiccoli@igalia.com>
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
	t=1652713009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oTDrZeo/UdLI29Tuaw8mlcdG/RkPgJLQM7cePAnlqRg=;
	b=qMST7ia3BcKl3UtC1W2uQ0qkLBJP5Q7YC0oT0Qsb2KbEzU3Or4Q8r5PYsshuphM/GEHsx/
	3TbgfR0/0E5XpsXnd9OyJN2pbUs6sglf0Hs/rZTi2wLDZTO2OOnHvkd7qA4fAmNZA1vdry
	3XHA87WfjJ2L5kh4VZznBS1IZ/1m/S0=
Content-Disposition: inline
In-Reply-To: <20220427224924.592546-26-gpiccoli@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, andriy.shev

On Wed 2022-04-27 19:49:19, Guilherme G. Piccoli wrote:
> Currently the parameter "panic_print" relies in a function called
> directly on panic path; one of the flags the users can set for
> panic_print triggers a console replay mechanism, to show the
> entire kernel log buffer (from the beginning) in a panic event.
> 
> Two problems with that: the dual nature of the panic_print
> isn't really appropriate, the function was originally meant
> to allow users dumping system information on panic events,
> and was "overridden" to also force a console flush of the full
> kernel log buffer. It also turns the code a bit more complex
> and duplicate than it needs to be.
> 
> This patch proposes 2 changes: first, we decouple panic_print
> from the console flushing mechanism, in the form of a new kernel
> core parameter (panic_console_replay); we kept the functionality
> on panic_print to avoid userspace breakage, although we comment
> in both code and documentation that this panic_print usage is
> deprecated.
> 
> We converted panic_print function to a panic notifier too, adding
> it on the panic informational notifier list, executed as the final
> callback. This allows a more clear code and makes sense, as
> panic_print_sys_info() is really a panic-time only function.
> We also moved its code to kernel/printk.c, it seems to make more
> sense given it's related to printing stuff.

I really like both changes. Just please split it them into two
patchset. I mean one patch for the new "panic_console_replay"
parameter and 2nd that moves "printk_info" into the notifier.

Best Regards,
Petr

