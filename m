Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519981;
	b=hdKtGbsqfkf2wg3DE4lNKDWxMb6ofmB6kBpXDFZCkjeIMoWgPYCn/+BsYZ/z3ur6qGg8
	 vnT4Nv6XZhj7opEesgVkHNjkKx34QbcHAbCvwcjiaJLCdu5uM+gmn28eR71FuJBxyQYJz
	 S0erVpYteLSpv6j3BH+WBWbxekfyuxFrcArHrekPN1eWvPq9XHZvPVsuQcSupdiKwL994
	 jMPclE7BrhDvUHNWpGwueQdc3+XitYTOoHlGv6IC3NrQVYMC69mD0DhRkaSq21TdKcDTv
	 nOy2hO6370Dx+t3TQK4c/+MNi7wnAMT9Ma6itp65O6JlsDSCLsujyn8P8ij1nW3k3Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=s/bSSvf0Im0ruzCTIFpwwFuOavhKohFLurdyvyasMP4=;
	b=tE5hO6QYBtVFFrrQOswm9YcPHhy6UwVM6lp8jitk4aTOeH1TJyf3muh+80egCzx7430P
	 S9U/1RBm+mAgG5TXN3e3c2cMYbln56hiHFBOhVzUsLPLgjbFNOOkL06DyD6tTmCFwRTJq
	 TyyHxhlc74KOg8cbd2IjLhE8ePh2xRWmqYmrta9CyHPc36j1g6YEYZRoY6PlBF+D3J0mq
	 F1B4eMoChKplcZc6ljuucSqCWwdOERL8hSWcCRZArIPL68Sr8a+9vCeiyo8h16xK5cDiD
	 HBIeGiPByx8JHNcOw9YEZAzRzDg30DOGxZxNwjl4pfTDU5iefcTKRqG5ex4RV1/PaVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WLScM0wC;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D805606A327
	for <linux-alpha@vger.kernel.org>; Tue, 24 Nov 2026 11:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D805606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WLScM0wC
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-498f5fa5103so2610396f8f.2
        for <linux-alpha@vger.kernel.org>; Tue, 24 Nov 2026 03:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795519978; x=1796124778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s/bSSvf0Im0ruzCTIFpwwFuOavhKohFLurdyvyasMP4=;
        b=WLScM0wCE8n9bNC8leElzo3pEq/ZLH6iPvqMGmOwKm9O08hQt/HJ9t/dvdyrs2DAF8
         holVOYZ4x1H/YWixsMjoiqqly926eZqs0KhAfZaiDI0yeew12uAe7354UmW4eneA/Zg8
         HTJbj5M1/msNpPZzGuLt24k30RgklKoe3xTZXIQoDQHJp2peaXS/6ogsqfd7Rk1XJqSH
         KL0h/6ZvUqJtdxlbQlGs3lwj0PIETp8OP0WPZ9U1AvrNhswvxRurpoy8+m6MZWkf4mWp
         8oXaCztL0QuP6BiNfKJak2pmy2UEwuebqfCkqDj7/LJXrLJEXjfsMFnibmRezcuj2V3P
         IGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795519978; x=1796124778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/bSSvf0Im0ruzCTIFpwwFuOavhKohFLurdyvyasMP4=;
        b=1VYWcSrHsvIWlFupGv4lFdcBTZ84NPP41YB2C8gP6WXCvvjYVWaGzTyLwMKlXsJuOv
         rMCjWIVvEFqKiomuWh5fqJwPspEu+2eQ4GFEhLDwfVjeNDnXsDrRhB1HzNSj84GQfP+/
         qKXqisnyeH2PElWyISmnp5UK0aoAuiAqRejwt+H3lVkdMi0vmJIiYEz4r31MqLUz02zA
         BczBNJ/Ha/uRtltQemN9BrXA3EN+gbpLMofF8VHn1dmp2yivGM1oL6xzL9eMUH3AeY3S
         ybkK+EFdxEYb/eWBFsWHTND5T3cdwdyulNk41sThDAFivwiLAVFz7mKNyVDBu5lsgbwt
         6hSA==
X-Forwarded-Encrypted: i=1; AL+hErH8DDiqGC9UParrFzZsCNGSyELimyfINT4ZW3qG4zpTmJsh8Dc3UbjfcJJAWEI40X0aD4561L+n9XmdNw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+EoY092tUdbrFOZdAX3R5uXxW0EFf2zv8W798Tpx81vKgdit3+
	nKLFftifdMqYNkAAFqa7Yvmz6aF9q/iG/zYzcjUzsh9byjEyd5keIc0i+rykyf8BOccYy9AExlK
	sRVj/
