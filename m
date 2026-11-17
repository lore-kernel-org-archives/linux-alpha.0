Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794946275;
	b=4obPlfZJejM1pfeQC4GeCYqZbqzfZWy3Hy1pLxp20OQ+THl7y6daGlw3IX9Xtgr2Po4L
	 5BqgZacAd8BoMkxE5JJxipAtKZ8dIXPB86u8mRCMi71q1hTCUZpPPURuHHi3/Y6uBk8WU
	 4MW6rD4oRTUNXRChHn9o1hKpJGsLVCjU2DvLUrecFLtTWzMGTKTMVNmwnFmK8LlTxw0E5
	 PZFRFxMGemKfKhkzApO+QzswQGJKdnEGr7O1NJCxkZsFFCIoi8S/+6CD6vuKS9UxKAkBv
	 5XhEbysQVWuCfguoQie4zLu9ndJ4l4dvPBm5PAV/c/2TbObjPJotia14PdM2ErPxwyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TLCtbRBV1PGHwelDPw3GRpng9bhYRh7QH8AhnaQQo6Q=;
	b=Fmk0Jq5dHwl/jATzR1ibUsazIhvvD5sEkqwjrBaVgr74sykjoAZVyWXop7Nls/ImDh/i
	 Hc2ZggXG0qJBOBqClBpu06SF6Ejelihf9/UR7mewnGh+luicDVc3T8JDXfKBAkeMvTTBY
	 oLj9akTrJjFEKQBaJq5JdQQ7ncBaNaW1tIdEqWP0WThmkcg8zhq32ZzzSL259AC1kVnCI
	 y3Sv1NRS1lTXQjHj1246YwuGJvKCl87PREvDhNOfY2f6oE4iSc1unl5bXZR35mwR0pl8n
	 xnDEqcBMFKZbR4quxMkjxoh8TvWzVSW8/3RGlW7yckbD9Z45y7bMu2A9MKyP8SmKlxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qUYi/5Le";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F021C606A31C
	for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 20:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F021C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qUYi/5Le
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so375852a12.1
        for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 12:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794946273; cv=none;
        d=google.com; s=arc-20260327;
        b=aLMh+PL+nl31z88hYvaTVTYg1oscns741pzSYqMJN0ppKOq80UNxBos2R7Pqyit/Fi
         MwM0VrNiZMBg1ke5EqFgcyeDbh6u3SCb9289N5uj+1CNVGbOwa71a1czODZBOOwpJk+7
         oiafeGFTpBLY4IpuYdLcQDcoDrMAHIZvWw1roJNX2juFZBwGQGxLQ9gzQswj90eJNnzF
         8CKffcC+kVFN92qRfVN46vGgJAFCtZNAVtoQHR1AzV9c6cCIiEmX/pmeeRql4j4nvX6Z
         XhQF6HSXu3blyU3cQbrqSkUbayBtiZnYLc4kaiKtRSPV3V4StDXgis+Zuppc5y3aH2h/
         un3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TLCtbRBV1PGHwelDPw3GRpng9bhYRh7QH8AhnaQQo6Q=;
        fh=i/mfBREju5DEDIFhiYhUT0Q0oXO3gkeKS94prVdxx8Y=;
        b=cfV1rAsNahEh0achjqfRq3doaGcwKemGJKbGEFaD5AZT6+mNFP1ox+uVk4aDcfWwvk
         8rkZB0ULBK86Hy2FF4bTUj04ZxD+yenYUNvD2Q/NYRp1+/8Gu9fj05rutZLVwUuu6vxJ
         nowuqRqaqYGL2r0NydXTlJfWuZbIu2eVqyUWuSPYaenuQlx0Tiy5mvHxK5FL2mTgpZWF
         CSVw4GScLEdE6sEAuaY7opkvPAp2X8bCHUsp2AaE7Da8vD3phlWrpDuRjabMWmswQOIx
         vPqAmnwCmuOY8IuO4tHlkZvyX6BYwyQlRH509F5QmWMrRtyB1xwYOsbLfQOA/x0n/JtN
         23NA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794946273; x=1795551073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TLCtbRBV1PGHwelDPw3GRpng9bhYRh7QH8AhnaQQo6Q=;
        b=qUYi/5LegcyQhwlyDIHJSec0Wq3K+2MDjMtllRf2GD5+J5Uig/9eXAdGiQqKo8/rkQ
         UZY0yqFZJmXO5C+fY26YLqJTbicpoAFPaJne0z8tdr73jeA/O2peN0eoZQcjhpUXqVvW
         tAguCwDvHD48dKuWDUvRTubsfVcr5EjJrOWnWZ/j5/NTQVb87KZo5z9P8J1rVPZL7Y1c
         HhM6ygFFx0bpOQOkzjfHIHOd/Wp8IxoLnVzNadw9xrLc0YiACFGTCSdIxM2ydYHCOQ0A
         4Ikl7srSRBUzfzX30kFmwKpbgGeBSk4v5zhjeQwEF8VcqpIO+zaYvtltHJ2V41XuVmtM
         Xj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794946273; x=1795551073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLCtbRBV1PGHwelDPw3GRpng9bhYRh7QH8AhnaQQo6Q=;
        b=o6UuD6n37Da0VYR9rR/6tcKPNeMbExLAU4IoXE3RubAfWcURD2zrtfiJpnrIoavoQu
         Fmwc1Vb+GmYXqEnVOEtdxA34TnHnDd83K+oU2itYPG2tle4ER2aq+To/cc9h0zXMIOTX
         WQlwAHUL4684k1zakwLHTBdgIMJKEIP9XRg3dRFvtzohw4/gQRuIfh/+GG4MG6T4BJtD
         ZVQqLfxtfsZzy7euoFfvcfVBYQj/+5tIAtQqBrTtSNojVdwbSiueD2P6fmHcyHdWXPob
         QhEiSGyiUI3MNoq6uAFi8MvNehmx9hrpwMQXcnXXMWtGvELdPyW2H237Jvmr346s7126
         /lWQ==
