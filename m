From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 13/24] sh/cpu: Make sure play_dead() doesn't return
Date: Tue, 14 Feb 2023 08:57:39 +0100
Message-ID: <2575e5f7-b11a-020f-06ef-ba42301d7415__33458.9497464307$1676361504$gmane$org@linaro.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <d0c3ff5349adfe8fd227acc236ae2c278a05eb4c.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/y3DoebXU2aSRTyTPgatGNryU5LQnPO9lrblNWAcqag=;
        b=FL1ODDD/dH0Fe6e9PftNHR2p1QM5RdtNbSNzqlK8pNihYv6DfVt9L8P4pf7gFWx8t9
         y7Myyo7fNfEgvIVHxiwayOczBTVyPShNBJ+OyPBbO2TGT73uZHOhE3xZtTrnwGF0MT+v
         t8HDjwcNYJ3GyE9n9IqdapPU+YITuv62k93vOPRVKNP4lguYU+6Ab9dRsm/1X2dXcAVB
         5VOmuk01NjVUhEIq+/0xsdIu4HhgQwnS4aeU6D7zwtcEsT7QviV6e0w82yhAQ3D1LK0D
         EflN9bEH39Ng0giNeci5B2LCie2rjDM+BdrF7iU+PFyH9SNv22kw1gwN55V2cUJYlnUa
         Ft5Q==
Content-Language: en-US
In-Reply-To: <d0c3ff5349adfe8fd227acc236ae2c278a05eb4c.1676358308.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

On 14/2/23 08:05, Josh Poimboeuf wrote:
> play_dead() doesn't return.  Make that more explicit with a BUG().
> 
> BUG() is preferable to unreachable() because BUG() is a more explicit
> failure mode and avoids undefined behavior like falling off the edge of
> the function into whatever code happens to be next.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>   arch/sh/include/asm/smp-ops.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/sh/include/asm/smp-ops.h b/arch/sh/include/asm/smp-ops.h
> index e27702130eb6..63866b1595a0 100644
> --- a/arch/sh/include/asm/smp-ops.h
> +++ b/arch/sh/include/asm/smp-ops.h
> @@ -27,6 +27,7 @@ static inline void plat_smp_setup(void)
>   static inline void play_dead(void)
>   {
>   	mp_ops->play_dead();
> +	BUG();
>   }

Shouldn't we decorate plat_smp_ops::play_dead() as noreturn first?
