Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28F4362124
	for <linux-alpha@vger.kernel.org>; Thu, 19 Mar 2026 14:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930484; cv=pass; b=nRTAtDwOdqfh9b3ZufTCNmKX6IhI4nY7hdWXr/y8KEASp2cJyLQ28+vEVMsL01esyr2Sdtb0Pfz/SHzM2rNrta/b/QZk7rPFjHNrzyvVft/5BEddEaiKjitzz5kH9+GgCU/I0Qer6HQ91zIJm8C/mOBFfXhcJ4wR7/VW7TLs/08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930484; c=relaxed/simple;
	bh=x6wZk7AvpBRTPYt5th9R3ycT2p5XdAgtnR98fAb1EOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXna/wBdy4eBxFf1JLy4UFyJtgEtLV6abAxXicPEixGUZBavhqcd6R9jMhNXFvoB5uW9sxYrdAQGpcI2avEbuQyPooz/cWHZtu9MRz69+ICzSzGUCCPWCO2dirVkTof2I0JKhg1u1ZdeyvGaUABCdvkZTuFSDc1wEITD8RgB4sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcCKrhoY; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcCKrhoY"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66132b22182so1466273a12.2
        for <linux-alpha@vger.kernel.org>; Thu, 19 Mar 2026 07:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773930479; cv=none;
        d=google.com; s=arc-20240605;
        b=g+usLTFK3coXlVGWrepFBBTmG94+KeN60dqkY0+XURX/a9J1c2vbBNrEXqZ8wnnXMt
         c4/h/zhwgiZhhmY/13NuXQgJoUZhm+N7K915LAD4XUWxe3xmPPnVQUJahsIHHsKUyxNy
         jfSoyJmvbx0j4ctOltTzeYdxV6IIAATCDOfMask+beMSpKS4ykfx48ibul60fCSpjw4R
         gidDGPplyzPfxWfXENHOTjnKTJJgN5L+mJlHybCdaIBPVH30vBxexG0TLch+/f2LeCob
         eq/svV3/1soQuIixCx+qi6lBMhHy/XsK7DW8QhumUTeKSNA7E4EW8201L0CaXCDEYT0B
         EKqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wEYdsi/UQnV1ulkUEVFM3uerucLpRLXH0M0xgNStZdI=;
        fh=k+936JPVHwMcPycr6YL2SpvVNruiKOY6zEXj3kxvBHI=;
        b=EaamN4VYSvTkaIfMFD8FzZhx/h88geFd171DT5nBo50vdthFYB2hNgv/xJg3Sj+Cst
         DaAesJgo6HuklX4eHn1bb5VHi9u/Qub97+nO4v/YcF/NHJFB4fU9hXsYzehTP/94ICOS
         kLhfhcrwQo/TUEdmPQd2HKWYbyruYlx5xqKDDf46pegfEbSc5V8EtzCi59rKlkikRkEr
         RK+yzfbxFWxdi6fhAmk9ljAAtiOuqHDETX+MNYBJPRpDI4o67L0Fio2QqHDGCYZ8peMY
         hVOlEhfkoHJg7VZS4xshY5+i3h+nVoVzUZ5gxSFlxA+Nj4p0m9B9oQk+6aqghS3SlsH4
         FCxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773930479; x=1774535279; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEYdsi/UQnV1ulkUEVFM3uerucLpRLXH0M0xgNStZdI=;
        b=kcCKrhoYX+8CZszcDQbuZD6T4DnxTVx1KFlZ0Jph2pEsT7DV9Mnj1YT1bYrXCuAa+S
         hpDAfQ1xXxUjFpI++GUXCzaWS1y6BSStTwjGD+OnOBciNoZ7Xp1VqamSGoaSAqSZ1u5R
         945g+zKdeorBhg1AKG/Bb90H6R2LtDirpwrPvj5Oh9WzuAiCQSN2EnknkZHTKsbab/zB
         fnD79VSfUGwENxCYTTrjL7dnOT3K9jltAF8JDxfu2vpVHutMN4ta0fP0qdP80PoqOA/o
         HPeL/1Ukubwi4cdQoCwu31uFJ5Bte1R3lZPg/JzllRmeny1zCPKEmeQumCaUrIAZcRJw
         +4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930479; x=1774535279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEYdsi/UQnV1ulkUEVFM3uerucLpRLXH0M0xgNStZdI=;
        b=hfeHnLCHV7wmlKb5uSmapFe4W2/286yOehqKVnteNWOuwgeoGa8lsDGuUz1513Ej2d
         vTCpp+EUx0T1Fh1rHDTbqCHeJ3OHM1UMcSHZB3MTBl0PzHYXYevnxIU6v4HWvZj9vmZ4
         ONV7VCkHp1p3VkQaqpfPjc1oCKTCr+qYAnOT0Ee3RLkqw56LoRE5dj2TrbIXVyRmKgpZ
         T2bkoNZR1WFfcxwryfvDD1MWQlkKZ4UlYUv3ZtBEyt5OxaKa4UI4mc3IylJh7INSlI3t
         M3mByNRbfZog5Z5Y8t+5LzK4q0DQm/0E0FYXbf6JmAn5cioNyA/wEThbEWFjgfJS0anv
         9beQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0N634tREHXfHHDBHdxOz4fGDRZ5GtbFUUHo3DhDcdESnXebB0B84sWlh/o7VeCHXEsnW+EHiYlS/uFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQNdEqyfqnSalOK8PG2RLOMxdJhs3l9bqTbtCO4RlEaJpcuu3b
	hw7cLOA6u+VA2sRZH03e48NMiT2VMxSNzbP5AGxa0itpS5T6voXHxJxUutLhudIpWCH2OlrK3HF
	zLA3HTJKmXjbW62L2RBsSufF80SIApH4=
