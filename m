Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090CD1D5151
	for <linux-alpha@vger.kernel.org>; Sun, 12 Apr 2026 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775981612; cv=pass; b=TIJ+iYsZMZ/gOzBq4U3q3E/l0DbAwMaHeKlpcNPcrujSwaR6Uo+3k59LA18wgeCPhUWFtEvebj/odGn/f0iC/DGWA+qY1h9NMJfXBsy8nxDMSzO88a3rF4bxtKzc4JQ7uitFejiz5RsWDZUNIQue9GgVTp4iCX6wgKcUWZkJIqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775981612; c=relaxed/simple;
	bh=xGalZPCURCPopeCzkacbKnGGyF6ssu9qfdi/2Xtz8TM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzuB7Mh+MKP71DgwgZsTYq91ZjoNvz7mNFox1eqMqCixY/nNzSbODK1hp0TOiSsCAe+t0WrQDaU8eBvSSfFrKGx394wr2556vsb/ZpKrfsTsnCCHpFok6mm0PUf5VyPwt1Z3UugAWtRG9AqfuGpGn+kcBAV862K9yjZLnI6a25E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pl0b/sGD; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pl0b/sGD"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6715594a4c2so172738a12.1
        for <linux-alpha@vger.kernel.org>; Sun, 12 Apr 2026 01:13:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775981609; cv=none;
        d=google.com; s=arc-20240605;
        b=EKUtC9YLrQ6xABq8BMB7/Yo579dN4b5M0yMY8tx4dfAd0gxhZSJ8vv98WG1rw325UL
         qsKUFInJHbbiMTxuRfWNAGHBfTpPUe29xL12AQtcDZERRGTzoKmKbbWig0APp+7q7OnJ
         G3XYCO1P372wE6cPkp+/dd1rM4rjtj0APO4k4/r9bR7hPXR/bEdLDtyzJK0L1IHiT5V3
         oKQw+0XlUsUUTzw3p2k82GcJQmh+1Se58C9O2iwUZzJvEmwdXm2z2G37j167QuA5l7Pq
         t8cpdUNo61UxzzbAo2Eo7I0159P+NBcMERkdimgT6tZUwY4fNWthzIdcdesIgp2n83gZ
         NnAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UL8V2RTxV4jklZpHaNMtWLWnJNihQ/PtAI6J27r5wDQ=;
        fh=ViAatGiZ05dh3a394EUid4cQpUnAI/U35CAucij+cuk=;
        b=AZ4XUt7uCsrXqrC1r2JPUIsyj8baiYb/2DRo81Asbf/Jp/X8d/U0Yd/3QNjWn5iU6W
         S9chbqxti/mno4hD8hwjgOqakz+BXt3F4rQ/l4Wa2IkNO/ZAH03LyPdVHj1QTsR4g8S+
         eNwmBuG8whSx0pRpxPSISWCFXfu5Ma4IQn4iyQKw7wvG4jGis3H8/G/UkJo1O9NoPv/X
         YGw4jKVd8+lX2VMpmJou5BxBE446+1AGHasL5F7lJsJ3TN4tfj0H1JKcKwJ6bMc8OOLF
         scM9HydSHJAh3MfYr/zzDKx1N+ONuYJT7aRaLQi0HOJjOKo6C6qkyBnGrDXXHy+mj7Hi
         Jt0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775981609; x=1776586409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UL8V2RTxV4jklZpHaNMtWLWnJNihQ/PtAI6J27r5wDQ=;
        b=Pl0b/sGDQ0w1p5ZeDoktMlIIuHGZDQ4ZXtiHhXcnYvvVixQ8sazFPATf8fj/UV7xYR
         FO11/UDq94c/Boh0xGgaQibmcqRPRAsOi634OlNMMKPufDfK05wGRsk2aaxGVCzjloM/
         RvLNiDIHcACC0xoQHWidfOt8moPSHiyqmR4+NMDu9SWUbOQzXBhXVTJ2TaGW05t2a2nr
         pFwv0ZvgPFEs2bYx1EF5BsWS8Z11MSPjHcXibINL/45ULV6BFwqBbizb/kCGXkUHH6q+
         l8UF5UUA7t5Q4PeOuwjH2ZhysL2nG7FuA4cXn0zcqI3+Pr7xOV6wGKDVXSpdzBYV4pmD
         yEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775981609; x=1776586409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UL8V2RTxV4jklZpHaNMtWLWnJNihQ/PtAI6J27r5wDQ=;
        b=iszFfTqKY/t5wIHGfOPedXOa8qELQ9n665RwP/nmrbAcoaHmIqhQIvrTRkdzsWdqiS
         EtkTtixXlnPEdx38eCK2cQMAQ5eK/gNcBZkK1QkgoIq7yoYh6LQjzT/PeVMXJKwHJOsE
         sXikaC9zFt9gjUv0ceNXVJg4romJ41Uwkg92Imu/7dNbUoSwk+xkqGi9XN1cincyhkrE
         DVVUDnS6FwE4+PsiNdW1syZ7YOBqq7Wsy/kALuAljkmv1u1XyvD+He4HIvf/8AFM9xZ1
         lonxiBRkGeQkfgWOgbGFqG/utXCdTa3oEgzLtZxYMYt0Abn1esK7wREotH2fuYeIEmmr
         miqw==
