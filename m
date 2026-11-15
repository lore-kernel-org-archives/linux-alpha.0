Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794760344;
	b=muMqMgjkzrnFw8uipY3qjMoIEisqwB1+pipJKkfSRipXDPYIpEYJlB237WYZA3lkNS/u
	 K+pBQZrT0B/jeI5YbUV9UiRwGRJIDdTnyUaqGKTZXtBy2UWOIO9LgqqqSjYNRBEJ2i8EB
	 TooalzbXZlZfOZb6qsR6rqWobQ3vXjdtN3wGRrwCeuTW94hlcr0o2PiKdKbXoyk60a18H
	 wc+GXczv0lLE1kvipENGjE5/nplEUDPBqSrEoaIsO33Qeon97ADBuLrb8zQhzo36NHp9N
	 iK22GUBuJ+Xu3VHDbmf2rgAMoXcEgrkV/Zu25iQP+57DySr3/uXxSWaCcUU2IOKg8Vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HCckTMZyw9OTQXV/bGloDIUtT2tzhoTG4aHw0IiDKVk=;
	b=sysPGlrVd/KGxi5voHo7ntSMJqCnZiTWrFMpt2VKJIo6hZXDkV09PjcGt2KX4WnijxV3
	 WDa/7mJU6rDEEmTaHedTPAYxywDRRTA/H2BuuBJbiaI6A2GdKX0jbtQTKOaz2ITV43TAE
	 cicVjwf2V4Ke8+DQ2/kffRM8AfmnyB4YMPO/IvvyF7JOpZtmHUylvjdysfrrO/ze7llN8
	 L+6wBJ+76x1L8TXI86Ys1gbOOTqu7oNtOuAONLkYOd238UP3ybHsx6B7xylmN1fHES9id
	 FeEACwuJCpG9o7BN2nWB7BozwOO/Zbk0tK4X0PKBjcCKF85uU9T7NTeymu35TgemNnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYp+F1J9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E67606A31D
	for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 16:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18E67606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYp+F1J9
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae22dcfdc3so25320591fa.1
        for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 08:32:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794760342; cv=none;
        d=google.com; s=arc-20260327;
        b=gOiPz+72AV8UFLxxl68i4nMu+wYE5CmZ38Ojb/n4LoRnTDRfdyINXEBM7Pv3OqAVC4
         T8rfB+D+VDmX9wGDsBgQH5u0hACn5IVJpLxrQRK6VZkV1UBQg22NWO24h+LceSThaSd9
         jWqcNJmE1hVMHNCKyw3w4Uj/FnpqoHAdcp/6VuOTVi61fc0Iv6GbYHHBS7rFqAtJZ1db
         TzXRYGe9+ho2sXUbK9TGx8W+p402dHQ/J/sODTonKdh7/AtjUuoNGCcoCEGytpxDrBmL
         CYi2FXpSncscxOTtcKQmWQn0yTPqeMPvBDRXpJo3MZfXhIAKFYP3Doo12BAt2nRe4bbi
         eThw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HCckTMZyw9OTQXV/bGloDIUtT2tzhoTG4aHw0IiDKVk=;
        fh=d8zhZ/2b9av40Z2s9TB9ghgzaVdtzrrZF/SF0Zt1U0A=;
        b=jFRSANzl8ETrztpbFpDvR9d9nWt4WX3e01ewI4Cf5mQI25Of6UNaR+8Hd2078FBSiN
         Blu6Ehk7+tfz6OLY19cnjvDF43xtVCO0GkYGfqDVKiirzkXyMNOE9soQ1vC5KoCdclAi
         S8J70f+pS2Qgyo1UzE5x6JbNP0p6auJ5hWe/fYDF2eI6VGYZLdUkL+XW2n9qbH77eaB/
         lVy/UKQEHVw8q2Vqx8+9scEDjRMDZVfH18QLN+cpkvZ/Yeo4usx1MoUWggPux8Qga+qg
         sqXSAyz9spelGm2CvaeM86/8IiKkZH8GpcGZ94GE+p3UFIIQBosuNvrQ5bDwYCwA2tBI
         8Z8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760342; x=1795365142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HCckTMZyw9OTQXV/bGloDIUtT2tzhoTG4aHw0IiDKVk=;
        b=NYp+F1J9iTTjv84uTPpY4S2uLIwXNbEw4wuiolygEReixpaCKk+U96XDGXrigDbrdG
         uCLajIYdhC+tiqT996FV4pUT4LyB9iTW3rmvfIR0Midpnd4KdZIul6XemJS4c8rbLuVF
         vVDi8DrGgOSjVOskzqHSk9tU8oAjUlvCB4Y/899ITvaaey1Owp2OTiOx2wDicUJL+jge
         JPRGVUKURhtIpWf4FNr9C+VgbRbKTdfQ0V3Tc9lGRwhPYYxWmh+fnptvSfEEZZQFEkiY
         uBMT5FgOEP23H1cE97L3HRWnVm4zD3FSLy+FGANOg4Le5pUinBX4+qbe1TDKPyxd9YMK
         Gqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760342; x=1795365142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCckTMZyw9OTQXV/bGloDIUtT2tzhoTG4aHw0IiDKVk=;
        b=SPbyTGPELhVOOcLnMW00EbtVzAk+JKUhnyYRuXqFzN9tVNOTQgrkRKRP9t/15APkEc
         XNBWPMx9hsSC/PuJSniQKB0U7SPLDv8Q8JIRi08eXX7YpuUdbZtYg9yRD0qUsyb9W7Br
         fdfinAJQOuOj8Le42+5QyF+DPPInlsT8iGKa/P19oG8J0FIGxixWMcJkG4vZVR7oYeEc
         BgwP9hahi59fuksHoV5qzG1iE4UGir2a0pXmXh7PIcNUfyQn2nWGZFKCz8eqWIccb6wn
         9x2uuCQXZa2Xjy+V3IBixE1ovTNBwc5dppl0SeFhYZwzQ5Xoyoh5MTyd14c9bEhMswIX
         ufcA==
