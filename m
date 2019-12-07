From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] time: posix-stubs: provide compat itimer supoprt for
 alpha
Date: Sat, 7 Dec 2019 14:54:24 -0800
Message-ID: <20191207225424.GA9476@roeck-us.net>
References: <20191207191043.656328-1-arnd@arndb.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cvfdz5udoYz82rV5IF60wkSHWqYMMiaRlZ1jxaHcNl8=;
        b=Z0w09Cc/v/rBnmUL5qWli1KSsd/0UP+Xl4IeCm9eIRXU/DnOHjVEPU2LfQ5iNvBAo0
         T7b/zuGJ60mh+3AORTe4fZq0mBKldd7dVw++08BGStRLS1QshGf+EnbdhqYJ5ZnC6cpn
         Lkmt81BIB8ax+WAMjXWXMCYxGjHZ6RlKe9EZ/ZrWBUZNbeFGrsN7zBmixvg7ZQ0b6ojn
         w0XnHlJ6tmpfgf0sVWDYAvv2V8d8LHSxFcPlb4CLeiPEPZpTE9chiGKn5p+lSTDxSDRX
         D5Wgj7quMyunmNdNNzPW2vRy/mE0GXX4sUOpxYOXO5ZAxOupgczHE4u5O4QaqjGK0pB9
         NbJg==
Content-Disposition: inline
In-Reply-To: <20191207191043.656328-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, kbuild test robot <lkp@intel.com>, linux-kernel@vger.kernel.org

On Sat, Dec 07, 2019 at 08:10:26PM +0100, Arnd Bergmann wrote:
> Using compat_sys_getitimer and compat_sys_setitimer on alpha
> causes a link failure in the Alpha tinyconfig and other configurations
> that turn off CONFIG_POSIX_TIMERS.
> 
> Use the same #ifdef check for the stub version as well.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: 4c22ea2b9120 ("y2038: use compat_{get,set}_itimer on alpha")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  kernel/time/posix-stubs.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/kernel/time/posix-stubs.c b/kernel/time/posix-stubs.c
> index 67df65f887ac..20c65a7d4e3a 100644
> --- a/kernel/time/posix-stubs.c
> +++ b/kernel/time/posix-stubs.c
> @@ -151,6 +151,9 @@ SYSCALL_DEFINE4(clock_nanosleep, const clockid_t, which_clock, int, flags,
>  
>  #ifdef CONFIG_COMPAT
>  COMPAT_SYS_NI(timer_create);
> +#endif
> +
> +#if defined(CONFIG_COMPAT) || defined(CONFIG_ALPHA)
>  COMPAT_SYS_NI(getitimer);
>  COMPAT_SYS_NI(setitimer);
>  #endif
> -- 
> 2.20.0
> 
