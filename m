Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5213AD537
	for <linux-alpha@vger.kernel.org>; Mon, 17 Aug 2026 23:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787008582; cv=pass; b=COAc7TCtllYPoRYy46QdzGLcYYLojLfRIJ5yRPA7EiiRQ54gJm7H/rDPNt4uNNE3CYahvp2I/x/q8NtUB8lkS8tmT12HFP3a7Vgxuf+m4krnOnvjgotiouwfHa1W2sJYnnhL1tRBsnl0VQTLHnRafBrdHLkCeD/jkuglbOf7v8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787008582; c=relaxed/simple;
	bh=aC4iUKA2UpUMbgOXb/TlUUJCtfx4w9IP1Z/GJ35LDvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lA2LF+Uv6E+5hyhRjQ8SRtW1vjEuc4Z/m7PaFUz55wHPek+yxVZPNmR5tkyofmFQEpchiIitdCvynDN1O10c6gSE4qmfI0ynMiHfWhJL3WqnfnElOFobDBUosSTNq86L7tBOqwewVzfThKUa6D4Q3SB2CqgWCPR+rVGroWQZGUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UZt90Un9; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UZt90Un9"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso5425925a12.3
        for <linux-alpha@vger.kernel.org>; Mon, 17 Aug 2026 16:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787008579; cv=none;
        d=google.com; s=arc-20260327;
        b=MvTF6tFsNMkX8FyNUUtMlAponPxNY2FZ5tn5x0Pj599Jy/rAAss+yRpAlUgYXZ1Oxv
         kmlN+FJ39jDnAKbcTD1HgjmLb3/C9XgcDJVUstNtljGO4cZX/i5F1yowiJOg/CTCB2Ci
         9Smdax34MXitpCK45EQOdEuAWZGHVZ5ZyhfmV9UwgrG7nawtM4/eMuUNZF15eFP57Q3N
         kqvZIRmOXcQ+s6HfbjNXuY9zxAUQLH7S0nOaaQe7BoUaE5X1ICvVwThxAuPYgZY3Ft3K
         yXCuftooTo+PMVgJorTkDoDlf6apmdwgaNGjFkopiXFguXUq98e18Cx5UUWDUA5LULzi
         BoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ARxs+z6TbrEcsZAzH4ghu9PG1NybKm0D9W/EVU4HDFY=;
        fh=gW9YRzxh23flT05OhfDHt+PjkgRUBZbWyJXl4Jf80Nw=;
        b=czPd0Ilm3oXt65J/175ru+kpKs5muuaOsz0Sj6UPhx0JBs7mNfRyGH019lV8sm8/5C
         XQPnozeOhxSLX5V7XltLffDx7pO+vzU4yKZBBLNOI7M1HzhXH9rsPFqoCbLonSET7XOH
         BiFIpxUT41TwMcheryaX/cUX5SsYRz8pbWqfMF/KqdrB7CB1BKBNLjgd9W0UuVq2qpu7
         QiDwkbz+08IrZMlx1HxKpMiNHz6dFisEV17cpMvyYI+oKqOAZx6nKegG+BPh4Zck/RqT
         BN5Cds7W7Bvt0q4pms1TLlNywZNlbdjdVwD8AXC3PM6jtbFkc/yOfVzkUPIeuqHBAax5
         usZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787008579; x=1787613379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ARxs+z6TbrEcsZAzH4ghu9PG1NybKm0D9W/EVU4HDFY=;
        b=UZt90Un9+qDE5TwSXRPCgyFdI5DQAtAsUObWKdSBT0tYcu7vy4ey9KBl8EcQzLhc3x
         L0SCfiNjaGqNSp9mhRZS6HveV4dsU0X2f8cBbDYcSjAPYK6moXrwTyQLi/cp+4AqwmD/
         UTqRoj0Lcm15n3T+q9SGsalY4SwEEDBa0dulYl8WARFqx3W5SoAP98jUIVG6el4nQvLC
         xFbZ8/aExnNWokghR/8QOzbyWnNY/eMHDV4dBCx21bZUDiS6ZwiG2ecY3ujysGQoEbhl
         LEGUnzSNQItDeWDQd+iYgCY4m+AQXyz7PNYF6XyRmZ114QX78h8W9g/+V+4FGi0KYQZT
         qoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787008579; x=1787613379;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ARxs+z6TbrEcsZAzH4ghu9PG1NybKm0D9W/EVU4HDFY=;
        b=Nr634U33Ky+y1vCdeVZslEqVag6/kVrsCHlyIF3aXqE6kgZlLmcveEJdHD9O/4veMc
         VdvVQFQiWl+7W7JAr0VEu5QwLuBeVSrAIN+WiqEPA8PUVYEUERQKf8SeSsqnDB+r6ghG
         wjWYwqQWn739Obk39EiH1WpAbr/BoE/EmfYT/pGZhUMZa6aQVymuy1aJXPoZJzuIUzzp
         5Fx0uqArvLyKRxwE0EHWy7MF8E943LiNDm8MYPaOymA0MYNYBeD0lfJF1simv6qWtxoT
         +U8lT55ojxi/H1cum2dZ4ZMKAnFcrTtKCyWq3PEgGOxjrZYWCa+Tv8c9gNrHdO15ZxCU
         enfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlOr7wIzAY2Uu8+y8je/l+1wa4tu0ldTd8NwiLOviVckqjSw9qYC4hiAxKFEDZkkrei/QHnEVN4jeQNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkwk8h6elPZXzZxHfXjK+htbk/IJa0cDS9XI91YwkwZdKRWiVo
	cItU0jY4PE9OqlseSQS3xjAX9oeWINk54pXrKBu/THwFSWnYbG+yS9ObFPTgJe0+jgCl8y93+F8
	uYypJt11qw9NPbBi/wK7aNWotfQHSx3TC8n8nAned
