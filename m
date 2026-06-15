Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5A33AE1B4
	for <linux-alpha@vger.kernel.org>; Mon, 15 Jun 2026 19:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781553341; cv=pass; b=lO/R6Iiw4n3fkBT+Zvnjow8UTo2UHsTdxMWSeDf2JnvA1uVyFmkupJjf+78K9YhjJOYfKVQ+k+Ed68EKfdsxFN6wCHWgA19Emel2S+ZrJQHRtR659ojTTz+Mxd8SMByLvoE/Euws1eDcBRjjrAENLgO8dLoJlHOsjT/cZ7VMaZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781553341; c=relaxed/simple;
	bh=eG9bjO+yPnqL3K1HuULNf3d6m/0FOLFESw4HBy5/K6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=MbXm+YytA5BgPtaZL0+OpjXudwasRNQrG/s1Vm1lRnvyhY0ikTWTeM1coPiG8yj8/hBjy7VP4mJLYeLcCcvJgyifZTMnYKcpSfVWqnM+f/Bqwix5NUMTPS8qK6q8+u7JATi7D1l1XAekGwC4gBYDZnCMqz7GA7K6Y0l5fkTKUZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kt5FOxSc; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kt5FOxSc"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-beb1bee8c16so423863966b.0
        for <linux-alpha@vger.kernel.org>; Mon, 15 Jun 2026 12:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781553339; cv=none;
        d=google.com; s=arc-20240605;
        b=HYM364wruQJGU+AxW9Uifz7T+EGuxuXZHLIz8yUUWAnxTF9COOM1LfyQ1rhqkaWRz2
         A7/e/9ORNIaZHkVHBTVvB0gPrdDvr3FqfcOD+g1krkovHgM/qg4k5Fb/Gd0oo+eNCT59
         4o12ItOhimDf/Fe8OwaWZvx5FI5qOV3jMsvplZBszmSeNYR4FHvX8uBHeW9OQzsnCtIX
         ecjakmmkbNaSoF1EIo/Mqorjuuc3LsLWaBKWVkFIYYjjpuZ0WQBwz892zuWw6wa8Bi9h
         18331JIMOR+S9l2RKJ/hG5HQxXc9RwK5+nkzL3qJpHkLSPfx6sLQJdlNAsL5E+eqq4Rt
         HbWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YeTtuHVS57e7HABEo54rZ9rKgT8KEheoZm3MySUQOXk=;
        fh=4MEgfSX0AZcf1G+vzcHkAMPuyWlYU8ni8YkGLNTWs70=;
        b=NY9cOddiifPnnHsrxaPdv1W9uFy6K7uDtLDDjGx39Q/Ou1Xy629JL+U55Ud4Y4+hxy
         WH5/etJ27ZLRIDBsgEC3bAhnJIsTyg/0pkeQJqDBR4AA9E6dNlLPJsq6i+QoCkVQxKxZ
         cLXPKbRpl+BuyyB7e2i216LPyHvO5M6iq22MlmmGJx3g5QD3b1OMQ4wcaJm28IJDCaMc
         IPSfCMpwMR/tGUTEL95r3evIjRKcWn/ILQ/JTEdTTcQ7/3kRSpVk51YysMlC+KBmXdnY
         k7FZJAi3orOQGaA7tdTtecHVe9MMrLKeg8TUQuqX/gAjRKIVwEs12BK9hkWRP1NYrwL7
         GvBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781553339; x=1782158139; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeTtuHVS57e7HABEo54rZ9rKgT8KEheoZm3MySUQOXk=;
        b=kt5FOxScDq7LCQgfEgsjhs7sn1D1Q9CfUImGNpmtMq5nYQXtoslsqQsJONQ3Y/P3SH
         +1Loi9LwSxs3C+/ptje65bn3XAvvvAt/AvDmZo/xzu7whXA24H39FSxzJBk3r6nFEaGA
         KXieQEu7ChFkjW63HIR4qtPMxIE8x+6KH54rDbSsSEA65Z8KS2LSXxI3omMuiQ75yYEM
         WhmjlzJ/5MpKqaKaWFfTqarB6U28XOdF93MBoYpmbA+7lQ0wpfxYg+8whh4m5rud629o
         J5zSzPhrx1wjufXlAp5Graa6pMfIxkNn3l+1Mvalwv8sPynyjv0o0SftQGuR5uaROU0b
         kOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781553339; x=1782158139;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YeTtuHVS57e7HABEo54rZ9rKgT8KEheoZm3MySUQOXk=;
        b=WYQku2+moSBLy7W+zgW6a7RfhG6buRfN+8ZJ68u5sFoeQdh19rL88OO5uoM3Cz65Xs
         OJ4t6DqPIl7QmKnbaMTjswMmmtsTm2KxTp4feTj2aJqb/AzHSJ8RigX7YBHww8a31vs3
         MXKnoI6vmfTDVlrUMVPUShnEqyG2GFISvFb+ZzWzFGanbXG3bCU9KbFg09Ig+n1lmhYP
         ycyGLyWBnXQKBrgPYULwe9fKQFSu/sX25DV3nPNUHBgMAN0Fbl/8aOxB09cE58XpPXCz
         MMol2hyYJDgE4vEhgeR3gylKJvmoJXzxeuMrPyEmWbGZFAwt4ykVoXmuUbpRvgTn6847
         Q4eA==
