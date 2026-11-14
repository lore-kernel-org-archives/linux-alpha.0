Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794676600;
	b=0aFqL0GCaUK+3OOWO861xeHtpY2sn/5IQ3VG2Z1eeqDTjc70XV1M7drDUAjKikINJ0P2
	 Ou14HjhHzifDu803Ud65yCPuCEvPjysYPwlGGW/r0VpYE5Kjh9uyElodk/oLJjlKaZzlI
	 6/ZDneOT74pbISkVtpAMu0xMT2mIiKNw551+jn+LkzfEDMS1nwKiN5brrbtZLlqq6weXf
	 2XHMazciQz91Bq5DoRuXiwe85apcln9bhB53ZkaxnXp3qT+mpflSjKvQ+4kS0O93LRUJY
	 YegEOd8tHP98sFm762uhBY0Z0URDdbQi+FXG96xt61n3Xx3SRo4yoYY2FLPYL44h51Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SjuxZpxo2VdoY/uM6bNancwZ4LLZPAOCdWtVCyHoJ6c=;
	b=ur48ISvoiq/x5hAyP9RzBLHw8nRzLIRs0j3AN+bItAEdOu+QzoBp2iim/KKRrX2Kc+2g
	 7QJilamt4HyPtEHLC+YGEfW7XipHZquUljHMzZjOabdb5rt7QP2lUi5hnQU+y+MCZrRsN
	 CaIJiinJwXqscRjqXD7r1Z0iXsgEN8PvUBP5L1/PJNVHU80cjwySVYU5/evbDzO5jejs9
	 i+dtICcqKokcvbEeucXvyezMSmq4hZaxMA3NB2d34jgNeCcnEsAKWbJh5Hk9BHnQ3pEyN
	 5+umONcTD3DAwOtOocvwNGFl/8kZjCOFg4PfS1yt9DbA0wTfYKvb6ynFcBRIKdCYi+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvqmD5t4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D286606A330
	for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 17:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D286606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvqmD5t4
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ae25d9e2fdso25633071fa.0
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 09:16:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794676598; cv=none;
        d=google.com; s=arc-20260327;
        b=ctZWjYsHK4iwyZQgQZGm0A1rV+kU/1DuYTxMUwhBOFC0avo8rS98s9392f3yuApjIC
         R8obEyOC/SiDCNnHG+5lkdkfQ8Yn/xzkrMrUDvmVhOLkABg9XIkeRiW8er969paSAFv0
         Xu9EgN3lYwD0aMt/ECfMql9l3BbSVt/UivBPKI9n6ep8palRgjSgLs6gOq/gAd0GsUlG
         VBFvyIFr+27MydQF0XQwi6UTMseXLSCC2C+NaOaeWYGYoyMEmCcEOU1a5uqWKB1mUZTR
         j/S3l8QzlvdxY6ygCfxu+HJK10JaSyOSbnY10e4ixBX5F9FN4yG5+lhBvz8UQqHdwNlw
         ++Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SjuxZpxo2VdoY/uM6bNancwZ4LLZPAOCdWtVCyHoJ6c=;
        fh=uXX0CMatSWL9yLdNEKEJQf78m+LXg8zDv3BAUyA7XY8=;
        b=E0ErU0Ts4hOt9DdmJ+Yi540n+5cyrFY3e8WYJYgI2XF9xzxxCwDaZI1GcRAHiWkngK
         Hoi0XbMQJkE3rtuxg/edRdVqIo0nSjH0zOv6k31KHStyvy9WdWaGezhG6x/X52wiak9a
         PMeIalQgYOzi0RO75Euc/IWXayuCCYLxxrknPifg148FWOZgpPUfMrqR1KZtAGtGuE+J
         N8oLzcuL8jf4eFL187UP7WmDmk4whg1d2DiGjyGv997lWnyktOZ4ydwwjRhsqBsVOapz
         QdZewuUa4JKxTPeX9KrnVlOIPHzHrm2HM/ll8qfxCNklAGYqR/oFtkzsvxCnB2cd7b3g
         itBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794676598; x=1795281398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SjuxZpxo2VdoY/uM6bNancwZ4LLZPAOCdWtVCyHoJ6c=;
        b=fvqmD5t4Wqd12zYagXQBWMFhc8VcfANemipTgF3OukheTTKf4Ofv1Bhe0nm1qfpc3+
         g0DLw75qTBQ5WCis51xDN+RcxUrccJQlfz74bveo2QQrQsWyCrWFivfueG7dS5uvnLk7
         KBheu6+/wG3DWPbxIEXn9wDlzobIkWlCdgkAZRbzG+aELuDWCnp9ebCln5kxXNjJOR1D
         Y2NhfIf9VgU5GCA3iNDNQtI8tkd47PvvhyqghZIoOZ8V4wmzn/AUAt3Y/xyoP0T054UZ
         7O11GeJUotazYBq/f7XSLCgEXqOWCfxBQz30memeFuWxE8obafKQkfH6W6DlZtmN6JXW
         6Lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676598; x=1795281398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SjuxZpxo2VdoY/uM6bNancwZ4LLZPAOCdWtVCyHoJ6c=;
        b=1pl92xrc4T2FevXe3ln2+zKqE+BdJbM7Y9kF6E1lIMf1aSOHqYpYZ/3ZyACbOsDwhu
         m+JvbRn5qQmizlwNjc+pBKboDlHzHknXwnkXiq10HCnaENlt7wLopSf7u2o+2GSGFalF
         ecGvJK9y2HBf3emftqAk0mv78NkDTB5MCDv5Z7F+27aviB3NfNd54fabay2WiWORgaNw
         tbm4gqGnYuAx5ctcHLyi/YFePFKaEpSOguOOhVuqlyJZQlO9KczJze9DlwFOy65zSmC+
         n3pVEAOOvoJG583PRaN1DBXPr/PlpxXrss7SI3czjk0rxhGeGmu/lzW6NU2GX8lCVcBZ
         66dw==
