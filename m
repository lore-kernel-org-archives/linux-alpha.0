Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913869;
	b=VQYNidUDSa3uRXGkBsysgpejkyU4d2hEmXLbDRnJk1kyB7+YfWvEMa2CYR2yQlfoAR+R
	 9yp6PCM7BlchsKclaIJrtMuKGT/fleeruMTcOD0XPMy60lgKGru2GZKvwiIkhWd7Ei5PA
	 +GRkjLicCgDC9eA0K+CtSQYCqfr7ijVSdgaovB5qyZg0wqdlsb6iQ51H3xwhD9852zVQU
	 lPk7M6bcJkBPN6XsfhKropz3/8KXJRVLOQwZsqmYMO4EI/P4haZ06gKcBcq4zx8qR4zXJ
	 YhK/FbV3Bse8twsDAjlQXrSOZoI9O4AkeyWAGi9TqTYhS2mfL60647zwo1BzBSNpIfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y3ENa1F0d9y28UWOmP0+YontQj5ZAWu0uOKB/L//CbQ=;
	b=khPyAmhQYwbCn+lnuNSZIaZFODYw52UCqSeC8sVPFWv7hKoQz+f/PKpvwOTSjnTE0r9k
	 TsMLU38+SSZkVRr6eyu/nRqmHxrvmbyb9KQVMfEwQNGwdkCyDwkmrenjDz7wipkoloanv
	 ehQwihIcpl8yMjnfSPQFKq8w/utGGVpeoOduO/V3uosdmlkPaSPpciOI89FVXKZhp68oK
	 guO92uoZYSgCqqna0kyKwn7+VfcV5l4xPa0+19FYTutTzQm0OozNI7EEsBqLGrj0lUNmM
	 AQYSzRSNDvaoO1FnZFwpD0BJj3MS8zZvKtjq5OEHSKUW+W3BdNmk7QKZSZXVZdanrPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moIxETzH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141F9606A32A
	for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 11:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 141F9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moIxETzH
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so5504336a12.0
        for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 03:11:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794913867; cv=none;
        d=google.com; s=arc-20260327;
        b=mEBinqiToja2P+Uz0Deh6ceYApu37jfQloMSfc8tidEn6Q4GtucQ3KOj+gwepSMWRZ
         sUniCiqT7azsJGweapxPsmu6NhS9U+rtz1g13cayEO2OSyvjcaW0uDEPSje9bKOvFbFH
         9zt2uSve8b6r7epYoEvoLeQ126sCc0fdp0YwJs0VJT9NCsoIZkjFCfwohraF3/T2MXsC
         IWuUR7+OeOX44u0F1pq31SizQhhMNnjXAhFVeE1DAUfGRlhhoyqyhMO4+utm94IVsvtq
         vtc5eHrasXIF1DKQhADdaj2DrKPwMf1LURPHsJuJ2yWYMNzPeyOVq+GA4ClJyuJwQAw5
         /bDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y3ENa1F0d9y28UWOmP0+YontQj5ZAWu0uOKB/L//CbQ=;
        fh=zHAKPh4U9ZediOQyCTDaxNXum3ODkWms9WP8/KhrCEI=;
        b=ebFAfO9eQF7cqu8rQsq75vlB3bcNbJy68ruUAFACde+Ghb8SDo/b1jUgA73cFcWi+w
         RvCfFlnHYUgoE8UN/w2Wi6p4SgOp7QRDEMufYVj3u78KqXzybQj4gI/hioAYt3sJVWBa
         449yJxO481cjygwl6m/Rki7+FbS19JZxBAT0IzOq4+IYUbaYhMuQFFlZWszUkuY+z7es
         YQwj0s1ZqAkKpmZ5HkpOP17dL45y+nNXOBCOyb3UDukcJNjm/H4upa7qLgtg78Hdts6u
         o4Fi1VmXOqGsAEpKlrjES9S8vTygxyRk/wINlMDV9na4dQQBPS1T6kaeo2vZNIuGQk3y
         JUGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913867; x=1795518667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y3ENa1F0d9y28UWOmP0+YontQj5ZAWu0uOKB/L//CbQ=;
        b=moIxETzHa0Oq01n7L4mzCWZwm33Qlqm57PUEdjACdCaFiZo0ueGyZTZaC/wKy5SOMK
         oXI0FM9+gSkDnkpXkD6q1VLY/HTVf4Z4buQ9pQMLMXvVB7vUyLnBFQbzotk6yVCr4iC5
         PfqYo4e11phlxLS+s6bPmjvyYm9H2cEjqvYUpvv60l+cCAz4oo31FFdQZuofiiHnUXk4
         9ZwUdgDAc0puWw+LIme2GDkOcXdRnvM/sLPo6bULbEvwYYc0NSjyfWsLmydzKblH1JO7
         hX9DD6A2nVioNZfFT60yg7Q397SzaWnpnFkWdV/ovcu7DMmLQhPK+iKjZG6jsXS5WS9s
         vP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913867; x=1795518667;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3ENa1F0d9y28UWOmP0+YontQj5ZAWu0uOKB/L//CbQ=;
        b=nCK/GCHWK7NKbK9Uz3+LBzloqcXkwkN/i4glMg+u23kyivI9J9I9TXGySYdPR+D31y
         RqgpcMR/0MpFc7Jd6G3Z1AHHCrPDfcOErz5Mj8DKyr/k6lSY3q/fbPgu4LKoJYjfY1t2
         2SC6w1Gs1cSJ2sblKP4P2bZdnyg7/wHZoNVakNJQFSaqseuaV9EXpCGT0wpMFevFfed+
         CzEOYCCG4GQ+VmPxDJ7Dh2pFoiXD8p7EJQt1s+Q3NB67Au6UtM2XYbPfmgky74ENNzK7
         c4phfAT5WHgMnUdtZPPwQIJSaCP5J1MDurJBq5BlzX5cQHP1T+RWckXcFJq8jdFf8G9D
         Rw5Q==
