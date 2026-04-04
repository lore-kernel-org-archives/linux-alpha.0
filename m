Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C794E34DCE0
	for <linux-alpha@vger.kernel.org>; Sat,  4 Apr 2026 08:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775291211; cv=pass; b=JpZ3yleYlcKXO8zHFwp7RBgemHBIBJuYvx7uHgOC2CCHO82drLSIZfrEk+ZudrVhG1EZu0zHRHnxn1LstTVZHrf1cXkyZoSJrVy60jUwfHWRwsYAv8yBxcc1BDoNRrff4GlDayMl2iVvE+1LBWGauM+0tRpfxK+xyEQI2VOXIZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775291211; c=relaxed/simple;
	bh=ePMO3rp6rcfrILm5MHjPLlJp3GUuBJiUPJJLWxvq29Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lC+Bh3nM2H+e7DnTliXdJORFBn01cZkUHUvt9OfH0gOSY5q0UstYaz4HA1cj+tGvd0aBVByTYi2DsnKSpfxLExrh/Q04U8Wk0OJMHS7MQQx/2I7NXbJnUD8Sx5Hxnn6TfoIkA6zsCjNHbYnHnHRlIknxcALzLn8O5OOfcODemlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMLf60Kx; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMLf60Kx"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so438541166b.2
        for <linux-alpha@vger.kernel.org>; Sat, 04 Apr 2026 01:26:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775291208; cv=none;
        d=google.com; s=arc-20240605;
        b=eqNpkXCdqFO3bSFjRJkD9TyOM30PCT0tW/Z7W1/Ifm/7vG4SyEhBU//NLk1fBxdoVR
         EjIsftSkAHC94fg7oQNoClSaf6llMN9CGusDE6QOvJY6KFsfGWQ5t8p1BI0dV8Xkq6rZ
         9tWTyjts/zSLjUtsiIWS+HQqRgsmZvaLZP+93RLWyPh7b0u29vzz2zC49mn8I1LIqzj3
         qe4xoYDB1EOYvq+SyK9OJ3A7m7Pc01pQVDIoXMa+v28lP28NhYeZ6Woh8JqK7qvd5tN/
         xjac6scZ/QBfJk23+XVyavdpPk/lAAovBrgHp8isCrBHPBcDbNsn1knVKO+A6KeL+WIf
         z0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WDacb9dGn1lTf+J9OEvafWQ1lQ/kQtggSqqu0CQnL+I=;
        fh=ViAatGiZ05dh3a394EUid4cQpUnAI/U35CAucij+cuk=;
        b=kDdXfy6wY5If4G7+PEi7dI5GdIjt5Ng0eKXscQvcUdMWy308qt22uwnipGYM50v1c4
         cDZ0NDzmTJifCIE/olGRNlpnWG6edBuJYueeetc5jVyLA6C23+K0o37ySiut1JZeevQb
         nxs7e5AGmdUFY8OXPMKRq5ZDqz8GSePf+Qp9apfyGi56jBD/ZAJR4JcZSLvJrmLNbFyA
         kbI+fRQA0PSfI9yBgm2RLKNyirEf8RZPH6ZhGcpvAFuO7EtqY6S9rDV++PpeIC2q3fNB
         HMQl1nuK/dUk2oShYfqkcnV1xtGjrhCfZB+kb9S14Or9mzrWJA9k3INfzyrEajm5wE3U
         Mxmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775291208; x=1775896008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDacb9dGn1lTf+J9OEvafWQ1lQ/kQtggSqqu0CQnL+I=;
        b=RMLf60Kx7fz/Zz3gyDij74q4kunv1Pxj9NtVGTa7cRclnOspMBZgeUHpREJx0vwom1
         sZxIgarRLTXcDnoTEVUzfAixd2nlZ2eHGh+3GWKObt0kPOX3rMmfClgFefKs9dx2XTR7
         as7QpdfP+Gj5y5aT3ACbgHlm3K2VHqLRHNo93pywqMNJshigFxMJUIcnbqdXbj4gJo9c
         Iv7Z7tBvHhUzCclTuo5Yb5htMsTmzByNex1+NTHSqodvp/tZpSjXafmE93xlBeu627Hv
         /6sdw0cRejaYCjXUSMWlvLUxlDbDfEW4rpyP6OYo/31R5Le7FeA7g8d6En51zyBKaOyj
         tkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775291208; x=1775896008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WDacb9dGn1lTf+J9OEvafWQ1lQ/kQtggSqqu0CQnL+I=;
        b=ioDhD1FeogwcabDV5TA6wcs+wA4auj6tZfIhNIdSbSL+glzMYHZsnDI7ploQ7+sJ3O
         Qh9QUJlj6ifaxj6YyOnfgN3/WTKLTNFCHoEe4FE3UQy+UIThZSitKs55JNVO/PlAkiE0
         40+/7G7p0EqWW5ozstfGZW5GFA+NjmUPU9pQnrV4s3i2Xtt+iRfsnmH/hep/ztspAZj+
         hD/BkpM9+1CmHS2XF612Ne84Cjbc938WhAhnoOIEjWcSwb+3wktwvPm6ysZuBs8zkTjN
         evGv8VfjfUoS+o+E1IhXE1BiVpRJBDxMns6OI67KiBmv6eSk/mPxvuGIz11BQqMVt0n0
         VvbQ==
