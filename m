Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C6447B425
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 22:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302109; cv=pass; b=oH/+ANG/3ehKGBhfDDbgBZ8edmMfQasC53+XGNvCNNx2iR5pU9I5eLI9RNL1KZPSxQqg4dLgUip231yvbUX3grBMQ4r3NVKArgXMhmX8EtJSdAJEAPNjYQnbZ54imZM3gf36CccLoYW8KAupaNoSrvyO/JXorx0+GZw0ryPoUkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302109; c=relaxed/simple;
	bh=ixWhrkDazTQwjsDRgnRpeztncVnCtwPnCq1bA67M6Mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H5cnxsi2BHHTA1HIFcQts7xRbkHg+VpQxnu7PCJ3KhgSL44pSH/OT3Hrh8t8zw+89Jd6TKiGpAL3HDsvbaae75cZ3naz8P/btbrabHH8A59tZXfZjCU6s28sQIY9BznUl/up6usQtlsUDSr5gwhICRWPB76RnXO0P9iinKpRNTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lk+tAFIj; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lk+tAFIj"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a5ebf75d62so614702a12.1
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 15:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788302103; cv=none;
        d=google.com; s=arc-20260327;
        b=aXlXH9edSZjuejpGIIBijGvXBJW+sIZ52nH99oLZUD9Kc/yi09QAbtiW+4GjKzV367
         asn1wbRX1GYTO962U4HllmANKqw0Ilj2aObb59cHvexXbR8iSpI1oZtbe62Ps36kpKtX
         OGRM5f64JqeT1xx86vgol0FMOMIlTpxK1C1Fa623qbTpdYakQJ6oakSJSNszDhP9c1C8
         3lxH143MI1NNQGN1i0TwAEsc4aQ5OwZgBshIrlt6ukZk65sNvdrv0U5gy6lfGjvBgPUd
         xP9vaxdthzmOZKn8qNi8TxzY4/xBaPjiy84GD04UIdN4z6FmOWu9xk7btBI6lWNENKD5
         Wa4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ixWhrkDazTQwjsDRgnRpeztncVnCtwPnCq1bA67M6Mc=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=VB1eUHwkjxmbzeHdO27w9/qrTkdT7wZxa9YX1SheKTOsyCSCLZnpF7o/8YoXYBNw2N
         cpRnIlpRcWrfCiSFLkQTydHpxGFiK59i4UBh1/LbLOYS1x6VFhqaODRKGVu62GsQVzBt
         UrAWeQxxDH2n00CD4dmXelnyJUoNDNQns5IMjmAAuhlDrv0lTRNJtWWfFVzrmWoj9IWA
         y3MCteos2EZ8NcjXDAJMQ/OpqeJuw9+p1Fej5LhpI8KIQMNh2etM9WlDrsRRi5E5J5dx
         gxPf4CjbiGnPjoxuwvnTUhhKDCc6mmWYFAIfzdxMcPx91E2k9jH2otQForGkKnRHGmnZ
         3haQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788302103; x=1788906903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ixWhrkDazTQwjsDRgnRpeztncVnCtwPnCq1bA67M6Mc=;
        b=lk+tAFIjM+a1/5pbRyFXVJ+KvSqK0v6C7+XKZqh3Kf2IIW23YuByyOHaTz7wmTxdpT
         U4x3udcJj0P5p5qr/7XTY4ChA602DK1vqNJPKqpLAUqr9gm3zE0z0JYjzmCRE6+q2tCf
         B5XkVAo9X4PGj7hteDiWVNWoQNlMik7rv4puAWi7PIphhKUMYS6pIwFmKgLWjbf/iiGC
         z2bGhXPmfBi18tQCpWvd9Sa85mo8HaeSzaWQDStcpKHoInsjTOAdSxzMktWJo365db9S
         wcaDCgyCYzI8pqAISF43f9s6sCZQEtlitigL9x8kAsdYbJQXVOjw5V/xiQIPjvjvbJI/
         AMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788302103; x=1788906903;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixWhrkDazTQwjsDRgnRpeztncVnCtwPnCq1bA67M6Mc=;
        b=CG/DVpq+zeiN2xAksaFNTBkrTw4HQuruEMeZHe0xeTGJhp7PUjcsU8ULCvSUiWTKv6
         Kc6UL4FsEqL7pG/o3JfnnD2XT5PVOq5zRGdItYNvhzCILj/eivhXUdEVSTJ6aJwO5PEC
         RA4q3uRlr7l4Mani+mVhnx3zC6QbpAQ4bm2w6R2u2IWV1t3DyXWt9HRmqhXhDCbrxOa8
         OlmvYWTpRwEYmntmZtxCt3/P4dRACqf0B40hbajM++CybfiCSJY8xe1aDSesiM6UXt27
         LzpegODmK8O3kjKqnN98zqNVAGsCDJeoK9JWNP/eguPM0cd7V7g55w+LeFEyddmO0yME
         2abg==
