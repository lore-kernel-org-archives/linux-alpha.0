Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB76309EE9
	for <linux-alpha@vger.kernel.org>; Fri, 10 Apr 2026 18:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775847522; cv=pass; b=pM6jyb0tgpThXa/VDdWFuqUArSk7CTocUT4WOWPGFiij7VJNE0NPY6P4P67zk4Uypf3Oug+GZxEFMsw0XM1Up1gpl3DwaClhS97h4CwRUe3YG56mDTyxpsWJeWGRTiIXvpQaQxsfatCB94Ee2gmjzhvf0Wu9yJSOL6skKWYjwmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775847522; c=relaxed/simple;
	bh=ijI6AlLzo525Eq2KVYLIBtapdzgY/kmkB7fhadpcpmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVoYppPWgBB8Bshww/lQ03Imn9yi2hyX0c8UHBtbvxKgpO2MUVlyiZgVL0tk3xPdXx6uohyxwgBfQ7tiJHODBJO8zWqX7W1k7XxaHnYra3OtxEdQfmZiAjYKH4lT1jg+ucMoTDfPnLlGIF0e2jnNRqfoer+Cb3DviIi03J0ROnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgiCgszm; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgiCgszm"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9c9d03524cso270503966b.3
        for <linux-alpha@vger.kernel.org>; Fri, 10 Apr 2026 11:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775847519; cv=none;
        d=google.com; s=arc-20240605;
        b=Hlpg2VoXB9C+5R1HXeQVknygUufyz8IDaLfoPyxPlM9VdeitB1UL1mSQDoE7sh3WPA
         1/zhwxmQ+nn2NKsgHcnWitq0ikLhyiMzT7FXCR/pBjk7FOWGGYD09nJhBQzwAiRslaZ/
         t0RRnfQDeUgPhOY+TaOKHlX5UiZtrXv9GpF3ONKLmJmKUdZWi9uumf9Xt7KtXR0itXuf
         k10JrhkFTf1Rd1gOtdADS7HmVAvmS/3ZCgWDtlM0D4vNwp+/5Kk9dduKX59at01Oyet8
         sTQ994W5Qdnbf9Z8lr6z7XpkWUTlbiR9dVX5UENeri8GxJBjggBt5hND/UaqFclnk38H
         vDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hH+pO3eHo0S6dlEQtVDlGDQE0LbU5mOP39pHXwxI4qo=;
        fh=ViAatGiZ05dh3a394EUid4cQpUnAI/U35CAucij+cuk=;
        b=Puszy7bGKgObNj5FN3bg8XWFZzHprFzkuN0b4pLr/Pj/rv/ywNEUknrWksAqna7ou9
         2pqjrCEBmfgdlN/lWmx0SqMUhccwok6soXhVemc1iqySZdIZfcXIxkMINLQm6fMGPEe8
         V9fF5nz6YYXwlKHiGUIoydiYkWGWvDwwNsUqh5jOWg/+SWPeM0iVBNjzAAeWAzm4H6Kn
         0ODxwej7HV4t4ND7XkQBiBnZ8BqnGOo3+KUZPAnQZ9ZcqS5a2ENe5yxHD2vbBUYyH5zj
         do3ivZfK+DkEx5V8prkZkyTHkbzWp87rsBAA1mm27TS3mfT7UJr7kgAayVENszrW3fse
         gd5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775847519; x=1776452319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hH+pO3eHo0S6dlEQtVDlGDQE0LbU5mOP39pHXwxI4qo=;
        b=GgiCgszmx0FxffmF3JrjeSDH+XaoYUMWgFM/rebJKffbFWFTTROG8jrOmkAIK0LxgY
         xiyeOZrSs/CfbnhQ3ibpD6b7ButwpPy/mSLfscryMT9am1BtDcuN4u3dgrm6TDqLsrWl
         Jb2YYU+D88ll3VSRYTZQHybQ1aWaCVtKdfHVZ9MicOQuyotl3bX7iQkPciMZOV4nHdSA
         /sUhn1/oiIJCau1Y+ilg5XF95U2EYVvUHwYHh24hunKwwhLg7xkbtqUtLQ29vI98/F3d
         ZQgyQYD+e/fyQ0GAbMK0T8U6XSxeUAhXkMcIT/mAveyta68lON65A1D60puhh0HgDLxl
         cbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775847519; x=1776452319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hH+pO3eHo0S6dlEQtVDlGDQE0LbU5mOP39pHXwxI4qo=;
        b=KvA1g9U2gXK6nu3y9pbIuoUvvprJesX6SsIaZCHwrjqQ83gLA2x61o2fyPtvgeD5rx
         zRFxgWgmj370ypmpkJkndPdSmpCuoMCvAYLAto1wzZuePsAXYiXGYTzrOwsn+XcVSd/a
         +dywHq1vWQ8q+HvnOGd01ixiafWySxw+9WfpO1iHLE+P1KA15SxMMBlhV28Z6if3V2qE
         yyCVj8eLI/5R00afI4rGOUb1MLmjwlQ/5+gMqTYrgytBb8VmT0YtiXt4bDOmgn6PSMeC
         wwndoomaRa/xBTYwBBC8agPwd2NI2wDokuwhErIk4VwmJD1EKiMh3XqcGGwdoczMmkgZ
         hnHA==
