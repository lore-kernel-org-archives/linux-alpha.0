From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] time: Make sure jiffies_to_msecs() preserves non-zero
 time periods
Date: Fri, 22 Jun 2018 10:11:58 +0200
Message-ID: <CAMuHMdWhFyiAhA=bdjxSSmopJ=yJMXqMmOAD8hWUHWpiz0t4kA@mail.gmail.com>
References: <20180622075421.16001-1-geert@linux-m68k.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180622075421.16001-1-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>

CC alpha, mips

On Fri, Jun 22, 2018 at 9:54 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> For the common cases where 1000 is a multiple of HZ, or HZ is a multiple
> of 1000, jiffies_to_msecs() never returns zero when passed a non-zero
> time period.
>
> However, if HZ > 1000 and not an integer multiple of 1000 (e.g. 1024 or
> 1200, as used on alpha and DECstation), jiffies_to_msecs() may return
> zero for small non-zero time periods.  This may break code that relies
> on receiving back a non-zero value.
>
> jiffies_to_usecs() does not need such a fix, as <linux/jiffies.h> does
> not support values of HZ larger than 12287, thus rejecting any
> problematic huge values of HZ.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v2:
>   - Add examples of affected systems,
>   - Use DIV_ROUND_UP().
> ---
>  kernel/time/time.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/time/time.c b/kernel/time/time.c
> index 6fa99213fc720e4b..2b41e8e2d31db26f 100644
> --- a/kernel/time/time.c
> +++ b/kernel/time/time.c
> @@ -28,6 +28,7 @@
>   */
>
>  #include <linux/export.h>
> +#include <linux/kernel.h>
>  #include <linux/timex.h>
>  #include <linux/capability.h>
>  #include <linux/timekeeper_internal.h>
> @@ -314,9 +315,10 @@ unsigned int jiffies_to_msecs(const unsigned long j)
>         return (j + (HZ / MSEC_PER_SEC) - 1)/(HZ / MSEC_PER_SEC);
>  #else
>  # if BITS_PER_LONG == 32
> -       return (HZ_TO_MSEC_MUL32 * j) >> HZ_TO_MSEC_SHR32;
> +       return (HZ_TO_MSEC_MUL32 * j + (1ULL << HZ_TO_MSEC_SHR32) - 1) >>
> +              HZ_TO_MSEC_SHR32;
>  # else
> -       return (j * HZ_TO_MSEC_NUM) / HZ_TO_MSEC_DEN;
> +       return DIV_ROUND_UP(j * HZ_TO_MSEC_NUM, HZ_TO_MSEC_DEN);
>  # endif
>  #endif
>  }
> --
> 2.17.1
