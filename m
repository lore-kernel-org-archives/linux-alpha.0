Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DE43AB5DA
	for <linux-alpha@vger.kernel.org>; Tue, 26 May 2026 16:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779811625; cv=pass; b=M42YLIwNMGEWHVf0nlRGFboY3EFAOMiZCIaGKzKabC1O5/Mb53i1gLcmcG4vWOqYIr0JV8GV4BfFr6m0iICffwy5iRxE5d80dcDSZHTzdlzP9k2zr8yEbk7xWXt47szwWHa6esmopjUExXdydUnKUroYhPlN6WgKtdKF3P9U5jA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779811625; c=relaxed/simple;
	bh=bTMEqXlymRrDkx+799UsR3M6EYL0Nku363nzBQvZgys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OUA4Y5xJ8fXdWE9hqygyxvebELqIR6Uf0VIJsid+xFGqZXM6mmranyKDBVcfKE4+SrfqVhkFMOv4EURgG+nCIAtCRM6cdMD438rSqoBJcxvlpXn+7vnJISaNfGhqCmT9rAmhD4ZuuIe91AZdZEEeoih82tFGUBiTlBy2yyiuPRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+g1WrgX; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+g1WrgX"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3942e9977a5so105132221fa.1
        for <linux-alpha@vger.kernel.org>; Tue, 26 May 2026 09:07:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779811622; cv=none;
        d=google.com; s=arc-20240605;
        b=HdAvl0agWM7/2SVDKJJ/jSVDvf/qlVk9sUUJ2YZ3lyTNF5p2xS6J/L1zGluM3luA8g
         DdKHDDzlKvP9WRzg3nmiDKk8n/5udzpVTjouz4jN2aYKLorImT7SpPKQGtIVimmO4lyg
         fI93srqAX67bP+JHDVlYZJ1YT7gvAdAqs9Lx2Af+yIEMrYGJqL8KaOulH1sVcStYKzj+
         O4dtu7dg+lPoYzMcQcluh3DJUmGpdYJIl/LVg3zrUIrIH1UUsnmUHQzYzteji+22WzJM
         jh7Y3IY1QxJvvQovjODaaKh/cC0qM0BzDilmzF7gkBlkFrIW23i1rFI6Vv70C4aqMBWh
         fNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zkSVl+XKBuW6eazU+0qT2rYU1h+udgx59l786BNP3Lc=;
        fh=Z862g/FtbEdxCUYaVOXYOCHX76/mfpAZtQgU2+30Z1k=;
        b=hZ+3UIEfXriSRpuLQ1cf89j8jfAe0f4jXeVoF61W5Jn/IM+SvC2MwpPw7w7bffD/lG
         Wn+zwXbsU/lkGgMq9Fw3jS6VDH2CyLDMWHvt5AZrF7+Rtbp1VGb3GH3gaQUEx8EXPOw6
         RYGO5k+knsCHyhDIvoUFvzPkMCJHD56Ac7xy/LIB3l0cspvB4G2+LMbM2O/y/1I9A4b7
         tJ3wb5q+kGe4ow9e8dVrHuyU8qd1KmyIwYjUtJ0ksdjzUXrj8WJqcVD3FEVbfXQmHFWm
         7pGOQ7S3lwLRNCp9K1W5GU4oOd6TnIFY89buDYheByBVDgHeBmRXPAq+Ohd9kob2cL2K
         TEcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779811622; x=1780416422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkSVl+XKBuW6eazU+0qT2rYU1h+udgx59l786BNP3Lc=;
        b=A+g1WrgXLOLg9AKWpnaRUOHcs13DPef+r7RiI+7YNAQEME6JyKvExn+EhX4xTrx3s+
         mDTK5HJm346j0A+l1u3LxLUenHQioSW6v3q7DPHHiwYdxesGGi4248x64u4BN1sHylq1
         aVvZj+oSp7xm/PkSS5usc/cE3RjSo/SNSSBi4kPEqipLO7ha9nAJ552rb0mQBkzvI2QO
         RrayZZJ5LAqLaKElTaVoULGrzduQ8fX2lhsth9OQqbXMYUvOjBXNRY+z42rChIEW+pVj
         U08+4cfOSKUatfH8D86fS7e0KfndsZRGNxIyDx74fVAhqpD2pdozlfMdehdKkMOxtY7l
         vByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779811622; x=1780416422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zkSVl+XKBuW6eazU+0qT2rYU1h+udgx59l786BNP3Lc=;
        b=WkISP+Y+suyfYz1+nxx9CWTPWz8wG/B2iQ9+BqhEuOu53Hk1IUtxsUc+7ns5zNKAZ0
         rD4+eTOWz3M30zY/b/c/HswcdQKKdhCAH5LpLCh0AV13/9UQbH3vuwWvP9VlyHqEwcjK
         wDY/uzA6Be83qDNQanMLnv4WY6Rck05NqWdN90sslaPx5qW7ZeM5yW8pfEsYP/ozFtO+
         Hp4XPCm5V+aar9lRHFZdDOuWrrAfw6JMDUEqLGyYWXRcjT/fx8cltY1+6VI3Ch5Tt1Vp
         8s5FuryWq8rJ9XTMjPFOBQxIzsCsLUQyC3qxgQFLeq6Vrv3U2ilThF/yHkoGllKESzQ5
         36Xw==