X-Gm-Gg: AZFdTZcA0fnCoD8chDWAophfvOF4ljuMrS5MbfiBOE3mYaYx1Oi6GTqeksyPzbnlAYd
	EcR9iRvYBW1E9aylSCPiq6WFsjn9uNpmgez5eEnn49lIj2c4e3BDO2XeLJrAB9jz1ctjXhkVdHG
	vicxhlYOT0naDvEh9OhtPs+WW9BwYMdh+il3X1TSLl6ePKUKkf9DqMwMvOl3Pnn+HLvGEeoZiyb
	hJoagMQ7RfJceG+yH8kOskr8N2XhQVKbeL4CszsI2eeK+BoB6gQTbq8EWLiV0e7tS6PK+dWtpao
	A2Tfkm9I3TUrIitY6+svFsCW6SCCJfIWnGa1D/TfbYZWqfGOCxndHsSP/B+Iaq1q3PSmMNvEzPm
	FLQaBaj6I3HfRsxlzlRNNzgnUZJ5DCtaSJIPDPRrJq1oA+sZrYx2siJLEsET+acUJbkf9xLKlG4
	5JHkQqspBhgxkHpEXzkNqgUd+7UrMi5GB9bpwruHyrUK0AMrCHJWp/9zBQyQ79kx15Mfpi60vHf
	HyQO2r02qZsPQ6c2YVjkxF+TvofJBi8zkH9eQ8eKod/yWCITQ+OLJG5PvpzTyUewaxf8YLOLY+X
	9wuUlw1sHOLP7nBD31fjcjOU43WRwWBu9PMIj8tCGQCZC6xzSRxESShQ/UUCQVeE+HdhWXJly+z
	BIpBS1blSva+/nioJ
X-Received: by 2002:a05:6000:40da:b0:4b7:83a0:6c06 with SMTP id ffacd0b85a97d-4b783a06c89mr2288961f8f.15.1795519978076;
        Tue, 24 Nov 2026 03:32:58 -0800 (PST)
Received: from localhost (p200300f65f19a9047f1ca7b446868308.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7f1c:a7b4:4686:8308])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6a67f1b2sm25503606f8f.25.2026.11.24.03.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:32:57 -0800 (PST)
Date: Tue, 24 Nov 2026 12:32:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-next@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, iommu@lists.linux.dev, joro@8bytes.org, 
	will@kernel.org
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
Message-ID: <awVzJMLVw4wUSqky@monoceros>
References: <20261115103809.1288167-1-linmag7@gmail.com>
 <20261115103809.1288167-3-linmag7@gmail.com>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zz6vlopso3otapss"
Content-Disposition: inline
In-Reply-To: <20261115103809.1288167-3-linmag7@gmail.com>


--zz6vlopso3otapss
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
MIME-Version: 1.0

Hello,

