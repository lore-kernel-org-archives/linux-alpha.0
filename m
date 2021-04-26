From: He Zhe <zhe.he@windriver.com>
Subject: Re: [PATCH] alpha: Add syscall_get_return_value()
Date: Mon, 26 Apr 2021 17:21:28 +0800
Message-ID: <255b68e5-e90e-26a9-fadd-6c8fd6fa3db5@windriver.com>
References: <20210423103533.30121-3-zhe.he@windriver.com>
 <20210426091629.45020-1-zhe.he@windriver.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJkXbQ1WQ7mBCrgxjaqNVe4r1ks4dGd/D6n9OTywAoc=;
 b=iMssWuxxw0Iy7bc4+Lg3MhmX4O9GpVIPd0WqbKhCtxCH7DlZvWktOJo6MC4DbZXjFY6b2RHH964HyK4NIMHTReymAmuNw2S255gx1au5pQB/ra5OvFBThK3EVcNBdqYuGKRxDAgxM1IZC9za0ueIi/to1kBZu368wNbJ3ekEqVs=
In-Reply-To: <20210426091629.45020-1-zhe.he@windriver.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: oleg@redhat.com, catalin.marinas@arm.com, will@kernel.org, paul@paul-moore.com, eparis@redhat.com, linux-audit@redhat.com, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This is depended by https://lore.kernel.org/lkml/20210423103533.30121-3-zhe.he@windriver.com/

Thanks,
Zhe

On 4/26/21 5:16 PM, He Zhe wrote:
> audit now reuquires syscall_get_return_value instead of regs_return_value
> to retrieve syscall return code . Other architectures that support audit
> have already define this function.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  arch/alpha/include/asm/syscall.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/alpha/include/asm/syscall.h b/arch/alpha/include/asm/syscall.h
> index 11c688c1d7ec..f21babaeed85 100644
> --- a/arch/alpha/include/asm/syscall.h
> +++ b/arch/alpha/include/asm/syscall.h
> @@ -9,4 +9,10 @@ static inline int syscall_get_arch(struct task_struct *task)
>  	return AUDIT_ARCH_ALPHA;
>  }
>  
> +static inline long syscall_get_return_value(struct task_struct *task,
> +					    struct pt_regs *regs)
> +{
> +	return regs->r0;
> +}
> +
>  #endif	/* _ASM_ALPHA_SYSCALL_H */