X-Gm-Message-State: AOJu0Yx38bLLW15oElb+m9t2l9mkOBSNiYEMne20BrLUkZeLrxLxvFdo
	UzEumDaS1L7G8y3BhdjitXU+4bMzAVfisAyn9INh7vgeFt52BhlUNZ2wqSNbIaKEBMUavoEIS53
	2skgcyOv7hw8q9lhYrKZojce/NILgZMt/ZqrKgPs=
X-Gm-Gg: Acq92OE0RzbzuAH62i9YDXBC+7tbEqexuvt8lTRT5DRmszNY0KgGJsUK5OwF9WQwleZ
	P+qsE1hQ9uLqbmR/6JBxlQQ/OqnEdUk+cmjAXtvq2963x1BCcbURRToTLv6aznaiQOmcIW1Vhdv
	IXwxJu5AceMmO2tsqA5rKN7n4OFC2jvV7Odi0goZ75hwsMSHuuZC0EjhwCdmIKGEygcNmv5pnVc
	e2oZpltbfeVppd5sH0LtSmKgmZIYx7OYCuO3fkCSQogxU7je8FIo0MV0kiLe8vo942J5XXTJzGG
	l2ogKqE4cQ==
X-Received: by 2002:a05:651c:150c:b0:394:3fc8:f19e with SMTP id
 38308e7fff4ca-395d8c60b1bmr60003061fa.0.1779811621870; Tue, 26 May 2026
 09:07:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403150357.489571-1-mattst88@gmail.com> <CA+=Fv5So25dGWwHJqGk-cMonQd5PVxzoPsdhe-u6KR3Sxhi22A@mail.gmail.com>
