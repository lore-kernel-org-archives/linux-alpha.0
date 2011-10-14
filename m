From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH 01/21] alpha: drop unused Kconfig symbol
Date: Fri, 14 Oct 2011 11:49:32 -0400
Message-ID: <CAEdQ38FzXyqoWDO_EykhpAH8msjeEkK9WWrHwGOyeESdAmD10g@mail.gmail.com>
References: <1318595240.6132.57.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=vmtpJQQfYaw5wt/Z813mxshDMAx8IQ4GvXb6JgRJxRM=;
        b=xzHAHrAbYTe1jiiZy+pApgZlLe12FZpXMHuricYecJ4pZmpuNDm6UGjrUTPnRiIfnR
         tdBnnaSCaFs0iIuESnk3uTr4FIp+kCBN0y4ltAZ6GaKP3tFs8K5O5RYpxQPL0nJb6gpH
         obpsJSowD5usDCRhcGQrp2xcZoxGtXNv/ImMw=
In-Reply-To: <1318595240.6132.57.camel@x61.thuisdomein>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Oct 14, 2011 at 8:27 AM, Paul Bolle <pebolle@tiscali.nl> wrote:
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> =A0arch/alpha/Kconfig | =A0 =A05 -----
> =A01 files changed, 0 insertions(+), 5 deletions(-)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 8bb9362..3d74801 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -445,11 +445,6 @@ config ALPHA_EV67
> =A0 =A0 =A0 =A0 =A0Is this a machine based on the EV67 core? =A0If in=
 doubt, select N here
> =A0 =A0 =A0 =A0 =A0and the machine will be treated as an EV6.
>
> -config ALPHA_EV7
> - =A0 =A0 =A0 bool
> - =A0 =A0 =A0 depends on ALPHA_MARVEL
> - =A0 =A0 =A0 default y
> -
> =A0config ALPHA_MCPCIA
> =A0 =A0 =A0 =A0bool
> =A0 =A0 =A0 =A0depends on ALPHA_RAWHIDE
> --
> 1.7.4.4

Reviewed-by: Matt Turner <mattst88@gmail.com>

I haven't gotten my kernel.org tree set back up yet, so someone else
might want to take this patch.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
