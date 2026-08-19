Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A75E1799F
	for <linux-alpha@vger.kernel.org>; Wed, 19 Aug 2026 01:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787101596; cv=pass; b=eyHuxNCmITm6ScHmDshZ8a4rp0Ac+Ba4ywjbsDhArfI1xgfHa35r6s1ST0jGM2pzN69udFucw+DpIBqJRWn/nKF1gVgtAzatXXTyWxsQZDmJASS3XhK63pRu1zX7yIWshakFrL/OVcW/jVgPvLB2ZTmwZRMc+1duAP6MI+C8ED4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787101596; c=relaxed/simple;
	bh=TbvLGp9aD+2RDPniO6Wahe9IFHIFUfO6pxWOXLfdioM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3Kn3+8ygZbDYZSlImJWFaRQpfB3Z06QbWRt6RNusg/fuGOU5UsYLuAKwe0Gw2NDWOkJQcW0r7H3+5O+KtYBWCls43Y1vTRAtDUF4yftzlcwMy2RDPAe3MCN9UGDSIpnNcXi6CugMFo1zckn5dlcwtWK3vS3okjT5rSspYnxu44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVzneyMw; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVzneyMw"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so1945256e87.0
        for <linux-alpha@vger.kernel.org>; Tue, 18 Aug 2026 18:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787101593; cv=none;
        d=google.com; s=arc-20260327;
        b=LbWljMZK1fpggVxVf4a9RU1e52dmIx/WBTWfB25o8tc3tT6eXk3Lo2zlAk+lTeM9Wf
         w5jixUoDX+P6s2xMLZVuGoDi+91wLiPCweXqUBMyBkDKYQwK7dUXmqAQavkVtdYzYx/n
         9y0G+T3pVItNVpIkxrXvTZxMqAX6lVL1JDy6pVh8W66DPz5goYhXPVbGtVJEX1FjKkPk
         UmiywOwBjBCSRhb91+5IZMATwhyFj+qeeF+fboaqnTPhNmz3Cxa1EeK8IxXLyXZQmeb0
         U1XTC5Vf2l67rgbtuxNnwDEn/Q6SRV9UTByE7FdTPywYlBTip5/xRUGKbOpgKhNQdfNh
         FCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Psv+vV5FJBws3mLEc3qiU+1KxE4djPJwTtEs0koRMRA=;
        fh=zO3U22VuspcsbFTzdRjB6cnM1NLMPoiGvKAdKIaJ0Bo=;
        b=mSy+f+jLi8NEOh7ZPKDXaYIoQW9q5O+kIunw9kpdfBB6YZO5Vyll8tTtd2tLsM1XE0
         ejjwpc8lPZbn2AeDxQL2S6bYk6VpEI/UFRGtKs+bIt1tj6LVUsLSXkNgSLXpq316mEGU
         fhjMWDVWhPMVZ4doWEQabMLWqpoG9Q/376a0W8l1hPigZOLVbs+pPxMvwdIcmEGKMnRC
         qxRaBxfpcMzp4CJRH4fBX8zqTtPGuW0bHVUJCXQZzJFbK6NOgRl0SR6VGslWYmh3Bcq4
         /UZDDXQyXAn9UbEBwVRyAZFBrFxXLhvk9NKnYisiFtddCtjzduKO2UzAgWU/zBnh6bZw
         Ywhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787101593; x=1787706393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Psv+vV5FJBws3mLEc3qiU+1KxE4djPJwTtEs0koRMRA=;
        b=eVzneyMwHPG5RtZ9ypw4RJO5S8YGkcHAnWDBfIsQVZqLMt+IeSp1k/axd36xDna35X
         uNv0nyJCWcyoeHwrkvXBjlnuOANsS250hdxWUXGJbBJaaeWAkR5yC39DECEPTt2+Y1dd
         SKhX+TAndtWidYs8LjKO++Yf0/DI7p3aoVF43NGhM6hRRLvgXZLjwDPV+OOwc/4m/4tX
         5aJ/CoF2NZpd6BEns4KSYExQQ0T8kozGqQGz7sj2qDAAi3AfpBKotvkcPqUjA8Zb1TRT
         3lt2jsknmG8P+kfLsX8Qegln5r4WFjIEqXtqscMEdWYorjR9uNGRe5y0ZPIIqb15uMRl
         oibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787101593; x=1787706393;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Psv+vV5FJBws3mLEc3qiU+1KxE4djPJwTtEs0koRMRA=;
        b=ExTUv0MLRSUPH2ZShViczIy/6Fo77i9B80AvQWKRmXaYa2+mJTAyXyznr+TUXrE8tn
         F1eSWYBLV35cRPjhWRYtq7uLWSfykgn4ftljsIwUzTD9iqjZq2ZDVirMA9Ji52E5ieWy
         ExKAKMU4NMoxf6SsLM6t/kaEP6NluMl2cboj7vdJcNINvJNfs1HURqr4ksaENvPPpyKU
         l6sDzrWTmzECKNRoNY4FRmyMG+h2i30YgWEam51hgm0Se9LhCje3m335/gTWakNhuiv9
         I62BGJOb0fCnF7nhvetZYT6ZTOp/e6TexWQ5+1GTJ6d7sLneuTtDPkxDxH8aqQJCPHB7
         PJnw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0QYy+nCktOL1g8HAbjhfMiZ/bkWdXPepQN6uGVznVmrBRzQ9sCBdPUvK+4SKMrZkIdEJrd6+e0SVf8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkdQzmkGb7lCUTMiI6IRGbHv+kyESdmpgAjy+IAl4WoQKDutkO
	TjrV6ffWoUbblVIdDBl9WizhMIInIoptkIMxo+gcgK0ddUfXkYs+qC/QtUkyqGpPpAeSYjnlzqp
	0XjXGSlhqu+ahfiCRN45HCEWZuMYMGpY=
