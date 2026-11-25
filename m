Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607536;
	b=Nbj6hy7SO0jr0TK4fd71we2XBJPkb6yRidMgSfwKjxcP60PS0HkPb0Uzqcb4IhHWDSmz
	 hlNbSaVKcknCbJz3bAh8IUoBdyVQXuvnrEONeHgX1O0VgfU64i+ytPJgv83HVlL8nQ9KP
	 Pak/d3vzYEsNWFUB8ey3jfKqJNvHlHZZ1FiO0r+1dDPKBmy93/FDI5d+U6oDLkz9Dd+Qq
	 EHuyOufEtCSsHo7zQ5opb97p89SdmX7FFsoS5a+Nuv+WDWXe7k0X9pspLV5yiOpFrejY6
	 Q06mPRsSNF66r5OXn/ES0N8jnHG9o2+6NF+OXXU+CGyec1DLqpm01CXa6PvjakhAJIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JiTLwnT8J6kdyIB5NBxt5frLTB5XA5RQrMtJGgcHBbQ=;
	b=uF6pGLfswp11hyFMJFt9iGXe/wig3uZCvTisyzFdYb1qk8zUQww1ADf/rKwE+sbboWf9
	 pLUvxLAUWcjpGfzwCzQT1u4XBT7zF8NZW2LV9uArT1YMGsQMcLrdFXzJsQq922iqGphJ4
	 71PEYhvY+d7WtkA3WDnD/1BoLaaqGQbPJBSpZ0hTLZ90u2lWmlJBFG5kr6ediC29Leoew
	 6vPjdu7pF7Vfci8TsM+lPzzmZSjA00HoSV0IMbAdPEpF6jJKTiX9Rs/vyXHj+nd46Ufym
	 n7nfgUxePL0EjILU34ShkWyX+BjddfOyx4rjTCiGewOVfOnO7NkT72x4R5pPb/amr4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GqBOILI5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60133606A334
	for <linux-alpha@vger.kernel.org>; Wed, 25 Nov 2026 11:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60133606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GqBOILI5
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so6968232a12.1
        for <linux-alpha@vger.kernel.org>; Wed, 25 Nov 2026 03:52:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795607535; cv=none;
        d=google.com; s=arc-20260327;
        b=iWyM+n0eaz5Lli8tNjA5gHFMAxv9fwqv/rJ7jCfF0OP2iAVn5ge+95mBr0RFwdj9Rt
         TEB0NS+9T661HZDX+1o6iDroR/6L6N9qgm79k8IhiM6Jbnq8RKOD3wvWn19fl8fSdArc
         24lN49qAV2uipVmUiE76UXe92tcE7xrkAGCGsoC+GGRbL0suNf9qG83vrGTZfrEa4IWd
         lsMZoZN/5/7ZGKrpnBFYKVjkvfr6dw6pkWROHr9QjsMkQCYspmlRRVjYxrd+f+TDPV5h
         zbHgVu9c1+PhlWcHKZPI2KQ/I8rr+4xKlefP2wQ062HR7jUuG6UQVgXE5+CIEScO8DaD
         z83A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JiTLwnT8J6kdyIB5NBxt5frLTB5XA5RQrMtJGgcHBbQ=;
        fh=RNK9a+m6Zf9hf9q+VpihAHGK5yi5CQvniSgzx/gJmSg=;
        b=qtYpX/VjAx/lFkl5BJXMnHXDnZX6hpoUgYIVLBSktF/yAovLILExfMQqor9Ti4Xm3V
         WdYXDb3r8MK/vgFf26NlDlCryMfyZPj11kX5OrqwIAKXKzD7GMj2Ph27svAC5jCP6hHI
         2tJz/poqSXTbvXwxA+D/HPpddU68BAD/o+5Zuhxhzgfxuc48zaxDAhUZxCpXQUX2LH8s
         jRYEaTUR+0lpbTPpuWHKgfrWktif6DeVsV+jmDF3wlVHp2zE2zMFBBQZNfRwe8Ky5ibu
         M7+XmeBFonHgOoL/Cs4qiJqlFIP/H3z3PgvlGw4jfPnE9SgvZu+xKuerqtj183ou1vml
         2kUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607535; x=1796212335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JiTLwnT8J6kdyIB5NBxt5frLTB5XA5RQrMtJGgcHBbQ=;
        b=GqBOILI5YHt+I8rgrwlbLHY5BG3XvSU+r+LHqw3oI7Xy0/F1mDTEwsdyR/Vg4NAa45
         Lm5t/VP+Y3VLJbd4SMm6dsdhwLsOEkLXgBKY7IhDbCRVTJW2z5+dEGbV75/b+OILcqVH
         Htz/jZJaC1jTlUIovL+B41koB1HHMD3on30Sq24mS8XcpKvZn84VEQVDg78rRo3NexCv
         CfUpZ4w1ozN2VEO3DGF34fg0s21O2V/GL4YDulN54roVhEA0MtAJ5Rzer/ir/Fv35qKe
         X1ChbSIIuM5mpCM9ks6E4geN5r0vm3yNI4K7txZiLyzSdnRqWF00BxvnRVlU7gqrA66V
         x4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607535; x=1796212335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JiTLwnT8J6kdyIB5NBxt5frLTB5XA5RQrMtJGgcHBbQ=;
        b=Vfmmb21c58Vht/7dasj6GXd9wWNuzUtRopW7VlUqub04lgcgUe56v+GWg9cdkmMfaE
         Rzo5H7YfTWPjD1mCPUvnn0F77ozCs60ljoQXoHBgaAmv850aed+wnxZcQvsWAs8qBmWm
         v7nRo0KU1jsTxpEeHPMrQZEvf49pVvfujqX4eYxM6fFfW6j2KNTqBw4czWYCbTs/P94g
         juoe9CFiGP5lg+COxuuuzth4hedFiDdBswzrT9v/k3r/dp4LEUvctUmq016J1kTbHYvo
         fLB9jP767S4CdDciPa6Fq8h+zvE8ajTebSolBNMTPisn3J4bnh4mJqiqtheIyBPkF0DR
         3Kfg==
