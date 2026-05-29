Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44D6333730
	for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049832; cv=pass; b=jG5EHX2cGJq0uOdUdAP6bOq08w2butTO5DcZRomsX5fDz2gf+3ea7mbWatNUJiz9BXFnCL/ttVV/rQ6PlfWhAbpJ2fLPu7Qk/rCj1NmlhNvxKa9vIDwfych0jq5CrFGZ65Ed5poSrP/Tp9ikHT5k2m+/7R+Yasxh+buH9gfOsx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049832; c=relaxed/simple;
	bh=oN19ZOQuE7WVi9huNyO9ICvw7+sfGs4Qu+L+afX5JN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tu9E6jpHYwGkFPNi56cfnfyNOfnL/fun/eSTJL9EWjXsprYRPkF8GZ2q0fmpY3ElWT0E1VnIs+a+afLZI27LJg3WTDCWMmsWps0pQEQY3KLD2k7iWNZe+CVroFs4aMGpPdn+/RSrsUCtjUasqfGS/S6L4mWAF79hPOxVQCP1GHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYVRzuet; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYVRzuet"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bcda7765d64so2563735566b.1
        for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 03:17:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780049829; cv=none;
        d=google.com; s=arc-20240605;
        b=k4YcNi38wZ3xEY+MR0njynfm30KgC67gQKiZCeYTM/2AyxfRaNc0Fy0lVTTt/l6j0g
         KWsfHP0HB5euvVJDXT26nEx88DTix6mJn4rFZfWf+a+ewKHd5qpAeygxFaZSQLtEjRAC
         DOoX9hOvgin7Wak2g+13RkR8jYlgBrlIyN1LsO/SUJ+m9iC8nCTBoGTdiEZTQckt740A
         h1jx/e4q30dTM6RMDHgTYGCVA4pu7VdU99NwFY0v/5vGIMDTh1MrA650g6n+J5VjOTS2
         IY8e0glENJsy6aL+HZdXeTQE556akDfG7++1SDE5CBpQZP0sZy8oGo1TKjQEODP6dZPN
         vyWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1iJ9dA03FdMF2EGmhu6kHfMDm4N03M3/64bl9s5U4dc=;
        fh=m1HGRrfGcZCQqHaFuLpjylZmMzhWVyx4UY9niiytw8M=;
        b=dI1/ply1Hy4j7ni2jDtSFvgpR/uXaXx0fQMNHaewLuaHbvLNNGU5QwllqEjxUd4ENJ
         AHCdiR5Lb9EU6fdxXc5z/wcKePaWfEokOmc3jwVI/YtXczc+eE5K/ifpxYPsIViMAfzE
         doPTgNrocCw7tiC6YGFRr93zu77Gs/2qgrk89/ZaGTvOSGEL/KJtSt4811PrmBdRXhAC
         bFWLe6UMKGls1lsDssvEvu9JR1tlChGfCN7rnEz5Pr9axf3FqnZamJdlNWs9MYK/GSUt
         9SX127YLwRoDwfi41u3chSRn8Oxvu9Er3d0atcu2CPbEJZDre0i96hb4PflmLfA77Ecq
         wIfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049829; x=1780654629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iJ9dA03FdMF2EGmhu6kHfMDm4N03M3/64bl9s5U4dc=;
        b=gYVRzuetgJTRBTT4BIY4OuvwCg7HU0TiWWqQ+6NyxMk/YN5fn40BPkzrd8d0Jrign4
         9suKRT6RSbawQ3kR0xPBQJ0Fo9fYA09EkQNGbR4gtg4NrD69WJzYJRuKHrbcdN3KCa8r
         +55IxtYvx2a3j56UPnMzhThh36fczX4xZJ9cGvGrRcU9E7yyTCrKopr67s+nhC9/88X6
         gf2PWk+9wSOEcCq/88H/CV0eI6FAcY4tMsc6GNgpEeaOCWqaNclJTUUtpWHaqhQwh+7o
         pnDURzrkJArquxDZ9w+EoAzOm08pXx8Xk8OHX1vBohY4bgCij9CENlHatI0IA1c2EKbn
         K7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049829; x=1780654629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1iJ9dA03FdMF2EGmhu6kHfMDm4N03M3/64bl9s5U4dc=;
        b=BRpl/qnf69XJh7nJZpWXbn9qsd971Uj+OZuCRgqBE6jGlGRuLAg+ItjjZWbfVNIk+/
         0TBZ4vTbmRKiaRbTXISZT0Rq9vCTMLx9XWwSjvQWF7Ssrd1HU9VNZyx2oOTc+R9RVeCy
         U0yarUbwFh8B+Q5ymTZstWEDvhJLmkp5xsuIUsUokfIEq32kFIoAfJsU68oPXTtm8GFm
         e72ptTGcOAdR/DUzYbibPK1V+sLU2iL9WDm1E44nln6pRmh3X87j7bi4HeWQUxjNVKsN
         NSPSoruyj4dgVVxUeE6mEs6eh9ZYAYUI9GGTAvZzGiyyuNDnwCD4GDY+euvqfqHAGoEo
         nwUg==
X-Gm-Message-State: AOJu0YyQNAAbXu8LDH7XE/by28JOh1h3CqHH7KdvPxlKirfoTLN3b7O5
	Koa08NdH+pusfGSocA7Kqi26U6oTOlm6HGRwOQn54l7qMMEENjyG/yMJtmx7K4W+GsE7jyE/Tgx
	hhVGIxdTKuqMx5zT1vYRtwqOQi6flxzk=
