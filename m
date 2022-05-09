From: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 10/30] alpha: Clean-up the panic notifier code
Date: Mon, 9 May 2022 11:13:17 -0300
Message-ID: <f6def662-5742-b3a8-544f-bf15c636d83d@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-11-gpiccoli@igalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=21Vuf08H7s2roER44d4b0UgJl5trrJFyPVjW1sFjFZE=; b=ruDiqyoExl2jG8ttjj8Kva7F0Z
        0gmy1ZjUnSZw1kESJcz3XDyEnMdDBnsUYP/IGGe7AdFcEsabz8oUBo80VtrFGlI8cQnzWF9UlpBBK
        4aFG0PgEAjxrGpxgz2rOXDVYxrjQeGb+FiM0Mo8j9WOU5B7iKslK22FH7g8xu7/o+vhoBdIcLeTVq
        TXR8EZtHjX3vb/+hbwrFc/UcTSPrqLuaLvGSeO7jUEfo1fKsk4NXM02lMULpMgFIGTd5/R8izOFMK
        smJXU8ctgfXKSVE5XSrKVK5cDdrQAjusLpX81WYReyDmurYDvxkw6DQoXAKa1dqFr5Ui2vHbk0ezv
        WsObUf8 
Content-Language: en-US
In-Reply-To: <20220427224924.592546-11-gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rth-/MQLu3FmUzdAfugRpC6u6w@public.gmane.org
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pmladek-IBi9RG/b67k@public.gmane.org, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, rcu-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-dev-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org, kernel-WeLdAqEWwDvk1uMJSBkQmQ@public.gmane.org, halves-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, fabiomirmar@gmai

On 27/04/2022 19:49, Guilherme G. Piccoli wrote:
> The alpha panic notifier has some code issues, not following
> the conventions of other notifiers. Also, it might halt the
> machine but still it is set to run as early as possible, which
> doesn't seem to be a good idea.
> 
> This patch cleans the code, and set the notifier to run as the
> latest, following the same approach other architectures are doing.
> Also, we remove the unnecessary include of a header already
> included indirectly.
> 
> Cc: Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>
> Cc: Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/alpha/kernel/setup.c | 36 +++++++++++++++---------------------
>  1 file changed, 15 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
> index b4fbbba30aa2..d88bdf852753 100644
> --- a/arch/alpha/kernel/setup.c
> +++ b/arch/alpha/kernel/setup.c
> @@ -41,19 +41,11 @@
>  #include <linux/sysrq.h>
>  #include <linux/reboot.h>
>  #endif
> -#include <linux/notifier.h>
>  #include <asm/setup.h>
>  #include <asm/io.h>
>  #include <linux/log2.h>
>  #include <linux/export.h>
>  
> -static int alpha_panic_event(struct notifier_block *, unsigned long, void *);
> -static struct notifier_block alpha_panic_block = {
> -	alpha_panic_event,
> -        NULL,
> -        INT_MAX /* try to do it first */
> -};
> -
>  #include <linux/uaccess.h>
>  #include <asm/hwrpb.h>
>  #include <asm/dma.h>
> @@ -435,6 +427,21 @@ static const struct sysrq_key_op srm_sysrq_reboot_op = {
>  };
>  #endif
>  
> +static int alpha_panic_event(struct notifier_block *this,
> +			     unsigned long event, void *ptr)
> +{
> +	/* If we are using SRM and serial console, just hard halt here. */
> +	if (alpha_using_srm && srmcons_output)
> +		__halt();
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block alpha_panic_block = {
> +	.notifier_call = alpha_panic_event,
> +	.priority = INT_MIN, /* may not return, do it last */
> +};
> +
>  void __init
>  setup_arch(char **cmdline_p)
>  {
> @@ -1427,19 +1434,6 @@ const struct seq_operations cpuinfo_op = {
>  	.show	= show_cpuinfo,
>  };
>  
> -
> -static int
> -alpha_panic_event(struct notifier_block *this, unsigned long event, void *ptr)
> -{
> -#if 1
> -	/* FIXME FIXME FIXME */
> -	/* If we are using SRM and serial console, just hard halt here. */
> -	if (alpha_using_srm && srmcons_output)
> -		__halt();
> -#endif
> -        return NOTIFY_DONE;
> -}
> -
>  static __init int add_pcspkr(void)
>  {
>  	struct platform_device *pd;


Hi folks, I'm updating Richard's email and re-sending the V1, any
reviews are greatly appreciated!

Cheers,


Guilherme