X-Gm-Gg: AR+sD10BlIVH0Mxvk5kSF0QpisiBSKgmD+Vbb2LhRF/FftbprKdxWnCYGSjWOIKuNFE
	mY5uICg4yhkFFOb8HNX5CXqCpy0nCKvfGcg5IaVR9v8SpcvoyKIZ7WNllQ0lWIHRO50WrxstftO
	yE6o3JwzpaiOuFnBWQJCstfXaRON0mpXVLQc0l7yf0pkf5dQSaq+IFWK8cYe5rFbvtjtdDoIlTU
	E8sjSrLM+Pqrag24hxIIGlRf5i7tEDW2Xy43YNqpAdKdvxtBakTxG+BFu2X//UWYbNDWog+BjWt
	Fae5VXOosQtoIvlo+QSs9CJMevjcEhBlpUSCVX0qN9m0Jf6CbQO0pzAY01G2l7RX24IlvCItSTV
	NhvQ=
X-Received: by 2002:a05:6512:224d:b0:5ae:b5d7:4b99 with SMTP id
 2adb3069b0e04-5b4785e6216mr238239e87.0.1787101593147; Tue, 18 Aug 2026
 18:06:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
 <20260803195135.GA1083357@ax162> <CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com>
 <CAEdQ38HhVk0rmq5ZRHbQABgLix8hq49QjzxNDodk_++DmA5Thw@mail.gmail.com> <CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
In-Reply-To: <CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 18 Aug 2026 21:06:20 -0400
X-Gm-Features: AcwNN1WcKtw5ENjFpgp0JrUF6Cd7Zxk1ebk8fb_me2vOSumdHXZLIX0XvC6ScbE
Message-ID: <CAEdQ38GFCDQF84ZOvGBeRvsc1TLHsJ6eJ8wMxMpeJGHKUWGXvA@mail.gmail.com>
Subject: Re: [PATCH 0/2] alpha: enable building with clang
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 12:24=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Aug 17, 2026 at 8:28=E2=80=AFPM Matt Turner <mattst88@gmail.com> =
wrote:
> >
> > On Mon, Aug 17, 2026 at 7:16=E2=80=AFPM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > >
> > > > On Mon, Aug 03, 2026 at 01:08:40PM -0400, Matt Turner wrote:
> > > > > Two small patches to let the alpha kernel build with clang.
> > > >
> > > I'm curious, since we've yet to have such a case of an out of tree
> > > llvm backend, what's your plan, if any, to upstream your backend in
> > > llvm-project proper? Perhaps as an experimental backend?  We have bug=
s
> > > filed in our issue track for m68k which is experimental (but upstream=
)
> > > in LLVM.
> >
> > It builds a kernel that boots in qemu and on real hardware.
>
> Wild.  Where did you even get real hardware? I know very little about Alp=
ha.

Mostly eBay :)

... along with most of my other pet computers (https://mattst88.com/compute=
rs/)

> >
> > As of two days ago, it's capable of building itself and the 373
> > packages of a Gentoo stage3 + a few other things. These include glibc
> > and other core components (in a qemu-backend container on a fast
> > multicore amd64 system).
>
> I haven't kept up with Adhemerval's work on building glibc with clang,
> but pretty wild to hear about glibc building with clang period, for
> alpha no less.

What a time to be alive!

> >
> > I would very much prefer to have the backend upstream, and I plan to
> > start a discussion on discourse.llvm.org this week. I think an
> > experimental backend is probably the limit of what makes sense for
> > Alpha?
>
> I agree. An RFC on discourse is the way to go. I'd use m68k as an example=
.

Thank you. I'll find the m68k discussion and model mine on that
(assuming they were successful).

> >
> > If you have advice on going about this, I would welcome it (privately
> > or in reply to this thread).
> >
> > Current diffstat is
> >
> > 461 files changed, 29735 insertions(+), 88 deletions(-)
>
> Only advice is that if any of that was AI generated, please do take
> the time to review LLVM's AI policy.  Reviewers have been getting
> crunched by low quality AI commits recently, and are a bit salty all
> around.
>
> https://llvm.org/docs/AIToolPolicy.html

Indeed, I have been, but my goal is to do enough self-review such that
no one would be able to tell that an LLM was involved. I will of
course disclose that LLMs were used.
