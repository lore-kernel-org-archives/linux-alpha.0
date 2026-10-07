Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE843815D0
	for <linux-alpha@vger.kernel.org>; Wed,  7 Oct 2026 17:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394316; cv=pass; b=l0Lb933NVYYkgMTkXyEudzWb4Q0Q6OHGLs3r+bJUfytdaV/N7NjTlSFutrmAvCqgSQyq4ze21i9M6pbumzAdJGSxTJNGarlnefjFtjhdeDJeut5/8eqS0jUipV6VqMt0fD5FlzTqwWr8maK3xfw7h5mum+MhuM4bvTbEgjXDoOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394316; c=relaxed/simple;
	bh=hEFs0Dw56zPPRQdsZEk2+a+v4IXYQPajTOT07U85lwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/E27PVLVTWDL9kdVyclZ662Z2eqBrkjMORIwmXsEyTOsMoz6eizIv7AOJDihr7DfD8CvsDUlKP3R5XsiSHWSSGvIqwSSqdMr2Zk+eP5aDnWx2Gl/O5avG0TmOrsdouO3y6aY3pqUJ5HdemIWtNFOiSnG60wvgfQCp1yyXd3TFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3JAV2M3; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3JAV2M3"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so6199415a12.1
        for <linux-alpha@vger.kernel.org>; Wed, 07 Oct 2026 10:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791394313; cv=none;
        d=google.com; s=arc-20260327;
        b=GrIEq9xSOg3chSlOR2TXW8caWVWEYNlFbhAf5ZCuVBZBD1vLuNKWvyEMSupvp2LWJV
         3uqg5aQA1WzGhFYvYSJyZc9xKYDrQqf8ionyeKnd27IPl4itlL6K3qOXYGcq402Ex5CH
         C+voNWv5ybpC0ZBvGZFzmexKN2bLwhGsd/3kWeTmIvWWp1NALQ4C5NdHwW7mipQlt7jc
         ZiiBFlcSlGm39wEKfvyEIR1Rv23vfsvx0ywwgGve+5/fwY7byMbhUVT22/wpJmqvOjNy
         kDFRF0XZzTSjBbeqTnxw0LKmsL+atOGuUoDL6tRHttWA0I0tkfk3PoMmRh6t7nAv5IHC
         zyuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lYmfqkWmWKlcMC5OV6H0RMT0NW6kLXjPokM74C3xA64=;
        fh=D32Gf07xYnLypM+/rxphFEKKV3kOmqH9CwWAOSE7Dyg=;
        b=bzXio/MjzxMPYxRAnFb3dihHbYhNwOlxDIVjk4xQw1U+GQdSi2Yy9oliwkSGya00oy
         ag6Q1UukEH1I8NMpn/qOQChBcSJNBKpNh9ovfDi9qRFCoCKxXS1+x9Y9PdD+RsFykMoX
         vd1iO42z0kk3ycMD8bxO717euHGyOaeFS7fm0xShASF7uuVkncOUbHRiydlsDfYTZ6BK
         PN0xZLJYr/2WLi2rPoEz/mZREYBDpAkza/KtUjRZEhca2BGo9PT/CDWdKPDBhAleXz4E
         7klHtfbnTfLVFG8LaulJDENBWCdiBXUKZEYgHgdObbDvJwZHTPPloV9/oOTMcCtuSHgg
         OZcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791394313; x=1791999113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lYmfqkWmWKlcMC5OV6H0RMT0NW6kLXjPokM74C3xA64=;
        b=W3JAV2M3iBhtUy+65ZgmdF7rioTXgTGZ+w0OpcPVNQO6ttTO4GTGBWESBj/9SutmHQ
         psXG4ryL2evLjrOxbw2H8217bAgVuWsxTEgSaeVG66YM10CFUNF7bF/l23vYfk4dI5e6
         QPuUPgQKaFZrMLILKYWbIz3LXOSvXb+AHy4DpEw97/iEgLvM6ZwP9oIsByKpcenwSD28
         UZ4XLOV36SUSCLXOdcXfRssV3Zgo+1ZAnGY0FCxGKKTXlmqaCNH8cPGX1qw8BDEf7upf
         4hvVV6q+kedFAfrusBpK4syJHxKPzP+jPzWfhR5q5KdW4R1jCyqL4eaAoRrD2hiaSJ6W
         suHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394313; x=1791999113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lYmfqkWmWKlcMC5OV6H0RMT0NW6kLXjPokM74C3xA64=;
        b=trA1XRU2slTB6ldREWBfmUiuhqxUFhUxcvx1RpsslLiq0kc4iKDJcVuE69mUFWcNma
         OA8XET0Z34t/qD4F78C58SBB8Hqwo6asDgQtezOp4F9yGPBFyRkiM0y7NSOvs/r257xU
         p6GPuyAeL5bEtO0mdFWJZswVyBq8lKK7paDrnUIPWYRQbJE++PWOyLA2W9e5TPfr6lG1
         P8PaB08L8UFwWYjLR4KFZWYVz/tlbxeZ13pGtfh/iBuwYhFgbSGtpPOGEv2Vk6YI1sfq
         bB2LcZ/XuV53T317Bsp2UwbfzjDqX07kz63NUlcK3ZpWUJHmsUvCOOsQnHEfdPKemmaY
         Dufw==
