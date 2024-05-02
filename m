Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF08957CA1
	for <linux-alpha@vger.kernel.org>; Thu,  2 May 2024 22:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714688679; cv=none; b=L+6jxutUtV2wZFD/vqxWywB2Vl7WCS2b26Knb7CcqBhsSHFWgQIIg3THDWbGOsxHdlgV01QE2SmplXJS+bHsrvxTKBmrYcLXRsTxhMPewN+MtfyeYZbW4hHe2qAe6qx6miAyUaldhunnfFK86pNlCWD2TAHNWilAQeKoGbJbko0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714688679; c=relaxed/simple;
	bh=qnKN9L3Z0Au55/oPWH4SsCKSSflxsoIcUt2AGUKIs6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MBvNqi6QEYM+fDEFvIdmv1WkZYGLF23CzOlkl2/aBLWbmjcT4PGh/9oCLPe9fTEhX9Gvu82T8RKpP6Q5gm76P8Z7zKlOK/VmQiHbBp21l+RxhqMUzWR7x2LxxMHH10Vhca35AepbuVwLyV/arEyKFAo8ODx0BSmx1DhBsSoe8pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PfzecQRZ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PfzecQRZ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51f40b5e059so1297518e87.0
        for <linux-alpha@vger.kernel.org>; Thu, 02 May 2024 15:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1714688676; x=1715293476; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r8L1plbBpC5b8hbxFDn23VRySV0QK2bnDqJWgg6u+KQ=;
        b=PfzecQRZHfTv2cGL/yR/MnUDR5RdWV5CPS+AZgBIveIm0P/jVHMk9pdpzZ7405fMq6
         rNVF7WgQlyu9Kh5FKJDz/DHDNHiWa7fXBmDpzWsTiJXF5oxD1ZTk0fHUaGIrHyBs9RUo
         3fXPzMaic+fEj+jyU+a1OP5a633EjkiiTO9gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714688676; x=1715293476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8L1plbBpC5b8hbxFDn23VRySV0QK2bnDqJWgg6u+KQ=;
        b=AkxlMTlJd/N6dNGrEW1NMLXV8SmU3ZK/bh2ZB93igExEndreMW6qYzSgTyCFlnjCLH
         p/qW905AONF13ogQkVl/b3GfLAo6Yn8NMDnNcrxG9xB3mT1yq3Usc4dcalA5r2CUH3F6
         eUnQPf4tXLX+ac0hhbqMW0LIvER54zNCvWP/sgoDvPz9dMWTp+bd6AJHXluKtAi73w1t
         fbpEupEaWEf7jDYM2SeRBXkAxpy0eYgz+tYm/IHoreshVzsuTb8jKd75y0L5nhSbr7wJ
         BUPByfwaOw1lpuHR/fn/QrbYce2HV458avxTBLUv5wUUfmRN9qxYQrszJXVdxsoFlTG6
         dZ7g==
X-Forwarded-Encrypted: i=1; AJvYcCXDWYwPviNYJT6nGGs7HP9/Mg7gc4gc6N2JroqC1fde0TEtQGcgveSsc9g9SaVkWBVgFAy7qLMJalrsnM6VQoQBz2J8bXRkfj2ca/Q=
X-Gm-Message-State: AOJu0YzuGtirPjwJBjjEHo2dxJ1bfRI/Z4gmNGnIjQp/hoOg00aGJF5t
	MP6TC/c3u22ZRamGx4eFZYtjD7kFEYheNQ6m38lHCz0D8a/F7zXejH8OE2QkJRwHJaH9Ypa733K
	1ng8Mkg==
