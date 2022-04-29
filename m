From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: Re: [PATCH 17/30] tracing: Improve panic/die notifiers
Date: Fri, 29 Apr 2022 12:22:44 +0300
Message-ID: <b8771b37-01f5-f50b-dbb3-9db4ee26e67e@gmail.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-18-gpiccoli@igalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bhPxd6svpKOboxST/6guS4MOSMze/71rIJIgOQA8rZo=;
        b=CcHlI3Au6GCo1UVzpXVov/h1wYElTNB9KLySGMMq2ve/a+TtvK5YlNIE1buiqFG4Nl
         u/yJNPitTZt8sIeOJjB65Ui/1u355v1A2H7rivfKbBLHtHs+twE1aeJijeY6w74gk/C9
         beognAtlmiiMUVoRPY2P2xBjOD5kn8WzXajIeBHjp2IbcVFILkaLGvvcgQymLNFVLX7W
         O2NCAewH21dEqhwgYIy8zCJ1hXEDN8sGRLk/bc4Oj4c5AC8PD4Xjq19cf3SOi69El8Xe
         CE7Bw/RGpPKDZ+W4HqGQMjQxaF5kblB25nziyJo7yUSAzUuWVoHRSngnqULHAZHmFVOo
         K43A==
In-Reply-To: <20220427224924.592546-18-gpiccoli@igalia.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@ora

Hello!

On 4/28/22 1:49 AM, Guilherme G. Piccoli wrote:

> Currently the tracing dump_on_oops feature is implemented
> through separate notifiers, one for die/oops and the other
> for panic. With the addition of panic notifier "id", this
> patch makes use of such "id" to unify both functions.
> 
> It also comments the function and changes the priority of the
> notifier blocks, in order they run early compared to other
> notifiers, to prevent useless trace data (like the callback
> names for the other notifiers). Finally, we also removed an
> unnecessary header inclusion.
> 
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>  kernel/trace/trace.c | 57 +++++++++++++++++++++++++-------------------
>  1 file changed, 32 insertions(+), 25 deletions(-)
> 
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index f4de111fa18f..c1d8a3622ccc 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
[...]
> @@ -9767,38 +9766,46 @@ static __init int tracer_init_tracefs(void)
>  
>  fs_initcall(tracer_init_tracefs);
>  
> -static int trace_panic_handler(struct notifier_block *this,
> -			       unsigned long event, void *unused)
> +/*
> + * The idea is to execute the following die/panic callback early, in order
> + * to avoid showing irrelevant information in the trace (like other panic
> + * notifier functions); we are the 2nd to run, after hung_task/rcu_stall
> + * warnings get disabled (to prevent potential log flooding).
> + */
> +static int trace_die_panic_handler(struct notifier_block *self,
> +				unsigned long ev, void *unused)
>  {
> -	if (ftrace_dump_on_oops)
> +	int do_dump;

   bool?

> +
> +	if (!ftrace_dump_on_oops)
> +		return NOTIFY_DONE;
> +
> +	switch (ev) {
> +	case DIE_OOPS:
> +		do_dump = 1;
> +		break;
> +	case PANIC_NOTIFIER:
> +		do_dump = 1;
> +		break;

   Why not:

	case DIE_OOPS:
	case PANIC_NOTIFIER:
		do_dump = 1;
		break;

> +	default:
> +		do_dump = 0;
> +		break;
> +	}
> +
> +	if (do_dump)
>  		ftrace_dump(ftrace_dump_on_oops);
> -	return NOTIFY_OK;
> +
> +	return NOTIFY_DONE;
>  }
[...]

MBR, Sergey
