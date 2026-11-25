Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603985;
	b=1RSFBZtBzXYQUfYD+XWToMaWFIJsaKwn/0r1htwxa0WjQEYtJ7xj0je96mbUta3PC0+s
	 ymamrHRK6KAdIaPUkfWZO0rLj+mvIGrjhS1wmIFzp5f5weJM5BZzMyENiCub5cht9W5W7
	 FbaBG6FafKMO7OhQcso+qJweQmjjhRI/X8lKPakO9AsLfT6Uj5XfiYp70JcHi/lTpzGEC
	 6UmHQ/oXmD1CTl2pZPfKYpETuUnoqoSWk3tzvDFHE/c8UOPLLd1tg6opEfDb3pWHvyuNp
	 a1CcoZhCptpi8vuOx+AaHED85fYeG5+wFU42fMmT2xwA3hCo5M8qHRapuTclcfq699w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GtyqZEMexnqUKbDqv2TlW/7VEDcPuxK4TtntSukqHfg=;
	b=pD07UK1wOrPYkLZbHdAZ7Z9ZFFRJ4KF3wEWemtoF8nkOFfOnA65FlbiE1ZwKqFxa31nK
	 9CfPoG6rgKuOJ7YgXMuZP1kVV0yfxJKH3uxnclewucCGcnwP/79uSOxEQ/xJGPuO9+mto
	 vNrXaCmKMC65ETSj91X7OgUvsCzd5dbOKwKogRalcrv8EpLSjX6YHQ2vuuIl0JKiJ3J5h
	 uCYjzkHdTAQVVTvAWsQe3iyUgCEVVYbZiW48fQoGgEI8qmbn01W0NvNVDi8JDz7VQ2WwA
	 2e/oYDhrZz1xM0nqI3G2lOVsR7t622s9YcP7KQCQHvkla7hI8rGN1+j4gyex7Acpu/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZQLLNSep;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76846606A323
	for <linux-alpha@vger.kernel.org>; Wed, 25 Nov 2026 10:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76846606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZQLLNSep
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so27615565e9.3
        for <linux-alpha@vger.kernel.org>; Wed, 25 Nov 2026 02:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795603983; x=1796208783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GtyqZEMexnqUKbDqv2TlW/7VEDcPuxK4TtntSukqHfg=;
        b=ZQLLNSepQaoHarrnqWeyG4f8VwH9MS+htiIaGhKRruFOrQbKn+J9w/l08zzFlA5J5c
         umSjq/J9LJyNcElsTl0fwemLQy5VpuESexyNF7A+r8IyufkqFyWYa8R/6aOM5wQ8nQEd
         qyi6yBtbjHxdkT3++ADg85sE3dTkBryDS7/uruqwp7VlLMuMk/PhLksXBqm88a3484XP
         Z02GhcPzwGG5XoLCIxR2rjn7pdeoq45tX+Fb78WOZpyT9iOjH9a0cNp+jcDDdqNvfKq/
         MHPaESzBn79lc/KQpTvzeq7MAF4+5FydeFO15G5Ei7yYiOhiMI+MEneGwF8ANdHRPoN7
         FZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603983; x=1796208783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GtyqZEMexnqUKbDqv2TlW/7VEDcPuxK4TtntSukqHfg=;
        b=BaHo1QqRwNxH2vEr+2kNeaCI6gbVtr/FutQtvktCnMu8Q2V7iZ0KtVJCAvGQ9RItKy
         n209kP9ow9U6dZ/zeI7EDIPF5bnCYBxFy3KIksFFWIUvqJzFR+RM/0Y/IsU/WMbC8wuI
         U2iT0nY1StgWHqbXDrj62+m+/i9WINE4zrcYMlHCCNnG742kYeA8wdU0gKyvtG52mpPD
         KPUBMH7jXazYe2wpJEP4tLkWGInYKJdQTCOCD9rSSCBlxyd2YTAppDH17TiNXjlVrIcS
         UhDRlr/ct4DlyAx9sv8EmlrnyqbvUTRexyfvUvxuOcs6YUD+W0KKhmoQjuQcIW4cNoXC
         7VqQ==
X-Forwarded-Encrypted: i=1; AL+hErHr1X2M4RqWZTf47eOg7CjJgbk9AF+eSzo6B4hZCG9UYhCZsfXjTaLIIDfoVMPX1KKpMfkjEcNyArSs/A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8dcf2Mcw2j8BpLqK9Fj0XwSTD3yT6im2mYjxi5iktXk5t38GTD
	Fn2WuNZbJu2BLl44nwthASY1uzPlQo1hqFN1XtJPne22u7xTMjCkP19FO5Ewh/98GRE=
