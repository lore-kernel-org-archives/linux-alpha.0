Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B777310762
	for <linux-alpha@vger.kernel.org>; Sun, 12 Apr 2026 08:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775983780; cv=pass; b=YBN5a+WXHJQvfOTpuA1Cm7oqM1WR9u74eX6KHX4DlENeY1c6bkT2C5u0y3HLai4IIdM97ZknJvS58A3TuY8dUxPmeOyqT63QcDrUA2mEqu2+QQaziibD8a3e/+2jwejVgPjGd0aLlhXwuIJrdJ4u8z0qY2+IfABSunRTre8tIrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775983780; c=relaxed/simple;
	bh=dyC+LKlFXsYf0M/eRkg3RW6FHxvIm37ogjc6VLaqP4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fG2Jx9K0lXymKnkI0/oMCNMxpcoSF2FIYZ4IpFkU6QBvPL4dLIwWIbMJ+SE130RJsFz2QUlhODxRUPWsP0R17Xc8vugNnTT2RVqfStqiPvD1sdaxuyuu8uhEDVirr6Yperrab03hiGl5OAWEt+X0m3OSBfwiF9odwOynrqSLX/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSkB4szc; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSkB4szc"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66bd4f7b2d3so3744490a12.3
        for <linux-alpha@vger.kernel.org>; Sun, 12 Apr 2026 01:49:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775983777; cv=none;
        d=google.com; s=arc-20240605;
        b=SIZ2InNceRgVDMc6623wcaCHMQt72ArJKBRilYkC+BY0JEsvzzZR8p9zuHMPCX1JOf
         iqh3c2QrlAKZDndjOkbeESTNa9uuQe8KfxpGFReAyTCbclOmnuDV3QJoEPOv1fONBHxV
         kb9w4lwptnTSlxFISp/ZNYLLaTn8sO1L8hpXyq9Osg9Mi+vDg4WpQHpRqif6ND5dxHYS
         bUrV3bUpHdyg/BoAfnpB9fxxBaUG4HZCoAjmp4zjxFFbkbKiN1o5rQnm/pbhMjGVkBVN
         fwllDs5lVYj1AYvqaoiEleKC4tbIs2HCCOmv9eCO5XaknuAPDUJZVfX7EXggH7s8K76M
         COSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IDtexGVoeBe7O/oFEf/W6TMi9rf4yNR3LevSP+v7lO4=;
        fh=ViAatGiZ05dh3a394EUid4cQpUnAI/U35CAucij+cuk=;
        b=UVrEkmpBxQei5Zf5xr+xVBIJJoyz15ysiek36/PckoUvTxXJaJSYls/8jofF3RdSOL
         l6Pgm2QhM7n/y+EQr6qlazWPZ5E/SrCD7zTs4/NcayI/6CJBId29iuY3kWclim1wZ0jz
         4wpBksTO3BflWmGaA0cj1Q9UN2kJni5yQfCxRcRPTEgxRjwBQUy7mhvp1Hy4K8o+Ac0+
         J2nioZC3V0ww7cJhle3OlEQ6PGx91G8dLrrMWAgKd7i+lKszQ7/g6SCV5xbBgDt7tuYn
         aVWYzHEv06fXUNMtMiv56vCGy8/8Rp2ML8Cd3bBilCS1+b0YoymLVRGt6W0bYs/NWKHF
         TVNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775983777; x=1776588577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDtexGVoeBe7O/oFEf/W6TMi9rf4yNR3LevSP+v7lO4=;
        b=hSkB4szc4FrmLssQcSRaKL6mWr36KREwvQg3aKV3yAOETwpvGxLy9stsSFUvZQ3Ocp
         nQ/1xZR0Za+5qziTVEvCPHomlPQhNVwWx6ALDThkiXAn1vVSCp6IrzXfiiex1NOQzCq5
         8ShhKWYANwpxvtPbIIQk8kZ7z8+6KmHOcyYbgWOeHYPGbwzWpPaGagUcG5HYuS6xdEB/
         ReHeTxVZ41VhO48tm1xdnHfG5jqmJuZ2ciTMeJAkmKPdo7ibfugd8el1QMpxhmiJXVkd
         2wZ2Yf+w6KceZx4jaYkXddJ3wv9pTtG74efu6ocFj3COARUvChgLblTrxjje7W+t+hqq
         BuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775983777; x=1776588577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IDtexGVoeBe7O/oFEf/W6TMi9rf4yNR3LevSP+v7lO4=;
        b=GUqh1tTeDfv5xu7UOUYr2awLC58WdzLYGdcnZjdlx0iFLUh+uxFyzNzru/fIJDCeom
         x2xirB5YCq1qPEMjhrvPjRMU0mty3C44TtW4R+Ot1GAQZxF8AUQmxoF3E1M1gExxo009
         huD763lHHdbwHds0ZYytMuEJkU1TDiD9LRgU0deQ54xruudSppFYDR0Y+CAIKedJ0qLg
         Gd1HU+cP411DlUn6ujGU/RY1pC/nmt+BmXkecY0mSVVdL/z3FiGl1lPXMhe7fUXc+1N5
         SbGAYfw4TCXE1aVeVdGhwAyS41tLn6MulqJHUVnZyiChaISpNe6AeHtnX9ZZe0sWK+rP
         fO2g==
