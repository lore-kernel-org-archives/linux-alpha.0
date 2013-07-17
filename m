From: Matt Turner <mattst88@gmail.com>
Subject: Re: [RFC PATCH 05/10] alpha: Primitive support for CPU power down.
Date: Tue, 16 Jul 2013 22:17:39 -0700
Message-ID: <CAEdQ38FF32t+Ca0EsEk=uArhU28HKGf91=F1DzA+NE88WDVKtw@mail.gmail.com>
References: <1373996058-13399-1-git-send-email-rth@twiddle.net> <1373996058-13399-6-git-send-email-rth@twiddle.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=1yVpuPUQGLtB59JoK8b3Vkr+DkgeXKL0ftGqCWDS60g=;
        b=B3NiykRsn36Z6/RHiQ1ZHZXhKN0j2EI4s7NVWjh+INxsyld8NEt2fWYqKjRibtREZh
         G2Uvw6XasmTL7TowSwFUn1okcTAoLWhFJ63gShOZcNL9mNhp5ln4iPMAjmlf4tj0W4Kp
         69uFGPhqj0mAPpDg9my7ehuKjcDBZ6Apj2+V+5RDMUID8mYrIxnLqQGZlt5sUnzC5gDN
         7gXMOdT9DiNliSW+pTYWZunq9gUT7D7WlzlZqPmafalsL+0ZDykl1vHBJWUw7GxfOC1p
         joDpZyh9jqrq+o3DxK8u5i/kl7RXoVs+W08/bMi+EQSq7WKJyH/Gt9IBTgZ+EJ6yGreK
         TyJA==
In-Reply-To: <1373996058-13399-6-git-send-email-rth@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org

On Tue, Jul 16, 2013 at 10:34 AM, Richard Henderson <rth@twiddle.net> wrote:
> Use WTINT to wait for the next interrupt.  Squash the WTINT call
> if the PALcode doesn't support it (e.g. MILO).  No attempt is yet
> made to skip clock ticks during normal scheduling in order to stay
> in power down mode longer.

The architecture reference manual says

> The counter, PCC, may increment at a lower rate or may stop entirely
> during wtint execution. This side effect is implementation dependent.

Is that anything to worry about?

>
> Signed-off-by: Richard Henderson <rth@twiddle.net>
> ---
>  arch/alpha/include/asm/pal.h      |  1 +
>  arch/alpha/include/uapi/asm/pal.h |  1 +
>  arch/alpha/kernel/process.c       | 15 +++++++++++++++
>  arch/alpha/kernel/traps.c         | 12 ++++++++++++
>  4 files changed, 29 insertions(+)
>
> diff --git a/arch/alpha/include/asm/pal.h b/arch/alpha/include/asm/pal.h
> index 6fcd2b5..e78ec9b 100644
> --- a/arch/alpha/include/asm/pal.h
> +++ b/arch/alpha/include/asm/pal.h
> @@ -89,6 +89,7 @@ __CALL_PAL_W1(wrmces, unsigned long);
>  __CALL_PAL_RW2(wrperfmon, unsigned long, unsigned long, unsigned long);
>  __CALL_PAL_W1(wrusp, unsigned long);
>  __CALL_PAL_W1(wrvptptr, unsigned long);
> +__CALL_PAL_RW1(wtint, unsigned long, unsigned long);
>
>  /*
>   * TB routines..
> diff --git a/arch/alpha/include/uapi/asm/pal.h b/arch/alpha/include/uapi/asm/pal.h
> index 3c0ce08..dfc8140 100644
> --- a/arch/alpha/include/uapi/asm/pal.h
> +++ b/arch/alpha/include/uapi/asm/pal.h
> @@ -46,6 +46,7 @@
>  #define PAL_rdusp      58
>  #define PAL_whami      60
>  #define PAL_retsys     61
> +#define PAL_wtint      62
>  #define PAL_rti                63
>
>
> diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
> index f2360a7..3130f13 100644
> --- a/arch/alpha/kernel/process.c
> +++ b/arch/alpha/kernel/process.c
> @@ -46,6 +46,21 @@
>  void (*pm_power_off)(void) = machine_power_off;
>  EXPORT_SYMBOL(pm_power_off);
>
> +/*
> + * Sleep the CPU.
> + * EV6, LCA45 and QEMU know how to power down, skipping N timer interrupts.
> + */
> +void arch_cpu_idle(void)
> +{
> +       wtint(0);
> +       local_irq_enable();
> +}
> +
> +void arch_cpu_idle_dead(void)
> +{
> +       wtint(INT_MAX);
> +}
> +
>  struct halt_info {
>         int mode;
>         char *restart_cmd;
> diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> index affccb9..991f6c3 100644
> --- a/arch/alpha/kernel/traps.c
> +++ b/arch/alpha/kernel/traps.c
> @@ -243,6 +243,18 @@ do_entIF(unsigned long type, struct pt_regs *regs)
>                                (const char *)(data[1] | (long)data[2] << 32),
>                                data[0]);
>                 }
> +               if (type == 4) {
> +                       /* If CALL_PAL WTINT is not supported by the PALcode,
> +                          "emulate" it by overwriting the insn.  */

The pseudo-code for WTINT contains an IF(implemented) check, where the
ELSE case just does v0 <- 0. So is overwriting with nop just an
optimization to avoid the (expensive) PAL call? If it is, could we
clarify the comment?

> +                       unsigned int *pinsn
> +                         = (unsigned int *) regs->pc - 1;
> +                       if (*pinsn == PAL_wtint) {
> +                               *pinsn = 0x47e01400; /* mov 0,$0 */
> +                               imb();
> +                               regs->r0 = 0;
> +                               return;
> +                       }
> +               }
>                 die_if_kernel((type == 1 ? "Kernel Bug" : "Instruction fault"),
>                               regs, type, NULL);
>         }
> --
> 1.8.1.4
>