X-Forwarded-Encrypted: i=1; AL+hErE6ce65oOllzgYQC0aLB62pg4FP3KVo+VbtM25Tgw/f1QDvly0kgh5WYiHoQt/mZHY3eRzrOoeBAzn0QA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+tvzkCnDszN9gCPY2zEvsuPDRZYGds219iYYqit0bK5ofASBEZ
	8U5YpZ148IT37wbWliUiLxXeDzg4kfyDo2KFVei0GBM/ahqYFKBJcyBzn74N86MTqF62VZeYugi
	5D3kVRqFugp8P+DFr/YS41n4WGUGYpbLwn4vgS8j7hg==
X-Gm-Gg: AYBFou2I8OUlunq+fSg4oC2c8JoDyhRcArtkvcE1xzC0XhCiMJI4UIu13n4fd/Gnkg+
	XAR/yrTrGwEH2ycZ0DfARgQmBfav9DOrbElYKTrmCteUdzQ7nLjiN/W1inYtcDksg28jXl+Bq9M
	xx4V5UN+cncRDYYYGvhYQgCvdkYOI1Agpabflj7z4icpqTwfw0gMD9SpSXj3IIgBG0l1I6Ryfm+
	7yhY2AJ45SRATPC54w26bM4eI3Xi/oFy/tOcI7VVuUHh9zjxsgG7KlXp0zeUtQ+bgFqdcBVjno3
	dc7sfBD+XN/AyvjS6M3jdoYwUgJg9DdhUfldIR5Z1f/LzI2XIkzRTOn7wPLE6VWw6JAqKStC0WF
	4eakBMIoavgKSzCFX+mZHSTRNTWL81YLD/zaUTshYXK1qDVp/ojBtnFuK2gvyWD4jJ5X5/Rto3f
	KliSgd/OhiTP8Yx4Lvx4H3/fWUGq8WSZWisZeBaQiAazJOG4xUA/5E
X-Received: by 2002:a2e:bc8f:0:b0:3a9:74f3:17d5 with SMTP id
 38308e7fff4ca-3ae2b41f644mr24359841fa.3.1794760341961; Sun, 15 Nov 2026
 08:32:21 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115103809.1288167-1-linmag7@gmail.com> <20261115103809.1288167-3-linmag7@gmail.com>
In-Reply-To: <20261115103809.1288167-3-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 15 Nov 2026 11:32:08 -0500
X-Gm-Features: AclHuK_dFmtmC7padQ5REKLjC77pZXObwKP22hGWvwh1YtR6bmvp3xOUehZ7QRc
Message-ID: <CAEdQ38FBKRAnFxWS9uQ3eAzByT8rKqzuQsAbPCv6Zhff=zF+RA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 5:38=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
> Use dma_alloc_contiguous(), which rejects non-blocking callers, before
> falling back to alloc_pages_exact(). Pair both paths with
> dma_free_contiguous(), whose buddy fallback uses free_pages_exact().

Right, and the !CONFIG_DMA_CMA stub does the same since 641a9b9cc697
("dma-mapping: use exact allocation for DMA pages"), so the pairing
holds either way. Just something to keep in mind if this ever gets
backported past that commit.

> +     size =3D PAGE_ALIGN(size);
>       gfp &=3D ~GFP_DMA;

Thanks, this and the matching change in alpha_pci_free_coherent() look
right. The CMA alloc and release counts now agree, and the memset()
covers the whole aligned size.

> +     if (__direct_map_size) {
> ...
> +     }

Looks good. Every remaining core sets a nonzero __direct_map_size, so
the check is purely defensive today, which is fine.

I build-tested the series on top of 0b4cadbe7c39 with
ALPHA_GENERIC=3Dy, SMP=3Dy, CMA=3Dy, DMA_CMA=3Dy and W=3D1, and saw no new
warnings in pci_iommu.c or setup.c. I haven't booted it.

Reviewed-by: Matt Turner <mattst88@gmail.com>
