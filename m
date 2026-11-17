Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913815;
	b=hoGi6COOdIdtsxq9uUE5EU5TA5rpYRStGSfjhfGuckEXWZNFxs0BENZx2sX2HCKK3vgx
	 XTZ4GIw7gzWg4p6vflpUil8Jda33zBDjX3yPa4tZmFxKCPMyU8lacT1ffOjEOv85+zO+t
	 ldbrJ4UluZ+CUcg1GU01CNka8jQ1DEBJ+z2fjgLFacBQna4kjH7BCSrUc7Jrm4QXmgHG/
	 QH5eMp30T25vurFgHTIWBAnNaRHaInSXr3ZVuCLyPeKVdhqJTY8Z/QAp7xvc15OBN24to
	 TAwYbxngV5nXq7H0CmfCf28v5Cy7dNq0iXAhOvOtLJ/adYnC8/5T4EMaeOAE0+fmXEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8HNt04LbL3op65Jtm2Xw8wh/ofgld4Wuc5d7vXjDfv0=;
	b=eBle1jw01W4cR+mkphRRQkA2xDSD52ihOevAJfzp5PEi9xQwHDVTKspoMJqutyhM4nlL
	 g4fvGx2NB17xA/LHCnuzxLi4+36Ti0c5OkW0l2DW+QeUkUFKvz+8MwCNx2KMIdbNlSO7l
	 58oCdnlZcusBTk4G+dpkwpHzTWHDKbUJWMSdruIkgL39PMHMVRJcBPVMUhSNFVYXmO5/U
	 EUTaRCPMjxEl4fPGeUtBqcdM1KSguuDSD7jznBkfI4paaC4929uhTIgA6nKsHtiTsdz/1
	 +WInHcqBe2HhVI1xcBgXXhTTIOMu8A+iEqHEGY8UfWIMKr3y17g3EHMvaGHYd9fFppg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2Hk1hKb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D248606A32F
	for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 11:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D248606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2Hk1hKb
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c445c95d553so655433266b.1
        for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 03:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794913814; cv=none;
        d=google.com; s=arc-20260327;
        b=jCChU/mnLG0dTI+A3KAJzSFZaI843LbgGKGw52vYf8CLhSgtb63yQ0Rx1moHNUXrdj
         B/nx7H9c/Y8cSeyiHAubyxyfvZfHx3pB1uvaPTaaamBFVXLDXjAMmzW/LlJBd4iGCtrV
         xwAxdvESSgP4+z1Fmaltv4JiqAjm6i/TTZ3JAlqY3oL3RpPUqQ1/Ade1Kq7U3uJb+eHQ
         M50tJwir5cOpr5cNwQU0dZwHrODpt4KG//vWRrG+o/Qf+HrAczIX7k83Mx5B0rT0osgR
         M3ZitYfAUP+z9clOz5ixFgNIi4hN8Ahvlv5qPuRvHy3Xut0kEv4su+sw63LIET9LLer6
         aLiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8HNt04LbL3op65Jtm2Xw8wh/ofgld4Wuc5d7vXjDfv0=;
        fh=9s+ziI8q8zlxpQamuc1c/9TksEpy4Wthy/OZdYy0g5U=;
        b=TkT8xZbTE5EzuCxiGbgxhp1llZmC83id50KZD+pytSDVzBvQg4no/o05E+wsSDByUE
         3d46AiqXkAXstGVGCNjE1SPFomKTm3q9XO9g6XeOa9hQk2q/POgzZiCiWCnNWrV8x2uP
         h9AJGYVcL86qbCtvTTjGq+CS/FOLCz7XMZ5xBqFmRN23qwzw1NVlLWmXnyvnwFWqoRAK
         uJI/I5u+bJNMxunLVLI2hJbzWmO/fzyaXkNo2SjeTC9jkUsm0/ae56Pga2YOjJX4HwSL
         ny/fAU1lPCa24+2z8RF0/9uuB9QKEy2TXh8QGyfJPLXT6NhC2rgbDrqsdzu2NgXMD6d5
         FHUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913814; x=1795518614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8HNt04LbL3op65Jtm2Xw8wh/ofgld4Wuc5d7vXjDfv0=;
        b=x2Hk1hKblfNfbBuIqPiQYQh2uP0SnQ8rF7azyRg4NYKTU3Fu7PbhEJPFEoY3qlSRFz
         T4COaEzFG92WXLtKX6fk63E1vsACOSPW5/ek9/aUiaptwVWyj+sJ2Q5rkTNyTSVXvxvx
         /5A9XHhMAAhtfAmWhFuuektMe6yqNzmace6YCtiehHL0xRx+KtowsiimYXlOejq/riSs
         S3s/uOKUsSWxJ3NHmOH3DkVJqg05gQzE8l7IhIRUxwEIe41jJmJInn8KzA4qLOVcGYze
         umI/PvB/VnSZkn4nBMxrMKsahoMhc9+btYRJpOYNhS2bITRufspALvbSPqUfA+f99JaT
         9A1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913814; x=1795518614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8HNt04LbL3op65Jtm2Xw8wh/ofgld4Wuc5d7vXjDfv0=;
        b=R5jKLGiC6tdkVqdPthLL3B2ANZc8qDcpUGyRJ9Ohg7C/UaVYeNIT3n0eC8FxqHbeOU
         65U6EjanZcKDNvsnQhE//ehJLkGecsXIKRRR+ALZwOwRkzuhjIyTrUI/DGhggp8xvcVi
         lfPFGPHKoUw/oFVm3tzR6Q5dEx1mdq4Fez1hHrW2iP9uiSD1RSwkgoTFlIBN48k690+v
         IR0AnlzooH8saiUe8cJCaYpxtiDXXpuBMbt6FE+nSrRU+YibThIBpQntWqa43FCEo1rI
         TS1VOvRlJcvoRiu1I0vqsyKbjQ8f23rciSC+EKOEQtDAt2gJBs3pCXZfdVy0wEMQyiiu
         NMbg==