In-Reply-To: <CA+=Fv5So25dGWwHJqGk-cMonQd5PVxzoPsdhe-u6KR3Sxhi22A@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 26 May 2026 12:06:49 -0400
X-Gm-Features: AVHnY4Lus0bm7iJCwEAWWlVXHLfS2Xr80VHB7WSdrtxcMBWp_kpMv1VxxXmxzDE
Message-ID: <CAEdQ38G1dqOwvLO-+gs5_zEAuVO-W8Crk3bGvu_dEe_=9XtPWA@mail.gmail.com>
Subject: Re: [PATCH] alpha: marvel: Fix lock ordering in init_io7_irqs()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 2:58=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> On Fri, Apr 3, 2026 at 5:04=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
> >
> > Move irq_set_chip_and_handler() and irq_set_status_flags() calls
> > outside the io7->irq_lock raw spinlock.  These functions take
> > sparse_irq_lock, which is a mutex, and taking a sleeping lock while
> > holding a raw spinlock is invalid.  The raw spinlock only needs to
> > protect the hardware CSR accesses.
> >
> > This fixes the following lockdep splat during boot:
> >
> >   [ BUG: Invalid wait context ]
> >   swapper/0/0 is trying to lock:
> >   sparse_irq_lock{....}-{4:4}, at: irq_mark_irq
> >   other info that might help us debug this:
> >   context-{5:5}
> >   1 lock held by swapper/0/0:
> >    #0: &io7->irq_lock{....}-{2:2}, at: init_io7_irqs.constprop.0
> >
> > Assisted-by: Claude:claude-opus-4-6
> > Signed-off-by: Matt Turner <mattst88@gmail.com>
> > ---
> >  arch/alpha/kernel/sys_marvel.c | 27 +++++++++++++--------------
> >  1 file changed, 13 insertions(+), 14 deletions(-)
> >
> > diff --git ./arch/alpha/kernel/sys_marvel.c ./arch/alpha/kernel/sys_mar=
vel.c
> > index 1f99b03effc2..d0bdd5e6cfd7 100644
> > --- ./arch/alpha/kernel/sys_marvel.c
> > +++ ./arch/alpha/kernel/sys_marvel.c
> > @@ -263,6 +263,18 @@ init_io7_irqs(struct io7 *io7,
> >          */
> >         printk("  Interrupts reported to CPU at PE %u\n", boot_cpuid);
> >
> > +       /* Set up the lsi irqs.  */
> > +       for (i =3D 0; i < 128; ++i) {
> > +               irq_set_chip_and_handler(base + i, lsi_ops, handle_leve=
l_irq);
> > +               irq_set_status_flags(i, IRQ_LEVEL);
> > +       }
> > +
> > +       /* Set up the msi irqs.  */
> > +       for (i =3D 128; i < (128 + 512); ++i) {
> > +               irq_set_chip_and_handler(base + i, msi_ops, handle_leve=
l_irq);
> > +               irq_set_status_flags(i, IRQ_LEVEL);
> > +       }
> > +
> >         raw_spin_lock(&io7->irq_lock);
> >
> >         /* set up the error irqs */
> > @@ -272,26 +284,13 @@ init_io7_irqs(struct io7 *io7,
> >         io7_redirect_irq(io7, &io7->csrs->STV_CTL.csr, boot_cpuid);
> >         io7_redirect_irq(io7, &io7->csrs->HEI_CTL.csr, boot_cpuid);
> >
> > -       /* Set up the lsi irqs.  */
> > -       for (i =3D 0; i < 128; ++i) {
> > -               irq_set_chip_and_handler(base + i, lsi_ops, handle_leve=
l_irq);
> > -               irq_set_status_flags(i, IRQ_LEVEL);
> > -       }
> > -
> >         /* Disable the implemented irqs in hardware.  */
> > -       for (i =3D 0; i < 0x60; ++i)
> > +       for (i =3D 0; i < 0x60; ++i)
> >                 init_one_io7_lsi(io7, i, boot_cpuid);
> >
> >         init_one_io7_lsi(io7, 0x74, boot_cpuid);
> >         init_one_io7_lsi(io7, 0x75, boot_cpuid);
> >
> > -
> > -       /* Set up the msi irqs.  */
> > -       for (i =3D 128; i < (128 + 512); ++i) {
> > -               irq_set_chip_and_handler(base + i, msi_ops, handle_leve=
l_irq);
> > -               irq_set_status_flags(i, IRQ_LEVEL);
> > -       }
> > -
> >         for (i =3D 0; i < 16; ++i)
> >                 init_one_io7_msi(io7, i, boot_cpuid);
> >
> > --
>
> The lock ordering fix makes sense to me.
>
> One question though: in the moved setup loops we now have
>
>     irq_set_chip_and_handler(base + i, ...)
>
> but still
>
>     irq_set_status_flags(i, IRQ_LEVEL);
>
> Why does irq_set_status_flags() not need `base + i` as
> well? I would have expected that to match the IRQ number
> passed to irq_set_chip_and_handler(), i.e. use
>
>     irq_set_status_flags(base + i, IRQ_LEVEL);
>
>
> Magnus

Nice catch.

This is a pre-existing bug introduced in commit
08876fe8519c4f7625efba8aa3d51b1d24cd8a13. I'll include a patch in my
series to fix this.
