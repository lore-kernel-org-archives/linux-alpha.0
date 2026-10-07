Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D04741D10D
	for <linux-alpha@vger.kernel.org>; Wed,  7 Oct 2026 21:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791409186; cv=pass; b=ArjTgPRUIRi6+Rdkuv8XUJmYgKPVry/QKsB7HEyhK8axxrBUxLYVD/PsIOEojq0Y0X8Lr4jNYb+6Fol84GE13C7hCULntzZo0Vbm4hnc4b+v3/8fIOHgO3FiO+BPHerJhPBrZJ3psVjkKQNJMzY4LBHY1sCkuP/mHugaMu16eKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791409186; c=relaxed/simple;
	bh=JWyzPvpHBQXTzwd806QqR5HZOKZL3EpwVaQS4P551iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FBlSv8EFsyTfb0hA5sTW4Z2fxu+HZ6HG7uvKuKTUemK00vBVhvlTYWemofv5jHtyPGvNIKI7cAZBCh2zhR8l33nld9MgrA+clOUI6LchhKE0mZjj0brKFxqazRVSnUCo6/fB+l4KInrRCWYJwN9xW59Z5rJMQrlkn35Z4KwFx/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyItYuDf; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyItYuDf"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6aaebeadf3cso4305651a12.3
        for <linux-alpha@vger.kernel.org>; Wed, 07 Oct 2026 14:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791409183; cv=none;
        d=google.com; s=arc-20260327;
        b=XeJ9qUUjIXAsffCM7b8sUmhMceD7RdCw8Bs8wTLpVouShi9dXMBFyH/PQ0QcGIEyhI
         BYVbCnMXKF8lWUJDAab/nK2KhzTorYHBRPIdRwvgia6deUTrGt+rnuWwmmQNkAEkoeXk
         Bg9pq1zMZfmNKHrkwlqAenknWvIkdN3qAownE6IygALriiG1e83um26BHicLsd9gMv5K
         BFiHr+W8mZ+JvNSCs1t0Mts00K49dLS6rgF+0jV/Dnnmj18FuYcRnif/QetuVc9hjJ0p
         gVdapCSukHnEkxo8/PfUGI+X7zF2/OYwFKogYfNEM4/d2gSqsGiA2i2O80rAxMGy4B3U
         lJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Wx3j8s7em4It+YW2aPLKaUN9j3qGpzQEd9/wpoKXk0=;
        fh=PwQNmA70pCG5EEIXGURevXabYU8/mWe8mZ9rS3jQ3yw=;
        b=lOxMvqPNr96AU8NkoL7xzn6uKcWDe4PXhwVjZshIiBp4qiVzvoreXwrOtDsdO6ZE5I
         0m7zh2ON+f5ESR/iheQSDSmdbd0VPeAjRe/5o3JWes6tNlPEXTldtFMnWEQ35/xq0+gy
         maFXncXtMXVbKT5HeoC6pTEZHeXYU3PDO7KKC9cSq6tq4MsMEkCjhfJK0A0yvL2GAPCp
         HlSaKy+3Cps/FpbqC8gNUMpP0P9VArpcxNsy/yAQMf4oHthacyjMjrIduP7qm8efE8hH
         xjRzaoSdVTTmYaRImoE/7eW/JzEjpvMijMchh45JgfGtDtG/i5VtPif3471KIVeS5ULw
         70EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791409183; x=1792013983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Wx3j8s7em4It+YW2aPLKaUN9j3qGpzQEd9/wpoKXk0=;
        b=lyItYuDfZEizGw12eTzsXvcr3yjV2dsXijbNh6XIvNbuajd6cJ95NxEFJPKgsB7iUS
         uKZjNLgsx2sahJFPVMvm2Vg7pPmmqGfhx3Ve0BuQEFZ+qmAB/oV9bLqMkz3RclDtaUb0
         Rul/GBAJyq4t42Tl1wUO3JQLLbMDnhddeMrnfncCKDQ85XhGDiIjCFwWIs5lbsvsck5G
         P52b5rZh5pvDK6c84PJ04KC76QFWyJrJbDuMlBZYyUhlF7FWWy5HuxICIuJOv3KcWPrm
         21Uxjp0fG8XwOcqRaFGXyhpxoo6UgVv45TuIsHhfGmwtedMTNWK2Phy4q2/LpGrgp8c0
         wRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791409183; x=1792013983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Wx3j8s7em4It+YW2aPLKaUN9j3qGpzQEd9/wpoKXk0=;
        b=KCEpRX1C/FTwsbw9GGx1uWjPghps6XJKTnjnXAE/ot8hYUsD3gC6AM/GEipKdVpkuJ
         Qz/jj2LJkcczA8cfwJspcNntFXGiYyHlaFUtGn+EppakCfzYVEEOGPX3hyDQ6mrm8vA1
         1YaFPFPfqeaH/SjAgsc2RWmXkalvjvpMdCDHSmeWiSrh5OqNiGZrrinmSINua+WCuVfN
         K/eAUXkPnWNVnj4277FyHanTBnetnSTdi7vhKKRyNWnAxeGxAMMRj3ZGW6wZIKYhxWxG
         e5wodP7M2sxblXpHbPL/tWLUaeUQwppvG8BsAokrz/y0ute+e1IipsOmIU6sIox64Kvf
         FlPA==