X-Gm-Gg: AZFdTZdbJ9oXbqjJGVML6JIbf2+tzcsn7Nvf3Nz2/VVQVYLNq6htLbF5e/qUnv3W96z
	r0w3JQ2PPJ6r+N+cg9iNtkPOwEVH8fajKHiRhgSStZ+iiAiljg7YZimZ46e7XHLgq2MqCAahPH/
	af1bPf9ZtKkYDyrXmfclNoWr8eIM1u34Pz3ehuJ6h8X/y1jnw6bDO71SphYiHht0bBWeykEj2Lx
	IrVL+n78KmJIANuJcyrZOChlsIaUeVtxE/MJ7bBfX+iVyxNawxq5Muvf/o+lcvbUpvQQwODuv6c
	gAkad4RR++Rsa0szp1onlROsGml/WmIO9+clAPm1szQG6vbyMPBJoPmuKddoTvJSnyF5GhNKO6l
	yGzlTLozoImg0Y3zHQncDXIM+Vs2pMHoewe1k9FfeH+RZoY5gFQvvp356cHJypV90gaNfLaVVLk
	6Ku7oh5sL4sWhSiy2mpL9c2FdbA9muwvhUqkkMwnQ3FiccTttuZyaIVmAsG6ZRqA3dOaHW/nJqW
	paSKrk1NE1rFMoqnlAnQH2n611vKFumuni/dcAZwjYxyyQroTPW10+w7vae9mIbFi+WpGhcE/he
	Qqow6Px3J0utdne8RCLQhbteEBkCeltCbfPh2pydin65m5CokoIpwVfq/Uu+HQrzE0iAY7ZC8qJ
	YyasrFdvzxOcN4c+g
X-Received: by 2002:a05:600c:638f:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4bb8880607cmr329616615e9.13.1795603982845;
        Wed, 25 Nov 2026 02:53:02 -0800 (PST)
Received: from localhost (p200300f65f19a9043ef7230869dfba63.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3ef7:2308:69df:ba63])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb853a12acsm539176075e9.8.2026.11.25.02.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:53:02 -0800 (PST)
Date: Wed, 25 Nov 2026 11:53:00 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Magnus Lindholm <linmag7@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-next@vger.kernel.org, 
	netdev@vger.kernel.org, iommu@lists.linux.dev, joro@8bytes.org, will@kernel.org, 
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
Message-ID: <awa6Owm3eDW3EitJ@monoceros>
References: <20261115103809.1288167-1-linmag7@gmail.com>
 <20261115103809.1288167-3-linmag7@gmail.com>
 <awVzJMLVw4wUSqky@monoceros>
 <CGME20261124232303eucas1p10f2da7a94c8aa19fa4e406d089c1367e@eucas1p1.samsung.com>
 <CA+=Fv5QJxoxEoKxRpm5Hisdf=y+VpmM-s_VBC1tDQ2FTCfb08w@mail.gmail.com>
 <3467269e-9929-4c9f-bc19-847976f49527@samsung.com>
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
	protocol="application/pgp-signature"; boundary="6sn276mtbb7rvtiq"
Content-Disposition: inline
In-Reply-To: <3467269e-9929-4c9f-bc19-847976f49527@samsung.com>


--6sn276mtbb7rvtiq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
MIME-Version: 1.0

Hello,

On Wed, Nov 25, 2026 at 09:54:08AM +0100, Marek Szyprowski wrote:
> Hi Magnus,
>=20
> On 25.11.2026 00:22, Magnus Lindholm wrote:
> > Thanks for catching this and identifying the interacting commits.
> >
> > I reproduced the error on next-20261123. In
> > arch/alpha/kernel/pci_iommu.c, I changed:
> >
> > page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev, size, gfp);
> >
> > to:
> >
> > page =3D (gfp & GFP_DMA) ? NULL :
> > dma_alloc_contiguous(dev, size, gfp, dev_to_node(dev));
> >
> > This fixes the allmodconfig pci_iommu.o build. A full DP264 UP build
> > with CMA enabled also passed, as did an object build with CMA disabled.
> > The full allmodconfig build hit an unrelated cgroup sample error
> > involving PATH_MAX and LINE_MAX.
> >
> > I'd prefer to keep the Alpha tree independent of the DMA series.

That's up to you, but in my eyes merging in the immutable branch
provided by Jakub into your tree (or rebasing on top of it as suggested
by Marek) is really the easiest option. That way you don't have to wait
for the change to hit Linus' tree and there is no further need for
coordination or others paying attention to not create non-bisectable
commit graphs.

However looking at the immutable branch I see it contains both the dma
API change and then separately various adaptions to ethernet drivers.
IMHO the immutable branch should only contain the API changes (that is
the commits up to 31f7e12d621b) to reduce the amount of possible
conflict.

Best regards
Uwe

--6sn276mtbb7rvtiq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsGvgoACgkQj4D7WH0S
/k7oNAgAknak/QZHg7BqHZFzHCe4qtzYco0MHY20TLpuveFkHfRuLa9UVG2bG0Ww
LQZfbq0hnFip66k6fjmWJ+mGt0QyF7sJj/DpkCtXlI6aQtnnm3D3slJhpH/bWjue
fk1SdxjYh64pzlg1UF9rEJri73sW9fln2Gz2EK1iHllG2Z1XRGwb4bBzh6WpzAxc
AuLAWN7R4PJvFLQ+kNkR4YocW5+EV0RnYb7/i7Fb9ABP1MxCxi+4OM8+uD8MGuGZ
OFggCxgES6vXm2Ostds9EY3vRvG+zs6/ZpyofM5BxVfPInkgG1teIzoXDpivIgkA
C+dJzsR+ixI93VaJu1B++KrDBjHhlw==
=UmCO
-----END PGP SIGNATURE-----

--6sn276mtbb7rvtiq--