X-Gm-Gg: ATEYQzy63BosvzMf06JuO99RRUXs1xFa4m/6ugROuRDsAg9PC54PTEcGusCWEsbPXcz
	CUlbf4WGISaMPnL2QtW0OguRn7/i6S+gCHM++ejQfaS7x8EviAxROPfAQVBdBhNVf3fWinEyB7P
	I4/Y8eQFhr8DSidmtx9899xsd9Pljv5srHIPZ3Y2z8GHoc4RGqYHVRun8mioqvzhqoW3HzqMYjm
	BsARScT9qZMLDO5TVyrCuzZiHAUmIIGpFNSzyLcU5MAMNp0xfpH9KOuX6uErmCjX0PZqI7eakrD
	BKZq05hKcA==
X-Received: by 2002:a17:906:ee83:b0:b96:db93:5d0e with SMTP id
 a640c23a62f3a-b97f4ab7799mr545864466b.41.1773930478856; Thu, 19 Mar 2026
 07:27:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de> <20260302-at-vector-size-arch-v1-7-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-7-a11f03ba2ca8@linutronix.de>
From: Andy Chiu <andybnac@gmail.com>
Date: Thu, 19 Mar 2026 09:27:47 -0500
X-Gm-Features: AaiRm52wQD6uRKulnt1Y_ioaRFL-b1bqEKDLHZMA0LYwV13CAWHAV79Bf5laR-o
Message-ID: <CAFTtA3O74BTJz8d87CJFQpa8Sub_ouKyyAB8cTXUxd=BnUzS7Q@mail.gmail.com>
Subject: Re: [PATCH 07/15] RISC-V: Remove AT_VECTOR_SIZE_ARCH from UAPI
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

On Mon, Mar 2, 2026 at 6:27=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> There is nothing userspace can do with this value. In the kernel is
> always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
> userspace and also changes from time to time.
>
> Move the symbol to a kernel-internal header.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Andy Chiu <andybnac@gmail.com>

> ---
>  arch/riscv/include/asm/auxvec.h      | 13 +++++++++++++
>  arch/riscv/include/uapi/asm/auxvec.h |  2 --
>  2 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/auxvec.h b/arch/riscv/include/asm/aux=
vec.h
> new file mode 100644
> index 000000000000..fb4233445276
> --- /dev/null
> +++ b/arch/riscv/include/asm/auxvec.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + * Copyright (C) 2015 Regents of the University of California
> + */
> +
> +#ifndef _ASM_RISCV_AUXVEC_H
> +#define _ASM_RISCV_AUXVEC_H
> +
> +/* entries in ARCH_DLINFO */
> +#define AT_VECTOR_SIZE_ARCH    10
> +
> +#endif /* _UAPI_ASM_RISCV_AUXVEC_H */
> diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/ua=
pi/asm/auxvec.h
> index 95050ebe9ad0..0a725f2aa2e7 100644
> --- a/arch/riscv/include/uapi/asm/auxvec.h
> +++ b/arch/riscv/include/uapi/asm/auxvec.h
> @@ -33,8 +33,6 @@
>  #define AT_L3_CACHESIZE                46
>  #define AT_L3_CACHEGEOMETRY    47
>
> -/* entries in ARCH_DLINFO */
> -#define AT_VECTOR_SIZE_ARCH    10
>  #define AT_MINSIGSTKSZ         51
>
>  #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
>
> --
> 2.53.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
