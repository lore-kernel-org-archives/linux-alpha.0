Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0DC377A97
	for <linux-alpha@vger.kernel.org>; Sun, 13 Sep 2026 09:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789293494; cv=pass; b=uU0/VrT8OY076mspzhO+q4txQ7n4//KjEHmZIE+s1xGqIxGl8pHoPkV9VZIkob0QhE/WVweANAEiFTwWy9CaqP/z2yyZdjkySWZzWxLx/UCANVwpA+mWBcLBEKVquUBNqNB8mFjmf5A4DQGZrIYY+gx9ztfm+jqqCq1cOMlhY0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789293494; c=relaxed/simple;
	bh=Z1UxZxGr9l++OMmSedOseueRC248vVuXVNhuqebXfaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q09XtJYCfNYmv5yxqRmXMe6pkjzEruI1L3uagmJXUnF3M0rJfp4Orz6vqt1/fqG/S5hOj2sBE4sMY0sbUruWMxnklC61ebQfMMjGV6isAmeUk8g15JkmqtJ1HMBI4btfQUrCSFBtnE+TWHKcP4PA+lzrcPecXgy1qIDMhtifcAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsrtQlxZ; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsrtQlxZ"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-671061b015eso2259907d50.1
        for <linux-alpha@vger.kernel.org>; Sun, 13 Sep 2026 02:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789293492; cv=none;
        d=google.com; s=arc-20260327;
        b=WP/ZVRNnS55+3Usu7yEgLplBO4YH9e2Drc9k6idrxaPlE4cifwYt+MttpGRqDD/Oyn
         SwPp6/8aIyWY9N+Ekqy+ur5vyt9YNwvCyGZ1BLzyc4AFpw9vAtTvwnZ78NTQTyNZzzrq
         hYKCUXsMF3ej8xPGt1s3FNZE0HGyktST8PjS568NPGN4PLYa8sh4pFLW/VX8b8sTjm2W
         m4Yxmy/hwQKZpoPz6n2J0OrOfPBMhklZ4P/ymhVt7ogdmg4BVZKGV+95Nxeefa6PSe9c
         71Vw65gGda8P5910NNrRbAhrYzUBm6c9WfAsPFrJoxIFE6G2VkwIGT97+MpoBz/8Ag6v
         Uf/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t/fCaWgN5LecoczEsl0ebG8re6KS/OVMTOW68zTUUHA=;
        fh=5r9qOBSWHXy8B2S1TjvSuBviVwHuW1HKvs0RGdL82jM=;
        b=GHkqsUOVQBFt4Z/dp+MVrDoeHSSArcIdbBl05bN/cLclJkEiKWfZvtKlXTGrkGpikA
         IiXVvs0nPtnf+tlRFBMXrWClexZHBgKgS3XgZ/+ZVJw9TmLYmy77rPxkyGC9zOaYIBax
         W/ClEJ+JFOPYu2i2j7aouK9FpDHk8rKfuY67WWG8bOOgP4194543ZtYzgX5s/alyPlZL
         BD3EHWsuiAPxAa7uhAi3maD8AaaMNHPVpKL5EiszbLxBUB7Vc4y0J3RXxvOdSua53KZo
         +Wov4R25sPztsJX/oxH9zQC+UNp1/xGpnEeOee1AAdbvi/QY6dFO92/q3aLzhDRqTlAH
         /IuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789293492; x=1789898292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t/fCaWgN5LecoczEsl0ebG8re6KS/OVMTOW68zTUUHA=;
        b=ZsrtQlxZJrTBszCgZZT/XK5b0kwScm8ahfUq4vZTiUn9BlHQDCnxFGEx4f8LggO1HX
         ufsYSXIw/j3Cj4jUi21hNgNPnk7m4OA30S9W8GdGw63TCcqaIAFgWGlhsO7xEHwsnmhB
         RGUGBKf+O0TSltbG20bvfeX3azitC23MduHPGSuMrAtvnIvEixQ/YFb9KoxlIAAB7fNg
         LQqEkTAhzULrIz1eiCaGhBWbtN8/YoNQAqrvtW1TEonGxtiH+8ZWRvJ1nseTtkZFevcX
         dLKbUyDaFKfPAYx/s3NcKW5aNQJC3qwt6/NLCIqXj/9W9l0lBwMiVugIiWr/Dc4P3wpn
         KhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789293492; x=1789898292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/fCaWgN5LecoczEsl0ebG8re6KS/OVMTOW68zTUUHA=;
        b=fNqGq661PuHv7lPZTpS1rNB8rH2ppJxtescT2U6T5OzrAQukHhVvatxy15eVRdq5ue
         3MquP5TBPOND3EkJw6QdiXPbHSTil4idfz7XLwmcAbFqV4pordZf2Gss3RNyC4+7qPh1
         rDvCy3PqPVuI9VYKovV2adhn6uhDuE0DIsSfOWd+MAEcP/54viqAG0n2mbrBxVULt+gB
         WDYdH5LPqaTXOx6fVSvmmSqXVY2gQZ49BLIc7OqXvxXEFCiJp9RxntgpajJegUC5+eFf
         ogCFBwzTtowD9k84J4wZrn91ToEzDOoq2Otb3XklkpL4NturjTZWUUpzgLuVib2clwAO
         vN5A==
