Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7843F363C74
	for <linux-alpha@vger.kernel.org>; Tue, 11 Aug 2026 18:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786471399; cv=pass; b=svbeRwpLAFddpnt9jgHqz+P0Z49fc/NkwxTPOCGzW0JzxvFhw0OnCW0+OKcLpEiU1RD8XIXO9LUz1TG0EoFb3nfCJYODzzHcTWPvgjHuuqbhgoFB3sVLfa7hxgWELiBdS/7tH/45ktLReLTnFHIbJdIiEENcT/MJhRRSsv8Av/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786471399; c=relaxed/simple;
	bh=MoIAe+r/nMy5HKj2wea0IFKWy0S7HugyLhHKg6BcVm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gaHaEMofx7gk6I/2PuKAx0skAc3PrqSGnPYGF0I2Q9tEurR1929wfLO04XKEmm3WKdqrP6x++h7Yask5oj6fhSXWycvRray5KlP2ASQJPzHsxCfyFahinGmtMDHt9vWAQywJkisJJIjeZmA9EeCuQCkUk/oE5PAmWcCMvK5Tuck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbHNHLnu; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbHNHLnu"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aebd52488cso128924e87.2
        for <linux-alpha@vger.kernel.org>; Tue, 11 Aug 2026 11:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786471395; cv=none;
        d=google.com; s=arc-20260327;
        b=CPeJrInzUk3aPf2Nxp/i/EQyiztgNS8n+HWA9eoUHilhUidHA9b5mjIx1OtiNhDD8c
         iWCP4ycGCPAqpUZd4WYtU5XLJI4KWTWdulJW9VbQPfRMASXaqGl0l/MCvDJgE3fJ6skK
         wHaeqi9fKqWVlYEyZIl+2OdUynSH2Xa5MK0VGJMDXjd2CPSCmxi+PIvZm6NT4IimPjWY
         yr/UC4lnInPxHIHOqtWZuheZ8sohd2Jl/75etk07bXTqKdxcR+5cyMI+8pBdnTZeDWfT
         RGpTdYmLlevSYnZ0+SBDfd3Fr95vnCsX8iZG74Bt5RkWj/gxFv0A1EkgBtcd/4p8oVnt
         EM9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vjd/fAmD0D3XwcSyeIvZ8+6EDq9t9quZRoVQ7xFbSro=;
        fh=l70Hbxt3pVxtyc/6UIQ+FS8S865zFgebV/rnqx2QD0o=;
        b=DumxEAxufECfVVgs5NAieZe9TjY7X73kSKkAbun7gXKM6dHAGC2lBRQFeJKRiLKc2V
         mpq1yARweqlqmptzRmFdHZrdehR960FQqkqagC+VTE1mzMTGAiyLbZYNxYWxgeAj6+oP
         vr7j/VxARAK7BlN681/nklW4v6bUuR85iZ6l6v0G8Cr4wNuFAxCcEReVPXEuQcp+bYWQ
         lkKNf+kVjg8Q5IZOJoZolsfkokkIrJRI5gCVcmNSpbZLLA1ekukHII5MKWmvc13cvO1n
         JA1sAcjTd/QkiaGnhl9nthZ1C84fr6ZtP5POlGdu+smQuIu1WChT/ChibRfyyt9bO4zs
         LKnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786471395; x=1787076195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vjd/fAmD0D3XwcSyeIvZ8+6EDq9t9quZRoVQ7xFbSro=;
        b=hbHNHLnu+rlV6LdS5JNiMxaTJUPB+M1ilOtfsxcBq4svk93HmTNB3LL7/eGDHcBwVX
         5aflB+beJ2YGXRuoVrQyz3CdnmuedQ/87ELe79BoZJO3MPusWfHcgkgb/g98ATI8OUQw
         EuFT5YAG00gHNNbwv93nPUNgiE7nTHr2OPxLNroishhAFjSpE50fx/RwN+zXXooXbTAw
         9PXMa6XPWzspU75llP5uUOcPvwENfwctfqUCNvaQxn/+kl05/RsOVkoePnWY5ppNBvtM
         L/Jsl4XnbbnBh7xZUJBK2MG0LWoWodJPJO7c4SFvm+Herc5w8HNupNZKv4CvMZ+RGciD
         1SoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786471395; x=1787076195;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjd/fAmD0D3XwcSyeIvZ8+6EDq9t9quZRoVQ7xFbSro=;
        b=eavyhKkL7db3FBy5HJZvKuUGidumcMBbiVdHOMgrJf57zq0UaY5WEwK6yZYUOGT2vL
         vM1khyw1uRIyBGskKBtDVb1RsaCBZZRCi7Z44qtPszXyUkmRiTCzM7rblmzG0CXW6CRV
         S4Smz6MyLAX4LQthmpvLBZAIqAu762FXtHr8Ez1fDWfiscbyl73/UOsWzjcGWgGLXrze
         GgHojvbYAGaiHWNiYZfvPwMo7tgN7P9NPH/l46Jfmgz9HMELuTq33p3I5MIdS73YdUW7
         1anMARJS2NUQRga44NQl5OEY4s3d9RrNUASxfvIZ9TvkKxOhgnoHQd1l6BVAugiUb3df
         2TTg==
