From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 5/9] signal/group_exit: Use start_group_exit in place of
 do_group_exit
Date: Fri, 25 Jun 2021 20:35:04 -0700
Message-ID: <202106252026.E8C5393@keescook>
References: <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133>
 <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133>
 <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
 <87zgvgabw1.fsf@disp2133>
 <875yy3850g.fsf_-_@disp2133>
 <87a6nf6q97.fsf_-_@disp2133>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aUhvmz2IAighG804GQ35EBkkFq5G6bi3JzTCxCLPv0E=;
        b=jQhfIeYg/XK/RbrcxRHqUnVapM962lRzN/PRvFhV2DZYDFbKdC7vhV1PUaQsJn6C2u
         wc+lSbUOtv47V7AjIimm25dFBpNDIJF/gjwNyux0Zp3DXmVZ+9n9jYRDF4LhGOCQBu/7
         W3DUA2b9WyKlpfNECqM9x3zozs9kmMB/qRga4=
Content-Disposition: inline
In-Reply-To: <87a6nf6q97.fsf_-_@disp2133>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>

On Thu, Jun 24, 2021 at 02:01:40PM -0500, Eric W. Biederman wrote:
> 
> Make thread exiting uniform by causing all threads to pass through
> get_signal when they are exiting.  This simplifies the analysis
> of sychronization during exit and guarantees that all full set
> of registers will be available for ptrace to examine for
> threads that stop at PTRACE_EVENT_EXIT.

Yeah, cool. I do like making the process lifetime more sensible here. It
always threw me that do_exit*() just stopped execution. :)

For future me, can you add a comment on start_group_exit() that mentions
where final process death happens?

> 
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> ---
>  kernel/exit.c    | 4 ++--
>  kernel/seccomp.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/exit.c b/kernel/exit.c
> index fd1c04193e18..921519d80b56 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -931,8 +931,8 @@ do_group_exit(int exit_code)
>   */
>  SYSCALL_DEFINE1(exit_group, int, error_code)
>  {
> -	do_group_exit((error_code & 0xff) << 8);
> -	/* NOTREACHED */
> +	start_group_exit((error_code & 0xff) << 8);
> +	/* get_signal will call do_exit */
>  	return 0;

"0" feels weird here, but I can't think of any better "fail closed"
error code here.

>  }
>  
> diff --git a/kernel/seccomp.c b/kernel/seccomp.c
> index 5301eca670a0..b1c06fd1b205 100644
> --- a/kernel/seccomp.c
> +++ b/kernel/seccomp.c
> @@ -1250,7 +1250,7 @@ static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
>  			if (action == SECCOMP_RET_KILL_THREAD)
>  				do_exit(SIGSYS);
>  			else
> -				do_group_exit(SIGSYS);
> +				start_group_exit(SIGSYS);

This could use a similar comment to the syscall's comment, just so I
don't panic when I read this code in like 3 years. ;)

Otherwise, yeah, looks good.

-Kees

>  		}
>  		return -1;
>  	}
> -- 
> 2.20.1
> 

-- 
Kees Cook
