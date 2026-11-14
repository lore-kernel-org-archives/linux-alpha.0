Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794647550;
	b=4CLUzi+uH0uDUD7tBym5OTYLZJdMUV8MQ6EjWHNJRH2H+WfHEMk3JUo2fAyvD5rtsUXo
	 rA+dCnkZDwCZtviHRkuNTwGEfyspCXws9XzcrtivTSzJmTpgtwHQGRHY/v5Xtup4Cp7q9
	 sCDrH4NTcb1978VlqzCpl6Z+itG/6aUezUvxc8cuPorBVcbMNN405IxMUYu8hxbzaT7JT
	 BbC1ukWZ25lDS38rvQA0u3o60tgjIfIJs2cxOb9dLKZ0bOoPEnWmyCt7COpwQ70VCN1uo
	 pILpIKC/dH0MKG2Zt38SwsxNEcU8SDE7LcfwKJ2PVrkS+PL7d5USNN1opE2hRxxUtYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wgvUfAbzidgQx/NVfNu92v+oDQg6bL1C3BnxS3Wh8CM=;
	b=qZoTLdsVk1xyEtMi6gmKBbqJQkRG409y1rsJxQb5d8cd9JynTagmVcYA055tfslhcA1A
	 RxXyjZm2iJhc+eLn/GgJKVCJhgumJGExcoxbkQ5qPBNvMJEeT5oktWdJCXj4OVqx739tD
	 BWAddLfEeVsTQ2gf4J+K7UAS06pbRgQQQsl9W/vLI31YNK3Kw15YZm6OkqV0teT/SsWjT
	 vYctLVGu1nCXOpnBe7zbuVHIltgU+ff8mmNOirXVVkvhPBhoOyBehF9KkZkAQl0TtEPKH
	 LUlJPnwrxIzTX5vjjk4zs1vq7NQ0qQby/GMJKnRSNRp1HuaFt/E/Ua4urxYdaffWh3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VsRytHHJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15913606A323
	for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 09:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15913606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VsRytHHJ
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b7a488a0a4so2317258a12.0
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 01:12:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794647548; cv=none;
        d=google.com; s=arc-20260327;
        b=ApmekybtEB1WbnHP2QzvlH4HyHAc4wcFCnlBPT+SsE/K/jM1nQn0ng1DrQrdkMpHgP
         KqEFTprR0n0o5qe2VSwbncQJa6Y3rZIBjvbUmT24Mbls+HCkESDSOncnnEJSI5+59Ii4
         STrpXQ+yoi1AzUvmubs9o9pltIwDfZnDlxIVgkjTCZ69PpTJXDj0MCETcesTYv7ejpiF
         ZSSNPdNBXsGhkp6nx/Z+kKWjeW5qMvzRyAT4LQ7rgvTyI75Lx2bje3SQ/Gr9pBCYzs+Y
         1thk9cPBGJ+NQ5zYRe74/ACaDzjRxMkf4atESGPWpefrA6nKdwYGK64YA6pOUM8YC5EN
         ohIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wgvUfAbzidgQx/NVfNu92v+oDQg6bL1C3BnxS3Wh8CM=;
        fh=4RMGulZIjdJB7ZUE5aR2B8t2+CaKHyz7gysS3QNA6ls=;
        b=d8P9j5KSrSH1zwdcq9J/LzZe32uu2+fG50i2dWYnr6I6Jg9GPEXPiP/+0z38MPBAKd
         7jeC4/J6fpYM2sc89IQMc0VGbDUuLB9ATMkTLjpfT0oaA2cBctyqqcN2eYMLCbkzp6uC
         WfSL5lETThWKuZxVERQiKp610uKDxdGp2puVRLArEnnMAzZ8liC4LK399JCL5hqMRmeu
         osazPI/QCFx7q4GKTr0Ji6LpDq3q3DPE09kTKY3oVZ2qn4nVAGU7WGHT3SWp3cJIHJLj
         iPb9akHm0tEUtgtiSZKVevZHsKt7ySo6izz0Ci5ajQeTSSO+QPbngQFr5dcHBmO2+1DZ
         GWNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794647548; x=1795252348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wgvUfAbzidgQx/NVfNu92v+oDQg6bL1C3BnxS3Wh8CM=;
        b=VsRytHHJ1LkcaDM0kP+WJnISyg5+vPGuEt4cnUJF6XBrhQ7l/i0FGEVnErL1/vDHOg
         irYC72XreKzQ2gfakFrFDUQ+dyrwwvJDuoyV/c/pLoxEchuOn79u/5EGVXF/QOJz6ebB
         /svE+xmhY54oNQMP9e+UViOF28Mj3/azn6CVZ8v3chL5C89pELitLZq4KmTdE9v2exQW
         D14W/4SbMcoZGDcpnLKkcyL0Ya0AH44w+yMBgoTUIOa94GCuc8mgTA3bgvUd9GFSgYgL
         ZE32NcKHL2XjsGcZ/PKV8uonz70ybBssg09Rr+9VelC5GCqOQ3jJs+X6n4NUqUXkD0RG
         Tc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794647548; x=1795252348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wgvUfAbzidgQx/NVfNu92v+oDQg6bL1C3BnxS3Wh8CM=;
        b=G04u5S+TA3sx7GNom2U9eud0S92Ach30bPRovl8eGRd20z2cIIgteNuMGh2T492xR0
         Lj/i6me9iTMFbbQjiUcYAYIDdKTYjjZ+pmQm+wsIp0m+eTwFLKbOF0DI00DqdsXHKdLA
         FtqqKrGFRSb9/85rXiehSIUMbpUgPOUQD2KL09EozLc6+Y8nn0fK/2aRFKanfc8B9MyK
         7KoiLPzMuiyDjoMmc3/24iAcsuOiEEIe74GMmtrfbpvwVtJJRcdeSSksTd+LP9UuZZRq
         INVfuQvl1T6bPQCTRGVwbqLUMJF7IiTKxrerk//LwdVdxk4MI+DNprVQTVTasqOkd7l5
         YA8Q==
