Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2514364031
	for <linux-alpha@vger.kernel.org>; Wed, 18 Mar 2026 06:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773814601; cv=pass; b=t94fbvAmHBC+2TEtWn5IOUpXtlyB+mfbxoPf5OvS1EqXqmEEPj3OeMA/vTOf7IcSd6ENnNClYdhUqZ6VrHID5B+YlpsE/RlhDbDMkjYZy4i5Ir3TejEL/y7ms7PZ8kk60CKhlEYzO4D0QWAHT83LGleRtPD7xvmMHAHqQkk5ups=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773814601; c=relaxed/simple;
	bh=LyvuvQqufknbMfPTy2o7n/T+OqohBBDpzWX+jX0Ni6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYQlt6B3tQVCTEjGziBmH/WelTxG+Mj0Qv8LvyHY4DlYahr1r3ewkKY90ZNpKBbInuzNBn5AQlXXvM5SygxS95BqgW7UGVcItheTphgprs44P8ViblKujQyPUVwNz+LVkIwHdA6zavj0YP9DXseDz4Zc4ImDK2pYoBa3bP6+Mk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czA+VIq9; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czA+VIq9"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b97a06d7629so541523866b.0
        for <linux-alpha@vger.kernel.org>; Tue, 17 Mar 2026 23:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773814598; cv=none;
        d=google.com; s=arc-20240605;
        b=iGJmIuq1rnb+2D7nhpI21a+684jrTl/1Dn35EzemHC5vfS4lipyt1CRGK1prLWjAvr
         +tFsIr0DqOQH8pUy0OXQd2xMPqCTSP8D3DqhvabVt2s1yzWVXKAVJWd7dVzGh84vdscy
         9UEenyfhPyek6Buez5BG1B2sma3DWCfnBbZzjAUYjZzOjfuN5sAPkUkqw86sC5fuj4xQ
         L2scVU/nRH5YQbbt4+uIvUlzfopPxCtIfLXlU90AC3ZM+JtcW2aRGnb6IKPLL6290ItS
         7QoAUsof258MDGAVXEjt6tbFqSI8FOJ/GUfAl4GV9Hy9sj+vV1RQ9sg5HcAuWZYDk1UJ
         fvxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hNXx5fLw5itcSqfItrsW3d6my1DlKfO6NqzxE5+AiMo=;
        fh=f/czFAIQeYtKnp1IEzRlWnrRU+CnOJZuttK3CfjrBAk=;
        b=MMZpY5PIY5lBWOnkqriJcAqxgFQ0Wdm9aivJ5Rx2X0EYRzs8S0kAuMPKvaIQIde4w/
         AVprRabVRLdyZqPLfJoY8ugQKbv93mHdHpN3swTm8p0dFQUSrhbqNAaYiw2sLcxSCG7B
         v/U1bz/pscpZotvykJTlFXgDSX0bIsT9MAnq6WnJtUtAV022H2z/7ec1GTsZpqsaX96g
         jZply8S1ojrH1iRSBvII88ib7flpL8UF9DfJRmFlq5U82yY/VUmUpeyB5pEeYrhWSILb
         wSKpppgNlgoduZxEs544fR+TN2rOX3ZaDudVBKPL0Si6+X8u4+5Lq1BTsvEWOvsiS3qu
         SAyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773814598; x=1774419398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNXx5fLw5itcSqfItrsW3d6my1DlKfO6NqzxE5+AiMo=;
        b=czA+VIq9QGWQxIWviOuOrte+AkszdW/h15AxwnnBl8PgQdCUSJeFt/rkA58JF8bw1z
         MYdnPYGFr5y46Y9Ze6hH0uQbYgBxWhk4ISCFrpb1oCRqUKW8TesUGp2nfyk/tjdH6ZzI
         DwOCFfQmjthVedmcIE7z/9904oV0s5pfRk6WMlT+ADyKZllzFK45VHyMvAMFKoo37U/j
         J1nqKAueMk09QeZKqRnb2BbN9+d1iclFRFK4eWers79RzlXUT6c5NL6yIGsvvdDwBLkL
         mIaXTaJyIolZxl+55rCZtIapNWvPnqXYQeH5Kjuv+rgtZgAO2r5C3jf4lHbFErXbdAiD
         Zyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773814598; x=1774419398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hNXx5fLw5itcSqfItrsW3d6my1DlKfO6NqzxE5+AiMo=;
        b=m8aWvr0u8cPL6sM3N4uVIkWf4K9KUfdEb1hfMCdz/yDY537MmegGuufvKNdnJeGk+g
         FHUBT6GKiqK5tKT3LLT/Oevqp/CENsS3qLFRKr1rkFyqHchmtMWGv0n8Qkrbfd2bULJu
         I2jq9/+AYwslydna01MrrEKFAOWTUCz4UnAP9GI5VX3mV3yyZbx/euTe2Ym9Wu69OAzi
         ZpD4zeT5/7S/GyV30JvucYWFj/iS47bJkDaWtN8KwoTVAGmTTr5+hEMxwWjNiK4De97M
         rXwwZAQoc0pjcQpMhi7FKvXemc8C8d+bzSoKOEfOxc8eN1ZWZf93Xt1ValBq3VgJMSXm
         mk9A==
