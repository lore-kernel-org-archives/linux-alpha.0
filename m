Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6449647D47A
	for <linux-alpha@vger.kernel.org>; Tue, 18 Aug 2026 16:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787070295; cv=pass; b=RMsZmcxTkerUSNWBpKoW0j7oCOsAo+uwo/HLSO0QqCHerboJYrHMSpdEUgmc6U7qfrnHUG7s9GOwHdLEWkfOtEs7s24/QH6KOj+4MWcX5PM4hdBUqksHqLoFF4J4RfSaMpHT+Rpg0KbMRA131KU0ce+TBMazxrMSb64BL01f2lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787070295; c=relaxed/simple;
	bh=33DXvXlll0HyJTxrb78h3DqOrjFtADo0DfT3EHT2Gmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YIrBpnzS2J1B1RO4QZDLQcsGrlUXiyHGDP94mG/UtPTj2B5mpYrGSJLctuu5fuXlYqeoGuUGCkeVuyIBSt508lysWlIriosJ1LKMnI7u2rr4yLGvDxf5m3LB6iYZXnIM8d+rMZ5Q9rp+UJ8QenzJeTUvE4PCK3D02yZ5hZ+n7bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cIqE5isQ; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cIqE5isQ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fe377a217so3325602f8f.1
        for <linux-alpha@vger.kernel.org>; Tue, 18 Aug 2026 09:24:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787070289; cv=none;
        d=google.com; s=arc-20260327;
        b=p98WPUyip+a9/T9XWRaIa4Ov5lSzB8e/g9SoXVxhrTi72hUyaOWsQAuf4lgodtkFdl
         MDIkOXUwPTaoM1e/rVKNhNu/V4XRcQKdBrYtGbFaPiIxECCWDcxlx9okUwZ5D0sSAP00
         VHnb77eF5+PFtWjr9IbkrerIdJ/RWeFo04554e3Lf4O1ZmxMaAUgmJJHaNDeOY+m75JB
         pAKFLGCCbCKp62tUQgUZFFYU0ZCRyemyIyZYUbS9AgCc2Cw6st6/EJVWz/EZHH6/973s
         SVWBRdg+fK+8yzXtwfszTbu1lt6pcx+BOccKQ3wT0AmWv60CtaZgb8+Rv1z20kgt6Rfb
         PITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ig4ZJ5ec863N27eKcdbfitdKOwnVM6xhItPYCP368+k=;
        fh=jIx7Rm5Mu3DiB+Mbvk0/8I7TwarsHxIEI9aZ690U++s=;
        b=O91Esz0tz6E03iJGK041mQFuyTLUz7CszTAPldb7Vh9IPumKB9UJbJSndWn8TCdnmN
         8gGevvujVie5I8WwHstPm9avLxx66WeE74u5tm7h8z8EkaHpl5BxkLSmQA0/G5picCXL
         6zkFmT/m2wxark2yjKAeYshqYeu1GGj6klBFZ0GF5+fuR/wxEclNvM/pYQ21NarNlR0B
         2CQaNnqS/REVq3VgxIbNJ4t2JVX5UqKgqeRX1zqg1uYzABOjJe9Uzp8sfmO3QIPfTEtH
         hpIuwBvQDxAcmxZ9KQhrHigWiRYqcRBkW3QdShvBfoy/Mfbg1VhibPukMFbpfQbeimmB
         jSGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787070289; x=1787675089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ig4ZJ5ec863N27eKcdbfitdKOwnVM6xhItPYCP368+k=;
        b=cIqE5isQJPGBK+qXyELGekaBjHsALGqLd9iVC6Ql6H6ATzgtPIS+pqduCFx7XlqJIr
         Lj7QBvRw82+Jeu44MsPvyQ9wt00l+BNTg7Xv/9+SVaoCmKY2fteIV1xec1DdDJ/c9f1U
         2u+yznVbXeyTq22je5CCwhgzkeZxyBqtWC8wylEA8wbtE01qLZGOnskHztNjFBO6nQFW
         LOu5NAEzrr5flBam7y57e0H2BBThhBJUYXbBRooO42PXrd+TKudYqRr4wmbymzyX0vWQ
         /ygNTD4P/RqC64Dors9zeMVQwTRoJpiziCDVIPlxhPC1cnLRkY3y75MqXG7iAE4RPVXn
         m6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787070289; x=1787675089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ig4ZJ5ec863N27eKcdbfitdKOwnVM6xhItPYCP368+k=;
        b=REVLLCSUcpJRR4HbT6d0/MJmS/QWgWxu86M/gIEoQ9gw8cypIm6cgcVUhpKkINesIZ
         1Tz1hvBRA5PWkg82/alKpxqUomDwgM1qmkbJGX2glIbR55rfn9vhl0O/S0hXhKYZuBkF
         EGvftMdX9N3oQSMvV51uepzBJDELIfrhEt6LGL2PPUW4292RFQl3Artp+80UMvDkKCFd
         2TlZ0h7dsmHsW+PWDZQsl9o9MCRdIW/aYAbfoek1sN8YkUeu2lFkKdIMsvEdQFbJB51V
         rtzSlmA09ashH5Lj16NDMytFdHokMkVewz7bGlIBuSvp5ASKj8fsnDe7lMFz2iioNGuS
         USYg==