X-Gm-Gg: Acq92OHmOIb85KBSfEhaNwFINQGMDquMXG2uVo8VdwconbYRUKeQUfK5KtrTHbL9H03
	6YypCutUqrf6jZgcpx4AV/A4V4q6OcF08Dh4Ll+6NTKyA0iroJLUGMbQsy6pCHUzbfBKhZyyeld
	fLbXTcChUg9MU7Ix3fmszXHKCwAgcZTP5nCTJ1zr92XRjNqZ+/siQMsD+FQSondnzdJ17d71zTs
	6XlsKeL9CfeKbBB0CxpBAKPZur+/gMcRX1/GoEtjnqY60SqcnVPTct3B2ZVr3qs/Cs5VWS4moZj
	bQ7RgCxP9UrlWonlAr90XN7WHlBksbF2UrkUyIJQXS7Z6srYeYX4vUciHjzn+Q==
X-Received: by 2002:a17:906:fe07:b0:bdb:5c26:d499 with SMTP id
 a640c23a62f3a-be9a7fa80a6mr127001566b.22.1780049829213; Fri, 29 May 2026
 03:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528230516.1839694-1-mattst88@gmail.com> <20260528230516.1839694-2-mattst88@gmail.com>
In-Reply-To: <20260528230516.1839694-2-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 29 May 2026 12:16:56 +0200
X-Gm-Features: AVHnY4ImbLCMtDpPYGgCG8ujxIMUAyT9qcsj2ridFJBYG__Iuv1d0L9ULK_fPaY
Message-ID: <CA+=Fv5SisLyZRfemTxeTnXoh6-uRvVOsv5r3A=mcCjuvGzWfcQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] alpha: marvel: Fix lock ordering in init_io7_irqs()
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, Thomas Gleixner <tglx@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 1:05=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Move irq_set_chip_and_handler() and irq_set_status_flags() calls
> outside the io7->irq_lock raw spinlock.  These functions take
> sparse_irq_lock, which is a mutex, and taking a sleeping lock while
> holding a raw spinlock is invalid.  The raw spinlock only needs to
> protect the hardware CSR accesses.
>
> This fixes the following lockdep splat during boot:
>
>   [ BUG: Invalid wait context ]
>   swapper/0/0 is trying to lock:
>   sparse_irq_lock{....}-{4:4}, at: irq_mark_irq
>   other info that might help us debug this:
>   context-{5:5}
>   1 lock held by swapper/0/0:
>    #0: &io7->irq_lock{....}-{2:2}, at: init_io7_irqs.constprop.0
>
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/sys_marvel.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git ./arch/alpha/kernel/sys_marvel.c ./arch/alpha/kernel/sys_marve=
l.c
> index bebeea3c286d..a37707e05e34 100644
> --- ./arch/alpha/kernel/sys_marvel.c
> +++ ./arch/alpha/kernel/sys_marvel.c
> @@ -263,6 +263,18 @@ init_io7_irqs(struct io7 *io7,
>          */
>         printk("  Interrupts reported to CPU at PE %u\n", boot_cpuid);
>
> +       /* Set up the lsi irqs.  */
> +       for (i =3D 0; i < 128; ++i) {
> +               irq_set_chip_and_handler(base + i, lsi_ops, handle_level_=
irq);
> +               irq_set_status_flags(base + i, IRQ_LEVEL);
> +       }
> +
> +       /* Set up the msi irqs.  */
> +       for (i =3D 128; i < (128 + 512); ++i) {
> +               irq_set_chip_and_handler(base + i, msi_ops, handle_level_=
irq);
> +               irq_set_status_flags(base + i, IRQ_LEVEL);
> +       }
> +
>         raw_spin_lock(&io7->irq_lock);
>
>         /* set up the error irqs */
> @@ -272,12 +284,6 @@ init_io7_irqs(struct io7 *io7,
>         io7_redirect_irq(io7, &io7->csrs->STV_CTL.csr, boot_cpuid);
>         io7_redirect_irq(io7, &io7->csrs->HEI_CTL.csr, boot_cpuid);
>
> -       /* Set up the lsi irqs.  */
> -       for (i =3D 0; i < 128; ++i) {
> -               irq_set_chip_and_handler(base + i, lsi_ops, handle_level_=
irq);
> -               irq_set_status_flags(base + i, IRQ_LEVEL);
> -       }
> -
>         /* Disable the implemented irqs in hardware.  */
>         for (i =3D 0; i < 0x60; ++i)
>                 init_one_io7_lsi(io7, i, boot_cpuid);
> @@ -285,13 +291,6 @@ init_io7_irqs(struct io7 *io7,
>         init_one_io7_lsi(io7, 0x74, boot_cpuid);
>         init_one_io7_lsi(io7, 0x75, boot_cpuid);
>
> -
> -       /* Set up the msi irqs.  */
> -       for (i =3D 128; i < (128 + 512); ++i) {
> -               irq_set_chip_and_handler(base + i, msi_ops, handle_level_=
irq);
> -               irq_set_status_flags(base + i, IRQ_LEVEL);
> -       }
> -
>         for (i =3D 0; i < 16; ++i)
>                 init_one_io7_msi(io7, i, boot_cpuid);
>
> --
> 2.53.0
>

With the preceding irq_set_status_flags(base + i, ...) fix applied, this
looks correct to me. The generic IRQ descriptor setup is moved outside
io7->irq_lock, while the raw spinlock still protects the IO7 hardware CSR
accesses. That matches the lockdep report and avoids taking sparse_irq_lock
from raw-spinlock context.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
