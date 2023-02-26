From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: Implement "current_stack_pointer"
Date: Sat, 25 Feb 2023 21:08:37 -0500
Message-ID: <CAEdQ38Fg=Au5=BbyTHiEO+GaivheCe6hPBjcZhjgALxn4503Mg@mail.gmail.com>
References: <20220224060558.1856804-1-keescook@chromium.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrjdtBILIDq+NV0DYk67jfytffL1y4tAnBSHMKXYiGE=;
        b=d6kmUKplnpCinpxYtGel4x9i/A3TT7tllyN6U5q2EzObKlKOA5nH9Qdfh06S1n97Wf
         9DhUo3Z6z8rUs3JeEPKZu/HgGpbfyjvGaZFVvOIlRsvJN2S5iD+OgucMIpNfmT42qKWd
         TRRdiRtMbiYa9n0jPyWtjuIIbtylvj4+OPFIVqF7tuIxVXhme9aNB83Isx23zzxJQ0KM
         7TXEMWEyrnaC/gIHaQw2DTqNdAaT73GpsMGwhe95HgYWL96WFv35ixpNANQqpdY0iuu5
         Ksx+l/3n4RHXw8IOXDbgYvXUH6beOE3+s9vOawQKWGBH1W27ArPfPBcFAWbxoFwLPvve
         CQeg==
In-Reply-To: <20220224060558.1856804-1-keescook@chromium.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Kefeng Wang <wangkefeng.wang@huawei.com>, "Alexander A. Klimov" <grandmaster@al2klimov.de>, linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org

On Thu, Feb 24, 2022 at 1:06 AM Kees Cook <keescook@chromium.org> wrote:
>
> To follow the existing per-arch conventions replace open-coded use
> of asm "$30" as "current_stack_pointer". This will let it be used in
> non-arch places (like HARDENED_USERCOPY).
>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  arch/alpha/Kconfig                   | 1 +
>  arch/alpha/include/asm/thread_info.h | 2 ++
>  arch/alpha/lib/stacktrace.c          | 2 +-
>  3 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 4e87783c90ad..31f3dbcdc28c 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -3,6 +3,7 @@ config ALPHA
>         bool
>         default y
>         select ARCH_32BIT_USTAT_F_TINODE
> +       select ARCH_HAS_CURRENT_STACK_POINTER
>         select ARCH_MIGHT_HAVE_PC_PARPORT
>         select ARCH_MIGHT_HAVE_PC_SERIO
>         select ARCH_NO_PREEMPT
> diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
> index 2592356e3215..28214db31053 100644
> --- a/arch/alpha/include/asm/thread_info.h
> +++ b/arch/alpha/include/asm/thread_info.h
> @@ -43,6 +43,8 @@ struct thread_info {
>  register struct thread_info *__current_thread_info __asm__("$8");
>  #define current_thread_info()  __current_thread_info
>
> +register unsigned long *current_stack_pointer __asm__ ("$30");
> +
>  #endif /* __ASSEMBLY__ */
>
>  /* Thread information allocation.  */
> diff --git a/arch/alpha/lib/stacktrace.c b/arch/alpha/lib/stacktrace.c
> index 62454a7810e2..2b1176dd5174 100644
> --- a/arch/alpha/lib/stacktrace.c
> +++ b/arch/alpha/lib/stacktrace.c
> @@ -92,7 +92,7 @@ stacktrace(void)
>  {
>         instr * ret_pc;
>         instr * prologue = (instr *)stacktrace;
> -       register unsigned char * sp __asm__ ("$30");
> +       unsigned char *sp = (unsigned char *)current_stack_pointer;
>
>         printk("\tstack trace:\n");
>         do {
> --
> 2.30.2
>

Thanks for the patch! This was included in my pull request today and
is now upstream in Linus' tree.
