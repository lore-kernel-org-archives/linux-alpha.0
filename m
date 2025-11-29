Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4691CFBA
	for <linux-alpha@vger.kernel.org>; Sat, 29 Nov 2025 16:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764433919; cv=none; b=sjGr1Ra+y0Ii1y6au9/QFaJRYAFss8DE/v3u92DzMkmTm6ExrqODiC+EjdZE4+0snJxKRL8zsyUKA8y7cgc/uyNMEK2unVegl4vGrvGtMyP39nN9W35Qq2eW2IgLdxcbycnggkVH0a2T2u5dMbFGlGudGy1ll8a0C9e0GMIqGZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764433919; c=relaxed/simple;
	bh=jmRhegzBa3VZWV/Vbk0j9b/60IZK9ozHEpNBlL5Qpv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jXireezZ3mUAEyHbKYqbtuvN8UwnRwmExvkqFnLTtDT/YRr4P1qF/DEHUfGn13f9EuFxVOiE2S1shD6y7mITzBJJokQnfCJFjbI0voEUsfKMVylrMSiZ8m6GKHYrDcSy3FyA02flH5mFtvgo3zBhzre2Ma14ttFD/ddXyyK3B1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJ5aDXXG; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJ5aDXXG"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so5085797a12.1
        for <linux-alpha@vger.kernel.org>; Sat, 29 Nov 2025 08:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764433917; x=1765038717; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZTlYlpfQ4CigBLu2mtDHcdSc0Yn8OGWXiNbe+QnH7M=;
        b=DJ5aDXXG/I68AHKZrBiwDAPHsxbnrXvF4LzI3cHAFYY7eF/EnNVdivaibZRLjqZ6iQ
         qFeItzscEjg6wB+A/UuGkHhKne3PTjm4xea5ZAPE6QEEiX21E3JoHwZSu/Cr2Np2L9Wi
         OaNvRs5C3RiIHfPZ+rsWSU9YSydlF6iRSWasQ3A+QP83T8REZ/CXvrFnyMXqdKtQyoyx
         39lxMMkMcNkSX2IQKXW4Kv/tVsxESKedkQOb/m78leRAUeTC/XJ9/aOQ9aocz6zJbNsf
         bx4QY9Q+bdH09Jqn5X90hYQaQUbeQvIK5eTbJ0CwULSbSJY6ttCn3/+JpeJc4j9l0rWH
         9yZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764433917; x=1765038717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lZTlYlpfQ4CigBLu2mtDHcdSc0Yn8OGWXiNbe+QnH7M=;
        b=T/NNSIdMYe7ySslz+V+T0jDkZF1d+IeYV8XEh0lhR+BcICXBOedbFEkJhAt7D2v68k
         t5rLjeHKELj70NqsfCWbdqwPDyqfgw9qruQIOvPfvOOCzxia9NtFzrwrWPmVsNpBFYv+
         cEOxP+H+w60I/CnDuzN+RgpFKggBXhQv1YV9J1Jl/KNiOuk7KLJauLFu8IP7Fw5cermj
         Dpw44qoFzJrvY8I8KO5U+odWVCl7LxmSUMtySkbGK7CQKlz64XgAoukPgO8HY/f+wCeL
         UWiTy/oE/Wkxjgb2F6UZAvXwJw8D0UB6DWrXdEQsot3zE+nQZ0mRAh4wNP6L/h1VCT/Z
         m5yw==
X-Forwarded-Encrypted: i=1; AJvYcCVxTI3v2sEqK7dkXtZPTpolYV8A3ySIgFpte0QVrYNrOgMdovkZ1A3C39l4zTRzryfJx7LIw5nwzE6LuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMZ08OuHRhuJuEbMyFe+tuDSUkxrOMsES9KHMg2AW3MDGFbERf
	ey38a6kbK5kgVUS8mqyw87owlKbII3esP+PpzvVdaZMwC3rlA/DVZTrOZd4ZLpIBDxdCKSaqraB
	JZA16ZPkwLhhEqN+tUhmuBRs/43wC8S31LdLj
