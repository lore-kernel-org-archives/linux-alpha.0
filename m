From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 17/24] x86/cpu: Make sure play_dead() doesn't return
Date: Tue, 14 Feb 2023 09:05:07 +0100
Message-ID: <579b0715-dba2-246c-63a1-7e0ef4e9f9a5__26928.0383059353$1676361944$gmane$org@linaro.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <11e6ac1cf10f92967882926e3ac16287b50642f2.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JF52YzZhW4elUM7Kky6bPhzQenJZTY4P/46jrbrklX0=;
        b=evhLL97JMkNYAYn9bGpom2GYrZHUYt2CtyFeYuIEml6T8racA9Aij5ni53nA2qN2B/
         7ol3c+EAOiUcR3bb0Nbg6oEblv3Vg7fMwY7/0LEF5VCVPbgg/9qJMYGdcPWyfh/NzUJP
         nVm8iXoCxY27TAbyblLvNVZ54uQ2sCsTY83Lokf3aopdz/EdDYYXBo8GWIClq0AGjewl
         aTkyCiKCaGx5UjLiSjzaakSSVH5DgeZyjpiMZih++pjBLki4KH45JDUvESt1xmw+rXib
         kUDSlfXab71A8Mkvhrw8TlHo9Ob8++YPLFpUADMuiGoEgIwoLSkBvntwalRx8rWTfTF1
         ikQA==
Content-Language: en-US
In-Reply-To: <11e6ac1cf10f92967882926e3ac16287b50642f2.1676358308.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

On 14/2/23 08:05, Josh Poimboeuf wrote:
> After commit 076cbf5d2163 ("x86/xen: don't let xen_pv_play_dead()
> return"), play_dead() never returns.  Make that more explicit with a
> BUG().
> 
> BUG() is preferable to unreachable() because BUG() is a more explicit
> failure mode and avoids undefined behavior like falling off the edge of
> the function into whatever code happens to be next.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>   arch/x86/include/asm/smp.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
> index b4dbb20dab1a..8f628e08b25a 100644
> --- a/arch/x86/include/asm/smp.h
> +++ b/arch/x86/include/asm/smp.h
> @@ -96,6 +96,7 @@ static inline void __cpu_die(unsigned int cpu)
>   static inline void play_dead(void)
>   {
>   	smp_ops.play_dead();
> +	BUG();
>   }

Similarly, smp_ops::play_dead() should be decorated noreturn first.
