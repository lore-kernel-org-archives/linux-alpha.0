From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 09/24] mips/cpu: Expose play_dead()'s prototype
 definition
Date: Tue, 14 Feb 2023 08:46:41 +0100
Message-ID: <080a5ccb-7fa0-1a75-538f-a09dc146fc4e@linaro.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <39835bc75af2e812fce56400533cb2ab41bcf0e2.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DacxiEr/DRTGj0ihMvkUuLy+Ahw15SkCabwK0cVB44w=;
        b=qDhFLdhlw3fk5+cbylV4EuicP2cp1j6GaEdWR75BFZ5cfMBViuHmoRACKTBq3oTz7n
         rVewYzdKSuwUurougp6CYy6IznFyHmrUwCi8u3DL9kS12KPbFLP07ynhro3+WFQSogl7
         uRbm7TyoTfgCngAGgMH6zAG0xNfoturbGAhE6YPUOw/BHGya7N+sX2wG73atfoGfioqV
         mZ44LWGz/XNdw1/lRFvORgWHtF//Vi0ebYhMCr3UkzP1JnplE/haXspQGjcP6TSdlIoQ
         MCUGIt9+T8hGMtruIPo9k19B4TRRKfvoX7D14PPhoPGCN7rLnhONxg37CYK0ltz3+z7L
         rxUQ==
Content-Language: en-US
In-Reply-To: <39835bc75af2e812fce56400533cb2ab41bcf0e2.1676358308.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

Hi Josh,

On 14/2/23 08:05, Josh Poimboeuf wrote:
> Include <asm/smp.h> to make sure play_dead() matches its prototype going
> forward.
> 
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>   arch/mips/kernel/smp-bmips.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
> index f5d7bfa3472a..df9158e8329d 100644
> --- a/arch/mips/kernel/smp-bmips.c
> +++ b/arch/mips/kernel/smp-bmips.c
> @@ -38,6 +38,7 @@
>   #include <asm/traps.h>
>   #include <asm/barrier.h>
>   #include <asm/cpu-features.h>
> +#include <asm/smp.h>

What about the other implementations?

$ git grep -L asm/smp.h $(git grep -wlF 'play_dead(void)' arch/mips)
arch/mips/cavium-octeon/smp.c
arch/mips/kernel/smp-bmips.c
arch/mips/kernel/smp-cps.c
arch/mips/loongson64/smp.c

