Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA91F39A7F6
	for <linux-alpha@vger.kernel.org>; Sat, 17 Oct 2026 22:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792276856; cv=pass; b=OXARxCvc0dufIWIBjPGOI+eBQ3ORqebY+T7j8vonFybXyFiTfJQMmIwUTWYgY0LTnZXZU8RA14gnD1dh11WvQxbGTLUUyzuc/45xw6SW744oFrfx3E9a/s+RNlKNnzUdJNcmKpFIFwV998OMJl4V9QX7oylWfSP8bjh3kPEqVeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792276856; c=relaxed/simple;
	bh=oRIP8pPJqh7IzUGPPWhIsDDwt7q2HNrL8WwBT8sPcSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTic08oTw7aua+gh6Fqn+efExEa920TWMBK4OyY2B2oN/B993FobKNoo3W1nVCoOueWc/WZ6Hx5QR+1O6DQayUz4rpB60TLPOS1RandFoUoVVC9fT1nKeldNQ3M/J3e1gcA8fCe4eR3v7r2j2wLQvGoDij1986tSe6XznBfyzOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRvY+Iib; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRvY+Iib"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so1713754a12.1
        for <linux-alpha@vger.kernel.org>; Sat, 17 Oct 2026 15:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792276852; cv=none;
        d=google.com; s=arc-20260327;
        b=H+nHYk3dCfRQWUsx5On9NH+YWx/IAFKN+9t2n3Rq4CFeNTtB/+3q71/mP4RmyyXz6H
         9xofoExlr3nbWXq455IS1hdlGug+rcCaH86vQROWWYXCOzhMcqgsyFh/w/crbk9gm2R1
         f+zUicFZgVMtZyco6k1axXgoI8JHKy0HYbOhr57487D9K/Nn4rrFKX9G6hbIEwAPutuL
         W141yPlSecj1+1NV6aNoAXzf/WsUNhfUqEA15J6DJHc/HkfDVZ+ncruUYyTccyg6UtNi
         oA6wPmWexl8/LmSXjucx6mmaqNMnrZooMuXI7pdBHmYQSJ4LjdAfsYzjV6KWtel+H5x4
         Mvbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BqaWKmhEIx/MyBH36dUoBxkHOV46oHXgijHsAslfTAQ=;
        fh=eaUmn+PmDOkQPvqoMe47InwG945Ca0s8s2tCRhukOxE=;
        b=TaZBRlbsN6WB4mXYwc6glwk3Cx+ZelFM4zqvQVQY0LCZdsvoFYamc6a6f0a8qeEZY6
         1ZzP2vpgtNvXzZ7+ebXUt3GwnHGH8/7lCaFttaPBCu5ySVGMQ315tFuCK/S0lISBv9/l
         FwyOe1JIEK92lsUgHuI7kzDF5AtgUI8A8OyALZMZCFp41TUFlrt1rgfy8tF4YJOFdOgN
         ydUYFBDjDO0/mHYxFKAQ3SsqpzUcZe2HXa7eqRG8EV7FiogzCscPkWc4iHqfNE5hhmTN
         CjM1SO/QSjR5ACFhUBs7IL6TD1b4xLfJT+OqGmYXWVEoJmd0hNcND2a2nHTuHnhc3y++
         UccA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792276852; x=1792881652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BqaWKmhEIx/MyBH36dUoBxkHOV46oHXgijHsAslfTAQ=;
        b=SRvY+IibDLnkdVsAawwcDnYrSdUJFGpKmIKMyqNVZhdjr39u6LWwo1Uh9pmiZRGBWk
         kyOR2w2O4pGXqvQ5lb2AsmgDod7jylVK0DGUhyL7/cpIggwainTklmXazZ1y4wK5Iqy4
         Q6XE7h7FcpQby9NH2tLFvgr67UX1xtZgX0HmpEsSszzyn/doYhbNY3PqlgOAC0y6OWEO
         dJRxbIv6LsanGtfglPqmYQ3Wkyyd0gcxWAD6y0k6iW8sX3+u+i+m4ebWNCuE2FHIpQ45
         cAg3uCTtpR+QQ8jC92HdzhAjPi5zcDnabVgAySIm3w22ne4yMrkofVbMs7dZsDzcGsh1
         uHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792276852; x=1792881652;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BqaWKmhEIx/MyBH36dUoBxkHOV46oHXgijHsAslfTAQ=;
        b=maifWVqYGCnaPB/wp57307C7+m5Zhj6MpZrCtgujINRJMn3p/OTrV+kNzSlTU5OxlS
         3lhg560uS0Eqqi4DGfCIEQCB2e8+3Cdgps4BLuR6oXjTwR3Nqpear8Am505TgCdZGqMK
         YVkm0oOgWdXlz//ptmpAZCZUnFvohs9PdfhvRx/7mIe69/Qf7BgE72G5OGroAqhCYUWT
         5m7X0QCIjX6JJ5ySa3GoeP2jPk4LFh+HNisqCTxuh/Vs26GtTyBfcI4iE2VdRlv5x5QZ
         dV5TGCWWOVYlqUusRd2a3MPsTK7dthWdysIO8JVdetdX7c+hx4mWRUlC814XQAT07/rX
         KX0g==