X-Forwarded-Encrypted: i=1; AL+hErEISC944fDYgc1hNt3EAnLfIZ7rwse41nuwjO8LYiulzs8i4opObfT635tZrgcduEpZfPgmtAGmZ0KXfQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z88pXGmWjjeZKeGikSA+ElDNG4N6C8r5y+u0NoU2mPYkGVvYDtg
	Rs8Yj66SL98a1VLVkMCIuXBUkMTS0oWyx3IGGvZlpANRYGscoL31fDlNEBVdJfTDYxmlPhbrNR6
	2kUEnGllGknG4RXyxHlcvKD2zYXulTTw=
X-Gm-Gg: AYBFou2ORRwO84OiokR3RoWYyGb3T0yQ9zrbXX38Soow21RzX24srI5RmdFJ0NbI0PX
	M6NU4THI/56JFvOgDEeNDjn0mMqLJULwASbmi4ih9RlvGruM0AQ/1vLhCchlZwCpCmO7R0h84df
	PAsS0K1m0bAt48zpv7+F8XlKoH+QbiMOdjLE8EHbVPKFjoh0dBDw+XMgOSJH8YIkHA6bTJFf/W6
	OgomdEtoRwcqBr/okoDg9UcPB1VJGYr0859ZCDruEe+MtNBP5UJsn3GmXlTOG0JM3CHz90J4us4
	1uWLPRXXF3943RkWdNOZe0VTM4mvmMr6qpyvYmwEa5jnE7Vyo2RLH5gtZpVTYL2/QcDqMn98smO
	NOwKAtor+HgwhbcDQJZ0Te+lCTnJheniFN1ocfTPtJpSVIsVMvUsobPO71N9Ye/GkXpXR/y3w83
	FqHYSwoKBAQxSaNvhjRSkSrcw=
X-Received: by 2002:a05:6402:42c8:b0:6b5:8695:f838 with SMTP id
 4fb4d7f45d1cf-6b7c0d1d417mr3702075a12.39.1794647548158; Sat, 14 Nov 2026
 01:12:28 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112200359.32685-3-blum@kernel.org>
In-Reply-To: <20261112200359.32685-3-blum@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 14 Nov 2026 10:12:16 +0100
X-Gm-Features: AclHuK_X_2RAfyvHpGYI64sNg_uq1lOE1NFIFDEcQpfru7cJQ_uLwDj87Ufzn3E
Message-ID: <CA+=Fv5TGev0uJp3s-Uvnqk+b+AxYEQzuwr8nymO2y-1J=frROg@mail.gmail.com>
Subject: Re: [PATCH 1/2] alpha/serial: Use generic BASE_BAUD in asm/serial.h
To: Thorsten Blum <blum@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Thu, Nov 12, 2026 at 9:04=E2=80=AFPM Thorsten Blum <blum@kernel.org> wro=
te:
>
> Include asm-generic/serial.h and use the generic BASE_BAUD definition
> instead of redefining it.
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/alpha/include/asm/serial.h | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/arch/alpha/include/asm/serial.h b/arch/alpha/include/asm/ser=
ial.h
> index 91115447319c..205e61ef2975 100644
> --- a/arch/alpha/include/asm/serial.h
> +++ b/arch/alpha/include/asm/serial.h
> @@ -3,15 +3,7 @@
>   * include/asm-alpha/serial.h
>   */
>
> -
> -/*
> - * This assumes you have a 1.8432 MHz clock for your UART.
> - *
> - * It'd be nice if someone built a serial card with a 24.576 MHz
> - * clock, since the 16550A is capable of handling a top speed of 1.5
> - * megabits/second; but this requires the faster clock.
> - */
> -#define BASE_BAUD ( 1843200 / 16 )
> +#include <asm-generic/serial.h>
>
>  /* Standard COM flags (except for COM4, because of the 8514 problem) */
>  #ifdef CONFIG_SERIAL_8250_DETECT_IRQ

Nice cleanup, looks right to me. Thanks!

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
