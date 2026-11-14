Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794647639;
	b=PdQsBwN4ny38Oc4cBZJAv8liUVO+RlaJ5X933oRd/f5hVMKTIRVbB3pvWLYzSc9v2/9W
	 yEZ1daNgrpe81EgH+HrBci2sZybZYtUXJzJK0t0y0xesZZEA5s5lk51O49djjiv50DheK
	 Sk0kklxQtfYaECQ6CEE9l8QFwEnwaPICQ9Hlic/OV39l0SCfZtNVkDHBmZyQ+AC3QDH/r
	 wfk0KunL/EvONf2PX2BW2pD9/eIQ9vc+YiRFmbz7wMjiR39Jsh76tR/y9+Eu+w2Wa5CBN
	 +IT9fzY7mU1ar/PqfaBALTeV5aUSaiTb6vwMgAx9QpPMVpcWpUfuKJNktO9a62QIrTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8ie7J0FJagTe78B8tUzxlFkiEYKYkmpvWYFLVnObvFo=;
	b=xdYHG6n8Oan9mts7yilvGiOW7H5DdH3EuQHdGhUcdU5qqAr1c56VQEosF3BnkDVGn7VJ
	 JM4UKLOlrwuG9+uKa2MdpI5qtM5uyIBlEk2Jk0kXTgwU0GexR46H1QKn75ywvYuwC0jHG
	 AcoFtGPcfBG/Ej/gMvbMP+E1cgQ8EKs/6TbIuMD/fCKelOfECcIBgVvZViPWCoHIFb16X
	 APS7mEn4jECEF7DNx/qbOstnFP//F5M04TiB3h5lEajdicFEMBpoJ5tA2vWUGinw5aZqs
	 dwHdw7szr2xJzrvcP9h9SJmC0CI5eNF0psu3ZPFT5DLGT/VKPOf+13HbmkAUBmqoLPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ag6ewlAa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914E8606A329
	for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 09:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 914E8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ag6ewlAa
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so3298681a12.2
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 01:13:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794647637; cv=none;
        d=google.com; s=arc-20260327;
        b=izLTmgVeQpsMRYM8WUOuW6xo00J1BM8rmrbiOccJ40LllYvhSVYkgRxkJyytNAl7gI
         6gelsUIZi7+GQfQOUHH2ure6mPmhEjU6LlsYkpepiqsiWZwgm4AVoaVvWjZeZEModGCD
         vDD1wn3fEJj+1ql9Go1yufxlHbE6nmxsFiMZ0qqdYomgvvwp2rq5ejsh55bcM8Kmv2Mn
         IDvBarj5hHSwqLhaHJdGT0J0LrXyVfPJGfFlgWDNNBc7HadkwXVaEownh0PYK2dZQ8X5
         l7/+MZABkCB2qEuD8NkNJK3ovpxkbSiABcetmf5U87gEU3iYLl3sDMgyk4SmbbWJLgv8
         EqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8ie7J0FJagTe78B8tUzxlFkiEYKYkmpvWYFLVnObvFo=;
        fh=KtOywCBhvV75t5MKTlHPvA6KjdDQCKNM2Y9jnox/wI0=;
        b=Hy9qCEfvoRyhBmsVfoFu4aph4LRA5biCssPS4RyhtgMlXS7FfXzXwZuYsVfKL1kVib
         JDkn8b3vqpldo1KHkD7uL1TkEr2vep96Cm9He4Ho2UPDrWjEX9sxq37mNGG1KJZr6X3o
         kKap5rUSIYW1lsaEo52MpBEYTzTg2A2Cc6bbZc/5vAjH9SO7fiNCugE0E7jU9FyFq8Da
         KbTkpdMhwEpzPemELuKh5PjNFTREWTnMiQncX5kRfoGCiQR0Qvz51cctqz9Jm7FE1PME
         NY1gk7X+Deg8T1CZ9ZJZu+7E+iJAQhQvL6hECZoKM85bMBfzaNNAS//D0ljmtK2hFIyq
         jK6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794647637; x=1795252437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ie7J0FJagTe78B8tUzxlFkiEYKYkmpvWYFLVnObvFo=;
        b=ag6ewlAaz81yhb1pzvlGZ4YZzFu0odmkI+M1Y1WpMHThGrSlyKOachfoxV/3Sj5d9g
         /slMinWPxJ0g/5IKJ1hX7muMyrcPXT24xm2Ua7HT56L3nbifcmXTcg1xqIrggBUxLnjj
         jdAj/aRw+BEtDgx3xgnsrphejx8GTUntFm+CywJi8/yU3d+vcXmxt/CrFBiTdUtlyjV2
         ERUEmLb+rYrIGd14s0zTN0xc/qn19e0eSbQAixQ7wgeci3seCSw9/h/2PYdC8Ge9WQPV
         yQ82e1i8lmtx7dyBUBWmneHmFAgUba/642m6cSF/JJKzrmeAb1SN+dkaoEYhHJzxvIgh
         Tk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794647637; x=1795252437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ie7J0FJagTe78B8tUzxlFkiEYKYkmpvWYFLVnObvFo=;
        b=yzzhrf/uNOfyvDkTpEjkd+cNbvgdjTME+YTXbpUcmKl+x25dcW6xi9IF1tAp9waB04
         yvJ8nTmhluZH/m6P9EA/ZSt9AhVH/ItfhXYILwsg0pt4RLtAasBKnp6elluXr5uzAbnb
         YrmRAKAQakt7BmsXQe3nnT19pEHTUjoB3lV8+7zVRVmzEcuc7Q6r2gAEr+xo/T7fOnRs
         iu4jLoYCW+pyQ6dquUmvOXLnHr0/2JEiC9MtlfhbKwdkRxLDPezR+OoYi5oQOOGxZKdr
         lFdb4DxDObe38Ktjn//2TP8S+9LAToGhFQW+i+59HGYAANVWoJtBbmeh59xIZpviNXs0
         L9vw==