X-Forwarded-Encrypted: i=1; AL+hErFJwrApKS+1Q5E/CBln2+QsEs5bCpY+VHIxtl168uEr8UG50bwjGEJ9JSR8GYFKE4FB6i86lgoT+mH6rg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ETUCVsM0tzDVleDryShGBxtP1AMN6Qlr6i324PFiGWLnBuQNe
	Kzx+mX6JlwxdWTc1GzAtz248y02sMbzeq1XW+RQyv45v8VZRgGUYhJMv/tGVP8lULuwCUXYgUUp
	25ZlmoGP35WCzTKTntM1ujsg1flwVM9U=
X-Gm-Gg: AYBFou2hxCsDCdPD14Rqvt3ejqWBonZwtasibJ5hdwujTsNNsfN7xBWdRPjPuqnqeuQ
	m5WvKgZNHVaPZdOyJzu3RAol3XIir+VoDs4meJhtls6zXyLkaHr72K2vXODU2ceqrwAHDtLKANQ
	hyfU6K7F5wZrJ9oMm0xazq0MvWPIrhUVCqSFF3mrAbVNjttF0rK6MxiR0a4MMgVvzCaffkuP/X3
	SN9w+0cOQIWub0+oSg4B3QUr+JuTd22i9AFlv4WKwN7j9+2Y+XpwiXgQeLyumquqZCr+KlM+Q3e
	A6l5fREhL8IoQgHcivhtRPgrul9DZYXlYU6DQ/13zFEOjhGipZQ5gsXEtWSayVs0TYHTcS9Ousb
	5bv90DgMsZT1Wd+pURrtW0MSx5+nhIFqoYvZ5jQ4asTsFzN0piQ0E0IMBUGEUomyIRXs/73RrBM
	xK3tAwbf1g+ZR8VPjUIsyGcUI=
X-Received: by 2002:a05:6402:c711:10b0:6b7:8b36:93f1 with SMTP id
 4fb4d7f45d1cf-6b7c098803fmr6702619a12.10.1794913866951; Tue, 17 Nov 2026
 03:11:06 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-4-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-4-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:10:54 +0100
X-Gm-Features: AclHuK-uU12m5JYQTGHnnby9FLfe8TB5m1Dddww0eP2k7bEnEFbxsuNSOldafTc
Message-ID: <CA+=Fv5S9+y3vuSpFd2MHFEAFOwa3Q_8gqPV=yei-ej0Zo-V-9A@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] alpha: marvel: notify environmental events
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
> A change in the state of a sensor arrives as a system event logout
> frame. Call an atomic notifier chain on each one, so that a sensor
> driver can reread its sensors and tell userspace without polling.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/marvel_env.h | 5 +++++
>  arch/alpha/kernel/err_marvel.c      | 9 ++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/include/asm/marvel_env.h b/arch/alpha/include/asm=
/marvel_env.h
> index 16ccd2002a11..dbbf827a18ad 100644
> --- a/arch/alpha/include/asm/marvel_env.h
> +++ b/arch/alpha/include/asm/marvel_env.h
> @@ -2,6 +2,8 @@
>  #ifndef __ALPHA_MARVEL_ENV_H
>  #define __ALPHA_MARVEL_ENV_H
>
> +#include <linux/notifier.h>
> +
>  /*
>   * Ask the console to refresh the environmental readings of the GCT node=
 at
>   * @offset from the start of the GCT. Returns the console status, which =
is 1
> @@ -9,4 +11,7 @@
>   */
>  long marvel_cfgtree_partial_update(unsigned long offset);
>Reviewed-by: Magnus Lindholm <linmag7@gmail.com>Reviewed-by: Magnus Lindho=
lm <linmag7@gmail.com>
> +/* Called from machine check context on each environmental system event.=
 */
> +extern struct atomic_notifier_head marvel_env_notifier;
> +
>  #endif /* __ALPHA_MARVEL_ENV_H */
> diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marve=
l.c
> index 46c521cea9a0..6e0b0aabdaca 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -17,10 +17,14 @@
>  #include <asm/smp.h>
>  #include <asm/err_common.h>
>  #include <asm/err_ev7.h>
> +#include <asm/marvel_env.h>
>
>  #include "err_impl.h"
>  #include "proto.h"
>
> +ATOMIC_NOTIFIER_HEAD(marvel_env_notifier);
> +EXPORT_SYMBOL_GPL(marvel_env_notifier);
> +
>  static const char *
>  marvel_env_state(u16 state)
>  {
> @@ -82,8 +86,11 @@ marvel_process_680_frame(struct ev7_lf_subpackets *lf_=
subpackets, int print)
>                         status =3D MCHK_DISPOSITION_REPORT;
>         }
>
> -       if (print)
> +       /* The frame is processed twice; notify on the printing pass only=
. */
> +       if (print) {
>                 marvel_print_680_frame(lf_subpackets);
> +               atomic_notifier_call_chain(&marvel_env_notifier, 0, NULL)=
;
> +       }
>
>         return status;
>  }
>
> --
> 2.56.1
>

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
