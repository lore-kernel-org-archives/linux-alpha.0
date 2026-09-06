Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A0B36897F
	for <linux-alpha@vger.kernel.org>; Sun,  6 Sep 2026 19:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788724409; cv=pass; b=btPt3B9GataXS1rR5XIzQrAUFBR+W5ragpgjn3OkbZuQ8cw6785on1W0uFcCdnHxUmhkPR9kSZSDvwLcJLVzGoH1vO/6rwz7wUM2lQkABBudoaqwBLTJM82rbITzrQU17WHvzY3/0Qhemmqv/EICV/nvsbTWsFtVB1XkPav9WYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788724409; c=relaxed/simple;
	bh=hSYT7Bdx66+CfzHQHP4O4JmmdfZPM3QZr35weq55SDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWFqfXwPFo4n8KI0oLm4eGCILT1oBajxPHS4qLdCxca9LOpTlRO9M/0m2hWI2FYwDYhvpI4k10G79lmfquAZrBQ5DH2A98ayz1rtSvjaRi539x/vmFhptBkxrgY/4JHF+iUNgCoCayUp2mZL2zbgBR0tRHwV6aEkchQz6BcwcWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzWMh9UC; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzWMh9UC"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a668ce86abso4274543a12.2
        for <linux-alpha@vger.kernel.org>; Sun, 06 Sep 2026 12:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788724405; cv=none;
        d=google.com; s=arc-20260327;
        b=cBTuT8Tgti/k4aVPoLaSqO7rtZUVEQH5XlcIHOjJ6INgYb0vBZiTd+TUlwOYrJO/qZ
         IVtRlatNnLkNBwfwv/fsgAww1PAa3Z+t5GdSDpXtBqND54wXL/HPJ5mD+tYE70VedftJ
         pxbBBB+wPGaMYzPTPZTR3MO8ea7nSAkkI4NqFcvEG656dxJnlJqq6J+XdgikZ3ElJA1s
         xA7VIT8/dfoQFHg26IobxE+SzWN0nME1hVMjBj32i0cMZO/QeMthE4THqMf7wKUm7S4F
         g/qBfsBpKBuhzJePjQteEWfqeHlDivibyb3EmP73htg+l1JuicHCO8/dtO1SISobqeMN
         WJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DxbCH9V+QwRl/rwfPKpCRxtVrgQCFOwACk6jwY2+Cv0=;
        fh=9G1WElDyElc3pHygiZ98hHkqG50HL+Eb8NL7IC85cXg=;
        b=FYLw7rq41GqB4eGxTSh4oeTZUoyZThxBku1ma8G9pd9QQPiGuAVjsvzcPwh6NBOTZg
         RCT8eYZlJvpYNxdX2Tw8valSjrEtUkV8DpMs3CVfk2rddxwAa/LCK0hEa+bPV0PKvu1k
         cqu/2sOzc7G46gCWTcjI4yQS4+tYVoJiHDEIz35VnrB7sOIz9BsevAdGUZiNKo80wxXb
         54We2ADhRHRSNkL17QFtmJm9E5JFUKlWHGEJQ/sqwW2DXoAuc206+21zlGB2pyc67ATi
         PIeb6J7ke1UVfCsKln3eyTFBnFoQ9rLzQPMkuyPhUXCtZ8dHvb+/bEa9PU6QHmLNqVtw
         kYgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788724405; x=1789329205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DxbCH9V+QwRl/rwfPKpCRxtVrgQCFOwACk6jwY2+Cv0=;
        b=OzWMh9UC5Kh70Ch1R76xE23eGWOVSAOID3BsCrc6GAuvQvkWJkBfFLRCnuS7qE/17q
         iUdFtwm4UF/sSJ3QpsE397YLo/s6vZXPFJa61RmwO4QXP8Uu88IQeIOTPVmFCrjF9oxz
         DZgta+HbGgxnAxBr8h3kD7WTlwaixQOL8bXiDbMl7NPNQCYaO62HjERqH1GwyuQlDTC5
         lVbofwBXHIxWrcE4gRdYfbLZ4wJJ3tBLuMEXwFraHgxndjVGMoupiT4v0pTNJRsaQ1eP
         NVkX77abMv14+Vj7VdfgYNRJIg53PhjuLRaJchOji1d6CsxXRDzixu0iHviIuCqHv/QT
         cJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788724405; x=1789329205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DxbCH9V+QwRl/rwfPKpCRxtVrgQCFOwACk6jwY2+Cv0=;
        b=rSyDKGWL/yAsRQvTsm4w27SuqBY7F5/pCMpatBwmt/2vSq6BZTsf4PII+Nr6OQo39F
         qksi0YJwkJ51xRiP1yAXRDjDvef6KZv3gzjxcDUEaaimwO83ujhxdWT5o/G/J5lHbf7b
         V8YwXOtEYM3twhr54Cslo6cX4VgRJpHv/GNOEWyImaI4xVoev88L/tJy5aQyepK7gbBD
         OIobBSZr7rJpzSNHADM5Zx1m+oO0gVGBntLQGfVbHIpnZxIyrB5KYewT0VxDxmuUk1hr
         DIUSr+qdDFlTzwSKp/v53zZUZl/VWAVGvthsqJm5OaGedjEaBTTx2Up3XJyALimhMBVC
         rDPg==
