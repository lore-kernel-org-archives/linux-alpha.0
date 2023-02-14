From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 19/24] xtensa/cpu: Make sure cpu_die() doesn't return
Date: Tue, 14 Feb 2023 08:55:32 +0100
Message-ID: <1b4afd82-83cb-0060-7cab-8e16d2e69ff9__41425.1267955237$1676361383$gmane$org@linaro.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <cca346b5c87693499e630291d78fb0bf12c24290.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yp9YVWt295eBrVzLlEnMpa7WOgUH71k9lLJgF3DktSY=;
        b=h7M/SCUzNlOISn5jTGNmLltaLnbaZUtdxvRAjU33Milk2tpbKS2C1xqAq0HPm/BJRT
         FiJ/HCdDfWLCGCTNdK3VS2qjtc9bpTHe81E3CHaSYgmIq5P8HZR7PAW1a8s10oF2TIN2
         HojjglJNveA+nL0EeGaVfr3pzEZ9h17G9zgq7eukZMRTKZ2554cjMQl6XJfdOivXDkqk
         p6+UvsMCjwelsi/fnbvPZ4bmn5hfmGaZNsy5Ihf1d+h0B7f6xnfKvDzNoawdB3/hVkXh
         jP0nQULxasHEDW+waBz6yBAelaG8oXEN0PvGFOoSyLSbjEhs1hwBhQkj5fUqpkYkA3YB
         8MHQ==
Content-Language: en-US
In-Reply-To: <cca346b5c87693499e630291d78fb0bf12c24290.1676358308.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

Hi Josh,

On 14/2/23 08:05, Josh Poimboeuf wrote:
> cpu_die() doesn't return.  Make that more explicit with a BUG().
> 
> BUG() is preferable to unreachable() because BUG() is a more explicit
> failure mode and avoids undefined behavior like falling off the edge of
> the function into whatever code happens to be next.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>   arch/xtensa/kernel/smp.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/xtensa/kernel/smp.c b/arch/xtensa/kernel/smp.c
> index 4dc109dd6214..7bad78495536 100644
> --- a/arch/xtensa/kernel/smp.c
> +++ b/arch/xtensa/kernel/smp.c

Can you update the documentation along? Currently we have:

   /*
    * Called from the idle thread for the CPU which has been shutdown.
    *
    * Note that we disable IRQs here, but do not re-enable them
    * before returning to the caller. This is also the behaviour
    * of the other hotplug-cpu capable cores, so presumably coming
    * out of idle fixes this.
    */

> @@ -341,6 +341,8 @@ void __ref cpu_die(void)
>   	__asm__ __volatile__(
>   			"	movi	a2, cpu_restart\n"
>   			"	jx	a2\n");
> +
> +	BUG();
>   }
>   
>   #endif /* CONFIG_HOTPLUG_CPU */