X-Gm-Message-State: AFq9FYLOhI5lLiIoXqr5H0iaPYIx0S+Z6ExkUheGYG8OiYAUS1uI64B1
	hRS02/7ZOxTFqrXN/jWui51dhbj9kwTmsL9EUg8uEFv/UqdcqrtdClZhrt2EflgZVcmDUqEaBFJ
	EgwqYOTmi+D9NcxKTjQopn+XDhUS50No=
X-Gm-Gg: AYBFou26tZvB9IUeJVIqhcB/mXgjsjpzES7qzYte5qJcyshGtE+gHEm+YsuYCghM5b6
	0YkEYSfemjXMmRoSr54xpzePdw05I8NRqejKnZ5A8waJbcILc4ahlbjpZXMmKRlKgWA63Vpkife
	h3ULH47o0W3JIm3vdGJMcFZpHjoZ92TpxGvUXSgh7v2T+xjrE9OXImgE6lO/Xy7IbXQPezsfJr9
	c24Kn4N4RplYMzeC9oTGO5nQnX5zl5yGQwjv8uPkqqosV7Ca556MJ1ZNKbEe2G45GRqTTGPrFDO
	uGSXspGKKD1WnnHQ2aYkB4HaoLnQcDK9mIXitlC8h2DXnxNlUlCdnl0O9CP378ubon+KjzJRfCi
	ztDqkIflyJ2Ys/HJoTE96eiyzOQGm01QyNmqUN9ah+lRGpzn6U7cF
X-Received: by 2002:a05:6402:a516:20b0:6ac:afa2:ca25 with SMTP id
 4fb4d7f45d1cf-6b3a80d48bcmr1363508a12.6.1792276851798; Sat, 17 Oct 2026
 15:40:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017174007.695344-1-mattst88@gmail.com>
In-Reply-To: <20261017174007.695344-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 18 Oct 2026 00:40:39 +0200
X-Gm-Features: AclHuK_Ih8NRcUeHiVy08vs1YO2xbvPGDzEkZWbDiQ8EM38w8BlDbwAuz0bVzYc
Message-ID: <CA+=Fv5R2vixMYF4-ksiFYjS00Se1f51MW0uoSNtge4XMcoS5pw@mail.gmail.com>
Subject: Re: [PATCH v3] alpha: select ARCH_SUPPORTS_INT128
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Oct 17, 2026 at 7:40=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> gcc supports __int128 on Alpha, and the 64x64 to 128-bit multiply that
> the users in the scheduler and in lib/ care about maps onto mulq/umulh
> rather than an out-of-line libgcc helper.
>
> Variable 128-bit shifts are another matter. gcc open-codes them when
> optimizing for speed, but with CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy it calls t=
he
> libgcc routines __ashlti3, __ashrti3 and __lshrti3 instead. The kernel
> does not link against libgcc, so provide the three helpers in C, as s390
> does, and export them for modules. They are built into the kernel proper
> rather than lib.a so the exports are present even when nothing built in
> references them. Like the s390 versions they are marked noinstr, since
> the compiler may emit calls to them from noinstr code.
>
> Gate the select on CC_HAS_INT128 as the other 64-bit architectures do.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> v3:
> - Fold in "alpha: add 128-bit shift helpers" so the select never lands
>   without the libgcc shift routines that -Os builds need
>   (https://lore.kernel.org/r/20261010022039.1610210-1-mattst88@gmail.com,
>   reported at https://lore.kernel.org/oe-kbuild-all/202610090831.DSxrGQRc=
-lkp@intel.com/)
> - Mark the helpers noinstr, as s390 does
> - Drop Magnus's Reviewed-by and Tested-by given the new code
>
>  arch/alpha/Kconfig                      |  1 +
>  arch/alpha/include/asm/asm-prototypes.h |  6 +++
>  arch/alpha/lib/Makefile                 |  2 +
>  arch/alpha/lib/tishift.c                | 70 +++++++++++++++++++++++++
>  4 files changed, 79 insertions(+)
>  create mode 100644 arch/alpha/lib/tishift.c
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 2672971b83f3..bed3f1c8d9d2 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -16,6 +16,7 @@ config ALPHA
>         select ARCH_NO_PREEMPT
>         select ARCH_NO_SG_CHAIN
>         select ARCH_SUPPORTS_ATOMIC_RMW
> +       select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>         select ARCH_USE_CMPXCHG_LOCKREF
>         select FORCE_PCI
>         select PCI_DOMAINS if PCI
> diff --git a/arch/alpha/include/asm/asm-prototypes.h b/arch/alpha/include=
/asm/asm-prototypes.h
> index c8ae46fc2e74..672fea15032f 100644
> --- a/arch/alpha/include/asm/asm-prototypes.h
> +++ b/arch/alpha/include/asm/asm-prototypes.h
> @@ -17,3 +17,9 @@ extern void __remlu(void);
>  extern void __divqu(void);
>  extern void __remqu(void);
>  extern unsigned long __udiv_qrnnd(unsigned long *, unsigned long, unsign=
ed long , unsigned long);
> +
> +#ifdef CONFIG_ARCH_SUPPORTS_INT128
> +extern __int128_t __ashlti3(__int128_t a, int shift);
> +extern __int128_t __ashrti3(__int128_t a, int shift);
> +extern __int128_t __lshrti3(__int128_t a, int shift);
> +#endif
> diff --git a/arch/alpha/lib/Makefile b/arch/alpha/lib/Makefile
> index 84046e730e6d..f77d4a46f2e6 100644
> --- a/arch/alpha/lib/Makefile
> +++ b/arch/alpha/lib/Makefile
> @@ -35,6 +35,8 @@ lib-y =3D       __divqu.o __remqu.o __divlu.o __remlu.o=
 \
