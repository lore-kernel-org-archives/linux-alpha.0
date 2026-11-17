Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913906;
	b=K8rTPk6sH900FQDvTpdpbGyatAzgeXUIe2/aT/uTuCHnLRfGwFI173l2WPBjpCAoNwAD
	 8U8j3Zc4vVqi92sN6IAz1M8VZCaeGBRoyElfbt5uaNO+04meBRM1zzXBTGwFLRskr8v99
	 fMn9qfhjB866q6aObqlebYWGrF8h8qvdkl5I9AQk/MTOu423XNRgf9P6g8Uzpu6R22z3D
	 latJg1DlLlv6BDRVEI09jJmWpc8wT6/ek2UdSkH1N7If5nvrV/UQYm463Dl+Re5MHz5jR
	 S2MYkGFpJo5wZa3KDOWhkv6IDoVoBg0Hu/sKWLdhlbjtMivVYi+bNoVTSAfTZ2X9NrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+10pY0INY9MpKdeaN2+bTZktiWeoGPp9KNRq4cSBn94=;
	b=KEtW1Z6dIK2KpiU9E6pZ3tDO/kU5Bmo+gRd+WRSa8IB20mCA7IL30AQxF4e2wBdAIhvR
	 BtirupEirFvL2OcU55QmALAmKSHs31JNPNDwIAHpa5TI2iVwyf6nKWWnG3oRv0irPBR/C
	 vu4A/gjJRzwczXVjLRaPey8PXPbkPOhPkVM8HoEN9OpArqusP8XGnXWV+tpcy0GuW9Eih
	 TChV0Izr3QI1iZ+JwPj4UVTc9qhlg7B/o1CiKMwJKW1ogXrdMgPGCgnUFwdzHl8h3EMuK
	 plinAmTZIDYym5GlrHiCMQEnfq3rVq6FBBOeG/HyDVmKxDFvVLfV9rLb47pMrEACN0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yyzwQXWU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A462606A32A
	for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 11:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A462606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yyzwQXWU
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so765008266b.3
        for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 03:11:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794913904; cv=none;
        d=google.com; s=arc-20260327;
        b=SP6UqUUIFa+f1f1j+/5JOJ4YkP6wJKWgw5Ew24J7Jvx/Fy8DmJeXRl7PHWbsCn/c5i
         Fh8nRWkHSV1chuprKj+d3Kmkd8bfD83+tzKkpFVcczamdk4z7ki+S4GgLesA10ZQNboJ
         WdROb7ZL7EggOyGpBElAhTGLidP3woV4ayII7H0fGp7Q7LbDWxetRcxyrcQD0A2Hdmj2
         b74eDNGGOVTtWmFrUA520z4GdkDLXj1XI7T0Rx3hY3U6sNniVm35D2N7OrOqI2cJRg4j
         PBV5yNrm7jmsvgyy5kEvjq65O1NYfGONODWvMOHHp31+MJJSSjSihY2m+S6V0N7QSVcB
         aC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+10pY0INY9MpKdeaN2+bTZktiWeoGPp9KNRq4cSBn94=;
        fh=J10WIJI2JDA7Pf0pLs8Pm5uyl7yv4+ZvkAwaOxyJT+U=;
        b=Bf/2tKdoziPPT3tSguA2Zsr/OAbdZMs3MDi+ua3DEMBUN/U3/2Aq+T3YEIcrAx+xFI
         ZDi87NHiCjx0wFlz4Kf/V+F82dLrqiev279B5ecH0RRijFro2dURy2XNWuajnq040Y7e
         lL6whxZ4HBJRtjNlcWYdjuQcS9ay+Ut1PYAPMV9q4nAE170BJKdjBuP7jeCkED9De0sY
         Nnsi0d5e0CZEYftufKHC+FHn7Ga5BE3RQ/WigQPgfqZW70VhYrvQutHjlLj2Wb0M5OG+
         D/3HhtuOZcTFr5FTEnWbtp8KkC4lYBmOyUlxUm07ff4ZR3DnS8dejNMMp1Rm6TrYpbXl
         A8ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913904; x=1795518704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+10pY0INY9MpKdeaN2+bTZktiWeoGPp9KNRq4cSBn94=;
        b=yyzwQXWUh3hlTm75j49756a3u40dxwVtzSwHSTRdU1++KQVLHeGLEY5oKwXhbCuaYH
         6nWczAtsAkgzqx7tarkVTwqE/NcVSVZoNK6OuqrefHsu23luGO9vLTl0ReCdUF488lYn
         Xctf0sJGtjqLQoPJcntw5NhbgQ1nt+25ZO5G9d6SB0G6QMIK+9CNoivLQNtlpfq8YlX2
         bvCKhmaKDMno2IJ2CF+XBc6YetjTb5aYwyiC80kbZ0zb4Mtd9yiOq9GZfVJP1lOB2jXz
         W2YR+wlO7NuhGWOJ237/w17lVlBl32uKbC1Xb7lNg+J4sMz5FU92rzdEDYH6v/ndnBFN
         3FOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913904; x=1795518704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+10pY0INY9MpKdeaN2+bTZktiWeoGPp9KNRq4cSBn94=;
        b=dDZmRfFtSKShJnXbXhR4RDFyNUUcPBqoV1BBFC/E2nBqfFbdH0Jcs01U1kyfS88ycF
         y+ExE5bt+EJ9tJAo9glGwQ4nFQBEkzpWXtjgxGGVOgJuhhok63GA49w/nLUjSbOwenho
         qDZaTvVDBWIYm2gweJo4+f0QwrwROtACXjSOJOsPH7uhO/sB1QHKoKJpRlmothujh93U
         pqryzKJa4KHLYm5pQ1pq4Vcm44CxvK+5J/OllKiiHwx2ah9d6/9Zb13Wg5hftJo1Eh9C
         nvLUe2qQcEEHz6oKFQATH2zOOiOh9YbjbaIghQva2kQnANCxmwPO/ADmSK7SAckOMs/9
         FUDQ==