X-Gm-Message-State: AOJu0YxPQvOjjAIdJhqGELaQpBKeKgC0dwRco4V3xRcFl6VXNYI1xWPF
	L+AQ7LvWQppsCCf8h2LrmkHKhHIqst7pR2iOyueZbnd3jf6X436Svag8FrbCP9ejKUX3ujyrhLK
	DfoPAaUWzyVIS7yWVkJ9IQ+XqE3TnuTw=
X-Gm-Gg: AeBDieuoNjGShp7eyNBWGNGGIBboLOFDx2XR4dQo2YKFPaxQCojvFQgM9xLsgaWVbrz
	iD/BT1tz86zcUrkQBDn7WMauMEjDBLorvpDabX7gOqATELqqzEApy8M3A64Z2bcidaYYuElQGfz
	YTgLWJTzXEs/4jXPqKIVXGC8y5Qd8iRXRwmHaDFiav31iTdDzQBXYKXKM+31m6i6ctoe4Ae7db/
	Ou4A2RmHj/KuFPgjgAcEqADNxTLOYNTWv0BNsog+OS8Ntuzw/LM9XY6lOeCWTRBis5U+rRKUm3a
	79Ubk+kHeUHcSRImPXKviLJ5YnjQLcFEoEJnx3PMSdiHkJujAw==
X-Received: by 2002:a17:907:960f:b0:b9b:e5d:71df with SMTP id
 a640c23a62f3a-b9c676a2f35mr306074966b.19.1775291207622; Sat, 04 Apr 2026
 01:26:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403150119.488427-1-mattst88@gmail.com>
In-Reply-To: <20260403150119.488427-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 4 Apr 2026 10:26:36 +0200
X-Gm-Features: AQROBzD6slV1TcGWxGTt9lZwFABJnMYwfyh6ABvWHU36-Dum7kMRO4EhV7ZsKcg
Message-ID: <CA+=Fv5S1068Hn=bZPkjx_uot=UDG1=OwpnL-kgsyMY4uS5tmoQ@mail.gmail.com>
Subject: Re: [PATCH] alpha: Fix arch_irqs_disabled_flags() to handle
 intermediate IPL levels
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 5:01=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> arch_irqs_disabled_flags() only considered IRQs disabled when IPL was
> at IPL_MAX (7). However, PALcode enters interrupt handlers at
> intermediate IPL levels (e.g., IPL_DEV1=3D4, IPL_TIMER=3D5), which also
> have interrupts disabled at that level and below.
>
> This caused a lockdep warning when TRACE_IRQFLAGS_SUPPORT was enabled:
> lockdep_hardirqs_off() calls irqs_disabled() inside an interrupt
> handler and expects it to return true, but the intermediate IPL didn't
> match the IPL_MAX check.
>
> Fix by treating any IPL above IPL_MIN as interrupts disabled.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/irqflags.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git ./arch/alpha/include/asm/irqflags.h ./arch/alpha/include/asm/i=
rqflags.h
> index 9f25d4e0d37e..80a01702b03a 100644
> --- ./arch/alpha/include/asm/irqflags.h
> +++ ./arch/alpha/include/asm/irqflags.h
> @@ -57,7 +57,7 @@ static inline void arch_local_irq_restore(unsigned long=
 flags)
>
>  static inline bool arch_irqs_disabled_flags(unsigned long flags)
>  {
> -       return flags =3D=3D IPL_MAX;
> +       return (flags & 7) > IPL_MIN;
>  }

Hi, Matt

I'm not sure  this change is correct.

On Alpha, the irqflags helpers are intended to operate on the
IPL field in the processor status (PS) register, not on the full
PS value. The low 3 bits of PS encode the current IPL, which is
why masking with `& 7` is appropriate when saving, restoring,
and checking interrupt flags.

However, changing arch_irqs_disabled_flags() from checking for
IPL_MAX to checking for any IPL > IPL_MIN changes the meaning
of the helper.

arch_irqs_disabled_flags() is used to answer whether local IRQs
are disabled in the Linux sense, i.e. whether all interrupt
levels are masked. On Alpha, that corresponds to IPL_MAX.
Intermediate IPL levels such as IPL_DEV1 or IPL_TIMER only mask
interrupts at and below that priority; higher-priority
interrupts can still be taken, so IRQs are not fully disabled.

So while masking flags down to the IPL bits is the right fix
when the saved flags may contain the full PS register,
broadening the predicate to `(flags & 7) > IPL_MIN` appears to
misreport partially masked interrupt state as "IRQs disabled".

I think the correct fix is to keep the PS/IPL cleanup, but
preserve the existing IPL_MAX semantics for
arch_irqs_disabled_flags().

Maybe we should consider something like this, (see below)

Regards Magnus

diff --git a/arch/alpha/include/asm/irqflags.h \
b/arch/alpha/include/asm/irqflags.h
index 9f25d4e0d37e..f207544f52de 100644
--- a/arch/alpha/include/asm/irqflags.h
+++ b/arch/alpha/include/asm/irqflags.h
@@ -26,7 +26,7 @@ extern int __min_ipl;

 static inline unsigned long arch_local_save_flags(void)
 {
-       return rdps();
+       return getipl();
 }

 static inline void arch_local_irq_disable(void)
@@ -51,13 +51,13 @@ static inline void arch_local_irq_enable(void)
 static inline void arch_local_irq_restore(unsigned long flags)
 {
        barrier();
-       setipl(flags);
+       setipl(flags & 7);
        barrier();
 }

 static inline bool arch_irqs_disabled_flags(unsigned long flags)
 {
-       return flags =3D=3D IPL_MAX;
+       return (flags & 7) =3D=3D IPL_MAX;
 }
