Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E83403E3
	for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 10:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049646; cv=pass; b=Ci+uF9kuo6U3ZWIGsHbdUXSuaLCZZO0kCUOXv5GDxOegObsWz28AuosOq1FR8pMnMCbSCXtzyDemKfiLVDvXwL9YfCkg39tmdzuYpg2VGWeSJvxe8zk6nyeKXC08DQB57FHYA9KosrgSijlNK33YiFJzIkcoLiaRv6LLzYEJVz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049646; c=relaxed/simple;
	bh=0dD/nw52uv7ETKPy7YO7Bra4Ckt+WV0LXq7SjVdjcxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRP6ZSMtGukcWs/6C7fsctVaq9fd7J/lrWdDi1b4d9Vr1dRHQMchTEJ7AfEjkWG0R93d16D9NUrf7V+DqzW1NOC+019I6qY1xkIUU4oxl6qZ4d2qX7q60UUVZD7Q2u7H3JsRyHkFqEAr+ehW+/vC0tgTlxCGwisQWub45ue7mMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbrbNQlI; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbrbNQlI"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68bd167797dso1105289a12.0
        for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 03:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780049643; cv=none;
        d=google.com; s=arc-20240605;
        b=j7p8Yn8BIcuj5StOqxPKfiyH2F9kkeqeZ0ZZj3n1yKPvCKp3YO5No+d7mSC1+HPrjl
         9mcs/wOavhNHACNegDPeq6YVBn6W0jlB52b6+L0IxN3NGiTrRuHMcOF29bAq6RA8tuW1
         C8PbVFDrfS6S9Q/2zjsDzlkyOglgO9HO6VVArPofqgC/5/PXXkmGQbwAD1UMqiRLFGTi
         Q0eYOaCOm/GnL1wNBqtbXGmaB/eG/fDUTR2A/Z7dICyiTW9+KszrJVAWuI4R8BtL+WtA
         wFTjNLl7yvxaOMN418ZcTkb7pZNX6QjnAFj3ATmn2fYtiWaC+JjMh49740jA866HBieE
         UWug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=69BdqBLDmhIiDSYfJNXDEk8EXbdstEZyFojS0b7qFu4=;
        fh=m1HGRrfGcZCQqHaFuLpjylZmMzhWVyx4UY9niiytw8M=;
        b=kOUpAn28fIge7bLIK/8De97YVW52uHxScL004PY9gl1kFvcR9bkaQKbjelxVKRYMq9
         Mr7/o3WXo0OZqJJ+V5lqDCfr3DeeYmjQQfFmkJ34zbh6/h9l1MZ6uC58qC0Kfi6CGIQg
         6uyET8Eis4brGzUaTj9rlJ55lVXbTgArzq6Gt/XM4J+OZgSfsrQPNDLXw3/mubxrYvwa
         yHPrTFvRLRQLurPl7vK9u1qXxFHkRzmQ68cJCWSnJPYkmOaIhFgadNZ+kJC25TiZQ665
         dVJMJjquCuIPpug8jSqSFbB1PsuqiqWUmRWW1Gy+B2JZG/rj5ogEV3UZt2KXu6COQoqX
         /Sng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049643; x=1780654443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69BdqBLDmhIiDSYfJNXDEk8EXbdstEZyFojS0b7qFu4=;
        b=kbrbNQlIgcR53VvFy8iH5uFik2UweDXFnhVCAijeXOAGF/pAd/9v6a830lkdzgclhr
         TIySLKEfJgI5aOjjFojTidFV8TzO5J4pJqXJMLzUazMk8CSeaCk+G91jfIYD+lCtIK0h
         leu2jF2acCij0uPddP5DQoynXCrJ+uPlk8rckqXJSQxC24NMfeXkEFuanoiyJMb3G1Fz
         PFQAUCEjXtP6OJ63ASAK9TInR6ASkrgW2NeGym/aspvRESbcn/Fuih//W3nx4yG6fE5u
         twWxYphTaLcdgg3QimEtdil1Vck/pWW++6WDT7MYOIkI6/P9w5KAe2WZeYTSrzWy7WxL
         tVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049643; x=1780654443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=69BdqBLDmhIiDSYfJNXDEk8EXbdstEZyFojS0b7qFu4=;
        b=mTQmFtEJzhLGhI5e8eoWtQcx4/BaF2t6fzc89KB9m4xk46iGvO5xR2PkGi5Pipn12Q
         gtBnOz1D2m05fT01mT6li2stURs5Uvfu7oK/39fpCueOTR3a90uHFi3GGJJsw1vyXiBO
         nktsPfqtwkQfSeIIUy+z1xZmmxUppYEbfqqT/oneT6nVehvtIej8NPJwpGZe8xfNZh7J
         tj2g/KdiEgJ1PhesPcZxoVo29s8WZsq8Mmtgo3Fwf6eutoPFt/Gfq49RCrGXNYV5gS+s
         IP0JSSIJ9/t8oWo5VWRiMtDGwhjHAW3iSupYoOWsj3d/zfyQZ4DFYED9dWXGCLZgJjpD
         RHkQ==
