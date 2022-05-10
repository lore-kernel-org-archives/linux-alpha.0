From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 15/30] bus: brcmstb_gisb: Clean-up panic/die notifiers
Date: Tue, 10 May 2022 17:28:40 +0200
Message-ID: <YnqEqDnMfUgC4dM6@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-16-gpiccoli@igalia.com>
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
	t=1652196522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e4wukkdgHyYEEL082h2+8MXPywOa6STdjbSVdRIKUGE=;
	b=rR4mS/+oT4jH07pNjBmARAg7zdRtaoeIif/UACNxEBTH30BjG7Bppc3qvkDfJRoCh4TawW
	6luoRejPAMFZr+z9Kvz9iubCA5AxZw1bIiLsMXPqeMDKaF9ra8TkGI7FOIFKW72kOoldt+
	xkdV40YW6dtF4zTHXKWuKX4kUttIYC0=
Content-Disposition: inline
In-Reply-To: <20220427224924.592546-16-gpiccoli@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, andriy.shev

On Wed 2022-04-27 19:49:09, Guilherme G. Piccoli wrote:
> This patch improves the panic/die notifiers in this driver by
> making use of a passed "id" instead of comparing pointer
> address; also, it removes an useless prototype declaration
> and unnecessary header inclusion.
> 
> This is part of a panic notifiers refactor - this notifier in
> the future will be moved to a new list, that encompass the
> information notifiers only.
> 
> --- a/drivers/bus/brcmstb_gisb.c
> +++ b/drivers/bus/brcmstb_gisb.c
> @@ -347,25 +346,14 @@ static irqreturn_t brcmstb_gisb_bp_handler(int irq, void *dev_id)
>  /*
>   * Dump out gisb errors on die or panic.
>   */
> -static int dump_gisb_error(struct notifier_block *self, unsigned long v,
> -			   void *p);
> -
> -static struct notifier_block gisb_die_notifier = {
> -	.notifier_call = dump_gisb_error,
> -};
> -
> -static struct notifier_block gisb_panic_notifier = {
> -	.notifier_call = dump_gisb_error,
> -};
> -
>  static int dump_gisb_error(struct notifier_block *self, unsigned long v,
>  			   void *p)
>  {
>  	struct brcmstb_gisb_arb_device *gdev;
> -	const char *reason = "panic";
> +	const char *reason = "die";
>  
> -	if (self == &gisb_die_notifier)
> -		reason = "die";
> +	if (v == PANIC_NOTIFIER)
> +		reason = "panic";

IMHO, the check of the @self parameter was the proper solution.

"gisb_die_notifier" list uses @val from enum die_val.
"gisb_panic_notifier" list uses @val from enum panic_notifier_val.

These are unrelated types. It might easily break when
someone defines the same constant also in enum die_val.

Best Regards,
Petr