X-Forwarded-Encrypted: i=1; AKwUvByo4/9wohHN0jd45YcuImsl99hKdHlXglDK+FDbwWTO3vFGOKVUjsFeGfgu6eyEu//WUUkgZebYoS/lvg==@vger.kernel.org
X-Gm-Message-State: AFuF++n3jZktgiCKlFasq1Gg/86esW2SvQwK3foid93F2orCcpdn9WSL
	A4ETqiBhlq+/AM4unr0B/iJ9f3D0BtTgcsjmQrtKz63Nj5YN3jniPtX2ll6GhkZu2nqWgRunm3I
	KQb9gYzAzXGEKZfxR5SXeukauNk8mCrY=
X-Gm-Gg: AYBFou3fvOz//Lmn5TfBYRZTlsU1QOitX1rd7p+Lqd4hSDatHWrThS66UttID5idrD7
	k2zuWcsd4JVgCuNr6LgNoAILWFnUbPR9cY1PAsb3Oa6dwnNpnAvzhH7Ww0C1S/275zUUQVfCDGR
	s+k/TtA1P5yfuUuXS0mTgBAqwTCRBWJkOMlpHnK4FG5qTXXzaoRBiCa8RtpsYu+DNO0gmbgpD5u
	jQRVo/6cDPOqLLLb9j4UMsyp33UCh77MRF9SSOs9/07PA2w6M1lNjxXWlcu3RX52wIJf5/PUnOk
	4aB4gt3y9MdOjZrcU4xIm2vY0JxT3eNttKb6e0u9axfmxJ+BlaSuXOe42mQbqSq1ch1o40gviwA
	hJf595Dtc/6HiFYsTdpahT9ED6VkzDVo=
X-Received: by 2002:a05:6402:270a:b0:6a6:32f5:90b4 with SMTP id
 4fb4d7f45d1cf-6a7e90a5f76mr10811303a12.22.1788724404883; Sun, 06 Sep 2026
 12:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com> <20260905-arch-kconfig-options-v2-v2-13-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-13-83e8245761a2@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 6 Sep 2026 21:53:13 +0200
X-Gm-Features: AcwNN1XQRPDvO4h0CLOCTqDWdsWEz7RUDSJzPl7o_oxwW7z9viJRHQIo11NfJJY
Message-ID: <CA+=Fv5REcH-Vj71gWidKiKiOvFUULV-uNKBP-sZGJ2XwBQa-BA@mail.gmail.com>
Subject: Re: [PATCH v2 13/22] alpha: add ARCH_SUPPORTS_PAGE_TABLE_CHECK support
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Kees Cook <kees@kernel.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Sep 5, 2026 at 9:29=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Add the page table check helpers needed for CONFIG_PAGE_TABLE_CHECK
> and select ARCH_SUPPORTS_PAGE_TABLE_CHECK in Kconfig.
>
> Alpha does not support huge pages, so pmd_user_accessible_page() and
> pud_user_accessible_page() always return false. pte_user_accessible_page(=
)
> checks for present PTEs with user read access (_PAGE_URE).
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>
>
> Update the helpers to the three-argument pxx_user_accessible_page(mm,
> addr, pxx) signature introduced by commit cf8771ca4cdb ("mm/page_table_ch=
eck:
> Pass mm_struct to pxx_user_accessible_page()"), matching the other
> architectures.
> ---
>  arch/alpha/Kconfig               |  1 +
>  arch/alpha/include/asm/pgtable.h | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 1d28fa8d3b66..da4ec8399517 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -19,6 +19,7 @@ config ALPHA
>         select ARCH_NO_SG_CHAIN
>         select ARCH_SUPPORTS_ATOMIC_RMW
>         select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
> +       select ARCH_SUPPORTS_PAGE_TABLE_CHECK
>         select ARCH_USE_CMPXCHG_LOCKREF
>         select FORCE_PCI
>         select PCI_DOMAINS if PCI
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index bdff33b505bc..6ebdd90f3035 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -232,6 +232,25 @@ extern inline void pud_clear(pud_t * pudp) { pud_val=
(*pudp) =3D 0; }
>  extern inline int pte_write(pte_t pte)         { return !(pte_val(pte) &=
 _PAGE_FOW); }
>  extern inline int pte_dirty(pte_t pte)         { return pte_val(pte) & _=
PAGE_DIRTY; }
>  extern inline int pte_young(pte_t pte)         { return pte_val(pte) & _=
PAGE_ACCESSED; }
> +extern inline int pte_user(pte_t pte)          { return pte_val(pte) & _=
PAGE_URE; }
> +
> +static inline bool pte_user_accessible_page(struct mm_struct *mm,
> +                                            unsigned long addr, pte_t pt=
e)
> +{
> +       return pte_present(pte) && pte_user(pte);
> +}
> +
> +static inline bool pmd_user_accessible_page(struct mm_struct *mm,
> +                                            unsigned long addr, pmd_t pm=
d)
> +{
> +       return false;
> +}
> +
> +static inline bool pud_user_accessible_page(struct mm_struct *mm,
> +                                            unsigned long addr, pud_t pu=
d)
> +{
> +       return false;
> +}
>
>  extern inline pte_t pte_wrprotect(pte_t pte)   { pte_val(pte) |=3D _PAGE=
_FOW; return pte; }
>  extern inline pte_t pte_mkclean(pte_t pte)     { pte_val(pte) &=3D ~(__D=
IRTY_BITS); return pte; }
>
Hi Matt,

I tested this on a two-CPU UP2000 with PAGE_TABLE_CHECK enabled and
enforced. A userspace test exercised anonymous, private file-backed,
and shared mappings, together with fork/COW, mprotect(), madvise(),
PTE teardown, and refault.

Single-process and concurrent CPU-pinned runs completed successfully,
with no page-table-check warnings, BUGs, or oopses.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Regards,
Magnus