X-Gm-Message-State: AOJu0YwFVB/U+i/VgenVCUoUL2/CMAUNfCN8kqMUlkcZbjflPRfX9aJU
	aKPlC4slngCOoOAzgYHjrRMpUXaU4TtlaW6ejaNKpufLOaj8WlYvbugmLXMUHIbQkN9LivG9IAU
	yIyjKVYxNmWWYB0s84poFaBX5R/V3K1KAnPQ1e3U=
X-Gm-Gg: AeBDievH4PUxzDKmwT8/SvmV65De8QYK/+idNgdTvTZH7Gz87YWEBJcfn/O/sn98Wit
	gHhOKekSdZPijnk7Z1ILO55mLxHoLqXat2Wp0VcLgjPgkfMOoC4elyUyG6z37Nf9jm8GaD/+RDI
	xoeN0hSj70FcszVDo4SyAeSmbrlfBUsVeacMjFhJN+8kN0sYdBiESWwCqj7zexquu9Zjtm4Xaza
	v+ABB8g7Y2hUpgFjTOlnpsy2fdhjSURj4fnDRW8Hwj2T2r37GB0cNZUKVf1B9jOU028elmt1nhT
	m1CZa8LoN8pdA4o4tVfftceqEu6qeXCwTNKHMPdobhirNYLY6PI=
X-Received: by 2002:a17:906:f594:b0:b9c:cc42:9c73 with SMTP id
 a640c23a62f3a-b9d72661455mr464573166b.30.1775983777128; Sun, 12 Apr 2026
 01:49:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403150128.488513-1-mattst88@gmail.com>
In-Reply-To: <20260403150128.488513-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 12 Apr 2026 10:49:25 +0200
X-Gm-Features: AQROBzCm4T-kPUj32nMZBIpMNqTvtaFwOgIJEcJtDJGcWZIy8pEgzzTQDmJt8WY
Message-ID: <CA+=Fv5Qptw+NXKwKh5+YDos9EwohT3DJ_Ef3AW7O5KiMGag=KA@mail.gmail.com>
Subject: Re: [PATCH] alpha: Define pgprot_modify to silence tautological
 comparison warnings
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 5:01=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Alpha's pgprot_noncached, pgprot_writecombine, and pgprot_device are
> all identity macros, so the generic pgprot_modify() produces
> tautological self-comparisons that GCC warns about:
>
>   include/linux/pgtable.h:1701:25: warning: self-comparison always
>   evaluates to true [-Wtautological-compare]
>
> Since all caching attributes are no-ops on Alpha, define
> pgprot_modify() to simply return newprot.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/pgtable.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git ./arch/alpha/include/asm/pgtable.h ./arch/alpha/include/asm/pg=
table.h
> index e786f630de5c..849abe2a1f98 100644
> --- ./arch/alpha/include/asm/pgtable.h
> +++ ./arch/alpha/include/asm/pgtable.h
> @@ -126,6 +126,17 @@ struct vm_area_struct;
>   */
>  #define pgprot_noncached(prot) (prot)
>
> +/*
> + * All caching attribute macros are identity on Alpha, so the generic
> + * pgprot_modify() degenerates to tautological self-comparisons.
> + * Override it to just return newprot directly.
> + */
> +#define pgprot_modify pgprot_modify
> +static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
> +{
> +       return newprot;
> +}
> +
>  /*
>   * ZERO_PAGE is a global shared page that is always zero:  used
>   * for zero-mapped memory areas etc..
> --

Looks good to me.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
