From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] Remove unused function marvel_irq_noop_return()
Date: Sun, 23 Jan 2011 17:08:12 +0000
Message-ID: <AANLkTinC-Q7LF-a+QyF7b54WpN4Agz4JAAiWbH6e2wYU@mail.gmail.com>
References: <38683FAC43C6446A93B96668D2228010@morten>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=NdT1/wMWxz3S2vwYVXwo0Hi9PgguitgcLAYOW5C4zCo=;
        b=g21RC6Uyh6A98HPQnxGPg2ULyj3Jr7SyRvXW0Owv1Fi5/oqX+PfaTE1haLAbAErRdO
         ibv3HIqTfJwCfFOkYjilFO2TsTkKoGJnwgM3Q/QjyT6ArydZ4VM3T6kOX041eKfNWlNi
         a3KLynGRjyIzPzEK8QKvaNrhNlHHx2gtZXY5c=
In-Reply-To: <38683FAC43C6446A93B96668D2228010@morten>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Morten Holst Larsen <m-larsen@post6.tele.dk>
Cc: linux-alpha@vger.kernel.org

On Sun, Jan 23, 2011 at 12:44 PM, Morten Holst Larsen
<m-larsen@post6.tele.dk> wrote:
> Remove unused function marvel_irq_noop_return()
>
> Signed-off-by: Morten H. Larsen <m-larsen@post6.tele.dk>
>
> index 2bfc9f1..5514dad 100644
> --- a/arch/alpha/kernel/sys_marvel.c
> +++ b/arch/alpha/kernel/sys_marvel.c
> @@ -149,12 +149,6 @@ marvel_irq_noop(unsigned int irq)
> =A0 =A0 =A0 return;
> }
>
> -static unsigned int
> -marvel_irq_noop_return(unsigned int irq)
> -{
> - =A0 =A0 =A0 return 0;
> -}
> -
> static struct irq_chip marvel_legacy_irq_type =3D {
> =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "LEGACY",
> =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D marvel_irq_noop,
> --
> 1.7.1

Thanks! I'll apply this.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
