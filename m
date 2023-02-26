From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: replace NR_SYSCALLS by NR_syscalls
Date: Sat, 25 Feb 2023 21:07:15 -0500
Message-ID: <CAEdQ38E7QKZddcZGFWBRB8AFu9CEBsiKxDrC4aG5nwT9p-PZvg@mail.gmail.com>
References: <20220329025737.2375176-1-yang.yang29@zte.com.cn>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nRJ1z3jciefZNx3Ldo4FLT1Lt6iH/IsHxfrZc22u8pM=;
        b=ARn/FqWiLWDklDuOxv4z0ENc2cOrqo8sjAh7pe4JNIL5ckb4Dmirbma/DIQpV6FgWI
         vspBHGYyGeRyYtra9OoGLy5RvBHJ/ziwxES0UFNSX8uPfxrgFfRnkoZgandDzS5zD8XN
         5vTkxKj9DtFLZB8yk5Du918KAjF9nxgqUXG0kRzflxaIwifTD4aNhsclaUuXkU2bys7d
         H+HJJ6SoqtYuxT1n3qHst5otzCsfUIhXvwBqoNQENR3+c2W+9xBS+3UGoMvA6Fcb/47v
         enVDd4lMFq7jh4QN/QOROFRaqMf3BnvOj0GdLbK2mEy4sGFjye31aHeqdbmSUY5IaZq5
         TjnQ==
In-Reply-To: <20220329025737.2375176-1-yang.yang29@zte.com.cn>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cgel.zte@gmail.com
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, firoz.khan@linaro.org, ematsumiya@suse.de, rostedt@goodmis.org, mingo@redhat.com, yang.yang29@zte.com.cn, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 28, 2022 at 10:58 PM <cgel.zte@gmail.com> wrote:
>
> From: Yang Yang <yang.yang29@zte.com.cn>
>
> Reference to other arch likes x86_64 or arm64 to do this replacement.
> To solve compile error when using NR_syscalls in kernel[1].
>
> [1] https://lore.kernel.org/all/202203270449.WBYQF9X3-lkp@intel.com/
>
> Signed-off-by: Yang Yang <yang.yang29@zte.com.cn>
> ---
>  arch/alpha/include/asm/unistd.h | 2 +-
>  arch/alpha/kernel/entry.S       | 4 ++--
>  kernel/trace/trace.h            | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/alpha/include/asm/unistd.h b/arch/alpha/include/asm/unistd.h
> index 986f5da9b7d8..caabd92ea709 100644
> --- a/arch/alpha/include/asm/unistd.h
> +++ b/arch/alpha/include/asm/unistd.h
> @@ -4,7 +4,7 @@
>
>  #include <uapi/asm/unistd.h>
>
> -#define NR_SYSCALLS    __NR_syscalls
> +#define NR_syscalls    __NR_syscalls
>
>  #define __ARCH_WANT_NEW_STAT
>  #define __ARCH_WANT_OLD_READDIR
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index e227f3a29a43..966400b925a5 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -454,7 +454,7 @@ entSys:
>         SAVE_ALL
>         lda     $8, 0x3fff
>         bic     $sp, $8, $8
> -       lda     $4, NR_SYSCALLS($31)
> +       lda     $4, NR_syscalls($31)
>         stq     $16, SP_OFF+24($sp)
>         lda     $5, sys_call_table
>         lda     $27, sys_ni_syscall
> @@ -585,7 +585,7 @@ strace:
>         ldq     $21, 88($sp)
>
>         /* get the system call pointer.. */
> -       lda     $1, NR_SYSCALLS($31)
> +       lda     $1, NR_syscalls($31)
>         lda     $2, sys_call_table
>         lda     $27, sys_ni_syscall
>         cmpult  $0, $1, $1
> diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
> index 07d990270e2a..7ad8324db192 100644
> --- a/kernel/trace/trace.h
> +++ b/kernel/trace/trace.h
> @@ -25,7 +25,7 @@
>  #include "pid_list.h"
>
>  #ifdef CONFIG_FTRACE_SYSCALLS
> -#include <asm/unistd.h>                /* For NR_SYSCALLS           */
> +#include <asm/unistd.h>                /* For NR_syscalls           */
>  #include <asm/syscall.h>       /* some archs define it here */
>  #endif
>
> --
> 2.25.1
>


Thanks for the patch! This was included in my pull request today and
is now upstream in Linus' tree.