X-Forwarded-Encrypted: i=1; AKwUvBwTCxikyb1CFMG9cu8yB2fB3nN7zOOZlLmsaenNzavncV1y59exfnGXbe/WiuenQ2urMjXQnspQUw4dRA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLAYkX1jxO1YK2FzdnLjlAqqp+b2wmm2SwDstxHV/qJqPc65Tb9
	qzksSxEsNEFZiIdsp92Z1QzIqI6oaLzWG9e+xWejQ3AjikP75tpXdQhurcKnej20+NTrqe44yAn
	nzMcU8uZvZqbQi065uLf/w4de5grfu4Y=
X-Gm-Gg: AYBFou0YS6yzBbkQcLT0G9KqT1SbBmGhOmoEnCS3nc1lHOrQdpuaDo5MMcKod2UGnxe
	bd9JHMxwqtxFIqgYoGndgDLl7Df6YFPKoIw0uRj+tXGyOn5LhemPvg042TC3BaG7/FaNBp12RIC
	X313U8I/WaAEDg3rc4eVbu2EvEGDdYIfv6jm/paQfzG33CqoA6yFHT69p77E6lix29ChZ++VqBR
	awQf/ck4MIRCXyRPxFkq5SgCAFOCFhZs6zVdU8T99TJ93Jn1zoQtB8ADI9nhAovXD0ppI9pIjbd
	8Fvv4zpYeRMJBq+yuXyMQSLMaukOGTPkds0ATvtKe7BuiLvWYXoohvKLqTbkQdEEWwNYvqN2E11
	d93he301318FZBl1P1p2nH439cKcgWnlXMaXsPJvQbjHBNtxkYN4e
X-Received: by 2002:a05:6402:4488:b0:6aa:ff76:3076 with SMTP id
 4fb4d7f45d1cf-6aff47a80f9mr3341037a12.32.1791409182860; Wed, 07 Oct 2026
 14:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com> <20261006-alpha-hugepages-v1-4-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-4-a673a18aaa70@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 7 Oct 2026 23:39:30 +0200