X-Gm-Message-State: AOJu0YwCQgZdJCe8/dx9fdpssOZOJgMn/hEhLaaQwfnkRYur3O7EB78B
	vs4KE/zyktPeDq7kUpG9XoG7CXw5rM+Q2ThtROqK7JdKqgUdto7Fz2cRckICPHB5tf0cDVFjR5/
	ZqFvKRwvF2vvWmZlgxe40n0czpwbEHHw=
X-Gm-Gg: Acq92OGUG/wCMrGOSelG19UkN41B1D2dJfhjDTQGGwoUTwYiF5p3G7WtZQqWIaJ6Hth
	PtBrER+Of3EzuhFXuFRB214EYVr+wnMiDwPD4BhFHQaaelJ8ctw8FRBVmj6HE5Iizy1xtlFp+Ap
	RXVigAyNnsSxDbatQ4OBiY8mPpXNg4Ubx1vvSSzMWw2a4cHI2cCukQoBeWDUnXtMBhkcJY2BsU0
	yMMAUBfG8k/Vbbr+EGbsCzdqBZp+i/hmtaCrvp0yRm7xpOp6irW/bOVK5z/sU4lONXjRQlQqml9
	kKATqW8PMJBrKsip0xU9R30ZOyygkJYPGCFDoStl4G1JAPXdv20=
X-Received: by 2002:a05:6402:35c9:b0:68c:3424:af6c with SMTP id
 4fb4d7f45d1cf-68c3424d067mr577735a12.20.1780049642708; Fri, 29 May 2026
 03:14:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528230516.1839694-1-mattst88@gmail.com>
In-Reply-To: <20260528230516.1839694-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 29 May 2026 12:13:51 +0200
X-Gm-Features: AVHnY4LJos2DFZs2mjihnMFxNiH4VI34ou3aJZYmyVpQIKCcpB_0uPqxUmIm0Eo
Message-ID: <CA+=Fv5TcVgZQZtYfSq=QPp3GkMkq7RhNWnJurSSWCogRU2q9TA@mail.gmail.com>
Subject: Re: [PATCH 1/2] alpha: marvel: Fix irq_set_status_flags to use
 correct IRQ number
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, Thomas Gleixner <tglx@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 1:05=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Pass base + i to irq_set_status_flags() to match the IRQ number
> used in irq_set_chip_and_handler(). Previously, IRQ_LEVEL was set
> on the wrong (low-numbered) IRQ descriptors rather than the IO7
> IRQs at base + i.
>
> Cc: stable@vger.kernel.org
> Fixes: 08876fe8519c ("alpha: marvel: Convert irq_chip functions")
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/sys_marvel.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git ./arch/alpha/kernel/sys_marvel.c ./arch/alpha/kernel/sys_marve=
l.c
> index 1f99b03effc2..bebeea3c286d 100644
> --- ./arch/alpha/kernel/sys_marvel.c
> +++ ./arch/alpha/kernel/sys_marvel.c
> @@ -275,7 +275,7 @@ init_io7_irqs(struct io7 *io7,
>         /* Set up the lsi irqs.  */
>         for (i =3D 0; i < 128; ++i) {
>                 irq_set_chip_and_handler(base + i, lsi_ops, handle_level_=
irq);
> -               irq_set_status_flags(i, IRQ_LEVEL);
> +               irq_set_status_flags(base + i, IRQ_LEVEL);
>         }
>
>         /* Disable the implemented irqs in hardware.  */
> @@ -289,7 +289,7 @@ init_io7_irqs(struct io7 *io7,
>         /* Set up the msi irqs.  */
>         for (i =3D 128; i < (128 + 512); ++i) {
>                 irq_set_chip_and_handler(base + i, msi_ops, handle_level_=
irq);
> -               irq_set_status_flags(i, IRQ_LEVEL);
> +               irq_set_status_flags(base + i, IRQ_LEVEL);
>         }
>
>         for (i =3D 0; i < 16; ++i)
> --
> 2.53.0
>

This looks correct to me. irq_set_status_flags() should use the same Linux
IRQ number as irq_set_chip_and_handler(), i.e. base + i, otherwise IRQ_LEVE=
L
is applied to the wrong low-numbered descriptors rather than the IO7 IRQs.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