X-Forwarded-Encrypted: i=1; AJvYcCUei6YzbU7rPndBMYDpBGVbE+o3/O1w1gQnKbeKqcE9rvZv9s5OBLKeRHKRdsFSaYAFG4z0jrC5akziSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfDy1I6sI4v6H+Y5AXAfOVG4HhuZKsaV0i+g/oqO8htOD4dgOT
	/F1z2fln2ITEgm68QeWepOhpCHXAV/7R3qwlo5yTqdo2tNHLuKLcfO7ujiCNb4XuW8+RsveO2Wy
	PCrQq9VrrbMOxXpEQu3Mx34OI/oQbZaM=
X-Gm-Gg: ATEYQzwzB9mcP1KLUCIQ5EEfcAxoHpzg83z8XfNoXYKf6+yNBDDRK1yX/JYOHhaCuOk
	EhJVDacm5thhAF4j/hSm8ildn0vDYuaxWEUxfW7CmEvWMe1g81yUEZYeEJfgZGBdVJF60MMr1b+
	/Ww6QjankG++r7a6SZw8Nn1cHYrnKqCHVpEFvaEGFKq2QXbkY6J4pLkZ93uaRYDz1tNYX04kHba
	m5Fw5r9GyAlglvnf2jbJH+7a1uVrr7ChuuODuUqHIxGESpvgpLcnj8OZ/Nmz1Asjg+AJofXyxUp
	jtyFBPX3/mtUer5adZh4XQgfB93qzgFfzWY1CV32FvJ7Y77o9B4=
X-Received: by 2002:a17:907:7b93:b0:b97:cc05:61b9 with SMTP id
 a640c23a62f3a-b97f4801ab5mr133040366b.15.1773814597747; Tue, 17 Mar 2026
 23:16:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de> <20260302-at-vector-size-arch-v1-14-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-14-a11f03ba2ca8@linutronix.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 18 Mar 2026 07:16:26 +0100
X-Gm-Features: AaiRm51Xx89jeaivgNYAhMk2LxpIu3kD6j5N4SuQDZ84WCnP1EAzJIW2dMNKGiE
Message-ID: <CA+=Fv5RLtUPp9BhXfFEUk3roE3Gah0iUamDEZ-MXCNM_xKm3PA@mail.gmail.com>
Subject: Re: [PATCH 14/15] alpha: remove AT_VECTOR_SIZE_ARCH from UAPI
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 1:32=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> There is nothing userspace can do with this value. In the kernel is
> always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
> userspace and also changes from time to time.
>
> Move the symbol to a kernel-internal header.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/alpha/include/asm/auxvec.h      | 7 +++++++
>  arch/alpha/include/uapi/asm/auxvec.h | 8 +++-----
>  2 files changed, 10 insertions(+), 5 deletions(-)
>

Build-tested on alpha, no issues here.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
