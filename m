From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH linux-next] alpha:smp: fix warning comparing pointer to 0
Date: Sun, 22 Aug 2021 19:01:56 -0700
Message-ID: <CAEdQ38FvspQYf75wMuNKDpj+C1agXdLzfvjYR3fud+V=iXP_JQ@mail.gmail.com>
References: <20210823014908.43982-1-jing.yangyang@zte.com.cn>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qn2X6yCZVQS4i5pjYYMheZPlPQ7wgcjmX5krI/88Nfg=;
        b=E0hH8hOwsJC9GpncoE+fBebmCo03rqjvfyWhGq9KDzEEYosyY+8/tTcs7dNl0eY4Q1
         wjbsdcvxN08K7d2MmVTc6KtMVWN49QhHlSHbGjULwvLdU+fC50m8QQd9gFyYbpfrjaAW
         8EYds/zXxDSpklieOzDbUk/iH3AGHe23WAkuUghtnh0jDWi8gwxHOOcROHNHx2jOxcYR
         xwEwQLXmXRyQNdLCrZz8m1T+mjkkbh2vqKjvrtje885kOVMR9rlrG5so8a3nFg7/+JdM
         1gHA9icA8LU2UeZAnh3Nt205c8vCu6lkY9uAKGGlDfwhLkarLWHskA34Sj2iML0HNPXd
         CqxQ==
In-Reply-To: <20210823014908.43982-1-jing.yangyang@zte.com.cn>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: CGEL <cgel.zte@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Jing Yangyang <jing.yangyang@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>

On Sun, Aug 22, 2021 at 6:49 PM CGEL <cgel.zte@gmail.com> wrote:
>
> From: Jing Yangyang <jing.yangyang@zte.com.cn>
>
> Fix the following coccicheck warning:
> ./arch/alpha/kernel/smp.c:271:39-40:
> WARNING:comparing pointer to 0
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
> ---
>  arch/alpha/kernel/smp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
> index cb64e47..adc05c2 100644
> --- a/arch/alpha/kernel/smp.c
> +++ b/arch/alpha/kernel/smp.c
> @@ -268,7 +268,7 @@ enum ipi_message_type {
>                         memcpy(cp2, cp1, cnt);
>                         cp2[cnt] = '\0';
>
> -                       while ((cp2 = strchr(cp2, '\r')) != 0) {

You may as well compare with NULL, for clarity.
