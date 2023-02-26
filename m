From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: osf_sys: reduce kernel log spamming on invalid
 osf_mount call typenr
Date: Sat, 25 Feb 2023 21:09:02 -0500
Message-ID: <CAEdQ38GpkM8mZJ2oiADjCgKfEmavCrq9mcYErqPf-CHvWZX84g@mail.gmail.com>
References: <20211213185625.546358-1-colin.i.king@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zOiw7v4d0b1KPpG9R/9yiqx5BWikVuJtMLZ9Bzv3kSo=;
        b=k+yMM7OX2Vq1cfpvwqtoq1c2EUROQBBVjl3ijtcoyhwuSOIBRGGC4N+G3mnkyTuLGR
         DCbHX2YI/bH0kNvM8g2nLmO8kV3h4WGNmQIdqLXI8C/5MqTd/zGJwh6T0F0YiYSkDxqR
         HrAixy5lA+PS6Z+hMXrB5ZQUSlpWE2ptOTd23u3NBHIQ1Psr3/kSAHVkLsS9KC19IbzQ
         U7O436YrEHzpxwSlUmW1Kx4oOZQ8Tov54qKH1/PDhy/wHfFrLbHMKgovXSN8JxpJDIr1
         GNENh4oT94YSVAOSzlY1WTNbCuwR2xKH4ImghicSABzEge7lnX66moQnucgURb5j9U5j
         q72A==
In-Reply-To: <20211213185625.546358-1-colin.i.king@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Dec 13, 2021 at 10:58 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> Calling the osf_mount system call with an invalid typenr value will
> spam the kernel log with error messages. Reduce the spamming by making
> it a ratelimited printk.  Issue found when exercising with the stress-ng
> enosys system call stressor.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  arch/alpha/kernel/osf_sys.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> index 8bbeebb73cf0..2367a385d726 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -521,7 +521,7 @@ SYSCALL_DEFINE4(osf_mount, unsigned long, typenr, const char __user *, path,
>                 break;
>         default:
>                 retval = -EINVAL;
> -               printk("osf_mount(%ld, %x)\n", typenr, flag);
> +               printk_ratelimited("osf_mount(%ld, %x)\n", typenr, flag);
>         }
>
>         return retval;
> --
> 2.33.1
>

Thanks for the patch! This was included in my pull request today and
is now upstream in Linus' tree.