X-Forwarded-Encrypted: i=1; AHgh+RrtjODV/Ua/F/aghJ/jtR3eX3+YMsa2r0yTEOIogbJTjZ/v5q5XxGgfaasOmcEoaXD2m0MfQ9F2+h4bjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgHkDD4xjBlnP/mhEJ1C6GxGlQkezdk7DkKv9znP4jcvKmA8jn
	pz2jOTDkkvB3+IZPg8rWNT6hvaE3ntB7EqyJktvwMFhDf+Zp97YOiRGxssNnFe79bUB7ELpPQxf
	oada+DZIa3CjBrW2kToT5Gk2RJZJz9fDNYA==
X-Gm-Gg: AR+sD119d2TIAWDjQkqWU44+BLhC1fRXLeqOZBx+yS8gXNRbNNE0AA63FB2O3YnmASl
	8lbugbi2u+/GrzOjc3Yflwb1GaiG4Tfr9zNOO1wMdiTdgoOnBNCsYDR4+1MlJau8eKr2WOA2WQI
	+OpjmAfrQXGzc52gdreCwfKofUxqG8PRUCMdmtPTR039Ufuv2f8e69FTAxrRFs8ySGmxTa1S+GM
	UYUIJ9CbDxc18Bo9N6FnIlhp+r64EJYYhLCRIGbMHjRI7REqxrxeH0KiEXDTm9csFOCXKWOlpu1
	FnqGctf707bWA+xJP3zPMjzOn4ERLKMVwxZfLquxKu7TjMJMVeluRghKG61JZXNO5x1yCbli45H
	WWw==
X-Received: by 2002:a05:6512:39d3:b0:5ae:aeeb:e902 with SMTP id
 2adb3069b0e04-5b448610878mr788811e87.13.1786471395270; Tue, 11 Aug 2026
 11:03:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
 <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com> <CA+=Fv5R0tdFeEKWgSVTjfXbs=guZmR8zy8FGbqUZNSKiyB24aA@mail.gmail.com>
 <alpine.DEB.2.21.2608110653370.48788@angie.orcam.me.uk> <CA+=Fv5SvjHgf7_5aXp_xBpE42FmM1XTXLrEkzjdQ60NRHKkwpw@mail.gmail.com>
In-Reply-To: <CA+=Fv5SvjHgf7_5aXp_xBpE42FmM1XTXLrEkzjdQ60NRHKkwpw@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 11 Aug 2026 14:03:02 -0400
X-Gm-Features: AUfX_mxmnN3UxyDqTnGPQ9KikRs4pBRLxD5kBxPrAo3ScWOdRlFNN1zZtW9p0HA
Message-ID: <CAEdQ38HmrYhR2z1TjrWFOrv5gJoXYk0HCeUoPPZ7vvghnwLVUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] alpha: read $gp and $sp explicitly for clang
To: Magnus Lindholm <linmag7@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Magnus Lindholm <lindholm@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 1:55=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> On Tue, Aug 11, 2026 at 1:10=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me=
.uk> wrote:
> >
> > On Mon, 3 Aug 2026, Magnus Lindholm wrote:
> >
> > > > diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> > > > index 7631129ac914..5b4f1ae2b74b 100644
> > > > --- a/arch/alpha/kernel/traps.c
> > > > +++ b/arch/alpha/kernel/traps.c
> > > > @@ -925,7 +925,9 @@ void
> > > >  trap_init(void)
> > > >  {
> > > >         /* Tell PAL-code what global pointer we want in the kernel.=
  */
> > > > -       register unsigned long gptr __asm__("$29");
> > > > +       unsigned long gptr;
> > > > +
> > > > +       __asm__ volatile("mov $29, %0" : "=3Dr"(gptr));
> > > >         wrkgp(gptr);
> > > >
> > > >         wrent(entArith, 1);
> > >
> > > This looks good to me. The explicit $gp read and use of
> > > current_stack_pointer avoid relying on the unsupported local
> > > register-asm behavior.
> >
> >  It could have been worth mentioning in the change description that no
> > code quality regression results here with GCC:
> >
> > --- arch/alpha/kernel/traps-0.dump      2026-08-11 11:57:59.895247441 +=
0100
> > +++ arch/alpha/kernel/traps-1.dump      2026-08-11 11:56:31.788713285 +=
0100
> > @@ -2223,8 +2223,8 @@
> >                         1b70: GPDISP    .text+0x4
> >      1b74:      00 00 bd 23     lda     gp,0(gp)
> >      1b78:      f0 ff de 23     lda     sp,-16(sp)
> > -    1b7c:      10 04 fd 47     mov     gp,a0
> > -    1b80:      00 00 5e b7     stq     ra,0(sp)
> > +    1b7c:      00 00 5e b7     stq     ra,0(sp)
> > +    1b80:      10 04 fd 47     mov     gp,a0
> >      1b84:      37 00 00 00     call_pal        0x37
> >      1b88:      04 00 00 c2     br      a0,1b9c <trap_init+0x2c>
> >      1b8c:      08 00 1e a6     ldq     a0,8(sp)
> >
> >  Also I think our coding style would rather see the asm written as:
> >
> >         __asm__ __volatile__("mov $29, %0" : "=3Dr" (gptr));
> >
> >  Otherwise:
> >
> > Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>
> >
> >   Maciej
>
> Hi Matt,
>
> Given Maciej's comment on the inline asm style, do you want to send a v2
> of this patch, or are you happy for me to fold the
>
> __asm__ volatile(...)
>
> to
>
> __asm__ __volatile__(...)
>
> style change in when I apply it to the Alpha tree?
>
> Either is fine with me.
>
> Thanks,
> Magnus

Hey Magnus,

Feel free to just fix it up when you apply it.

Thanks,
Matt
