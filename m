Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793704006;
	b=bwwDD2RJmc022FRTl8+PK/gxITgi7lsQxQSPDsuMhI75jSeGgfpmp6/aH6jSW5J4EHFY
	 pNST13MZxbnKWjBnvafjBecoUelfZWHjZnabJFNHA5BvGpb3Rb9BBjUtclg8sGlT2/EJ4
	 iRHNeANBEAxcESKjDV8rwqSZjWm7ZF4J+HIIXAO1mkYuFIIgYS5T34Z305I8GM/1LF6zx
	 kaS8Xnt1c1KXay/KtsUBDZ6FnOXhCzmUtWH1fRs0qB4QOw+0rLzJzxlQlhtXdhZEpleil
	 v4eFPLGL6xl7duAJoTd6QWvYxHNWUZ8McQHOyjqI4jm0iMgYuFwqElvuQ8fhHhwRNUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N/WKx1dvlKtMTD6b1Dkde2yUpnwD8vYx6xMXPAAWNvY=;
	b=SlE+loqZarVjhk/wsS8+dkoKTdhGYnceb6Oc4zRFxUtBAmFHFRzPTbUojGwX3W4eGCrt
	 GackH0Qh1lWFk6SSU2GIYUIWC/vswjIvJ0yi3WdprIYKltM7vCCquaB/eAtC2uNDxuv+s
	 xPiakkg8TfJ1WHUqgMYye6+FhDL3j254wclO5gw98ZeS6l7vnnAZKdWaor3WhM/Keriw2
	 vvuiiVKu1/aDtp/VFBBr0O0z527Apan+SiVaNxjpqaGaAxDu0KppjH2HqFRoHvDyvKJwp
	 GgXLr1g2TfvpLmiJNVK8guApZJJrGUqIUwiBfuN/uWNZ3EsrlpHJfOytZ7qQqKm2RsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2DuDTks;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075A4606F7E5
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 11:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 075A4606F7E5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2DuDTks
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso5841073a12.2
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 03:06:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793704004; cv=none;
        d=google.com; s=arc-20260327;
        b=sLmM7lxMC6LJOgW3BN7fhN5C29dDjY44pOsJEU8zt/HAtGL3aekyxDhTMOfMLn762B
         OTEEHDhxaZ3KMhMqJwMrSnWd8ZnDxj/xbL8N14MK3kzKCQOMSTk7qfHgoFtFY37vkctx
         OoJBM4tMda3I+Pw9HRXSib8eGv6kiiJdETtZpQSGZxKwIOJCHieAX/DDwbv3sXRFHBj+
         aoExueZLYwfIW2mmkvHUw0VuUeg2LI7ncoG0+rCSsC3GMn9efoH6t0BMe2+Jz9RXpoW7
         vtOcDDsVVl2BEYkFsfBGSMpJMlETw4/spzunzaqlf2fpU+BssMAIux9g7AEHVgEq2AdV
         Emfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N/WKx1dvlKtMTD6b1Dkde2yUpnwD8vYx6xMXPAAWNvY=;
        fh=YaIhO/ojiHqlY6tHTt65eZB2psI5HRIeU+lp9Shzmv0=;
        b=cYrSg8uR50dy+qgRsPTZZpGBsViowFRqVCVtfcs1SBl6TzffItwdlmPvPhO4g6J97v
         hhi+1oKxgycNnNYiL08vBef2W/ApsiBDEazc2BBmt76wYblay92LHnrStimc/9ng5Yxa
         bwFW7VKCwDlRTEa/UkBTYf9Ca/Vgu8UNZLeVcasDJfUkMa0OfKtW2ZEwnZBuDr6jAdqR
         gJgdSHlymGoYQykUp8CQ9qNYVvj6HsEvyRC5hjW9oy76M5e/Ae4FsCNkrvyDKHAG6pvj
         tkUMPw7Hz60+cOCtggyeuWYYoEaHGR1nnMZUAVSH8JyM1U9XSGveQ5dXH6M1wcwo7qwk
         1fqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793704004; x=1794308804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N/WKx1dvlKtMTD6b1Dkde2yUpnwD8vYx6xMXPAAWNvY=;
        b=e2DuDTks/EEje4+iKJ4BABVZzNrwOnegOge1hHHgecVPwiDRr4fOBm0m61f25X7hhj
         Zn6CoXRVW3jcobR3CuamkshJei9lB7lEcaJpp7Jx4cBOy625g4IDmiSNuFiX2zlmRBMr
         4qBgBoTbLKoxoOxtYCDdkuXNujW8sOn6jY8LRGc5WUjvsrzaZXcg5oxssAhGQPjjMlaY
         u4HMnASC9Q0xzwoKxXGcQDmwhWaqByiLyQ+jF8i3Ub0fMT42umomyHypNEg6Af9vm2y2
         IgB9hjbkL24D4/3aWMk8Jz7o9v+muD97ppQ4Keez2hLYE0d//zi2SRqUTjZad2xG1t2v
         eVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704004; x=1794308804;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/WKx1dvlKtMTD6b1Dkde2yUpnwD8vYx6xMXPAAWNvY=;
        b=m6JPkeNWDB866KfrLfTlUOn7NFvOLsJVAWncbau9lltF6faBzwTAkdwksCuKJjOdnl
         ucFq12qNKoaXdbSFkeAayEDqfBhnrf76lC6mzYoMSFmOc/cBvBUO2+Y/M97aN30aGktU
         EKotCTun7tsdhnepfpGf+9bdHROTdT+nvD2sYmDR+7MZmoJwVQrt9yUYirINIWEKMC8v
         XmhRtyHfv7SttkrHN1Eb2fAe5fci9zM7D7cXTP7pc8kTwV5In4VAApSxHIY3llyCTUFG
         2lUbx+adHjod+cPn4bPX+X5vy6ia9pqpsnJuqst/oY+hiWv1l8iDxqt7WNgCaUqOro7R
         CtuQ==