X-Google-Smtp-Source: AGHT+IEdOo9bmXMy2dXycVvJy+5RvdFSKaDksmhQ8T7n2TWJ7PsWMoTnC73cyNzSq61MuFqfS2RTyQ==
X-Received: by 2002:a05:6512:789:b0:51f:3f3c:cdff with SMTP id x9-20020a056512078900b0051f3f3ccdffmr593670lfr.65.1714688675674;
        Thu, 02 May 2024 15:24:35 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id lb2-20020a170906adc200b00a58f4b3661asm998680ejb.0.2024.05.02.15.24.35
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 15:24:35 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4196c62bb4eso62789575e9.2
        for <linux-alpha@vger.kernel.org>; Thu, 02 May 2024 15:24:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8/rj8IQ/v6DBip762tKm13Ea+hfvWJJGNo6ROru+Q77IkTyjOx2BsLtyXn1AQ8dfvmihTpLP4sgp1d6yjClFI+poVF+jcxExFg1s=
X-Received: by 2002:a17:906:2b94:b0:a59:4101:433e with SMTP id
 m20-20020a1709062b9400b00a594101433emr448463ejg.35.1714688229488; Thu, 02 May
 2024 15:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b67e79d4-06cb-4a45-a906-b9e0fbae22c5@paulmck-laptop>
 <20240501230130.1111603-12-paulmck@kernel.org> <1376850f47279e3a3f4f40e3de2784ae3ac30414.camel@physik.fu-berlin.de>
 <b7ae0feb-d401-43ee-8d5f-ce62ca224638@paulmck-laptop> <6f7743601fe7bd50c2855a8fd1ed8f766ef03cac.camel@physik.fu-berlin.de>
 <9a4e1928-961d-43af-9951-71786b97062a@paulmck-laptop> <20240502205345.GK2118490@ZenIV>
 <20240502210122.GA2322432@ZenIV>
In-Reply-To: <20240502210122.GA2322432@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 2 May 2024 15:16:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj-Jt7MgFC4-yr6DdvCVDoy1nu0W9W2zmaGZm6u=b2qTg@mail.gmail.com>
Message-ID: <CAHk-=wj-Jt7MgFC4-yr6DdvCVDoy1nu0W9W2zmaGZm6u=b2qTg@mail.gmail.com>
Subject: Re: alpha cmpxchg.h (was Re: [PATCH v2 cmpxchg 12/13] sh: Emulate
 one-byte cmpxchg)
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, elver@google.com, akpm@linux-foundation.org, 
	tglx@linutronix.de, peterz@infradead.org, dianders@chromium.org, 
	pmladek@suse.com, arnd@arndb.de, kernel-team@meta.com, 
	Andi Shyti <andi.shyti@linux.intel.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 May 2024 at 14:01, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> +static inline unsigned long
> +____xchg_u8(volatile char *m, unsigned long val)
> +{
> +       unsigned long ret, tmp, addr64;
> +
> +       __asm__ __volatile__(
> +       "       andnot  %4,7,%3\n"
> +       "       insbl   %1,%4,%1\n"
> +       "1:     ldq_l   %2,0(%3)\n"
> +       "       extbl   %2,%4,%0\n"
> +       "       mskbl   %2,%4,%2\n"
> +       "       or      %1,%2,%2\n"
> +       "       stq_c   %2,0(%3)\n"
> +       "       beq     %2,2f\n"
> +       ".subsection 2\n"
> +       "2:     br      1b\n"
> +       ".previous"
> +       : "=&r" (ret), "=&r" (val), "=&r" (tmp), "=&r" (addr64)
> +       : "r" ((long)m), "1" (val) : "memory");
> +
> +       return ret;
> +}

Side note: if you move this around, I think you should just uninline
it too and turn it into a function call.

This inline asm doesn't actually take any advantage of the inlining.
The main reason to inline something like this is that you could then
deal with different compile-time alignments better than using the
generic software sequence. But that's not what the inline asm actually
does, and it uses the worst-case code sequence for inserting the byte.

Put that together with "byte and word xchg are rare", and it really
smells to me like we shouldn't be inlining this.

Now, the 32-bit and 64-bit cases are different - more common, but also
much simpler code sequences. They seem worth inlining.

That said, maybe for alpha, the "just move code around" is better than
"fix up old bad decisions" just because the effort is lower.

              Linus