X-Forwarded-Encrypted: i=1; AKwUvBwsW68tS0gNe6jn3RfGd3whya7dCWncIn2YNlRqPPqAJkrgZxNA6ot8p/sE6ioM8G1ItDQJih4Krb3wCw==@vger.kernel.org
X-Gm-Message-State: AFuF++n4b28WTcR8mblbNzGI9OaemtQwMJfbe0entti4AyxPgUPfWuGO
	l8TnTcYAagKrYmVsAzF5+WlEstClc7ZlDLzQvWpqw+JEVmtnvWdNFL9R87u4qY4ATWx2zWuOjTt
	LtzlTSQ8n7e10oRes4RbPzrS3r/EYXA4=
X-Gm-Gg: AYBFou3w1kSC4rwzzcRdATKTnyXBgxRGKDqCWOGNgGYKA0lp3j1wzb1t4nksTwU5xoP
	CUMXbRPtdriAX9GZbrBX9RFTlYwUpW+Jpk04PRC+Ri+RzoI1wd1EhCQOguE+4V5x0Fp+u/imC1L
	432hKXMBy12Ezj2ig111LRfgSn+XehdtrX3LcS7yAB3RkQgykkolv4/LGehNBRj+NESfG951q2O
	l3+yKhGVkZ/HqpsxdQvp4b93bmTEMGWAHzGamTcNq9ztSPf+w5+jNC6qaBsWSCRJxvuhVTXorRR
	nMvATFJxz2NKrp+HoRP2DjQV5Ip8eyBGDKsomWIXM86QrK5OcDed6k1zsnoJqK6jrgn97IOUgCv
	IRuguLaF8ztluEwrrBGQpd3A4JKv5O9VqbPuOP8Zy
X-Received: by 2002:a05:690e:1506:b0:66e:5fdb:98d with SMTP id
 956f58d0204a3-671246c1606mr3543486d50.50.1789293491753; Sun, 13 Sep 2026
 02:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
In-Reply-To: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 13 Sep 2026 11:57:59 +0200
X-Gm-Features: AcwNN1UjOH515ZFAs0rqo3W477-VlkGQGDTh2_Zpt2YFJYsWJyBQLc1fwY1eGXI
Message-ID: <CA+=Fv5TXRbYARxnaKqEeCpC3OVFNAjBGNRZ_2FA+2g2s8OV=eA@mail.gmail.com>
Subject: Re: [PATCH 0/3] alpha: self-extracting compressed kernel images
To: Matt Turner <mattst88@gmail.com>
Cc: Lasse Collin <lasse.collin@tukaani.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Sep 12, 2026 at 9:55=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Alpha is the last architecture whose boot loader decompresses the kernel
> itself: aboot carries its own inflate code, so vmlinux.gz has always
> been plain gzip, and adding a compression format meant writing a
> decompressor for aboot as well as for the kernel.
>
> Build a self-extracting image instead, a small ELF stub with the
> compressed vmlinux linked in, which aboot loads and enters like any
> other kernel. The compression format then becomes an ordinary kernel
> Kconfig choice, and all seven formats become available: xz gives the
> smallest image, 5547496 bytes against 7677280 for the equivalent gzip
> one. The build now emits arch/alpha/boot/vmlinuz, since the image is no
> longer gzip data.
>
> The SRM netboot path (bootpz.c) has its own boot protocol and keeps
> using gzip.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>


Nice series! I've done some testing during the weekend and it all looks
good to me, thanks for doing this.

Regards

Magnus


> ---
> Matt Turner (3):
>       xz: add arch-specific tuning for alpha
>       alpha: add self-extracting compressed kernel boot stub
>       alpha: support the remaining kernel compression formats
>
>  arch/alpha/Kconfig                       |   7 ++
>  arch/alpha/Makefile                      |   6 +-
>  arch/alpha/boot/.gitignore               |   2 +
>  arch/alpha/boot/Makefile                 |  16 ++-
>  arch/alpha/boot/compressed/.gitignore    |   3 +
>  arch/alpha/boot/compressed/Makefile      |  63 ++++++++++
>  arch/alpha/boot/compressed/head.S        |  36 ++++++
>  arch/alpha/boot/compressed/misc.c        | 209 +++++++++++++++++++++++++=
++++++
>  arch/alpha/boot/compressed/trampoline.S  |  46 +++++++
>  arch/alpha/boot/compressed/vmlinux.lds.S |  83 ++++++++++++
>  arch/alpha/boot/compressed/vmlinux.scr   |  10 ++
>  scripts/xz_wrap.sh                       |   5 +
>  12 files changed, 478 insertions(+), 8 deletions(-)
> ---
> base-commit: 4407825b2f96b0e48a4bd08ab196b50a30eb3aef
> change-id: 20260912-alpha-kernel-compression-2043f806fb75
>
> Best regards,
> --
> Matt Turner <mattst88@gmail.com>
>
