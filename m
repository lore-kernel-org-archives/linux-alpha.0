Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795562577;
	b=w7YWkFPPoBUjKuUSrXk0T+N6yeDoqd6AwR9zhjcsM9DplkyddhF926UuBbTm3auBf4Be
	 /GAPCZRQz1QGz+ZVZmjQALNWcXL1GCkIFcuQPORnnDtlcIDHKx4OHChPa5d21spvgRXq+
	 E+m9brBosTS/2Z5g0jUYfftmyMYiOHvaFdnIiDXfevsxocjFIt4Buk4OyC4vlYzYxglU+
	 RUzLnEL3gIsLtjJxAN3uA5BfY1d+PL0W5tsaeTKKX4IkYsFPopjSvoQLFOfHcVqeF4qhi
	 XmIYOBdeASx/7dhLycU/p4toUNh+XOtREumwAvTOL5UNmEpajGV5yHx/fIBaVmgjAoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+rTqiyEyTcsjP0xyYZP/sz2SwheWx3kWrvomWaMtpJ4=;
	b=4dORX2h52SwMEqPsFw+e9O81lM778GZH9hoKdMf6Xujs5AMyWD73AmWuH7eNMR4u7i9R
	 jndT7EpYU8oWyQeMu3tylTgt0jf1g6tS6f5RGPFixBZjvLwkoNQLr3IAALXI4srmv8QTx
	 pLw99cg40hNhwYk4nXzNd8tbUIogaCozP0gFjAcYDCRDclyr811I1Io36UoetIyTeL3zn
	 wgwA/MOylxRMeDC0GPoC4fwwuzfuO2VvHOuHqTDQHn2JIUVqZgZJ/EdTAxiI6wdrPYXgI
	 VxlsH3YY89RnQ+G9mY3CwYvHdr56UOAFXkJQAaf27Ol+T/rPm1n9VWtEXb1H7RS09kQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nFAARA7C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C56E606A33C
	for <linux-alpha@vger.kernel.org>; Tue, 24 Nov 2026 23:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C56E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nFAARA7C
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c513a854320so837433966b.0
        for <linux-alpha@vger.kernel.org>; Tue, 24 Nov 2026 15:22:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795562575; cv=none;
        d=google.com; s=arc-20260327;
        b=DJ6J61N+NxPticdaxSi7C6iD2z2thCY4pkul9WQUAr9gcwROyS9oPwc8P0MuiA9TcE
         u92hzz0kQf17vKYhrmqzw0Acn5jvunJWR8Guvcga8XS7jpF7NuG5eOZXfn7y7XHzNND6
         L9HORdHFRbugHvCogEzCHSedswwFBz0ws8UMDJCeiC08EdXZ2HNGT/0JIoteHCMvgkTD
         O0n4qnTbO/e2pCq8cBIH4IsM1U4sdA+8e+WC+2X38/MfSFnm2jLDVZl8KOUlfc6aqV/+
         XdWjeZ6US/V956zlwpMHPV/gO8pqGKjOGaU+MmakmkH+dKm+ELhwCSCTKA7bxCqQARVw
         HWwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+rTqiyEyTcsjP0xyYZP/sz2SwheWx3kWrvomWaMtpJ4=;
        fh=z0JSH4MeN0oJGtwrmx+2/9ikiw2/2vQ/YXUsBMaUTsw=;
        b=CESQrIadC788yq6WVEsezVQo+Vo6f5flZt9CCZVlFURQP64TeVTL17Q+CM4CbtAuqC
         EVE7eehWt7WEqPM0uoG72BjReaXS6pu6lokWiVoJm5MT1neHqvi4WG1IC2LVHg604h3K
         LseEs9TMpbwAi7CcJ3ajvA1cA+JjwCi+QC08BQjrFgV3kDioMwDKW/9QJpmsncNApEIa
         26WoiCTiNpyjNhI/0J326ifPtHfOZUY3bJxTki5qnVm1qQvZKgDoILUENDIdwgG87bjH
         VWVvmPw79dRJeUxc9Hg2IT4C0+81R93M1RKmjcaMPYrd3B9EotsIJ8g4dub+qtZQGnEo
         6dug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795562575; x=1796167375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+rTqiyEyTcsjP0xyYZP/sz2SwheWx3kWrvomWaMtpJ4=;
        b=nFAARA7Cx2gUDYdmhiPWIhOLgw4+aYVBFj22IRVliJa9NgXc24+2Atj7MZeI4+k0EZ
         boFGw1uQQLETqjcnJIgujQnFwKk1V4AIagMh+jeL5S6bm7E/y+3R9UBBomg76spuLv2M
         ubkhf+a/MKeHLj2fJCXvu9TEQbCMOoM/73j2p/Vz5j+DI9LIY6Sro2IBiNm/VzpRsiDi
         GMwyQ+QaZhJXOox8nowxzdDyMmUkkEjbiqMbTEfFQ5WXw7cTkMZlX1k0RAvbW5EZP5J5
         ktnrHLxqmTYx5rn/RBYJXllVmPsrvbtZC5srpF6v4Rzsmfdn4VNLpLeaEGNT4juIOWK+
         atYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562575; x=1796167375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+rTqiyEyTcsjP0xyYZP/sz2SwheWx3kWrvomWaMtpJ4=;
        b=Y4AiTtAmvBW4IKtzuK1qHdGszLFZr/+FVDkOg/P0lmgbjQa4TFWoQw6zFDxwAeS58e
         MLxJzVukuptNYO8bOU5pvqBiDI6sHwXDnX3A+ZXK3nPT9FuOyCHBAcGixg0cwPOsIpT0
         XoCZdlphQ7wBqEtItID2/F1FU8HMCClpJ4xAq+fWN+d7vkbMn1WNpfzxjnnAfZpY9cId
         Q6SobBxWp94yEaqzi2vYW/w88k23v/oduCKQktOmWld1dkiZwi13SDx18G7+fwEXBae7
         uF4rqvd3j6rNibnmM17bo2xW491Hy2TceNYRscE+UFXychJ/5mWWNMwB+NZ+QLy6GjLs
         EyJw==