X-Forwarded-Encrypted: i=1; AL+hErHqBRrEp6Yzyyw6RiafVf9PsJ+yGbVCV0Oy00vtif7eJiSIowP6Jw9qqB/bOLULVnuWfg1Sfb7IOkMT5g==@vger.kernel.org
X-Gm-Message-State: APuU4Z842k/tVlLa5AEJRaoZotkVwmnFkX+8yl2sxUg7ERCqiu0QOY5D
	mH41XyCWnsNBQU1Na6NzDAlqAddSbtiUZ3sUvZTB6q0eF8tTtnpYMcd5zSgLOX+luXlVVHsLGQx
	QPNWzwifPvKkNDbkwhTyNPbiQa1jQRHs=
X-Gm-Gg: AYBFou03KFCuMiYLcRecDDIZ9qT+pXAgZ7+hibRcIaEFY9f9k00qJHsYiCK4/V364Cz
	ueX2E/a9kPQ7VLz9KDrMwYkt0XU8dhI0QTwFtXBRhJyfOzKuM1v+XrQP9vBNYzho2e80N45UOUg
	/mpsflQ5aTfWtB5CV9EBNB3M7SYCR2rVaXOqm2AKGlKC/aI7ZBbSB+mLLNEVKKZreFjQff1TkQh
	L9+h+l9pMOKTuASuNGO27iPdzWc8Obl79X3oG4nlnoU/lsU0HtLdJLvAv1uqMfIpgQ+T655tr/t
	DKNaiQb5enTnJx3uaAaeO5fxCvMnE3eFh1ohZlH2GqZq24L4HbG+7QIUzUPlNhZV+2RaXi7/SJd
	2dvuFDgX+wYrUaFRUGWWBMiPBlUpipy2kf2iSOcggNuw+9iZCxJPxTATogzNW+y378RdiVrQTnr
	rrP0/2wUluZHljoEQGovdQ4E4=
X-Received: by 2002:a17:907:94c5:b0:c50:576f:b3a8 with SMTP id
 a640c23a62f3a-c50963d9089mr1499165666b.48.1794913904361; Tue, 17 Nov 2026
 03:11:44 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-5-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-5-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:11:32 +0100
X-Gm-Features: AclHuK_ySbd-btf70cw_u0VyMg7YEG-_OS2SndJeElSe33r8vAUxyZLJAiFwxJQ
Message-ID: <CA+=Fv5R9GknyU62ZwcGPvH9u_ucK=qP3j0mE5s-YMJgVbkGs7A@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] alpha: marvel: register a platform device for the
 environmental sensors
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
> Register a "marvel_env" platform device on Marvel systems booted from
> SRM, for the hwmon driver to bind to.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/core_marvel.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_mar=
vel.c
> index 7525f3ed6b62..169a1df6adb2 100644
> --- a/arch/alpha/kernel/core_marvel.c
> +++ b/arch/alpha/kernel/core_marvel.c
> @@ -21,6 +21,7 @@
>  #include <linux/module.h>
>  #include <linux/memblock.h>
>  #include <linux/workqueue.h>
> +#include <linux/platform_device.h>
>
>  #include <asm/ptrace.h>
>  #include <asm/smp.h>
> @@ -1139,3 +1140,13 @@ long marvel_cfgtree_partial_update(unsigned long o=
ffset)
>         return status;
>  }
>  EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
> +
> +static int __init marvel_env_init(void)
> +{
> +       if (alpha_mv.init_arch !=3D marvel_init_arch || !alpha_using_srm)
> +               return 0;
> +
> +       return PTR_ERR_OR_ZERO(platform_device_register_simple("marvel_en=
v",
> +                                                              -1, NULL, =
0));
> +}
> +device_initcall(marvel_env_init);
>
> --
> 2.56.1
>

Looks good!

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