X-Forwarded-Encrypted: i=1; AKwUvBygf9aHICKSlIopc6IkyaMyhDyPeU90qk0ruY4gqEvfssCbFijjeiOWIBk4GE9mSDshIxX12DBbJmamLg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9pQXAWhIdSNT05Q0E4dSRQPsMeSDSS7J3dj5ZtM2U0La53iqIB
	nWpWDmZIcdvO3zgUDTffAwdv/VuZYaO5uDWe7R5DAwx5Wts7amFSoGeB1xrOdMikpQoOqXA9s1T
	VEpoGM+BN/A+IiTgU2BF3Gd4WaOtKyiY=
X-Gm-Gg: AYBFou3w6O23YnWkylxQ2sRrbp/NFtvDvTtafl0oY234XiZdAOwTytNJCxVa4FM14gw
	pfBT8em1I2BdTj7qOXY210gfQmRGX0xTW/f6NYkN7Qq48QSrqvPxuCc1lu6x2mop2L2P9glMBhC
	0p5nGVbdPhEHIHIWqxTbbWYMAC2ctZ5fZ2Nghs0KUyAXQiiUSRQ8jFrcLDpYLjP7g1qOi3dddX/
	1napuE5LLHTw+jzvab6nWVUDN+beUWXWlRR2eRl2vlulbTkFj+fLFyQlNxj73qQFg7G1KwZPr16
	8PW7usHQGMn++dTEVNscToAV53eeYP62I/HHUBEOGNwNR/WqGItGDdmnRAsERyPMxV1G94Q56pb
	EMllXR2F9rc37Hry2/fBVGhWTR+gjXO9ioEISVNI7DjEZ5KAGD+noxoBmldfOXQFCI/Ec9cH2Ar
	fnfSZobogvDPjCgAqvJ0GsPg==
X-Received: by 2002:a05:6402:428f:b0:6ac:a862:d8ce with SMTP id
 4fb4d7f45d1cf-6b4d428f81cmr8567727a12.7.1793704004167; Tue, 03 Nov 2026
 03:06:44 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-alpha-compile-v1-1-9e93e2260a9f@kernel.org>
In-Reply-To: <20261103-alpha-compile-v1-1-9e93e2260a9f@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 3 Nov 2026 12:06:32 +0100
X-Gm-Features: AclHuK80yRCm0o-1xn8zHa6unhoXxUoLu6bQm-m9xx4ZQebfzMiUchQkkgUNT-g
Message-ID: <CA+=Fv5T0NE3LiTEHtwORHzz=0qv4xkRxY7iReU9KQ8MQmcRPmQ@mail.gmail.com>
Subject: Re: [PATCH] alpha: Use symbol assignment in SYM_END
To: Linus Walleij <linusw@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, Nov 3, 2026 at 10:09=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Alpha uses the .set directive to select assembler options, so the
> symbol assignment emitted by the generic SYM_END macro fails to assemble.
> This breaks COMPILE_TEST builds left and right, e.g.:
>
>   Error: junk at end of line, first unrecognized character is `,'
>   Error: .size expression for bcm6846_runner_start does not evaluate to a=
 constant
>
> Override SYM_END to use an ordinary symbol assignment for the calculated
> size. Preserve the symbol type, size and local size symbol while leaving
> other architectures unchanged.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611031620.n4ptlpo7-lkp@i=
ntel.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> The generic SYM_END uses .set for symbol assignment, but Alpha interprets
> .set as an assembler mode directive. Provide an Alpha override using
> ordinary assignment.
>
> Tested the unchanged Runner wrapper with an Alpha-targeted GNU assembler
> 2.46.1: the original header reproduces the reported errors, while the
> fixed header assembles without warnings. Symbol sizes and the embedded
> Runner bytes were checked. A full Alpha allyesconfig build was not run.
>
> This patch was prepared with LLM assistance.
> ---
>  arch/alpha/include/asm/linkage.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/alpha/include/asm/linkage.h b/arch/alpha/include/asm/li=
nkage.h
> index aa8661fa60dc..a3f0302c92d0 100644
> --- a/arch/alpha/include/asm/linkage.h
> +++ b/arch/alpha/include/asm/linkage.h
> @@ -6,4 +6,12 @@
>  #define SYSCALL_ALIAS(alias, name)                                     \
>         asm ( #alias " =3D " #name "\n\t.globl " #alias)
>
> +#ifdef __ASSEMBLY__
> +/* Alpha uses .set for assembler options, not symbol assignments. */
> +#define SYM_END(name, sym_type)                                \
> +       .type name sym_type ASM_NL                      \
> +       .L__sym_size_##name =3D . - name ASM_NL           \
> +       .size name, .L__sym_size_##name
> +#endif
> +
>  #endif
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261103-alpha-compile-efdde587115c
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>

Thanks for fixing this. I reproduced the failure with the unchanged
BCM6846 Runner wrapper using Alpha GNU as 2.43. With your patch it
assembled without warnings. The start symbol is a 32768-byte OBJECT,
the end label is at offset 0x8000, and the embedded bytes match the
Runner assembler's output. I also cross-built the kernel and modules
with my ES40-config and CONFIG_COMPILE_TEST=3Dy.

One related observation: I tried SYM_FUNC_ALIAS() on Alpha and hit
the same assembler error because the generic SYM_ALIAS() also uses
.set. Maybe that is being handled separately?

For this patch:

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
