Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481CE1DE8BF
	for <linux-alpha@vger.kernel.org>; Sat, 29 Nov 2025 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764439169; cv=none; b=Ph1F50Y1dvyTL8acw3req5wvnPyrZIkbP6WwfHK1G0thnds4DpEHiy0XSt40/CGiZnfeRaExpp1bgf/nXkmi4E121qBf+NBnLBm7HBJQPEfvRhqr4wN4rXIjqFzEwSrBDSIDp7Z63oZIVXxSdjgnbBXoVaiqQFTPnLE/mSH1J0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764439169; c=relaxed/simple;
	bh=DGlPDfNLAWyspL0UxJGaCFDod9ET7hiJvThKCyQBm8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NrmQC6kiZ+FrczqYKLobyRieZxOVc8HOGKQI0he3G15pQTko9jNGmvfvH+mWvwP8u80Jrfee8/zS/XTIX8EjbIxXaR07VOU3z8RvoE8YymNbxPJGil+tyQoub6E9nqjxDelAcxFsuRaFhvNZnwA4nPt4nzd7u4OO1S6nxXMNvcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpLwwS48; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpLwwS48"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so4346292a12.0
        for <linux-alpha@vger.kernel.org>; Sat, 29 Nov 2025 09:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764439165; x=1765043965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBRwKDLFgot90BCpwfeuf6lF5eBHC5zOS1aXw8/zxsw=;
        b=UpLwwS48Jrlbg3eyzK4/Nz7L2PK7HkLKtw5RbiH0J2m1490+HyFD4P8Wo37o+uv1S5
         vcCUzSFs42wvFPvYg5eYUOkcrZuReovYWtw6uak/5w9opr+yjSrD2Aj6oYPlZyPF2OaM
         AB9uClV+3uASIYQpnaeZjDixiDNPBUj6/38gHUdDdpa9lpLt2Tp/1NI4xV0tZrdHnVs5
         m3DRXAT2QWgdg0k6en/6jqcSX/1GCICD6+gMzQwuGiG9poEfBTFxMDiKM7gFi/oBgr4/
         IyQtM7KB0/EO/7EiQWC1bqUUei8RfhcObgIjMHIQ8XQfiNnuMvvU/CiVPuNhVtS+XhAU
         0Oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764439165; x=1765043965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aBRwKDLFgot90BCpwfeuf6lF5eBHC5zOS1aXw8/zxsw=;
        b=iwaeNq7gVuBIEI9Qm3/K2zFUwwqnTcajL+7MT2FPdzAPGCf6dmmSKQ5I09tnd9HuMV
         OqkwDcn3YB/rmKcdRHNw/WxAcsQUTe5rKJV9N+K+HZfLwpPPWG1jZgXwt3jnYHboTEaV
         Y7heRHQKIXPyYJ4WMksKgH95PbHiaup02nB0vXx4N0/d1Z/E0hastiZN3K3YMRAKuocB
         A5Aw7N5HyEZXV+8XAkN6oO+Vt3TM2nOp++NFPZtziuW9SBW4yeLacfnB1LTAUdErnR7Y
         W6RQ/0WirmRGB+AHFu2DP1sBV+504G9KSBtfJn3tFdZXuLtqkdj+X75nrLy6fEJsBg/4
         ZzsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1AW0k1uBHwIG5dUjsMLgTcozmH+bMjKPn1zBW9KKUg7n2u2abrlhSaVAY4s47O7A12Nkr+MTP+x/LBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4QH/b21xh3gPuAGlErcDka0Qh5BSOPqn3VMAOcIEV+3T+YNj0
	p0E04NCkmOha3wThrXO3vYu76p4Y9xhltbMK+CKmw8Vz9VamswvYp85SxjrCS2EpdyweCPlcrCI
	nGM8G4EsN1+b+yLz1W5g4EGee+9S/uV0=
X-Gm-Gg: ASbGnct1V0zNrFya8zvXSj6UuHwY0jrJlzsgHIJ4uqefikuM6N/cptk+UGX8UsFhGeY
	HDsrc9h2BjJmxBbGqF6pJSFeXh2Lh6hA/h2jicr4tOtCNFcLYYEo4SEZktBJkKR162B9ssyltJb
	sC20G/f86udc4aSEM6VIfGQ5NZA6bYeTSbUtYoLxBOQ+ioi7gudRvamHXqRPhLC57sWL0QHfUtp
	yZ63hMmkNEnMNPNI3Bud7rylzfbA9SIBeq88yUcp2F1hra4Ig5fPjrx5VmYmOk9XUo9rPlT
X-Google-Smtp-Source: AGHT+IG0VgtlaGTSklyY0vbu4Qq4mH1myxFDbZdM5hSJcMj+hIDd8tP/K+G8vhcbc6WgZnrjqnh8cyGubkBSRuGt/Vc=
X-Received: by 2002:a05:6402:34d2:b0:643:8301:d107 with SMTP id
 4fb4d7f45d1cf-645eb799b65mr18151139a12.30.1764439165410; Sat, 29 Nov 2025
 09:59:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <99f1a93cf8cd4f0ece8611be2860677084663aac.1759359610.git.sam@gentoo.org>
In-Reply-To: <99f1a93cf8cd4f0ece8611be2860677084663aac.1759359610.git.sam@gentoo.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 29 Nov 2025 18:59:13 +0100
X-Gm-Features: AWmQ_bkrBmxxqq4OZe51leZUcX5SsifMClMcQ-NL3CRIKUHqXn4Riqh3kSl9BD8
Message-ID: <CA+=Fv5Qr_QE2ccxiF-yBLWOiFS-bdWA-EP3V_J=-GskKPj8_iw@mail.gmail.com>
Subject: Re: [PATCH] alpha: don't reference obsolete termio struct for TC* constants
To: Sam James <sam@gentoo.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Stian Halseth <stian@itx.no>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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

Thanks, looks good to me!

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