X-Gm-Message-State: AFuF++kcmVHkUGIxjWEZjYCXXUEHUV6SI4/PG1sj09cxcL+txLcHWfrb
	/ZgGsg2+Ga43OhWSswn1nX0ChpjuxLC/6uKtBOwvoiZxtgSa2uxiETwk/xw2a06cIMNZXZisOsS
	ZcgTn8d53/4VU0eoQCauHrTo1Ul71JvM=
X-Gm-Gg: AYBFou2ufvMrLg51gm9t0baPeIqSPARtiaUXjk+/V+4h5gfTGEUNQy9MwF9rUpVh+SW
	DGrYwUqDSnKBeUySFB1cEK9lskry1UNv3+mn2CiWNF+iVsWlFGTc15QunEjr+XUAq3WPeH22lMt
	+W8i1Kzg7JTp97FjOdNITZrpUgUcHid+QEth3/AkEy7leT71boVYcfJkcw5OL6T52qEpLceSyeh
	S4soDBR6n0CNxpmP4axpacPEVxUx+Y6Dchh3gCVPIFqRpTW58pdjbiVnYq8JMvIrbICMVC886JZ
	OU2iZqWuBveTrtki0sAa1/b4DfDs2RzNEqw+tEGPwtQNV/O9Ah4T3XeVOIExdfopCY2+O63J84L
	S8VwX3waNoKN/VtQVxkQZizq8R52JVFg=
X-Received: by 2002:a05:6402:5042:b0:6a3:5685:703 with SMTP id
 4fb4d7f45d1cf-6a68527768emr165172a12.3.1788302102525; Tue, 01 Sep 2026
 15:35:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <61175f9015771b6a6d78624579ecc180f57d17e9.1788277742.git.mattst88@gmail.com>
In-Reply-To: <61175f9015771b6a6d78624579ecc180f57d17e9.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 00:34:50 +0200
X-Gm-Features: AcwNN1WgbmFzP62nTXwf1sLZrIPpu0y1q4syu1pWxP14aqgN4CoXz9yJQt7B17Y
Message-ID: <CA+=Fv5TYnwcDLPvwScOcGq-7CUSs2bDMqrYEj-Lhf4XfQ=yTzA@mail.gmail.com>
Subject: Re: [PATCH 03/24] alpha: select ARCH_HAS_UBSAN
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> GCC's undefined behavior sanitizer has no architecture-specific runtime
> requirements. Enable it for Alpha to allow UBSAN instrumentation of the
> kernel.
>
I tested this patch on top of my rebased Alpha GENERIC_ENTRY patch on an
AlphaServer ES40. The kernel built and booted successfully with
CONFIG_UBSAN=3Dy, and the UBSAN instrumentation is active.

CONFIG_UBSAN_ALIGNMENT did expose a misaligned struct bucket_table
allocation in lib/rhashtable.c. This appears to be a generic rhashtable
allocation-alignment issue rather than an Alpha UBSAN problem.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Regards,
Magnus
