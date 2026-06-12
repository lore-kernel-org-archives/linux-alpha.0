Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FBC363096
	for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 19:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293975; cv=pass; b=Cnfxr95D1Wz1T5tIuXp4LQcNJaE7LxKAA9KE3DCD2bBPN/Tb0h9Mhqe6tUdhLk8xanhjdur2O29mf7fQ+TUTW0tTKjtOSBJfrQr1nCkCJBmys7OQayXyh3jfTB/BgRWio0SHF2rb5J0vkCuwrFS4oXyDaUjv3hJk4Q7HPYnUqR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293975; c=relaxed/simple;
	bh=1CX5KyShxTK5c+h2r3CxBcQeKWkomeG3IebRUcZct8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQ16V5x3BJ/xov6tuB8fEs4lFHj27ZeR9V/LeiocZG0+lI9UWllAWF4XmAJ87jTZ2ZVBR9Xp1r/cy17nbEYaTwHPqpyZQbejJZF00mtBWQt1DYgE2u4mkw8dKz5aiO+/eteZecu11E9kv54K/XjHl4DJf+ERlaMpHrcOsJeV2T8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/ikyGwi; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/ikyGwi"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68f36e1663cso2334510a12.3
        for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 12:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781293973; cv=none;
        d=google.com; s=arc-20240605;
        b=ReRthJgGofRtbDTnTQP7tXr3tabwNcbpXLMhFGTYU/6Vnz7tn1byiKYMr6xOgQ07t0
         eHuyR+CxH/liFeclNMU9bHEzHZue9xXjsUZLphROYt4N6n9u6ix8eeKfEgesUf6dyq8t
         9F4ODbGbrMVQsXdGr61BOSsSpiZdRqTYjs03qloTBm/3R8FyALtyvVuuQi895pic+qNW
         saHb9FKlmT5wVgBi3cAHO1hSzmz4TP6r+IGD6rd/4UpBb0a/jwsRYy5Q5RofMXbJoNVq
         CVk9FWZ1/MaUL23KWkFZC7M3DjoBPH10HgDKjyk118phzwryVWUo+3HFygbMwHA4iPbF
         bXxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HrYLccQHrQmtz0zec3KOHrvCzqkYFKFO/MVBEjo1RR0=;
        fh=xcmCsGmCArpp52s629N50u8TO/6pZQQ7bkcIdVh3UvY=;
        b=Kx3FFJfrsusaKvsLe/1RTDXEcZ13q+1gq7oPk0RZd6g+rhZw2EypHQI8Rzs8Cf2bl7
         hKhRMRTka2KOXO3gVBqmRpZc9wELmfmUCPmsc4pvjr/2TRogjnH3pnAxgSEYwi/wUrAx
         9qDhlCuGQhUKdpLfBQzuM6ZSN8RFMSOxf18YkaYYDbxc4wGvINHDqPnxwNKKepB/tY1e
         8hIgvYoheo5sjn9Kf6/psBL7AfJHd5SLCgDrPIFhF5xuBGoaYnvNoUyB6PwzkuoSlzzB
         inyO918ADuxgna7Jk7GmnQxk+BYornt8XsfndiUblDCt9jPIwTg3QCba2idfF4pmDdO2
         igoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781293973; x=1781898773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrYLccQHrQmtz0zec3KOHrvCzqkYFKFO/MVBEjo1RR0=;
        b=s/ikyGwiAb2sE04i/PhDDDTP4Ll4pp78Zbk9nEmAKfE/yQ58OJ549RbogQCZK/PI1c
         U3VcaygyGclkkmiKepj/G+Gn3G1QHfhIj4So0wVzvyPdT/a+s3gaU/M9nG+iyda1dBAm
         Qa2XEKI6dOQ0pJuyOZvJRyxUH6z+zKS+sE9+21YBFt1RcrOabDF/0sKGSd3SvHYrVrZr
         Sd2+jpXDiLtjqu6hrjy0nNIBfujSTOUr2TRtmesLS+wmGAoQejnE++VQI+5kEQ73pIRw
         1DG8FT1fnzRk+6SfNxxEhy1aeO71EnjYWR0u+cwUoD3A8+bNPOZEyNqGBsmTa0bTJxbm
         3uLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293973; x=1781898773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HrYLccQHrQmtz0zec3KOHrvCzqkYFKFO/MVBEjo1RR0=;
        b=JcJi+WZt6XQjftbiiQwgPGUXFOJR7VFEjUmERgFwARU0/kcReOTaZrQgYIP9Lf8oGf
         FK7zJltEmdvevZpBFwYuxNKoD1IB/AuoNxLWZN+AXy46fWGeP9ktXhB/3t4L4XFiXEO1
         XF0UskfaZHrEuMgdmddVU/Kxds0Sx2oYoxPS6lD7wHp3HjUtuFUxPX3uii8pz1DpNsiO
         RTrQ3O3/Lg2d1683MNCb4+7LGurMKGLsqN6jeJ7iM+71HZ/CqRIYUaUoVByoP4gNJm9Z
         jkJTWNJuABMnLxsfTE7jYHOmTPDtZ6dMYLesC6OhV9fXY/1LYCPnsOkaNNoBxGo+/QaP
         nqfg==
