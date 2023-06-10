From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH] syscalls: add sys_ni_posix_timers prototype
Date: Sat, 10 Jun 2023 14:06:42 +0200
Message-ID: <874jnfa5d9.ffs@tglx>
References: <20230607142925.3126422-1-arnd@kernel.org>
Mime-Version: 1.0
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1686398803;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=f9vpJCOBmn1kjBZo6jMweDpG7dJUYQBav9b62qbm/4U=;
        b=b+1BCKEBeAMrQlSxMKQfFZZ8rZxMHwUzK5Dnj4B9/V4H9acAcmPx4vpgfHColQQm1077GK
        BsAQkoRDSSFgXCtyaP66+T4xwPXXJzoj5WpKf1iXz6CeVq7HzSMeyW82gNLqdXvLAxWNUj
        Q2u/SffraBTFhhadv20Lvi5dqSXZni8TA6AaJgEOWpduper39lGfS5Pvxbu9rdxq3zjfqp
        zst92Z7AUYF90RHm2SOgz+5myX8pnzXzgYk3cIPCBNKKxnQ4cQgZgRTZnw9eVQE88puyMJ
        jYaDZ0BNyMnAFmkYF/VWGGFZ8OLm/hRSoodgh0a5mCJyfnFYd35W8ucSQwLlyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1686398803;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=f9vpJCOBmn1kjBZo6jMweDpG7dJUYQBav9b62qbm/4U=;
        b=8HR2GDgbKRZeHABXfPCtTuVbEXOHvgSTaMrXwWG/wJ4VTy69ODr85gl+ovj2r02i4QwaLm
        vwYr071+yYSgvqAQ==
In-Reply-To: <20230607142925.3126422-1-arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Richard Henderson <richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Jun 07 2023 at 16:28, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>
> The sys_ni_posix_timers() definition causes a warning when
> the declaration is missing, so this needs to be added
> along with the normal syscalls, outside of the #ifdef.
>
> kernel/time/posix-stubs.c:26:17: error: no previous prototype for 'sys_ni_posix_timers' [-Werror=missing-prototypes]
>
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
> I missed sending this out in the initial submission of my Wmissing-prototype patches
> ---
>  arch/alpha/kernel/osf_sys.c | 2 --
>  include/linux/syscalls.h    | 1 +
>  kernel/time/posix-stubs.c   | 1 +
>  3 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> index 2a9a877a05083..d98701ee36c6a 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -1014,8 +1014,6 @@ SYSCALL_DEFINE2(osf_settimeofday, struct timeval32 __user *, tv,
>  	return do_sys_settimeofday64(tv ? &kts : NULL, tz ? &ktz : NULL);
>  }
>  
> -asmlinkage long sys_ni_posix_timers(void);
> -
>  SYSCALL_DEFINE2(osf_utimes, const char __user *, filename,
>  		struct timeval32 __user *, tvs)
>  {
> diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
> index 4627b9cf4b4d9..712f4e1dc6a69 100644
> --- a/include/linux/syscalls.h
> +++ b/include/linux/syscalls.h
> @@ -1286,6 +1286,7 @@ asmlinkage long sys_ni_syscall(void);
>  
>  #endif /* CONFIG_ARCH_HAS_SYSCALL_WRAPPER */
>  
> +asmlinkage long sys_ni_posix_timers(void);
>  
>  /*
>   * Kernel code should not call syscalls (i.e., sys_xyzyyz()) directly.
> diff --git a/kernel/time/posix-stubs.c b/kernel/time/posix-stubs.c
> index 828aeecbd1e8a..39769b2d1005e 100644
> --- a/kernel/time/posix-stubs.c
> +++ b/kernel/time/posix-stubs.c
> @@ -16,6 +16,7 @@
>  #include <linux/posix-timers.h>
>  #include <linux/time_namespace.h>
>  #include <linux/compat.h>
> +#include <linux/syscalls.h>

That's already included. I'll fix it up while applying.