X-Forwarded-Encrypted: i=1; AL+hErF6E6ODoThnCjBV3Ftj0cURdRchACY+t/Ybp8UR3xH+rKIx8GFQqLqGI2KmyHr3tglM+BP+J/3ihNGe4g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ti/HqaIS5jgvp2zGfMXXmLPs61gldOJU1MXXTizhQp5IpAjdF
	WLfui2nvl2sSgKly4cB5/WUNx9irCFC8pJ8J5scfymm7ZB48eSresrT3pxfJXLXaNEM5LSIIjdm
	HKaI8Z4Kl7YSKVwfbJQX2RTG8gviL3Po=
X-Gm-Gg: AYBFou1+ULufZw2gPirsbLxE5/i54zhxeZpEzkKBMQ6pSIElD+8To0Y1I7lRyne1nvy
	EkdEf6xKjeiZzHL6t0FBiDZo2Bc+qSU8j6wZedwGWkDUhRRwReYLkC3hweZDE7bH+WVh6UIQIrU
	xmIFuVqlTWsn93NltmBUXc3pe1+/1t5vsAwIuo96ohWzyehJKkZpxtwHu6WCjPhKZ+uf03SpFs6
	BqEX+8byXu/kBFwACJYtfnaQrgCHbHBhqRZI+xuTLfGSS55XBW7j/3bxKFvdOffMMJRjbHwQgR/
	YcccL4XJXuf09v+TkqWcS5QIePTBYuf8P7aE7p9R/CX7KASmylQsTFsusUzxsDQ8j2M/Pn4Yizg
	8GyOYkJeJBz5ALhyTf7yoxBOqgDT2c2EIUaZZDCSGN0A7ftHV0S3RqhMq/aObctkdq/OQN0eAll
	kDdhnvkvaammRJyvCm37j+A/4G3+vOijzr6EBgBxhk03xA
X-Received: by 2002:a17:907:6d06:b0:c2e:2944:d6cb with SMTP id
 a640c23a62f3a-c5096328166mr1059994766b.13.1794913813640; Tue, 17 Nov 2026
 03:10:13 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-2-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-2-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:10:02 +0100
X-Gm-Features: AclHuK-Br5Vbz1VzqXOUMBwObsh3mCpAfEThlMEgldrsDt8fW8D9WyXgT-y8mRs
Message-ID: <CA+=Fv5SCPN9wTpZ-FMToWtNerfPswbExZxEHtt=gwrXf+S994A@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] alpha: marvel: report environmental events without VERBOSE_MCHECK
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 17, 2026 at 3:59=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> The service processors report temperature, fan, voltage and power supply
> alarms as system event (0x680) logout frames. The frame is already
> classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
> header line reaches the log, which does not say which sensor or what
> happened. Print the subpackets unconditionally.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/err_marvel.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marve=
l.c
> index 85f7a56816ce..46c521cea9a0 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -37,7 +37,6 @@ marvel_env_state(u16 state)
>  static void
>  marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
>  {
> -#ifdef CONFIG_VERBOSE_MCHECK
>         struct ev7_pal_environmental_subpacket *env;
>         struct { int type; char *name; } ev_packets[] =3D {
>                 { EL_TYPE__PAL__ENV__AMBIENT_TEMPERATURE,
> @@ -68,7 +67,6 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_sub=
packets)
>                        marvel_env_state(env->state), env->cabinet,
>                        env->drawer, env->pe, env->sensor, env->state);
>         }
> -#endif /* CONFIG_VERBOSE_MCHECK */
>  }
>
>  static int
>
> --
> 2.56.1
>

Looks good to me:

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