>         callback_srm.o srm_puts.o srm_printk.o \
>         fls.o
>
> +obj-$(CONFIG_ARCH_SUPPORTS_INT128) +=3D tishift.o
> +
>  # The division routines are built from single source, with different def=
ines.
>  AFLAGS___divqu.o =3D -DDIV
>  AFLAGS___remqu.o =3D       -DREM
> diff --git a/arch/alpha/lib/tishift.c b/arch/alpha/lib/tishift.c
> new file mode 100644
> index 000000000000..8319907d8150
> --- /dev/null
> +++ b/arch/alpha/lib/tishift.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * 128-bit shift helpers.
> + *
> + * gcc open-codes a variable 128-bit shift when optimizing for speed, bu=
t
> + * calls these libgcc routines when optimizing for size.
> + */
> +
> +#include <linux/export.h>
> +#include <linux/types.h>
> +#include <asm/asm-prototypes.h>
> +
> +union ti {
> +       __int128_t val;
> +       struct {
> +               u64 low;
> +               u64 high;
> +       };
> +};
> +
> +noinstr __int128_t __ashlti3(__int128_t a, int shift)
> +{
> +       union ti ti =3D { .val =3D a };
> +
> +       if (!shift)
> +               return ti.val;
> +       if (shift < 64) {
> +               ti.high =3D (ti.high << shift) | (ti.low >> (64 - shift))=
;
> +               ti.low <<=3D shift;
> +       } else {
> +               ti.high =3D ti.low << (shift - 64);
> +               ti.low =3D 0;
> +       }
> +       return ti.val;
> +}
> +EXPORT_SYMBOL(__ashlti3);
> +
> +noinstr __int128_t __ashrti3(__int128_t a, int shift)
> +{
> +       union ti ti =3D { .val =3D a };
> +
> +       if (!shift)
> +               return ti.val;
> +       if (shift < 64) {
> +               ti.low =3D (ti.low >> shift) | (ti.high << (64 - shift));
> +               ti.high =3D (s64)ti.high >> shift;
> +       } else {
> +               ti.low =3D (s64)ti.high >> (shift - 64);
> +               ti.high =3D (s64)ti.high >> 63;
> +       }
> +       return ti.val;
> +}
> +EXPORT_SYMBOL(__ashrti3);
> +
> +noinstr __int128_t __lshrti3(__int128_t a, int shift)
> +{
> +       union ti ti =3D { .val =3D a };
> +
> +       if (!shift)
> +               return ti.val;
> +       if (shift < 64) {
> +               ti.low =3D (ti.low >> shift) | (ti.high << (64 - shift));
> +               ti.high >>=3D shift;
> +       } else {
> +               ti.low =3D ti.high >> (shift - 64);
> +               ti.high =3D 0;
> +       }
> +       return ti.val;
> +}
> +EXPORT_SYMBOL(__lshrti3);
> --
> 2.55.0
>

Tested v3 on my ES40: all 3,369,984 shift checks and 168 mul/div
tests passed, including compiler-generated -Os helper calls.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
