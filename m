From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: Add some spaces to ensure format specification
Date: Sat, 25 Feb 2023 21:06:57 -0500
Message-ID: <CAEdQ38EDxV=K-kxB=u0Z+YRaBr1yTT7iN5gzhxw6-QJo+n9y3Q@mail.gmail.com>
References: <20220621081506.50096-1-jiaming@nfschina.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oUrV65DvJz1MlLRNg+iPzZY8aqrFbPa/knFZvxr1Kbw=;
        b=SGLOso4TUPA1ykJmwAoTQWhovHzSENx0gsg++egebJJ38y7f8WUlwKUrRS/lhSFwBh
         gVgI/fsabQF8fhIhJCIcpZzW+fyoCG/sclP7/Zp6VBCdvr0YT+9PRQiGhCqGoi8S0Xmo
         2uKjrWfoc+UaR0bDyk3low8Rl+7GqX5ZiG4S0CIAiqa8qk93oF3v97QHLAnIH/iQ4Tv5
         VHnPkQPYEJZEf+aSgNc+q2RdLEOvBR30T/AIKBwXXDL/hug3fRCmyMxgbha0PuKcuZjq
         6kmAM6b+XOWi1SNYiYKbgaEQ/dlrrbH8bGagwRomDcgAd7hThiFdhIVAeGndOjK/3p0y
         m1JA==
In-Reply-To: <20220621081506.50096-1-jiaming@nfschina.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Jiaming <jiaming@nfschina.com>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, liqiong@nfschina.com, renyu@nfschina.com

On Tue, Jun 21, 2022 at 4:15 AM Zhang Jiaming <jiaming@nfschina.com> wrote:
>
> Add a space after ','.
> Add spaces around the '=', '>' and '=='.
>
> Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>
> ---
>  arch/alpha/boot/stdio.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/alpha/boot/stdio.c b/arch/alpha/boot/stdio.c
> index 60f73ccd2e89..e6d1ebff4209 100644
> --- a/arch/alpha/boot/stdio.c
> +++ b/arch/alpha/boot/stdio.c
> @@ -42,8 +42,8 @@ static int skip_atoi(const char **s)
>
>  static char * number(char * str, unsigned long long num, int base, int size, int precision, int type)
>  {
> -       char c,sign,tmp[66];
> -       const char *digits="0123456789abcdefghijklmnopqrstuvwxyz";
> +       char c, sign, tmp[66];
> +       const char *digits = "0123456789abcdefghijklmnopqrstuvwxyz";
>         int i;
>
>         if (type & LARGE)
> @@ -83,14 +83,14 @@ static char * number(char * str, unsigned long long num, int base, int size, int
>                 precision = i;
>         size -= precision;
>         if (!(type&(ZEROPAD+LEFT)))
> -               while(size-->0)
> +               while (size-- > 0)
>                         *str++ = ' ';
>         if (sign)
>                 *str++ = sign;
>         if (type & SPECIAL) {
>                 if (base==8)
>                         *str++ = '0';
> -               else if (base==16) {
> +               else if (base == 16) {
>                         *str++ = '0';
>                         *str++ = digits[33];
>                 }
> @@ -125,7 +125,7 @@ int vsprintf(char *buf, const char *fmt, va_list args)
>                                 /* 'z' changed to 'Z' --davidm 1/25/99 */
>
>
> -       for (str=buf ; *fmt ; ++fmt) {
> +       for (str = buf ; *fmt ; ++fmt) {
>                 if (*fmt != '%') {
>                         *str++ = *fmt;
>                         continue;
> @@ -296,7 +296,7 @@ int sprintf(char * buf, const char *fmt, ...)
>         int i;
>
>         va_start(args, fmt);
> -       i=vsprintf(buf,fmt,args);
> +       i = vsprintf(buf, fmt, args);
>         va_end(args);
>         return i;
>  }
> --
> 2.25.1
>

Thanks for the patch! This was included in my pull request today and
is now upstream in Linus' tree.