X-Forwarded-Encrypted: i=1; AL+hErGDHqghKqJdSqfnffnxkrBzMiPoC0IdEHI+btfAc1xp1ezhoUoPQWZM8vdJqXHLqIpWMhvfqoyA5uDJSg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8wre0wlBUwa23IKveyqAvfiXiG4P1/8+1pcikgczNkzu1toPBy
	MMIpAvlBbUXqIxu7Di3PpL66YP1eT4xTYQQHHHwWy9XtGmdtQUHy3YiSi5yNbud0e7T43Akp6AM
	b7Z5qdaZarKKhLmb1wIQnadI3AiEUA24=
X-Gm-Gg: AZFdTZehQWws1B2xvRTgTwmx3NsSqXx7Wpg6nMMfHev20AtqyOomz7Zm8ebbSaX1O4+
	d3bGel4zRf6LduuPt+57j3ZUJQmneOPdGtRqhrtaopVhGJ/U3x8IgfH9sOuL6k+52WYIxnB9plF
	muuas66kRkdVXuwP6waVVUapuHSlF5GZkjnt9LpH0zchNdRYOyxYuIOpYIQmSm+zrVWKwmXDBA2
	6qzjMviarVyEkj2b5MVZqbOMtvX7H1NW6q7LP98EGN5/NzYKdfJZCIhLnfd0WhTk4PkAev0YWbB
	ath10oFBwwouq6DFASJk0mpZRgYiYPwSuTAz5N1ACe30boMOMpv/JXPPZ0NZZ3xLt1yLdzv8Kee
	8SaqwK23F6JTArAUYUa8vUnexFzJJRWNOwncPuWuxsX88M0FhwHOxTo21Tzl9Pokp2GGKzMvgQv
	dXigNnful8RRhWvsKcfgIC8LI=
X-Received: by 2002:a05:6402:3551:b0:6bb:2049:ca7a with SMTP id
 4fb4d7f45d1cf-6bb2049ce09mr530944a12.30.1795562574801; Tue, 24 Nov 2026
 15:22:54 -0800 (PST)
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
 <awVzJMLVw4wUSqky@monoceros>