On Sun, Nov 15, 2026 at 11:37:43AM +0100, Magnus Lindholm wrote:
> Select HAVE_DMA_CONTIGUOUS and reserve a default CMA area after the
> machine has initialized its DMA windows. Prefer top-down placement
> below the direct-map and usable RAM limits. Skip the default reservation
> when no direct-map window exists. Explicit cma=3D ranges retain their
> generic override semantics; top-down placement is a preference, not a
> hard lower bound excluding the first 16 MiB.
>=20
> Use dma_alloc_contiguous(), which rejects non-blocking callers, before
> falling back to alloc_pages_exact(). Pair both paths with
> dma_free_contiguous(), whose buddy fallback uses free_pages_exact().
> Skip CMA on the GFP_DMA retry after a mapping failure so it cannot
> return the same unsuitable CMA pages. Retain zeroing for CMA memory.
>=20
> Round the size up to a page boundary in both allocation and free. CMA
> allocates size >> PAGE_SHIFT pages, so an unaligned size could otherwise
> allocate too few pages and overrun the allocation during zeroing. Keep
> the mapping and unmapping lengths consistent with the aligned size.
>=20
> With CONFIG_DMA_CMA=3Dy, the default CMA_SIZE_MBYTES setting reserves
> 16 MiB without a cma=3D argument. cma=3D0 disables the default area.
>=20
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> ---
>  .../io/dma-contiguous/arch-support.txt        |  2 +-
>  arch/alpha/Kconfig                            |  1 +
>  arch/alpha/kernel/pci_iommu.c                 | 19 +++++++++++++------
>  arch/alpha/kernel/setup.c                     | 15 +++++++++++++++
>  4 files changed, 30 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/features/io/dma-contiguous/arch-support.txt b/=
Documentation/features/io/dma-contiguous/arch-support.txt
> index 3c6ce35d704f..6cd205a991f6 100644
> --- a/Documentation/features/io/dma-contiguous/arch-support.txt
> +++ b/Documentation/features/io/dma-contiguous/arch-support.txt
> @@ -6,7 +6,7 @@
>      -----------------------
>      |         arch |status|
>      -----------------------
> -    |       alpha: | TODO |
> +    |       alpha: |  ok  |
>      |         arc: | TODO |
>      |         arm: |  ok  |
>      |       arm64: |  ok  |
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 6ccb2d230326..cddc1f3af209 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -30,6 +30,7 @@ config ALPHA
>  	select HAVE_ARCH_COMPILER_H
>  	select HAVE_ASM_MODVERSIONS
>  	select HAVE_DEBUG_KMEMLEAK
> +	select HAVE_DMA_CONTIGUOUS
>  	select HAVE_GUP_FAST
>  	select HAVE_KERNEL_BZIP2
>  	select HAVE_KERNEL_GZIP
> diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
> index 955b6ca61627..19aa5c05de2b 100644
> --- a/arch/alpha/kernel/pci_iommu.c
> +++ b/arch/alpha/kernel/pci_iommu.c
> @@ -408,15 +408,20 @@ static void *alpha_pci_alloc_coherent(struct device=
 *dev, size_t size,
>  {
>  	struct pci_dev *pdev =3D alpha_gendev_to_pci(dev);
>  	void *cpu_addr;
> -	long order =3D get_order(size);
> +	struct page *page;
> =20
> +	size =3D PAGE_ALIGN(size);
>  	gfp &=3D ~GFP_DMA;
> =20
>  try_again:
> -	cpu_addr =3D (void *)__get_free_pages(gfp | __GFP_ZERO, order);
> +	/* A low-memory retry must not return the same unsuitable CMA pages. */
> +	page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev, size, gfp);
> +	if (page)
> +		cpu_addr =3D page_address(page);
> +	else
> +		cpu_addr =3D alloc_pages_exact(size, gfp | __GFP_ZERO);
>  	if (! cpu_addr) {
> -		printk(KERN_INFO "pci_alloc_consistent: "
> -		       "get_free_pages failed from %ps\n",
> +		pr_info("pci_alloc_consistent: allocation failed from %ps\n",
>  			__builtin_return_address(0));
>  		/* ??? Really atomic allocation?  Otherwise we could play
>  		   with vmalloc and sg if we can't find contiguous memory.  */
> @@ -426,7 +431,7 @@ static void *alpha_pci_alloc_coherent(struct device *=
dev, size_t size,
> =20
>  	*dma_addrp =3D pci_map_single_1(pdev, virt_to_phys(cpu_addr), size, 0);
>  	if (*dma_addrp =3D=3D DMA_MAPPING_ERROR) {
> -		free_pages((unsigned long)cpu_addr, order);
> +		dma_free_contiguous(dev, virt_to_page(cpu_addr), size);

On next-20261123 I get a build error on an ARCH=3Dalpha allmodconfig build

arch/alpha/kernel/pci_iommu.c: In function =E2=80=98alpha_pci_alloc_coheren=
t=E2=80=99:
arch/alpha/kernel/pci_iommu.c:418:41: error: too few arguments to function =
=E2=80=98dma_alloc_contiguous=E2=80=99; expected 4, have 3
  418 |         page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev,=
 size, gfp);
      |                                         ^~~~~~~~~~~~~~~~~~~~
In file included from arch/alpha/kernel/pci_iommu.c:14:
include/linux/dma-map-ops.h:105:14: note: declared here
  105 | struct page *dma_alloc_contiguous(struct device *dev, size_t size, =
gfp_t gfp,
      |              ^~~~~~~~~~~~~~~~~~~~

which seems to be a conflict between

	next-20261123~159^2 =3D f03df6019b56 ("alpha: enable contiguous memory all=
ocation for coherent DMA")

=66rom
https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git for-next

and

	next-20261123~104^2~23^2~7 =3D 31f7e12d621b ("dma-contiguous: pass the NUM=
A node to dma_alloc_contiguous()")

=66rom
https://git.kernel.org/pub/scm/linux/kernel/git/kuba/linux.git dma_alloc_co=
herent_node

I guess the right thing to do is to pull

	https://git.kernel.org/pub/scm/linux/kernel/git/kuba/linux.git dma_alloc_c=
oherent_node

into the alpha tree and fix the offending function call in the merge
commit.

Best regards
Uwe

--zz6vlopso3otapss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsFdeMACgkQj4D7WH0S
/k5++gf8Def1hTBgcrh/KoII3KUQugHVpyoXdwJDAayGMHuOUnodDFoEcOG7dRch
ODRC7w2t0rKG/XIYwabEtNnXK6BanW5b3foBoafZTtB+E9v7swJK3Z2TpNYsfIDh
eba7AQFbffHbCTwNlzdCMTEmyqqz0qhL5Mc8YONsN9lq4no+UNOzN9123YxSnsaH
MaVWVYaV/ZLWle1TLI3vUfb+L+fQzX96kFbT6FeX1FGO8Cubq37kGONVgLybBvC+
y5GTwQ0VbUIoYQ74Bt+7Jo7qbU8NSyhEiosy5G7TDUQ05NX1Eikj5eiYv+XvHR2u
zBKgWDi9C98biJIon1f+BFbkWqNA2g==
=1TSm
-----END PGP SIGNATURE-----

--zz6vlopso3otapss--