X-Gm-Features: AclHuK8vegbe0yGNt0PdkgPJ1Zuj7G3aOsGulVX-hIw4x7EklG3ldXU5N1EvPa0
Message-ID: <CA+=Fv5SC4byEbdap5NpoqBgD7ZutMV8DTR3h5h8Pxv_jVOdB_Q@mail.gmail.com>
Subject: Re: [PATCH 4/6] alpha: define granularity hint PTE bits
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Oct 6, 2026 at 4:04=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Bits <6:5> of the Alpha PTE are the granularity hint, described in Table
> 17-3 of the Alpha Architecture Reference Manual. A hint of N marks the
> PTE as one of a block of 8^N physically contiguous, naturally aligned
> pages that the translation buffer may map with a single entry. With 8KB
> pages that gives 64KB, 512KB and 4MB blocks.
>
> Define the field and the helpers to encode and decode it. Nothing sets a
> non-zero hint yet.
>
> Add the hint to _PAGE_CHG_MASK so that pte_modify() preserves it. Swap
> PTEs leave bits <31:0> clear, so pte_huge() is false on swap, migration
> and marker entries, and page table entries above the last level keep a
> zero hint where pmd_bad() would reject anything else.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/pgtable.h | 51 ++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index d123fd0d4091..605b82f73a98 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -65,6 +65,8 @@ struct vm_area_struct;
>  #define _PAGE_FOW      0x0004  /* used for page protection (fault on wri=
te) */
>  #define _PAGE_FOE      0x0008  /* used for page protection (fault on exe=
c) */
>  #define _PAGE_ASM      0x0010
> +#define _PAGE_GH_MASK  0x0060  /* granularity hint, PTE<6:5> */
> +#define _PAGE_GH_SHIFT 5
>  /*
>   * The Alpha AXP ARM defines 8 protection bits in PTE[15:8]: KRE, ERE, S=
RE,
>   * URE, KWE, EWE, SWE, UWE (Kernel/Executive/Supervisor/User Read/Write
> @@ -103,7 +105,36 @@ struct vm_area_struct;
>  #define _PFN_MASK      0xFFFFFFFF00000000UL
>
>  #define _PAGE_TABLE    (_PAGE_VALID | __DIRTY_BITS | __ACCESS_BITS)
> -#define _PAGE_CHG_MASK (_PFN_MASK | __DIRTY_BITS | __ACCESS_BITS | _PAGE=
_SPECIAL)
> +/*
> + * pte_modify() must preserve the granularity hint, or
> + * hugetlb_change_protection() would turn a block into single-page PTEs.
> + */
> +#define _PAGE_CHG_MASK (_PFN_MASK | __DIRTY_BITS | __ACCESS_BITS | \
> +                        _PAGE_GH_MASK | _PAGE_SPECIAL)
> +
> +/*
> + * Granularity hints. A PTE with hint order N is one of a block of 8^N
> + * physically contiguous pages, naturally aligned both virtually and
> + * physically, that the TB may map with a single entry. With 8KB pages t=
he
> + * four encodings give 8KB, 64KB, 512KB and 4MB.
> + *
> + * Every PTE of a block must still carry the PFN of its own page, and al=
l of
> + * them must agree in bits <15:0>: the protection, fault, hint and valid=
 bits.
> + * __ACCESS_BITS and __DIRTY_BITS reach into that range, so young and di=
rty
> + * updates have to be applied to the whole block too.
> + *
> + * The hint is advisory: an implementation that ignores it still transla=
tes
> + * correctly through the individual PTEs, so it is safe to set on any Al=
pha.
> + */
> +#define GH_ORDER_MAX   4                       /* hint orders 0..3 */
> +
> +#define gh_cont_shift(order)   (PAGE_SHIFT + 3 * (order))
> +#define gh_cont_size(order)    (1UL << gh_cont_shift(order))
> +#define gh_cont_mask(order)    (~(gh_cont_size(order) - 1))
> +#define gh_pte_num(order)      (1UL << (3 * (order)))
> +
> +#define for_each_gh_order(order) \
> +       for ((order) =3D 1; (order) < GH_ORDER_MAX; (order)++)
>
>  /*
>   * All the normal masks have the "page accessed" bits on, as any time th=
ey are used,
> @@ -269,6 +300,24 @@ extern inline pte_t pte_mkyoung(pte_t pte) { pte_val=
(pte) |=3D __ACCESS_BITS; retu
>  extern inline int pte_special(pte_t pte)       { return pte_val(pte) & _=
PAGE_SPECIAL; }
>  extern inline pte_t pte_mkspecial(pte_t pte)   { pte_val(pte) |=3D _PAGE=
_SPECIAL; return pte; }
>
> +extern inline unsigned int pte_gh_order(pte_t pte)
> +{
> +       return (pte_val(pte) & _PAGE_GH_MASK) >> _PAGE_GH_SHIFT;
> +}
> +
> +extern inline pte_t pte_mkgh(pte_t pte, unsigned int order)
> +{
> +       pte_val(pte) &=3D ~_PAGE_GH_MASK;
> +       pte_val(pte) |=3D (unsigned long)order << _PAGE_GH_SHIFT;
> +       return pte;
> +}
> +
> +/*
> + * Swap PTEs leave bits <31:0> clear, so this is false for every swap,
> + * migration and marker entry, not just for ordinary small pages.
> + */
> +extern inline int pte_huge(pte_t pte)          { return pte_val(pte) & _=
PAGE_GH_MASK; }
> +
>  /*
>   * The smp_rmb() in the following functions are required to order the lo=
ad of
>   * *dir (the pointer in the top level page table) with any subsequent lo=
ad of
>
> --
> 2.54.0
>

This looks good to me,


Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