X-Forwarded-Encrypted: i=1; AL+hErHFU55T/JnUx7ejmaZLqLAW5UTB/Z+4fc3UQ4UegUcSviaqYh17ORfuxbVSwfmjTtJhcPy4RVS+Kh6SOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+JtsqUaYeEV/tHIq0TaJ97KiwVBoASH3fHa5JWEk30clPlvf0p
	+zXZ0baUNX5jXQ2xGPpghMgtWkgp4++HsYeOsTcRhFsgSEzOBufIkzU7LnWP/bN4evOy2PQCHTD
	NnJ1aO2yuNAREAHOyzQNegzSlSu8rMIw=
X-Gm-Gg: AYBFou2uTCTtk90ExykfK6xmrRbFJQ8LKCUBus3jx1cuMletJDG36iJuprIcki3NAge
	UlNPP1SCQsqjSOmvW9sF3etGdAO0YkGf0ImW850a+1UW5e70Biy47UN/3I8PR3fERY18gncQJxl
	E2r1nK5Bjzpa+12D/51r16QJhMVEzv1eyrGCEbTCJ5RYm9oBG8NJ7BgvaAB/OAN+iFXxJnCQr3S
	mjXmiIDJv/8fxA5pAkgd+eUYLCnfKR1+kyJXqB47oyW2xK8PN1quE1OoQnJNyZify7K0KqcxFFO
	n8OKe0uyrtNIO1oE5RhLp84e5cTSeQ2iybw66KW+KvUEWSur19M45u4cXe/tEIVmGUk4kVcjZgV
	IvMnxTOjqfX9CGyfL7e2dsNAuW5Ar762uYq+/GLe0dX0FmfKlO/LZiq9uqkoJ0LQ6iyIQZGJjKh
	l+l+UmwvQ/Dh8KmNtR3smtlOXb
X-Received: by 2002:a05:6402:1598:b0:6b7:164a:7228 with SMTP id
 4fb4d7f45d1cf-6b888111f83mr296086a12.41.1794946273014; Tue, 17 Nov 2026
 12:11:13 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com> <20261117-marvel-env-v3-1-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-1-0edc370fdca9@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 21:11:01 +0100