In-Reply-To: <awVzJMLVw4wUSqky@monoceros>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 25 Nov 2026 00:22:43 +0100
X-Gm-Features: Aa3M54p40jvWYlRgIpwdomsHYhgnFpDsLhI0rv_i2dkIsTGssHPloMOWlC-TIyE
Message-ID: <CA+=Fv5QJxoxEoKxRpm5Hisdf=y+VpmM-s_VBC1tDQ2FTCfb08w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-next@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	iommu@lists.linux.dev, joro@8bytes.org, will@kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Tue, Nov 24, 2026 at 12:32=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Sun, Nov 15, 2026 at 11:37:43AM +0100, Magnus Lindholm wrote:
> > Select HAVE_DMA_CONTIGUOUS and reserve a default CMA area after the
> > machine has initialized its DMA windows. Prefer top-down placement
> > below the direct-map and usable RAM limits. Skip the default reservatio=
n
> > when no direct-map window exists. Explicit cma=3D ranges retain their
> > generic override semantics; top-down placement is a preference, not a
> > hard lower bound excluding the first 16 MiB.
> >
> > Use dma_alloc_contiguous(), which rejects non-blocking callers, before
> > falling back to alloc_pages_exact(). Pair both paths with
> > dma_free_contiguous(), whose buddy fallback uses free_pages_exact().
> > Skip CMA on the GFP_DMA retry after a mapping failure so it cannot
> > return the same unsuitable CMA pages. Retain zeroing for CMA memory.
> >
> > Round the size up to a page boundary in both allocation and free. CMA
> > allocates size >> PAGE_SHIFT pages, so an unaligned size could otherwis=
e
> > allocate too few pages and overrun the allocation during zeroing. Keep
> > the mapping and unmapping lengths consistent with the aligned size.
> >
> > With CONFIG_DMA_CMA=3Dy, the default CMA_SIZE_MBYTES setting reserves
> > 16 MiB without a cma=3D argument. cma=3D0 disables the default area.
> >
> > Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> > ---
> >  .../io/dma-contiguous/arch-support.txt        |  2 +-
> >  arch/alpha/Kconfig                            |  1 +
> >  arch/alpha/kernel/pci_iommu.c                 | 19 +++++++++++++------
> >  arch/alpha/kernel/setup.c                     | 15 +++++++++++++++
> >  4 files changed, 30 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/features/io/dma-contiguous/arch-support.txt =
b/Documentation/features/io/dma-contiguous/arch-support.txt
> > index 3c6ce35d704f..6cd205a991f6 100644
> > --- a/Documentation/features/io/dma-contiguous/arch-support.txt
> > +++ b/Documentation/features/io/dma-contiguous/arch-support.txt
> > @@ -6,7 +6,7 @@
> >      -----------------------
> >      |         arch |status|
> >      -----------------------
> > -    |       alpha: | TODO |
> > +    |       alpha: |  ok  |
> >      |         arc: | TODO |
> >      |         arm: |  ok  |
> >      |       arm64: |  ok  |
> > diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> > index 6ccb2d230326..cddc1f3af209 100644
> > --- a/arch/alpha/Kconfig
> > +++ b/arch/alpha/Kconfig
> > @@ -30,6 +30,7 @@ config ALPHA
> >       select HAVE_ARCH_COMPILER_H
> >       select HAVE_ASM_MODVERSIONS
> >       select HAVE_DEBUG_KMEMLEAK
> > +     select HAVE_DMA_CONTIGUOUS
> >       select HAVE_GUP_FAST
> >       select HAVE_KERNEL_BZIP2
> >       select HAVE_KERNEL_GZIP
> > diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iomm=
u.c
> > index 955b6ca61627..19aa5c05de2b 100644
> > --- a/arch/alpha/kernel/pci_iommu.c
> > +++ b/arch/alpha/kernel/pci_iommu.c
> > @@ -408,15 +408,20 @@ static void *alpha_pci_alloc_coherent(struct devi=
ce *dev, size_t size,
> >  {
> >       struct pci_dev *pdev =3D alpha_gendev_to_pci(dev);
> >       void *cpu_addr;
> > -     long order =3D get_order(size);
> > +     struct page *page;
> >
> > +     size =3D PAGE_ALIGN(size);
> >       gfp &=3D ~GFP_DMA;
> >
> >  try_again:
> > -     cpu_addr =3D (void *)__get_free_pages(gfp | __GFP_ZERO, order);
> > +     /* A low-memory retry must not return the same unsuitable CMA pag=
es. */
> > +     page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev, size,=
 gfp);
> > +     if (page)
> > +             cpu_addr =3D page_address(page);
> > +     else
> > +             cpu_addr =3D alloc_pages_exact(size, gfp | __GFP_ZERO);
> >       if (! cpu_addr) {
> > -             printk(KERN_INFO "pci_alloc_consistent: "
> > -                    "get_free_pages failed from %ps\n",
> > +             pr_info("pci_alloc_consistent: allocation failed from %ps=
\n",
> >                       __builtin_return_address(0));
> >               /* ??? Really atomic allocation?  Otherwise we could play
> >                  with vmalloc and sg if we can't find contiguous memory=
.  */
> > @@ -426,7 +431,7 @@ static void *alpha_pci_alloc_coherent(struct device=
 *dev, size_t size,
> >
> >       *dma_addrp =3D pci_map_single_1(pdev, virt_to_phys(cpu_addr), siz=
e, 0);
> >       if (*dma_addrp =3D=3D DMA_MAPPING_ERROR) {
> > -             free_pages((unsigned long)cpu_addr, order);
> > +             dma_free_contiguous(dev, virt_to_page(cpu_addr), size);
>
> On next-20261123 I get a build error on an ARCH=3Dalpha allmodconfig buil=
d
>
> arch/alpha/kernel/pci_iommu.c: In function =E2=80=98alpha_pci_alloc_coher=
ent=E2=80=99:
> arch/alpha/kernel/pci_iommu.c:418:41: error: too few arguments to functio=
n =E2=80=98dma_alloc_contiguous=E2=80=99; expected 4, have 3
>   418 |         page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(de=
v, size, gfp);
>       |                                         ^~~~~~~~~~~~~~~~~~~~
> In file included from arch/alpha/kernel/pci_iommu.c:14:
> include/linux/dma-map-ops.h:105:14: note: declared here
>   105 | struct page *dma_alloc_contiguous(struct device *dev, size_t size=
, gfp_t gfp,
>       |              ^~~~~~~~~~~~~~~~~~~~
>
> which seems to be a conflict between
>
>         next-20261123~159^2 =3D f03df6019b56 ("alpha: enable contiguous m=
emory allocation for coherent DMA")
>
> from
> https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git for-ne=
xt
>
> and
>
>         next-20261123~104^2~23^2~7 =3D 31f7e12d621b ("dma-contiguous: pas=
s the NUMA node to dma_alloc_contiguous()")
>
> from
> https://git.kernel.org/pub/scm/linux/kernel/git/kuba/linux.git dma_alloc_=
coherent_node
>
> I guess the right thing to do is to pull
>
>         https://git.kernel.org/pub/scm/linux/kernel/git/kuba/linux.git dm=
a_alloc_coherent_node
>
> into the alpha tree and fix the offending function call in the merge
> commit.

Thanks for catching this and identifying the interacting commits.

I reproduced the error on next-20261123. In
arch/alpha/kernel/pci_iommu.c, I changed:

page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev, size, gfp);

to:

page =3D (gfp & GFP_DMA) ? NULL :
dma_alloc_contiguous(dev, size, gfp, dev_to_node(dev));

This fixes the allmodconfig pci_iommu.o build. A full DP264 UP build
with CMA enabled also passed, as did an object build with CMA disabled.
The full allmodconfig build hit an unrelated cgroup sample error
involving PATH_MAX and LINE_MAX.

I'd prefer to keep the Alpha tree independent of the DMA series.
Could we coordinate with Jakub and Marek to carry the adjustment in
linux-next and ensure it reaches Linus when both changes are present?
I'm happy to help with further testing.

If that proves awkward, I can remove the CMA patch from for-next and
defer it to a separate Alpha pull request once the DMA changes have
landed, updating the caller then.

Thanks,
Magnus

>
> Best regards
> Uwe