X-Forwarded-Encrypted: i=1; AL+hErFQc0W4kmzpnXpJSam/LAlFcqjYQ/z4ILrkCAcBcIPFkW5ap/Dd2x1iqWV4wxaIPNMjbbSYwRQHe9DCnA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/JB5e4vp3HdeoRLhzjLht2vWeUKlo0xXJmUUtl+THrUGJY2O3z
	oE1k/82oNqBGWfm0VsmiGq3GzNwisI7NQUFd1qNjj3m3qyuAswnwvMEZf8H3KYZUxjwRRr7Sq4X
	OV5gedilKs236HT6Wjn3xE9AlPOcGiZw=
X-Gm-Gg: AYBFou3v7t4JLj/Oqqm6Ip/z90VvrRzxYG6WYEEU+o35fP0GC2B4XXUPWR/105isqvm
	60KzfHONUUFvT8R8AZkMoskyz1zeuVDzvTc8lv1ktWblLVvRxdiq4R1XkXbMqGzgWKUjD6v9FWN
	78/RUYjiAGsh+hririki9S+R1h+it7Ta4KbdSETTKbxODOwBtWP5XOal1KGj3Fj6vUM5l895uwQ
	AcOuNG+9MBanX66k6C6y54X+snxPnueQewwzMIGgwWJW9YBgSIheWgXKjmKx9d6HSHFtPlSUXNp
	ePWQcvXpoyY4Nui95i7zsbuITmDLkgfCkwUfYso3Y7XOWrWWA3Y5BQ35IQ1o8aDuFCX7OMSOSo7
	yXsB5VHCyhNWFgZAgPPkprS6NDlOsNN1IfNqcQYUjJUR9Z1KGG5W7BfxF8N9PxioJRo53S9w29T
	oxDCnr4oGvxn3eAfF8OgsbnxH6
X-Received: by 2002:a05:6402:13d2:b0:6b7:e902:5e23 with SMTP id
 4fb4d7f45d1cf-6b7e9026013mr717104a12.33.1794647636609; Sat, 14 Nov 2026
 01:13:56 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112200359.32685-3-blum@kernel.org> <20261112200359.32685-4-blum@kernel.org>
In-Reply-To: <20261112200359.32685-4-blum@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 14 Nov 2026 10:13:45 +0100
X-Gm-Features: AclHuK88jybBaSEEPMTliBUIGHdiw1hpHPJEag-axkztBSs_Zfqh3EhY0WqZ05k
Message-ID: <CA+=Fv5TLvQx+c1exSXxecBohM6HUGqtnQRCAqHMvugCMpa-K4w@mail.gmail.com>
Subject: Re: [PATCH 2/2] alpha/serial: Add include guard to asm/serial.h
To: Thorsten Blum <blum@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Thu, Nov 12, 2026 at 9:04=E2=80=AFPM Thorsten Blum <blum@kernel.org> wro=
te:
>
> Add an include guard and remove the stale comment while at it.
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/alpha/include/asm/serial.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/include/asm/serial.h b/arch/alpha/include/asm/ser=
ial.h
> index 205e61ef2975..7fa754cab5df 100644
> --- a/arch/alpha/include/asm/serial.h
> +++ b/arch/alpha/include/asm/serial.h
> @@ -1,7 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * include/asm-alpha/serial.h
> - */
> +#ifndef _ASM_ALPHA_SERIAL_H
> +#define _ASM_ALPHA_SERIAL_H
>
>  #include <asm-generic/serial.h>
>
> @@ -20,3 +19,5 @@
>         { 0, BASE_BAUD, 0x2F8, 3, STD_COM_FLAGS },      /* ttyS1 */     \
>         { 0, BASE_BAUD, 0x3E8, 4, STD_COM_FLAGS },      /* ttyS2 */     \
>         { 0, BASE_BAUD, 0x2E8, 3, STD_COM4_FLAGS },     /* ttyS3 */
> +
> +#endif /* _ASM_ALPHA_SERIAL_H */

Looks good, Thanks!

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
