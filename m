Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964C9306D2A
	for <linux-alpha@vger.kernel.org>; Tue, 13 Oct 2026 03:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791861606; cv=pass; b=bqY0ZulR9pmUpFcfg6FHbstzf8wksago6SjAnGueYQx2a+64122a6oFVmA1ICQ0WFpwZJX8nr2BOFvzUVKK+eNTbAVO4muSjSbSJhnnI7y5toN3dbC0X2JGHU1iKV5bMvEnAxzgL3Sn30kpN4hzxIxoZwBu65k3Cm8+WV2AZmRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791861606; c=relaxed/simple;
	bh=72W1TYLhTlY5mHnQbwXp7nlRivybQU3gGp2mD1iL4vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eEikFGvWfua4mBhUYgP2WIK7zy6IIOvg76rKLMsg7HAqiN83L144vpQnKu8nc0KxC+6H+M62e6PgEfayfrg6Yq6kpsnPszGJw7F0qZ6H7SOChGHLlY2TvoKZ+asqcMnEw5+TqVmJU7kl8lqPD+YaD2YJJTHWdgNkiX9xMeBPSfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHWfmuXq; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHWfmuXq"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a980c01033so20882711fa.3
        for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 20:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791861603; cv=none;
        d=google.com; s=arc-20260327;
        b=B3Xdl+Y+diUPvHEWqPxQmklhbY53ai8MbJFQn+0TwARKDaRaGjRdRnfiEIKmskt2OP
         9aVODdGhzHvqir9hSy8nN9/OMEZHkyQlsHYJ+W+MCr1OoK+8L28xzt0oiImqFtEMEG71
         3Uu9XjS1cBDldjEXTQHsNLOHwEzSGj2OIfhz7WgHmONPoAftsC6lMRfukBh+vYdnrMff
         Y/jheWKTAcNTvDURC62PouMk9wmRdme59ddb6lmLv8s2me57wz4kSKlRsj3PdEzENgyl
         LC1j6m/4EcDqFUNfc0apvu81x36pwCYkEH9E18ixud6i+cSfC+TsWIYkMmGMH71IjJTB
         ih4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8uzRKJ38CQO5fI7/X0o8JnofebUxgax7PJCqj7QJt9A=;
        fh=ycDsan36qivy0bCo1LRdVXRmmaB+T00NF2ObfIyV780=;
        b=HTtfoIexNVtLJHEIwzVZzuxNxXJk6HbvwZSYMJ8cWuIG+KsZGNLj7UNiUAf9GUO79d
         QX3A89oJovWuiE/91wHWc3hNQhtJ4Cto/EAG8ZYTLzg2MdtwMKvGRIxV+Cn77QveJG4p
         QmQmz8vkmOJfwfDMICv0RhC5djyWwOEmfoz82CLxpQYdpNPFX0kmvba2p2LSGl4I2WO4
         USm16YnphzyqO9XRGJsneckk9NQ3ig4Kwb/qSX1uedOs1nvqzIJPtGukl7ziie4JAjzA
         PopDRo9jAaqQzpqQoSXBafqx5SliFtsKowMlYla09exKJ9OF8SuAMgINGpLIE5tDO6EO
         L+7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791861603; x=1792466403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8uzRKJ38CQO5fI7/X0o8JnofebUxgax7PJCqj7QJt9A=;
        b=eHWfmuXqR7N2A2vjX92EBH8n11ngbXhuXn0GS+SI95SPao9EJczinwx4qt/6RK2YAf
         JHd2OBJVcQDHq01r1ZivkLJ28GVYDqygxdJqKvHIZCM9QlZPCS+d5r6/4LpgyAAWVfKq
         TyEyeC5Sn2Zfc8QM/oqeqCf5yIu5W9Y4lNMMDfYXl7vuRTdlclBd7ikOUBkS6MXQp0xV
         YMTgK8QHRyGJqtwKGTosYTTSRKXN+oh4Zwot0Wl1hoCrDy3diVBsMqbyyDA7v7Al5g+Y
         Hs2byLireJ+4MHzf5a9f09Leuc85y66ieR5wmA8/j9tCO7Zpnmgpa8P7VneMxLvFNopI
         mnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791861603; x=1792466403;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8uzRKJ38CQO5fI7/X0o8JnofebUxgax7PJCqj7QJt9A=;
        b=e2l+yyKb7ASist9LarD0p45ZLSDNPjZ0CV8etbRAGgohkaO9QuOREZQYaRnurO9Ah0
         ICdJxqgo7ivJ5QDtr6EK6zcr6QTBKzHJX5ldYSvNsLXm3DSI/J/1FuFv/OhxLud16sYo
         Kd49ei/FKuHYSsWlrbJB5vros0zeeMrO4EgeyJhSW360MLUVmzdgUYJbKNSiiUI87FNI
         qc5MBt4x/QyB4i5oEGOUCdL1CxzuBwi3ioNlTuFyoio99qYoLliAGnGhBOUrEr1H+8H3
         V/qo7UJZV8PJCRpgUAXKmxyPh/MtXwZKqpQmSvmN2yrqxE/0P6gj9jL6Z3egcS1ZN1XC
         WwRw==
