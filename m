From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 12/22] powerpc/cpu: Mark start_secondary_resume()
 __noreturn
Date: Mon, 06 Feb 2023 22:10:22 +1100
Message-ID: <87v8kfdp7l.fsf@mpe.ellerman.id.au>
References: <cover.1675461757.git.jpoimboe@kernel.org>
 <b5d065218265e79daa23f82bb84efc6a7ea120fc.1675461757.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1675681839;
        bh=kUcid2K08WtpFrwk3dq6n2jc2ZZxMaSNsif8b2qLpcI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=JSr9bUqckLWxlQvgXrqHdLKjhZNKCyo4/W+R7iqEdoTwQny8JL4fA9p8KLiKopoBY
         5u53AQEtGGXSUIVhYTsKoGTQqHAWk/L2OGiEhn+0/8fSth4VXKAS3aT226D33i5p+m
         FdbPDX2xoyL2dmmxuKSPL38q4OEI/nwe/wpGmzrwBTQTovoqi6LZ4omZBFLcu1QcvH
         OCmTE96dRBgZqYLhxf1uVZpSZUhhjl9pivy58AnZ8D9ntUKLxW5BuUV2Rkfq3DMiAR
         1E1dDbWxoKsiTVWbw5buAHInDRJ1Jkci48lbw53vA/21E8Kh226KSjdHUbEkKMeduf
         u7otQ9CqmaTuA==
In-Reply-To: <b5d065218265e79daa23f82bb84efc6a7ea120fc.1675461757.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x8

Josh Poimboeuf <jpoimboe@kernel.org> writes:
> start_secondary_resume() doesn't return.  Annotate it as such.  By
> extension this also makes arch_cpu_idle_dead() noreturn.

Can we also mark arch_cpu_idle_dead() (the C function) __noreturn ?

Seems like it would be good documentation, even if it's not required
once the generic prototype is __noreturn.

But not a show-stopper.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
> index f63505d74932..cfd42ca8765c 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -66,7 +66,7 @@ void start_secondary(void *unused);
>  extern int smp_send_nmi_ipi(int cpu, void (*fn)(struct pt_regs *), u64 delay_us);
>  extern int smp_send_safe_nmi_ipi(int cpu, void (*fn)(struct pt_regs *), u64 delay_us);
>  extern void smp_send_debugger_break(void);
> -extern void start_secondary_resume(void);
> +extern void __noreturn start_secondary_resume(void);
>  extern void smp_generic_give_timebase(void);
>  extern void smp_generic_take_timebase(void);
>  
> -- 
> 2.39.0