X-Gm-Features: AclHuK_Xa5-PlkYMr0Ybe8c0xscp1fzE_6udpNRIkvpkKayBgek5aLFyZAumq5Y
Message-ID: <CA+=Fv5SFdf9Gr0zTGXJSW0GVB0eFoyp4a6PCWQ4PY2q3LGZTcw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] alpha: marvel: fix the environmental subpacket layout
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 17, 2026 at 7:13=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> struct ev7_pal_environmental_subpacket does not match what the MBM and
> CMM firmware (V2.7) put in system event frames, which is:
>
>   +0   cabinet
>   +2   drawer
>   +8   PE (the power and environment node holding the sensor)
>   +10  sensor index
>   +14  state: 0 ok, 1 warning, 2 fault, 0xfffe unknown, 0xffff removed
>
> So the byte printed as "Condition" was half of the sensor index, and the
> state was never printed. Use the firmware's layout and print the state
> along with the sensor's key. This matches the frames in the error log of
> an ES47.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/err_ev7.h | 16 ++++++++++++----
>  arch/alpha/kernel/err_marvel.c   | 30 +++++++++++++++++++-----------
>  2 files changed, 31 insertions(+), 15 deletions(-)
>
> diff --git a/arch/alpha/include/asm/err_ev7.h b/arch/alpha/include/asm/er=
r_ev7.h
> index ab17e6333764..5d30af0221fb 100644
> --- a/arch/alpha/include/asm/err_ev7.h
> +++ b/arch/alpha/include/asm/err_ev7.h
> @@ -147,17 +147,25 @@ struct ev7_pal_io_subpacket {
>   *        class PAL (14), type POWER_SUPPLY (14)
>   *        class PAL (14), type LAN (15)
>   *        class PAL (14), type HOT_PLUG (16)
> + *
> + * Cabinet, drawer, PE and sensor are the keys of the sensor's GCT packe=
t.
>   */
>  struct ev7_pal_environmental_subpacket {
>         u16 cabinet;
>         u16 drawer;
>         u16 reserved1[2];
> -       u8 module_type;
> -       u8 unit_id;             /* unit reporting condition */
> -       u8 reserved2;
> -       u8 condition;           /* condition reported       */
> +       u16 pe;
> +       u16 sensor;
> +       u16 reserved2;
> +       u16 state;              /* EV7_ENV_STATE_* */
>  };
>
> +#define EV7_ENV_STATE_OK       0
> +#define EV7_ENV_STATE_WARNING  1
> +#define EV7_ENV_STATE_FAULT    2
> +#define EV7_ENV_STATE_UNKNOWN  0xfffe
> +#define EV7_ENV_STATE_REMOVED  0xffff
> +
>  /*
>   * Convert environmental type to index
>   */
> diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marve=
l.c
> index c0c0ccefc467..9304ae74877d 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -21,6 +21,21 @@
>  #include "err_impl.h"
>  #include "proto.h"
>
> +#ifdef CONFIG_VERBOSE_MCHECK
> +static const char *
> +marvel_env_state(u16 state)
> +{
> +       switch (state) {
> +       case EV7_ENV_STATE_OK:          return "ok";
> +       case EV7_ENV_STATE_WARNING:     return "warning";
> +       case EV7_ENV_STATE_FAULT:       return "fault";
> +       case EV7_ENV_STATE_UNKNOWN:     return "unknown";
> +       case EV7_ENV_STATE_REMOVED:     return "removed";
> +       default:                        return "unrecognized";
> +       }
> +}
> +#endif /* CONFIG_VERBOSE_MCHECK */
> +
>  static void
>  marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
>  {
> @@ -50,17 +65,10 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_s=
ubpackets)
>                 if (!env)
>                         continue;
>
> -               printk("%s**%s event (cabinet %d, drawer %d)\n",
> -                      err_print_prefix,
> -                      ev_packets[i].name,
> -                      env->cabinet,
> -                      env->drawer);
> -               printk("%s   Module Type: 0x%x - Unit ID 0x%x - "
> -                      "Condition 0x%x\n",
> -                      err_print_prefix,
> -                      env->module_type,
> -                      env->unit_id,
> -                      env->condition);
> +               printk("%s**%s %s (cabinet %u, drawer %u, PE %u, sensor %=
u, state %#x)\n",
> +                      err_print_prefix, ev_packets[i].name,
> +                      marvel_env_state(env->state), env->cabinet,
> +                      env->drawer, env->pe, env->sensor, env->state);
>         }
>  #endif /* CONFIG_VERBOSE_MCHECK */
>  }
>
> --
> 2.56.1
>

Thanks, this builds on its own now with VERBOSE_MCHECK=3Dn.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