X-Gm-Gg: ASbGncv410ldfSD8oZNqQoMZT+QOM+qkPr9ml3BqCHNeKMM76lfKVsdYaX31nGYcJjD
	ijUVuJgc+ZhxB+86ZNEk9CtE1luSIZjmcS9B507etkfRbmH9yhf7UVCd3h0juS8uaQQeVZqcokY
	+Y0j/gNwlaTJhirg5vRtcpu9c+cPRmAFFxj93YJP+YUsABeFS9Q3DrL46CWFk9D/bCIPUQa+XN7
	3bdADd/qRR7Qpo3cZDwNY+LEKLLGu+RrjSzPoVnrdWmS+gDmNsvjs0JoR5x/SuKTm7PZJyG
X-Google-Smtp-Source: AGHT+IFnUtVskftU3twk6pRF3EUW8vqU/P4n5cLLsQoOxEFst7L+iH8a/j6DNTQ9VlGj8mFB9AP+5nVkRB5/SsQvsc8=
X-Received: by 2002:a05:6402:270b:b0:640:a356:e796 with SMTP id
 4fb4d7f45d1cf-64554339c3emr30904922a12.5.1764433916414; Sat, 29 Nov 2025
 08:31:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <99f1a93cf8cd4f0ece8611be2860677084663aac.1759359610.git.sam@gentoo.org>
In-Reply-To: <99f1a93cf8cd4f0ece8611be2860677084663aac.1759359610.git.sam@gentoo.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 29 Nov 2025 17:31:45 +0100
X-Gm-Features: AWmQ_bnkWgYjAuyVJ7nydBAsqOBmLTVE6ZIgAv2mxBzsMRnypYehwT2RQGT2cng
Message-ID: <CA+=Fv5SKjqtVcfzu7EKJcN5ysXtxXsHX2DqECAWnKMvHgSed=Q@mail.gmail.com>
Subject: Re: [PATCH] alpha: don't reference obsolete termio struct for TC* constants
To: Sam James <sam@gentoo.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Stian Halseth <stian@itx.no>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, looks good to me, sorry for a late reply.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>


On Thu, Oct 2, 2025 at 1:01=E2=80=AFAM Sam James <sam@gentoo.org> wrote:
>
> Similar in nature to ab107276607af90b13a5994997e19b7b9731e251. glibc-2.42
> drops the legacy termio struct, but the ioctls.h header still defines som=
e
> TC* constants in terms of termio (via sizeof). Hardcode the values instea=
d.
>
> This fixes building Python for example, which falls over like:
>   ./Modules/termios.c:1119:16: error: invalid application of 'sizeof' to =
incomplete type 'struct termio'
>
> Link: https://bugs.gentoo.org/961769
> Link: https://bugs.gentoo.org/962600
> Co-authored-by: Stian Halseth <stian@itx.no>
> Co-authored-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Sam James <sam@gentoo.org>
> ---
> v3: Fix constants per Magnus.
> v2: Fix title.
>
>  arch/alpha/include/uapi/asm/ioctls.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/alpha/include/uapi/asm/ioctls.h b/arch/alpha/include/ua=
pi/asm/ioctls.h
> index 971311605288f..a09d04b49cc65 100644
> --- a/arch/alpha/include/uapi/asm/ioctls.h
> +++ b/arch/alpha/include/uapi/asm/ioctls.h
> @@ -23,10 +23,10 @@
>  #define TCSETSW                _IOW('t', 21, struct termios)
>  #define TCSETSF                _IOW('t', 22, struct termios)
>
> -#define TCGETA         _IOR('t', 23, struct termio)
> -#define TCSETA         _IOW('t', 24, struct termio)
> -#define TCSETAW                _IOW('t', 25, struct termio)
> -#define TCSETAF                _IOW('t', 28, struct termio)
> +#define TCGETA          0x40127417
> +#define TCSETA          0x80127418
> +#define TCSETAW         0x80127419
> +#define TCSETAF         0x8012741c
>
>  #define TCSBRK         _IO('t', 29)
>  #define TCXONC         _IO('t', 30)
> --
> 2.51.0
>
