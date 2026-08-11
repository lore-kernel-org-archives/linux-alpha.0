Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097A6365A13
	for <linux-alpha@vger.kernel.org>; Tue, 11 Aug 2026 17:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786470909; cv=pass; b=PT5SyeaBjCnwtMUdEf/X+h81TuRy/WTzGuPgsccTGIyR0wkQSuk+oKzZK1nrtzTLZHmZikiCdkqaff9pTVVtyc05CiHGS0jsKHRu+TwkeOc9JbeUUpSke3bYzKL4/h8PFiPqA5ggICxZ+geNQ0d5nmzV+xOEuYY9XhtMTqhY3NE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786470909; c=relaxed/simple;
	bh=fk3cj3bj08mSlvA6SO698MI0UqKOknXv52CFioKh+/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSpGwkchmBQojRaMJMB2pM2ai7H4/+KLlRmuoizcpQVWMEedwPRxAhNyCClXW0EnPIj7sHO3Byn5uGTZHM7P3kVBJ2oVEBWqtHmb7Dh4q9kQZ0pZJfz01Fn1K4+ahpx71vTE2QkUzHZBgVAYn7QMytAuTOeHmb9kW8F2rkHXdIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIfgB4eG; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIfgB4eG"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso175170a12.2
        for <linux-alpha@vger.kernel.org>; Tue, 11 Aug 2026 10:55:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786470906; cv=none;
        d=google.com; s=arc-20260327;
        b=sSZIEFkGsle0O0j546Sid49eJtcWSShbORWMT90mi78O7pdwOEeIpFqzBNU3RkuR00
         5lFNdDgSfJjqp2SsvD3aV1JL2KmS2KxlVKRGGJ3SOrR9+Ls+sc0Ysm4AIlcM9Z0W8i5D
         VqJkTfchdncye+ospjqRXD1zgNhYdNFhrfBfQWD1vw7yt+huyLnGVJGEpXv2sJzI3Mjt
         AwSDRny5sTDGPSrRr2Fi9LNLJsMo0JBfJ8RU+/Nev34YB5PhRJZXa11DqYoSjPGhDVkX
         eYhv0KvrwfUoT41iXsQ6K2DAn1xC+Czi/Ppgs/VRECkRAb/pgR0//3trpWcD2t5AwaIb
         u74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s33/23a4ORZv3N7HYPVzxR1l7OBRJzVtzzr7ljH0lXw=;
        fh=SRtf5xIKLS+/q486Xx5JJrg79u9Th8Oi4ZWSggDwoWw=;
        b=SkMfW9Opnk2LjOWG35k96CttcOVd6KV72nDfp6dtyvwFFY3IJ5HipNbMf+xlf/Yvs1
         nswQ34Kac0T6QIcUMBScyE0YiWKWso8u39dk4Ub2xEKdsAi4A8VB4h+h2AiVojX6XNKD
         7BnbXcoiY44Y72M+Nj9RRXhru+FZpRgmUEyO/xBfIf9XXjJOSzona6ewZZjat3rXCtow
         TnXQ8hUkSuoL1wpHELFXClxrUIhzTzfD58osC+PJo2lwKKw4D6uzTGhBBWUj20VoTKPL
         5bxOVyM9Tgi+ix5wsnb+r2ZH/Z6uBoR5mHTs6DmNta8pRBJK4gcAdptU0o7J0LQMhtni
         Vs5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786470906; x=1787075706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s33/23a4ORZv3N7HYPVzxR1l7OBRJzVtzzr7ljH0lXw=;
        b=iIfgB4eGzmPL4YMa1RafxDhLHkGiI9xpYXtJSARmAN9W6+kbMmd9f0m0lnaTIK6hYm
         lSeIX2c94pxN9nzHpTOXPmgQKI2qf9xURPaEyUGKixA3GqaY8k3HanNpMWYWgiYk7Tc1
         jLpDjVipPuC4EfJrFOPKRvAgpB3wv6njv617BXKMflEQLOzUfY0GmUZ3pHWBffihdvbP
         mAcE/Ky4AwvEXX3/vjFhrn+vUYAJ5/25BzJ6juQFyrwHPIejsIrH0mH+bJr0jThCk/wX
         qsfqgh8tXHFF/lJFd6gUjVyQIXBb9yT1qIUli4pbNWFVakOoZQGxIvLBuz14AUGhs+Oo
         Xoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786470906; x=1787075706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s33/23a4ORZv3N7HYPVzxR1l7OBRJzVtzzr7ljH0lXw=;
        b=b7DV5ik23V3kW7e0O1abQksVYYTwNTVsHIXH/l/FIysSYWNeRDzLVRu/jZ4OcN11Wf
         SqHy9V6Zx1L8vUW2KLDn+ttcOoA5HL7S2iRhTpVOc4DrEE7f1CSBQh8TU9jj9tMCwZW9
         drGkmCX6x9ZFaG7Gjf5cfD5GWn1suIP0y4hV/BAV9hDpgYynbd6bSQq3ZiIY6dMq7wJ7
         zhYlCDs7UiKdAbUr0ZgDmdZzP2mW3vgNzGjpS5Lfs0q29CIg6Q3EBFCgwG9sX+1FCu2W
         x8GxnJ/nYyTAeBOGHQXFk5uqdX5d9eMtRiIJS8cmvdtTtH9VF7s52HUmAhaCmC8MXtS9
         cajA==