X-Gm-Message-State: AOJu0YyF2vNRR57R/lyxyHHSz0tKk+QipEbDi/QXiMdOKSPLF2pm58wp
	1/3EH2u6RHs8rlnspA256gNVJNu6a0lKCid9RMLdk+/fWS48XN+JIANrbxcb4m0GvUCZ/ec3han
	u0XVWjnJAjew2HN23c0GjsjxyJSaZBO+2uZhN
X-Gm-Gg: AeBDies79hrFPT2Tbh6UNtfmZb5RnWBJq0er/IJKKMXAumvMafVNxaIQA9aT7qVbMhY
	XczqeybhYNdhqsOKzernUIP3+P44Y+IVqz5xHQNuN7Lx45vx7ltXXwn7xn1Xjvd2RGOMeMPs6fb
	Lu7t7ZpWbCBgBkrmreD4Kbl0nRXMVtQ+K5gZxdRlTOTAXCNv7B1kdWrvkHFQN1JTpbGMvX77h0v
	wYR6o05QmRT9RBSlIqCuXxh0IfBM+mN30/QWHvMu3KUZqZYeRGEmvMoBJ+m4N7wOfzgcn55aDUQ
	4gX57+4tyuafG2CAy9QftSUEA/G2kFvAaMVhsgNt
X-Received: by 2002:a17:907:94d3:b0:b9d:6483:6711 with SMTP id
 a640c23a62f3a-b9d7281491cmr530457266b.46.1775981609026; Sun, 12 Apr 2026
 01:13:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403150340.489381-1-mattst88@gmail.com>
In-Reply-To: <20260403150340.489381-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 12 Apr 2026 10:13:17 +0200
X-Gm-Features: AQROBzA9PKMlLXj0y-S0loWdoYKDKnN3ftSSIGLKMairjQrPLSmLHk7cqoBiAuc
Message-ID: <CA+=Fv5RkXJrAx7SoORyM2Gh-28VOcvrsHSYjraeMXYzRkZkAYg@mail.gmail.com>
Subject: Re: [PATCH] alpha: Select ARCH_SUPPORTS_ATOMIC_RMW
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 5:03=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Alpha has native LL/SC instructions (LDL_L/STL_C, LDQ_L/STQ_C) that
> provide atomic read-modify-write capability, and already selects
> ARCH_HAVE_NMI_SAFE_CMPXCHG.
>
> Selecting ARCH_SUPPORTS_ATOMIC_RMW enables MUTEX_SPIN_ON_OWNER and
> RWSEM_SPIN_ON_OWNER on SMP, allowing optimistic spinning on contended
> locks rather than immediately sleeping.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
> index 4329743757e3..57c91ed67b71 100644
> --- ./arch/alpha/Kconfig
> +++ ./arch/alpha/Kconfig
> @@ -10,6 +10,7 @@ config ALPHA
>         select ARCH_MODULE_NEEDS_WEAK_PER_CPU if SMP
>         select ARCH_NO_PREEMPT
>         select ARCH_NO_SG_CHAIN
> +       select ARCH_SUPPORTS_ATOMIC_RMW
>         select ARCH_SUPPORTS_PAGE_TABLE_CHECK
>         select ARCH_USE_CMPXCHG_LOCKREF
>         select FORCE_PCI
> --

Hi Matt,

Support for pre-BWX CPUs has been removed from the kernel for quite
some time, so all supported Alpha systems now have full byte/word
instruction support along with the existing LL/SC primitives
(LDL_L/STL_C, LDQ_L/STQ_C). Given that, selecting
ARCH_SUPPORTS_ATOMIC_RMW at the architecture level
accurately reflects the capabilities of the CPUs we actually support today.

That said, there have also been efforts (by Maciej Rozycki) to reintroduce
support for non-BWX Alpha systems. If that happens, we may need to
revisit the rationale here, since the "all supported systems have BWX"
argument would no longer apply as stated?

The patch itself fails to apply cleanly on top of v7.0-rc1, I guess
there are entries in your arch/alpha/Kconfig that do not match
what is in v7.0-rc1?

Regards



Magnus
