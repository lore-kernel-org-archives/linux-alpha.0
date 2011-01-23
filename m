From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] Fix typo in call to irq_to_desc()
Date: Sun, 23 Jan 2011 17:07:54 +0000
Message-ID: <AANLkTingvwnDPzzTAcKfx4A97_DzQfhaZR1TkEhoF1Qe@mail.gmail.com>
References: <F49BAFD32B8946B3B60EB150F23CE224@morten>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=3WGc7AFC0hNTzcRo9lDoPl5ccYRGdjSzO/Umr7YKVAc=;
        b=KD1suJXTjcor/xo13JzynyTaN6aMhJ+x8z4NtfuOzHBv6nwOa/vDwJHDy++QXXGHBZ
         Edjt/UZqUbXg3PlgoowFa0pauJ4TT+QQ6OePjxclPzL8WWTr7KIoPxU3RQOFJ8KYLOaR
         sSnw4gYQD5aUj9sOs4TZUHPH8KaUwXECz1VwM=
In-Reply-To: <F49BAFD32B8946B3B60EB150F23CE224@morten>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Morten Holst Larsen <m-larsen@post6.tele.dk>
Cc: linux-alpha@vger.kernel.org

On Sun, Jan 23, 2011 at 12:40 PM, Morten Holst Larsen
<m-larsen@post6.tele.dk> wrote:
> Fix typo in call to irq_to_desc()
>
> Signed-off-by: Morten H. Larsen <m-larsen@post6.tele.dk>
>
> diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
> index 9ab234f..d3e20c7 100644
> --- a/arch/alpha/kernel/irq.c
> +++ b/arch/alpha/kernel/irq.c
> @@ -44,7 +44,7 @@ static char irq_user_affinity[NR_IRQS];
>
> int irq_select_affinity(unsigned int irq)
> {
> - =A0 =A0 =A0 struct irq_desc *desc =3D irq_to_desc[irq];
> + =A0 =A0 =A0 struct irq_desc *desc =3D irq_to_desc(irq);
> =A0 =A0 =A0 static int last_cpu;
> =A0 =A0 =A0 int cpu =3D last_cpu + 1;
>
> --
> 1.7.1

Thanks! I'll apply this.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
