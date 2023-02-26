From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: in_irq() cleanup
Date: Sat, 25 Feb 2023 21:09:22 -0500
Message-ID: <CAEdQ38EHwaP-=jwuWwFyftc6yya0tzV6+LL7NoEdZpEVj_kGuw@mail.gmail.com>
References: <20210814010103.3929-1-changbin.du@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gyUjGjkIXklTpf2KG+KR10rtJGIH5WJU4Esx1os/A6o=;
        b=YpOg2waX8HSrZDHDyMnE6wt6tCpelTayVZ0V8EiNJX2akfTzAiP3ZfOqfhSrJ+/FOk
         VX77h/3HF3DVdbVt2MiLwOdxxhsZj0VUaEQry6vrt/w4P/jgbUPuKSOIrXBkmfbuLA/Z
         yR2dagznRbtS6xZAnO4mbyj/3dOs0D58Irr2fSWzgZrPx0iWXfHoe4Zy40I4iDoOQjfP
         4qcSWOvoNTW4xTO+kbIZSJbAgeifp+sxm1kRpw+qAl4TN2TMXKLr5WKSoBg6agyv8S2i
         RcaShoKBczIP7FKSAmJt6B0CmIgKqHHuDcS+L74MtW1adn53yDjNLUM5/NmRaZ4nLxlo
         S9JA==
In-Reply-To: <20210814010103.3929-1-changbin.du@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Changbin Du <changbin.du@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Aug 13, 2021 at 9:01 PM Changbin Du <changbin.du@gmail.com> wrote:
>
> Replace the obsolete and ambiguos macro in_irq() with new
> macro in_hardirq().
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  arch/alpha/kernel/process.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
> index a5123ea426ce..a524de9f1c98 100644
> --- a/arch/alpha/kernel/process.c
> +++ b/arch/alpha/kernel/process.c
> @@ -134,7 +134,7 @@ common_shutdown_1(void *generic_ptr)
>  #ifdef CONFIG_DUMMY_CONSOLE
>                 /* If we've gotten here after SysRq-b, leave interrupt
>                    context before taking over the console. */
> -               if (in_irq())
> +               if (in_hardirq())
>                         irq_exit();
>                 /* This has the effect of resetting the VGA video origin.  */
>                 console_lock();
> --
> 2.30.2
>

Thanks for the patch! This was included in my pull request today and
is now upstream in Linus' tree.
