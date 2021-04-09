From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH v2 1/1] kernel.h: Split out panic and oops helpers
Date: Sat, 10 Apr 2021 00:39:11 +0200
Message-ID: <20210409223911.GA21445@alpha.franken.de>
References: <20210409100250.25922-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Return-path: <linux-parisc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210409100250.25922-1-andriy.shevchenko@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexander Lobakin <alobakin@pm.me>, Wei Liu <wei.liu@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <bjorn.andersson@linaro.org>, Christian Brauner <christian.brauner@ubuntu.com>, Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, Mike Rapoport <rppt@kernel.org>, Corey Minyard <cminyard@mvista.com>, Michael Ellerman <mpe@ellerman.id.au>, Vasily Gorbik <gor@linux.ibm.com>, "Jason J. Herne" <jjherne@linux.ibm.com>, Joerg Roedel <jroedel@suse.de>, Michael Kelley <mikelley@microsoft.com>, Joe Perches <joe@perches.com>, Florian Fainelli <f.fainelli@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Fri, Apr 09, 2021 at 01:02:50PM +0300, Andy Shevchenko wrote:
> kernel.h is being used as a dump for all kinds of stuff for a long time.
> Here is the attempt to start cleaning it up by splitting out panic and
> oops helpers.
> 
> There are several purposes of doing this:
> - dropping dependency in bug.h
> - dropping a loop by moving out panic_notifier.h
> - unload kernel.h from something which has its own domain
> 
> At the same time convert users tree-wide to use new headers, although
> for the time being include new header back to kernel.h to avoid twisted
> indirected includes for existing users.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Kees Cook <keescook@chromium.org>
> Acked-by: Wei Liu <wei.liu@kernel.org>
> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> v2:
>  - fixed all errors with allmodconfig on x86_64 (Andrew)
>  - checked with allyesconfig on x86_64
>  - additionally grepped source code for panic notifier list usage
>    and converted all users
>  - elaborated commit message (Luis)
>  - collected given tags (incl. Andrew's SoB, see below)
> 
> I added Andrew's SoB since part of the fixes I took from him. Andrew,
> feel free to amend or tell me how you want me to do.
> 
>  arch/mips/kernel/relocate.c                   |  1 +
>  arch/mips/sgi-ip22/ip22-reset.c               |  1 +
>  arch/mips/sgi-ip32/ip32-reset.c               |  1 +

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