X-Forwarded-Encrypted: i=1; AL+hErG+ov7pPukRENyQZWQFZylSuHuVLOc0u8yzP09IhLrXaxK0TZ/l8MuQs6tXMP+imei5ag3WAoFgv1olDA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/tuGapOE0I/KD02SuN68sZ9ubAAdMmbkFgI/uzQsKsXqbG92iS
	Bsivu2VXl0lSRjPWzt2BRTye6f+eifJpKCgjJXVD4cXeFpllV5ee55k+nXukFtsT9KtZY44cZJ5
	rvIhGKSYxIAPyy7AGRUUaFkptScVzWz6qD/7Yy9fDFA==
X-Gm-Gg: AYBFou3g1OQqQyqdeHinD8sfzhA7p2zDs3GQziom8OcfeHg8SFeZaYHF4iQcFM8/m6n
	9Nf7PJ4qP6O6Cfr9f//UWwMEfqdeq7jkQSZzUUBbUKpO/Eaa9+YXr/M6ogieWiHp2zn9t940bmT
	x7nk4LqX9CcRI110LTXkhFymPsefntymgfr2xyIaJkgFr8CfbEynz+Xy8RfO5OMzdgj7Tof+T69
	WH5Aw4x+CR+CsW/ssw0Y5TEDNRkXjpQTQWY9pjDZ+k3uBxeWgHAUZUoqQR/9qNJfoD7A6EvGQdO
	E7cxV340dMU7wv6bUKDH7XLeFWMlpLRaz63D6rG51eaP1TN3HUTbK22HC5EPn91pK0FVNxVZktL
	9oIu0T9+V+uRyLUb6hCKH/6sbIG2we97T/+IkF7uhuydhK3PycudVqWEsbtBBzwkxSB6x4L/7pG
	RYit2rVyHcLLgrXW8wBCZg/kbMOhPYisG8AJOblg==
X-Received: by 2002:a2e:a543:0:b0:3ac:7ad6:2007 with SMTP id
 38308e7fff4ca-3ae2b6a7862mr16289171fa.25.1794676598373; Sat, 14 Nov 2026
 09:16:38 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114095335.1283016-1-linmag7@gmail.com> <20261114095335.1283016-3-linmag7@gmail.com>
In-Reply-To: <20261114095335.1283016-3-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:16:26 -0500
X-Gm-Features: AclHuK_J9LkDU4Ejd97Ghggn0eepCu1-9VA9AiIWRy_3uPpOUQcjqWFzA10azKk
Message-ID: <CAEdQ38GQTPA3jaWf+qUaQr50i9_zaYREA2V2UYd5vWUYk1z2fg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 4:53=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
> @@ -408,12 +408,17 @@ static void *alpha_pci_alloc_coherent(struct device=
 *dev, size_t size,
>  {
>       struct pci_dev *pdev =3D alpha_gendev_to_pci(dev);
>       void *cpu_addr;
> -     long order =3D get_order(size);
> +     struct page *page;
>
>       gfp &=3D ~GFP_DMA;
>
>  try_again:
> -     cpu_addr =3D (void *)__get_free_pages(gfp | __GFP_ZERO, order);
> +     /* A low-memory retry must not return the same unsuitable CMA pages=
. */
> +     page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev, size, g=
fp);

size here comes straight from the driver's dma_alloc_coherent() call
and isn't necessarily a multiple of PAGE_SIZE. dma_alloc_contiguous()
assumes it is: cma_alloc_aligned() passes size >> PAGE_SHIFT to
cma_alloc(), but dma_free_contiguous() releases
PAGE_ALIGN(size) >> PAGE_SHIFT pages.

So a 12K allocation gets a single 8K page from CMA, the memset() below
runs 4K off the end of it, and the free later releases two pages, one
of which we never owned. dma_direct_alloc() does size =3D PAGE_ALIGN(size)
before it gets this far. I think we need the same at the top of both
alpha_pci_alloc_coherent() and alpha_pci_free_coherent().

The 8K, 24K and 32M cases in your test are all page multiples, so they
wouldn't have caught this. Something like 12K or 20K would.

> +     if (page)
> +             cpu_addr =3D page_address(page);
> +     else
> +             cpu_addr =3D alloc_pages_exact(size, gfp | __GFP_ZERO);
>       if (! cpu_addr) {
>               printk(KERN_INFO "pci_alloc_consistent: "
>                      "get_free_pages failed from %ps\n",

Minor, but this message isn't accurate anymore. Maybe just say
"allocation failed".

Rest of it looks good to me. Skipping CMA on the GFP_DMA retry is the
right call.