X-Forwarded-Encrypted: i=1; AKwUvByVlOqTo//HVPsyz9ti4XT0EQFwy2G0740pf4hsvhTALPKhhJOoOxWlb6DN59xgcmpZNLU6BUfqM6nZ8Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKc8wdB9oleOmJv5AiFy8A5g5p3/gTs3WmrXibZDrrSUElSnc4u
	iBmyg32UY274Umy/k8qOHYv98cWEudsFRxtYwZP2GF8Ks3qo1uMtyR+bNT9ynTN7dvV8ecwJgq+
	+sYE4fgiOHIsd6P8UdLE9Qosm0YiRE88=
X-Gm-Gg: AYBFou0L6MatrPRWMWQGFUa64euqHWzl3MNlhS1Kq4mq2y3DL9c2fLxRD3SaQEIh8jv
	8rOYr7ULHVAiI5YV9hxI81/xE2hiUO8kApWeszYOIUARkakd1Iy8eNSZ7SAZM5xRwLBgEfVVER8
	aw7/g9j1l9vnuPsagkDxxabDkP3cepmuw43ZvU7vT+3s+y221iy2ztHB4BvVrSbo0ojb1NnxKy6
	KiDiuEZSA3EysLTYguR4wRHnDsOLv0odZ8PUk2xo81GvMjBKcBQ0u+eaUJ8Pll49tZgWt+4g3y4
	bI/EPrcIRIj481Tem2uCpw61+GOXJCPm5PIHS7FF49+JJUg2M7JhXVkJPLowy5I6DTCT6dIK0bM
	6ii5bVdHxf+dQql8V66nhbEupAuqQ9LfrWwLlfBRhKhzIg36lDVRTkdKW0+KAisBam6sHaD4dar
	ha2DEo8w==
X-Received: by 2002:a05:651c:2109:b0:3a6:772c:2757 with SMTP id
 38308e7fff4ca-3a9c5357723mr27901721fa.12.1791861602415; Mon, 12 Oct 2026
 20:20:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011191344.981000-1-linmag7@gmail.com> <20261011191344.981000-7-linmag7@gmail.com>
 <CAEdQ38GoGhoaoymQER16qF2NHwhOGjGsTh68B8oqSzeR-LL-uA@mail.gmail.com> <CA+=Fv5TC4OTgVKXdnqDWawXBm4M1m8ZHPJoX6wL8K8fdyPo5xw@mail.gmail.com>
In-Reply-To: <CA+=Fv5TC4OTgVKXdnqDWawXBm4M1m8ZHPJoX6wL8K8fdyPo5xw@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 12 Oct 2026 23:19:50 -0400
X-Gm-Features: AclHuK9hJRZQQijffp3ZG423JnMVaXslPDbjKrvlp-t3oTq7yIesmqsGhDbHdBg
Message-ID: <CAEdQ38Gcfco9N62rXueiwFBF+r=7A+SptYUsecOdq_ipihKmKA@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] alpha: stop on fatal Tsunami system ECC and write
 parity errors
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 12:58=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com=
> wrote:
>
> Hi Matt,
>
> On Sun, Oct 11, 2026 at 10:01=E2=80=AFPM Matt Turner <mattst88@gmail.com>=
 wrote:
> >
> > > +#define TSUNAMI_PERROR_FATAL (perror_m_uecc | perror_m_perr)
> >
> > Why PERR and not RDPE? Bad parity on data read from PCI seems just as
> > bad for the consumer. If the HRM says the Pchip poisons that data and
> > the CPU takes a 670 for it, please say so in the changelog.
> >
> > > +             perror =3D live.perror[0] | live.perror[1];
> >
> > The changelog says incidental PERROR state on a CPU or environmental
> > vector cannot trigger the panic. It still can on a system vector: UECC
> > or PERR latched before an unrelated NXM will panic here. That may be
> > what you want, since the error is real either way, but the changelog
> > should cover it. It also depends on the PERRMASK question I asked on
> > patch 4.
> >
> > Two things that I think belong in the changelog:
> >
> > A CPU-detected uncorrectable ECC error (670 through
> > ev6_machine_check()) still does not panic, so after this patch the
> > policy differs by who detected the error.
> >
> > A PCI card with a marginal connection that asserts PERR# now takes the
> > machine down, where before it logged and carried on.
>
> Thanks, these are good points. Would it make sense to drop patch 6
> for now and address the panic policy in a follow-up? That would let
> us consider RDPE, CPU-detected ECC and previously latched errors
> alongside UECC/PERR, including the impact of a device asserting PERR#.
>
> V7 could then focus on the reporting and acknowledgment improvements.
> That would preserve the existing continuation behavior for now,
> without implying that continuing after an uncorrectable error is safe.
>
> Magnus

Yeah, that seems reasonable to me.