X-Gm-Gg: AR+sD125qnpry0fuxMRoLbRlpgdQnXG5sxben+zZsmT5pJQYXVqKyqKF9PG6AuXrPCv
	SiNB0nS27FpNhZ+GOIQqHY6jhRNaXMr4mLJqADBMevee5Y2ovinFhCkXkrFiAgjMuVw2lEM4Sbe
	S65iouCSGcCRDHPMP/H6G5yWyqFukyBpZQvKlIuEVwXdWkpiCKDYu+rY50OJzfr4Pw39TOfEfsF
	GMBTOJ1g2k/PlPvio2gr5igdamYShtpEnBaCVMCAiejSN5a/vNFj8xA/gJnxGO5WrY6BpN3l0U2
	vCv5N29L2JtlhPxGvOsKE3MhHthTUjz14J8tod6BEsNVwbn0S9G43HmxUOYhVGUt2P8xAlHQOz1
	QOiPgfZf3UC9gQ8wypnbhplDTav6Yhn8cbovpue7m416joPh8CQpt9QdN
X-Received: by 2002:a17:907:94cb:b0:c20:5121:89c1 with SMTP id
 a640c23a62f3a-c212a10a4f8mr1291313666b.12.1787008578604; Mon, 17 Aug 2026
 16:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com> <20260803195135.GA1083357@ax162>
In-Reply-To: <20260803195135.GA1083357@ax162>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 17 Aug 2026 16:16:07 -0700
X-Gm-Features: AcwNN1W9izkcwuAp6MkFeC5J1f8fYvzE8iJLioZu2VQvTBLrGCuk-8lW7l7-HjI
Message-ID: <CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com>
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

+ John Paul

On Mon, Aug 3, 2026 at 12:51=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Matt,
>
> On Mon, Aug 03, 2026 at 01:08:40PM -0400, Matt Turner wrote:
> > Two small patches to let the alpha kernel build with clang.
>
> Nice!
>
> > The first registers the clang target triple and stops passing -Wa,-mev6
> > when the compiler is not gcc.  That flag exists to keep gas from emulat=
ing
> > instructions it believes the target lacks; it is a gas-only option and
> > clang's integrated assembler does not emulate instructions, so it is no=
t
> > needed there.
> >
> > The second fixes two uses of local register-asm variables that clang do=
es
> > not honor.  clang treats `register unsigned long x __asm__("$N")` as th=
e
> > named register only where the variable appears as an inline-asm operand=
,
> > so reading one to get the live $gp or $sp yields an undefined value.
> > trap_init() passed that to PAL_wrkgp and load_PCB() stored it into the
> > PCB for swpctx, either of which wedges an early boot.
> >
> > Note that the alpha backend is not in upstream LLVM.  It lives in
> >
> >   https://github.com/alphalinux-org/llvm-project
> >
> > and is a work in progress, so the scripts/Makefile.clang entry has no
> > effect with an upstream clang today.  I am sending this now because the
> > second patch is a real bug in its own right -- the register-asm reads a=
re
> > only guaranteed to work by gcc's implementation, not by anything either
> > compiler documents -- but I understand if the kbuild side would rather
> > wait for the backend to land upstream.
>
> Yeah, I am not sure how I feel taking the target triple part of the
> first patch. On the one hand, I want it to be easy for you to test
> against upstream Linux but on the other, I do not want people to read
> this Makefile and assume that ARCH=3Dalpha will work with an upstream
> clang.

Right. It's cool you have something building. I'm curious if the
resulting image boots? (That's the next major milestone).

I'm curious, since we've yet to have such a case of an out of tree
llvm backend, what's your plan, if any, to upstream your backend in
llvm-project proper? Perhaps as an experimental backend?  We have bugs
filed in our issue track for m68k which is experimental (but upstream)
in LLVM.

>
> We could add a comment that the backend is currently out of tree but
> that would go stale once it is actually upstream and it will be floating
> around for forever. Maybe a better compromise is taking arch/alpha
> changes now then landing the scripts/Makefile.clang change when you
> actually start upstreaming the backend, as being able to use an upstream
> version of clang should be relatively imminent at that point.
>
> --
> Cheers,
> Nathan



--
Thanks,
~Nick Desaulniers