X-Forwarded-Encrypted: i=1; AHgh+RoGBgTxH0pL6NdSoqd+hicsbOW3yweMzNG+7dO+dEY2omfXCL4K/GA2VKzUoPyhX+z+4TvyI/WZe7ghSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMEknYexzVZ7wgjw0m/T9viCh4foEISKcSG0vmjzWgpOb6Fq5n
	9RU8jKYPwAWGGIVL6y6movG3fSRGDbrLdf7uhYuUMTsiRUSE4pSJyhoKwdnxCTfs0/mcsAkZ+hr
	nh+rDEOy28epD/N6ZL5rFwGPXPLAMchdcfyz91TeQ
X-Gm-Gg: AR+sD13Kr9GHm8OdwnbyQVunCtELgmMteSAE8qO57onWSyg3whatXxU9s98p1t5ENVw
	c0BQBDo8cldhEiOKi0FG/8Tf17VYr88jgrD1U4R7P+2YdEEv8kUrsucBeHxLbBe7ph3IRGgrqn/
	N4R9gLd/1S4h+whXA/5Sxxk8HIELuFMwhvGdZNbb3xL3bT2ilSsFcInMO8Y08YERdir2MKm6ExQ
	pdxDB3rPTOHR2c9qbkov3Wj8iWLPmH6f457LN8agGPNIjLs/FTD6nPVWY1hLrp9h43svhMeTeYi
	ggTswPHBjC9xpaxwWcodfdat0LlyuyYgnnxqcR6UAu+UzLZY85ph9/52QzZzRZoGRyDLIdkBmnJ
	/ylPmqhv/b0FRs+7H3k6LujeDs7TI++kN5wDSTocbvCwq0pSz64LNkwBdzapTDQkAqof4
X-Received: by 2002:a05:6000:4919:b0:47f:e877:641b with SMTP id
 ffacd0b85a97d-482a8ff751dmr18513986f8f.11.1787070288729; Tue, 18 Aug 2026
 09:24:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
 <20260803195135.GA1083357@ax162> <CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com>
 <CAEdQ38HhVk0rmq5ZRHbQABgLix8hq49QjzxNDodk_++DmA5Thw@mail.gmail.com>
In-Reply-To: <CAEdQ38HhVk0rmq5ZRHbQABgLix8hq49QjzxNDodk_++DmA5Thw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Aug 2026 09:24:37 -0700
X-Gm-Features: AcwNN1U2F_9yv474aYoKrxgqvJJ_fOFHnGq3BGDcA7pmQq1T0vy1kWNlSniCBGI
Message-ID: <CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
Subject: Re: [PATCH 0/2] alpha: enable building with clang
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 8:28=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Mon, Aug 17, 2026 at 7:16=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > >
> > > On Mon, Aug 03, 2026 at 01:08:40PM -0400, Matt Turner wrote:
> > > > Two small patches to let the alpha kernel build with clang.
> > >
> > I'm curious, since we've yet to have such a case of an out of tree
> > llvm backend, what's your plan, if any, to upstream your backend in
> > llvm-project proper? Perhaps as an experimental backend?  We have bugs
> > filed in our issue track for m68k which is experimental (but upstream)
> > in LLVM.
>
> It builds a kernel that boots in qemu and on real hardware.

Wild.  Where did you even get real hardware? I know very little about Alpha=
.

>
> As of two days ago, it's capable of building itself and the 373
> packages of a Gentoo stage3 + a few other things. These include glibc
> and other core components (in a qemu-backend container on a fast
> multicore amd64 system).

I haven't kept up with Adhemerval's work on building glibc with clang,
but pretty wild to hear about glibc building with clang period, for
alpha no less.

>
> I would very much prefer to have the backend upstream, and I plan to
> start a discussion on discourse.llvm.org this week. I think an
> experimental backend is probably the limit of what makes sense for
> Alpha?

I agree. An RFC on discourse is the way to go. I'd use m68k as an example.

>
> If you have advice on going about this, I would welcome it (privately
> or in reply to this thread).
>
> Current diffstat is
>
> 461 files changed, 29735 insertions(+), 88 deletions(-)

Only advice is that if any of that was AI generated, please do take
the time to review LLVM's AI policy.  Reviewers have been getting
crunched by low quality AI commits recently, and are a bit salty all
around.

https://llvm.org/docs/AIToolPolicy.html

>
> of which {llvm,lld,clang}/test is
>
> 266 files changed, 9871 insertions(+), 4 deletions(-)
>
> Currently reviewing and cleaning up, so the numbers will change.



--=20
Thanks,
~Nick Desaulniers