X-Forwarded-Encrypted: i=1; AKwUvBwYSBrGgn5xOYMJFcDiVKRCNu+Xky4laFE5o1PfR/BW2WYSE4rA6S4HO5t0RVh9wFgV8pgPbZGSIgX6Qg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJtebLh65Tc+AbhxAezVTWGA4Y8EAehOif6AqeMs3rs1KAt85gV
	W9RF3ivsSlABywSAWgT/trZb5/XOn3edyVm0lE9K3Err24dKBXVSR+OB43NRTky2YBmEZGYbXl9
	nbu87NN+TYvKzcvpiU7yAPmInEWy5Coc=
X-Gm-Gg: AYBFou3ZY2jib5x25arH564MwwwvnbqV9J+wkBMpz/RKk7Qkz0Gac1PqLeDR0QUYhzV
	UPRRCXWBdL0vfgM7F1NQYgXLsvkYMBNRVyG19UZ70EiwwRk7BnEx4zMOxRu7vzYURbAncb+J8Ev
	2WzoAFNcwwllwwIwsldziI6H3RrVvV5y1hmpxtlYbP6gK7GHL0T1QjjDr3Lhw2sWmyctDoJwtIZ
	DDr6ziozwRMizYGsk88NVUQEFN614i2elcNU49GKW4qVEK4hQrWHydIC0qW6pdH0+zgq3BkG9ph
	Poj0gyIYxtx/OMfyogX2kjCXhCtbJTnUgJPF/GVa+jfIfYga5kfBaOG+ill5b8cquPkdnFUrV2K
	7Vwo6Zi5ClWdNNZtngouDk8vNkAVKnFxWFzrkkfq43A==
X-Received: by 2002:a05:6402:5112:b0:6ae:16f5:5bf0 with SMTP id
 4fb4d7f45d1cf-6aff3901a70mr2828026a12.29.1791394313288; Wed, 07 Oct 2026
 10:31:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com> <20261006-alpha-hugepages-v1-1-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-1-a673a18aaa70@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 7 Oct 2026 19:31:41 +0200
X-Gm-Features: AclHuK_xVEaI7ZERJacz1HIbeacaTan5r5Wv6mnxZ57dQ_8Emz8kC0MqviECPEA
Message-ID: <CA+=Fv5R+6mvrHSrGBAtX-BfxMyt3e-aD=Su6huF0VdDno35P-g@mail.gmail.com>
Subject: Re: [PATCH 1/6] alpha: add missing page_table_check_pte_clear() to ptep_get_and_clear()
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Oct 6, 2026 at 4:04=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Alpha's CONFIG_COMPACTION-gated ptep_get_and_clear() overrides the
> generic version in include/linux/pgtable.h but omits its
> page_table_check_pte_clear() call. With CONFIG_PAGE_TABLE_CHECK=3Dy the
> map count taken by set_ptes() is therefore never dropped when a PTE is
> cleared through this path.
>
> Add the missing call, and drop the now-duplicate one in
> ptep_clear_flush(), which already goes through ptep_get_and_clear().
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index 6ebdd90f3035..8a175e0c2b42 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -305,6 +305,7 @@ static inline pte_t ptep_get_and_clear(struct mm_stru=
ct *mm,
>         pte_t pte =3D READ_ONCE(*ptep);
>
>         pte_clear(mm, address, ptep);
> +       page_table_check_pte_clear(mm, address, pte);
>         return pte;
>  }
>
> @@ -316,7 +317,6 @@ static inline pte_t ptep_clear_flush(struct vm_area_s=
truct *vma,
>         struct mm_struct *mm =3D vma->vm_mm;
>         pte_t pte =3D ptep_get_and_clear(mm, addr, ptep);
>
> -       page_table_check_pte_clear(mm, addr, pte);
>         migrate_flush_tlb_page(vma, addr);
>         return pte;
>  }
>
> --
> 2.54.0
>

The misplaced call is mine (dd5712f3379c), but it only became reachable
once page table check is enabled for alpha.

The consequence is worth a line too: with page table check enabled, the
first page freed after zap_pte_range() hits the BUG_ON() in
__page_table_check_zero() (mm/page_table_check.c). My test kernels
have COMPACTION=3Dy and PAGE_TABLE_CHECK_ENFORCED=3Dy and run
clean with this applied.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