X-Forwarded-Encrypted: i=1; AFNElJ8cpdKEB6oMtnnGiHtqvR8Ma9jsJW0aQhuZvFV8DjKgMGfcSuSFoyC2aUlxqqRJIBTRfU3qRMcXyZdvCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBlvo7VaAKk6ZSwEC+mlrwo3rYJXUVeHFSDLKZfEU+KZdV8gyl
	yIn1Ey4cQnZtyp+WWX6Hc7zrE6EKDiMqPzeGKb2Ogx2N2EGlh352xvf+Nk9x/DhwdpQW3K721CL
	4eARUeBZBHh/qOlcZW7wJvkOdYF0zEEo=
X-Gm-Gg: Acq92OE3TMtVbO4EuKRNr9IIsWWfogjJAJUDR74IDMtnkq9xOyuHpBVkUdMm1KrSMA1
	gyGRynp3D+bD5+XkAK4um0+cbeBra1q6q4dlnOmVxjf9XuBHgSd5PEIA96N0yDcJrCkjsTOgslU
	Hxx8KuONf8LEgwkWUM7aK7DSHogMrzsPOXqn+VNDABBDjSa6hL7I9SazkBkfUy3BMVzfBS05F65
	e5ZVZlnXLk0DRCVMSvvyacMNEArxvP7iGI2JRlg/g4CPWl2tmaADbSdgX7h18A9aY98zvZmssIi
	meegpRQJFRTW+iiLeWFlhibHriqberP2MP+PJ+DZG6n88QR93KE=
X-Received: by 2002:a05:6402:42c5:b0:68a:e054:5b72 with SMTP id
 4fb4d7f45d1cf-69378a2e7b2mr2104851a12.19.1781293972693; Fri, 12 Jun 2026
 12:52:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529142322.1362438-1-linmag7@gmail.com> <20260529142322.1362438-9-linmag7@gmail.com>
 <CAEdQ38HYJoUKTcC3=sU1kzRZEqDuOpx+HF7CkVqXBkJ2Drtz2A@mail.gmail.com>
In-Reply-To: <CAEdQ38HYJoUKTcC3=sU1kzRZEqDuOpx+HF7CkVqXBkJ2Drtz2A@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 12 Jun 2026 21:52:39 +0200
X-Gm-Features: AVVi8CeePryXXpDHgfA3-o4itTp2STTExcFMA2_E3eMfXdbI4uHaZDZ-wT-Z764
Message-ID: <CA+=Fv5RHVqJSX7tUPqwitqS02EvA3gxFP059gH2jgTy5-GuHXg@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] alpha: enable GENERIC_ENTRY and GENERIC_IRQ_ENTRY
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de, mcree@orcon.net.nz, 
	ink@unseen.parts, macro@orcam.me.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 7:52=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Fri, May 29, 2026 at 10:23=E2=80=AFAM Magnus Lindholm <linmag7@gmail.c=
om> wrote:
> > diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
> > index 69eb337347df..d4a8937985be 100644
> > --- a/arch/alpha/kernel/ptrace.c
> > +++ b/arch/alpha/kernel/ptrace.c
> > @@ -134,18 +134,51 @@ get_reg_addr(struct task_struct * task, unsigned =
long regno)
> >  /*
> >   * Get contents of register REGNO in task TASK.
> >   */
> > -static unsigned long
> > -get_reg(struct task_struct * task, unsigned long regno)
> > +
> > +static bool
> > +valid_regno(unsigned long regno)
> >  {
> > -       /* Special hack for fpcr -- combine hardware and software bits.=
  */
> > +       switch (regno) {
> > +       case 0 ... 31:
>
> POKEUSR implements the floating-point registers, 32-62 (63 is FPCR).
> We should implement them here as well for symmetry.
>
> > +       case 63:
>
> I think we need to implement 64 (program counter). Without that, I
> think single-stepping will be broken?

Nice catch, thanks alot. I'll fix this and send out a v3. Thanks for
taking the time to test and review this.

Magnus