X-Forwarded-Encrypted: i=1; AHgh+Rreygg1QE7kKiYPnTtcEEMNhPo1YJxerifN12frBzDsDFB6TV2yeTd9oDzLndzg9hjqwFYj2ChAy13OCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGw00pkH9Qh9I6u7lSCeBvN6G3D7GM3h5YzWIkUzMt3YpOtBFJ
	RzaiEwTflZYBjRo+FiTMaJqPb3omNLiJDBGAEY/mNJXas8WIOWwDE1ZB1A8nxgutCHMVUCXXfBT
	o1BDtiyhyWzBAw2wACg76Kq/CXigJ42o=
X-Gm-Gg: AR+sD13KwvMh2HeHEYDfBqhQggg1HKDyAX/iqEahE+9TMqIvtVuyOzWIQOlY0dw4Lv1
	cPUvmDXq/42MHElR2lfKSot5F5MCPMSpFBP/Z67mIeulEiD1pSxFj5lyocjna6iYTheyb9eE58v
	8QatKsN1edvuRO3nO/s9NiVVvyVBX5AmbHXQbXCi5NrFDI/dQ2auDHFZsdr1J5FsqfDRvqHzRNp
	aXUOC96u2YqYOl3urlD3BVUr+8cYi2Y+P7ArQqbV0tKAmrpOe3rtLan/CdjuTgOY9Gr8Xh4nXIn
	ZET9AMdERGJWG35xrKbkROB51m5Dq6wRpLVnyMMI+x4ZLBAXC03eeiX9hVwMCJ/uKWeykofzbNY
	41nk4paG1i2D4q4+zaBbmfSdglJENSQ==
X-Received: by 2002:a17:906:99d2:b0:c16:29eb:e81a with SMTP id
 a640c23a62f3a-c20e62ab2fbmr267443266b.29.1786470905900; Tue, 11 Aug 2026
 10:55:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
 <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com> <CA+=Fv5R0tdFeEKWgSVTjfXbs=guZmR8zy8FGbqUZNSKiyB24aA@mail.gmail.com>
 <alpine.DEB.2.21.2608110653370.48788@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2608110653370.48788@angie.orcam.me.uk>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 11 Aug 2026 19:54:53 +0200
X-Gm-Features: AUfX_mwmYRsPi8HwxaB-iZ7wFAEzdikDqU9IB7Vfrv62aJ3SgXEP-mOrafoo-HM
Message-ID: <CA+=Fv5SvjHgf7_5aXp_xBpE42FmM1XTXLrEkzjdQ60NRHKkwpw@mail.gmail.com>
Subject: Re: [PATCH 2/2] alpha: read $gp and $sp explicitly for clang
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Magnus Lindholm <lindholm@kernel.org>, Matt Turner <mattst88@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 1:10=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.u=
k> wrote:
>
> On Mon, 3 Aug 2026, Magnus Lindholm wrote:
>
> > > diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> > > index 7631129ac914..5b4f1ae2b74b 100644
> > > --- a/arch/alpha/kernel/traps.c
> > > +++ b/arch/alpha/kernel/traps.c
> > > @@ -925,7 +925,9 @@ void
> > >  trap_init(void)
> > >  {
> > >         /* Tell PAL-code what global pointer we want in the kernel.  =
*/
> > > -       register unsigned long gptr __asm__("$29");
> > > +       unsigned long gptr;
> > > +
> > > +       __asm__ volatile("mov $29, %0" : "=3Dr"(gptr));
> > >         wrkgp(gptr);
> > >
> > >         wrent(entArith, 1);
> >
> > This looks good to me. The explicit $gp read and use of
> > current_stack_pointer avoid relying on the unsupported local
> > register-asm behavior.
>
>  It could have been worth mentioning in the change description that no
> code quality regression results here with GCC:
>
> --- arch/alpha/kernel/traps-0.dump      2026-08-11 11:57:59.895247441 +01=
00
> +++ arch/alpha/kernel/traps-1.dump      2026-08-11 11:56:31.788713285 +01=
00
> @@ -2223,8 +2223,8 @@
>                         1b70: GPDISP    .text+0x4
>      1b74:      00 00 bd 23     lda     gp,0(gp)
>      1b78:      f0 ff de 23     lda     sp,-16(sp)
> -    1b7c:      10 04 fd 47     mov     gp,a0
> -    1b80:      00 00 5e b7     stq     ra,0(sp)
> +    1b7c:      00 00 5e b7     stq     ra,0(sp)
> +    1b80:      10 04 fd 47     mov     gp,a0
>      1b84:      37 00 00 00     call_pal        0x37
>      1b88:      04 00 00 c2     br      a0,1b9c <trap_init+0x2c>
>      1b8c:      08 00 1e a6     ldq     a0,8(sp)
>
>  Also I think our coding style would rather see the asm written as:
>
>         __asm__ __volatile__("mov $29, %0" : "=3Dr" (gptr));
>
>  Otherwise:
>
> Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>
>
>   Maciej

Hi Matt,

Given Maciej's comment on the inline asm style, do you want to send a v2
of this patch, or are you happy for me to fold the

__asm__ volatile(...)

to

__asm__ __volatile__(...)

style change in when I apply it to the Alpha tree?

Either is fine with me.

Thanks,
Magnus