X-Gm-Message-State: AOJu0Yz0+D0lktEkU4OgduxgFoSGzaJilPj5il4kTqqMPTUB7d9Lg7kX
	djUMRxEdKRVXYdtj529tkk2DhJlPsuVh51z30n73X8u36vfujmCUgTxcaZe1m7J1YAzn4foZ9Ot
	7jq+ZDAL24nTdZY62xDr0ivJP4gBKXrg=
X-Gm-Gg: AeBDiesjj9le50t/oEdFJ6bo5JWPKhaHSUZ721e6DivNknwToSwFx0Aee2dFa9H2MeZ
	mxjKhhdAXtcBaUFvsMXxlGpTOwktTqjJjx9zKMIv6GXEU55j/ttz9qxdu7Pk6EMx8Mjt4I7qTHq
	LFAbXjGcFt7ZEutPOlz8+bPXrKWMVxcxl06gmdMeqRnxF964XYjVFwlz+ThcE5yjMN6qymgH3TX
	zSZomwNCX3dqop93sTaJu+FLAs25XvbfEALGZ5Q5jjTznpf5CDMkQn2kxifm8lCJa7x2y6m4Uex
	QRORVAm6W3IaMbMzBiTGZR9G51sIO4pz1TWoUac=
X-Received: by 2002:a17:906:c3a2:b0:b9c:451b:234e with SMTP id
 a640c23a62f3a-b9d7267a8ffmr208233266b.11.1775847519386; Fri, 10 Apr 2026
 11:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403150357.489571-1-mattst88@gmail.com>
In-Reply-To: <20260403150357.489571-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 10 Apr 2026 20:58:27 +0200
X-Gm-Features: AQROBzDyJUUMOZsb2vcJt27_7GNlozOYbNdCry7E21w1vMeZ2pRljALaVYmDg_8
Message-ID: <CA+=Fv5So25dGWwHJqGk-cMonQd5PVxzoPsdhe-u6KR3Sxhi22A@mail.gmail.com>
Subject: Re: [PATCH] alpha: marvel: Fix lock ordering in init_io7_irqs()
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 5:04=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
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
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/sys_marvel.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
>
> diff --git ./arch/alpha/kernel/sys_marvel.c ./arch/alpha/kernel/sys_marve=
l.c
> index 1f99b03effc2..d0bdd5e6cfd7 100644
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
> +               irq_set_status_flags(i, IRQ_LEVEL);
> +       }
> +
> +       /* Set up the msi irqs.  */
> +       for (i =3D 128; i < (128 + 512); ++i) {
> +               irq_set_chip_and_handler(base + i, msi_ops, handle_level_=
irq);
> +               irq_set_status_flags(i, IRQ_LEVEL);
> +       }
> +
>         raw_spin_lock(&io7->irq_lock);
>
>         /* set up the error irqs */
> @@ -272,26 +284,13 @@ init_io7_irqs(struct io7 *io7,
>         io7_redirect_irq(io7, &io7->csrs->STV_CTL.csr, boot_cpuid);
>         io7_redirect_irq(io7, &io7->csrs->HEI_CTL.csr, boot_cpuid);
>
> -       /* Set up the lsi irqs.  */
> -       for (i =3D 0; i < 128; ++i) {
> -               irq_set_chip_and_handler(base + i, lsi_ops, handle_level_=
irq);
> -               irq_set_status_flags(i, IRQ_LEVEL);
> -       }
> -
>         /* Disable the implemented irqs in hardware.  */
> -       for (i =3D 0; i < 0x60; ++i)
> +       for (i =3D 0; i < 0x60; ++i)
>                 init_one_io7_lsi(io7, i, boot_cpuid);
>
>         init_one_io7_lsi(io7, 0x74, boot_cpuid);
>         init_one_io7_lsi(io7, 0x75, boot_cpuid);
>
> -
> -       /* Set up the msi irqs.  */
> -       for (i =3D 128; i < (128 + 512); ++i) {
> -               irq_set_chip_and_handler(base + i, msi_ops, handle_level_=
irq);
> -               irq_set_status_flags(i, IRQ_LEVEL);
> -       }
> -
>         for (i =3D 0; i < 16; ++i)
>                 init_one_io7_msi(io7, i, boot_cpuid);
>
> --

The lock ordering fix makes sense to me.

One question though: in the moved setup loops we now have

    irq_set_chip_and_handler(base + i, ...)

but still

    irq_set_status_flags(i, IRQ_LEVEL);

Why does irq_set_status_flags() not need `base + i` as
well? I would have expected that to match the IRQ number
passed to irq_set_chip_and_handler(), i.e. use

    irq_set_status_flags(base + i, IRQ_LEVEL);


Magnus