X-Forwarded-Encrypted: i=1; AFNElJ8zcFZyZayAXtbraAHWt8VdO3FXP8unRCctEF6lZ5wEfii5enirrQZ+Ig61Ixg2LU+Cxmrt7ghn89mLkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YymB30JjyO7dtgrfaJhC0C3CoOSTTdQ/kWvY/BOmRlhzKHgWFBb
	Nb9zYnOO6IfHzOJbxulcHFHIbqn3AOL/lQvh/qbNnCCjqhuH2DNJKTAQeB2m62LUjr7Jzr5oabZ
	W9nHrZsYMHjWrBPFTI0OgWhoVxiJNLx4=
X-Gm-Gg: Acq92OEOyrxCiJ+R2AWrHv2C8Aao4CsH7j0sjpXyabjhNxIuGsyVyeQ6n6xfQfJdtmp
	f7EvKrFR4Uh0T4/HTbWrrUBAKrzXK98WUEjoOiVJSA/tVWW3hZnlnkHrFHxQIYKVv1Pa7QTGWEm
	WPprp6tgauNz0hwHI6/OQTm+pHTqMG3vzY+/a5MBny24CtfqTvJp88EGCC5rrpvATQybv83/x+Y
	1kqhB7vjzQbML6q+7pp69fAWvdMUUV0XwNn/Kl9ykPwsFXUQe+Acr1sOXC5/9dIPJaqbRE2HADb
	BmVUqsNLcbqmqkOJV+XdF7HXSyAGaEmnYEhYQbQ=
X-Received: by 2002:a17:907:7fa3:b0:bec:5264:e527 with SMTP id
 a640c23a62f3a-c04177e049fmr52353366b.26.1781553338384; Mon, 15 Jun 2026
 12:55:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612203006.2265557-1-linmag7@gmail.com> <ai4GLtp1Iaqz_aVK@creeky>
In-Reply-To: <ai4GLtp1Iaqz_aVK@creeky>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 15 Jun 2026 21:55:26 +0200
X-Gm-Features: AVVi8CcWxUOPV2r3Zx_fEsn6yU7cGGDt6Bu1L4A5SP_BgYc4fV38gyCHXAlRlVo
Message-ID: <CA+=Fv5QgH19VsbbQcJFMWJ-8rnzEwqUv_HrYVZLGVMUnj51=Fg@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] alpha: enable generic entry infrastructure
To: Michael Cree <mcree@orcon.net.nz>, Magnus Lindholm <linmag7@gmail.com>, richard.henderson@linaro.org, 
	mattst88@gmail.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	glaubitz@physik.fu-berlin.de, ink@unseen.parts, macro@orcam.me.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2026 at 3:39=E2=80=AFAM Michael Cree <mcree@orcon.net.nz> w=
rote:
>
> On Fri, Jun 12, 2026 at 10:26:48PM +0200, Magnus Lindholm wrote:
> > This series moves Alpha closer to the common architecture infrastructur=
e
> > and enables GENERIC_ENTRY and GENERIC_IRQ_ENTRY. This is v3 of this pat=
ch
> > series, please see below for changes since v1 and v2.
>
> I am seeing sporadic Xorg crashes with this patchset applied to a 7.0
> stable series kernel, usually within a minute of logging into the
> desktop. The rest of system keeps running fine and there are no
> messsages in the kernel log.  I am testing on an XP1000 with Radeon
> HD4350 graphics card.  The same kernel without this patchset works
> fine -- no Xorg crashes.  Indeed, it has been playing the dulcet
> tones of Pink Floyd through my sound system for the last hour without
> a problem.
>
> Example Xorg backtrace follows.  In this case it is a fp exception
> but sometimes it is a segfault:
>

Michael,

Thanks a lot for taking the time to test this series. I was close to sendin=
g
a pull request with it, but your testing clearly shows that it still needs
more work, so I will hold off.

Given the symptoms, my first suspicion is that the final generic-entry patc=
h
has changed the Alpha return-to-user/signal path in a way that loses the ol=
d
explicit FPU save before signal delivery. The old do_work_pending() path di=
d
a save_fpu() before calling do_signal(), while the new path goes through
arch_do_signal_or_restart() and the generic exit-to-user code. If I missed
preserving that Alpha-specific FPU handling, that could plausibly explain
sporadic SIGFPE/SEGV failures in FP-heavy code such as Xorg/pixman.

I have an XP1000 with a similar Radeon card, so this sounds like something =
I
should be able to reproduce locally. Unfortunately I do not have access to
that machine right now, so any proper fix will have to wait until the next
merge window.

Thanks again for catching this before I sent the pull request.

Magnus