X-Forwarded-Encrypted: i=1; AL+hErFU+8VdjKdO2HBkKrUZnO0rgG2kr7gE39uaAxEUci3a1dA3fdxmFoZeOP5nTXryyEtuTnA0psgfjesruQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/zsRMWP/0UeCudi+D10Dz56npctq7I0JSNdKaY37asFh/2B9Mc
	u5Mk44c5au0yAmk0sRbLo+P+G3abxuo9CxGgujepqKsSSd0DP+sJm7uKvNwEP0FiohhxQG7q/c4
	WRoN9pB7PBcT9bvLVesQH4AVP4+HKjl8=
X-Gm-Gg: AZFdTZeVL2xN3FjMmutr5QTC/mUSDKmzuPQ0y04w6jkr3eKvnWGcY3H0yGsWbP+QzTX
	D36IsN5ow0yxjHsDPXIf+jUM2P1RVuM1pE2CJVqouTTDz11vV74DhVZnoMlctE17djcHK9pb8bo
	c+G9hRoo5Zhs1OZA4ufAgF9eJYgezZN8wtfPC77AQuWD24MdL14ssUul6wrCP+QK9Ajy/ZektP/
	re/0NRdrn8EQBMdlyiGeObo9uAfDDfwLhybHn8osWIyml60/sO3/7K+zHi74+LazDDMbCE98fTO
	doX4rAaW+2dR6siEoDmVGZ4H/bO5GtYHplojZVr1fq5N6cEJQGYzEJDRsk27HaR1ZzhGIBzOr5Y
	R8h3lualWZCePC4IAAqGrE/z8OT7fb4rbUgXRKregrPIbihsRE+HA02IcNrMFDonURy945w==
X-Received: by 2002:a05:6402:a592:10b0:6b8:8706:8e91 with SMTP id
 4fb4d7f45d1cf-6ba37d6526dmr10123892a12.12.1795607534606; Wed, 25 Nov 2026
 03:52:14 -0800 (PST)
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
 <awVzJMLVw4wUSqky@monoceros> <CGME20261124232303eucas1p10f2da7a94c8aa19fa4e406d089c1367e@eucas1p1.samsung.com>
 <CA+=Fv5QJxoxEoKxRpm5Hisdf=y+VpmM-s_VBC1tDQ2FTCfb08w@mail.gmail.com>
 <3467269e-9929-4c9f-bc19-847976f49527@samsung.com> <awa6Owm3eDW3EitJ@monoceros>
In-Reply-To: <awa6Owm3eDW3EitJ@monoceros>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 25 Nov 2026 12:52:02 +0100
X-Gm-Features: Aa3M54p8sDF24v9l5vsIDk_y4hlZnLV9zBkxaSf0Tu8Y_d4WDzlfpPV0l4Su2os
Message-ID: <CA+=Fv5RttOgZp9vftYN2XfmV31TyC_o_eSejruM_bbf6v7zfBQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-next@vger.kernel.org, netdev@vger.kernel.org, iommu@lists.linux.dev, 
	joro@8bytes.org, will@kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe, Marek, Jakub,

On Wed, Nov 25, 2026 at 11:53=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Wed, Nov 25, 2026 at 09:54:08AM +0100, Marek Szyprowski wrote:
> > Hi Magnus,
> >
> > On 25.11.2026 00:22, Magnus Lindholm wrote:
> > > Thanks for catching this and identifying the interacting commits.
> > >
> > > I reproduced the error on next-20261123. In
> > > arch/alpha/kernel/pci_iommu.c, I changed:
> > >
> > > page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev, size, gfp=
);
> > >
> > > to:
> > >
> > > page =3D (gfp & GFP_DMA) ? NULL :
> > > dma_alloc_contiguous(dev, size, gfp, dev_to_node(dev));
> > >
> > > This fixes the allmodconfig pci_iommu.o build. A full DP264 UP build
> > > with CMA enabled also passed, as did an object build with CMA disable=
d.
> > > The full allmodconfig build hit an unrelated cgroup sample error
> > > involving PATH_MAX and LINE_MAX.
> > >
> > > I'd prefer to keep the Alpha tree independent of the DMA series.
>
> That's up to you, but in my eyes merging in the immutable branch
> provided by Jakub into your tree (or rebasing on top of it as suggested
> by Marek) is really the easiest option. That way you don't have to wait
> for the change to hit Linus' tree and there is no further need for
> coordination or others paying attention to not create non-bisectable
> commit graphs.
>
> However looking at the immutable branch I see it contains both the dma
> API change and then separately various adaptions to ethernet drivers.
> IMHO the immutable branch should only contain the API changes (that is
> the commits up to 31f7e12d621b) to reduce the amount of possible
> conflict.

Thanks, that makes sense. I guess best is for me  to rebase the Alpha chang=
es
onto the shared DMA API changes and update the caller in my CMA commit.

As you point out, using only the four API commits through 31f7e12d621b
would avoid bringing the Ethernet driver conversions into the Alpha tree.

Jakub, Marek, would that commit be a suitable immutable base for this?
A separate stable tag at that point would be helpful.

I'll then rebase, retest, and notify Mark before updating for-next.

Thanks,
Magnus

>
> Best regards
> Uwe
