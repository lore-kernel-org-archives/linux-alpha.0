Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D50639A078
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 14:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469685; cv=pass; b=a301yPLz3YZmQp9MXSvuwfnYM4+SxL1O/QZYLDYOCFxOtDYm/cHvKZjYjjn3gaMwkeaGK1ZEsJZZnmblYlSZR3pMFLN/zAqUxVSUEMhWVVXbWb+e/DVaEa9fjZcGgnyCw+PwfJ6NruIuvn1u17U8W8B0f5k2phNB0fOBOINM8iU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469685; c=relaxed/simple;
	bh=keOSQgCBg5o9yF+yqfS+kAZznzz3Kp36g6dua0RP338=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5yilLBi662RcA8o4JIlB4Ok1YQGp/TB1/s2DwNm+mVDmXiNPqMjLZm781ZIUTLcktWRpYwAJQdlMtPsJ/Vucb8lwDLk7JDsLdIlTiSb5tOuhjk4z0Q+PQA42mjaDHmMR3DaL19rwcRlma915tDQQjAV/hWAUyf4sJ5G6EdryPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Da3JbWQe; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Da3JbWQe"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e8e738ae0so478686166b.1
        for <linux-alpha@vger.kernel.org>; Thu, 08 Oct 2026 07:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791469682; cv=none;
        d=google.com; s=arc-20260327;
        b=KlfqTXzaTGutmK06L1hZPC9P3hM67bqgo8I1AtGX0vwjoFYrEJaA+45hnGhegYw0J1
         bNSxbS8gmAhIzjdYSNoPtDkCQhxht99z6nXgbKmHEd5VzGFLV6ljlqPDnirMaIYy7Ecv
         bm9A/OhLK8drwNxtWK8d0mnVDv0oaiMfU7maImHSNDooXEJKRgUMZVai089QYcG9XtnV
         I3yb7C5fMCNWF1mY8BGz9jhqu9XY0KBUB2UQR1ehhmYTsuxwbLR7+sNWT3xhmfPA2NtX
         ioJxGZrKhWPlYHeS6EtJusenP5JqKTu2OsfTXdH82rfyVhZzOk7lk8TCKDnKzlliKb4M
         YrzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ZGFIe06azsu9BMIbRvkzv0DNeRxdepAkNT9gQZRAmc=;
        fh=QSmtAiA7RjLgKmjnblCiHypsuVh+fd+OIlxLBECgojM=;
        b=ruMp3KezbmZB9etIUz1L8g+wkt8YRNwjdfEHa+o3RpTrLIPn5yaV4H9BRqMDu06sWh
         iGoLmIkKEPg0NI33OBfUM4fk4s2bThkKOew8+Jpl7B2XOgAP4tM9BcPECy1zKTOesjOQ
         f4xw/8LXcRfIXlEobdfSxOIO0Ij0aUt5Cv3se3kQ+ma0a5zB1yW60mhY3Gxe7XJYOWnO
         zJw+7tdNJXa2PaMvid+39XmsKBdOsYy8QMQ3DaFnAABW4LLiYedJZqEAuxOXy+RNPzM2
         kGl4ZIm/jNerrdC08qUDlDnDMDTN0k0ciUidZ5Q9TBQEyCNCHOIr8+3zw0oCpS3lyzuz
         Nemg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469682; x=1792074482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ZGFIe06azsu9BMIbRvkzv0DNeRxdepAkNT9gQZRAmc=;
        b=Da3JbWQeOtcpPXfQI66ZICgXO1r2Fqmrg5UUtPSXnS/O5xdNmymUeL+yjv9372N/lU
         FfpcMCvhxoSwG7FM3K0wqIJfRrv0q7OuXLm/PzIrU5DsZ312S8zSPycY1NFvlPdE6lUp
         /libW7P1jYEDs4i9LUl5aPDzrMgVWdDaaNek5QZU+eyF2dmN0CqQMOSpn+Q7cxS/WEWT
         g0giq5KVepyTxr6szWhuTCXzG3bP51Y/Ft6p/7Iz0VkzIs/XssBdus65nyfiU3XqpFCI
         HgfFBNcjmRnTsQlLNlBITOwrkpJ6jKCA8goMYvZpLodBR7cOIfzUN6Eq5BePhHOVrGMs
         PFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469682; x=1792074482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ZGFIe06azsu9BMIbRvkzv0DNeRxdepAkNT9gQZRAmc=;
        b=COPiWGAlv85UI9uECUhhLgZSlfaCgQ2uhulKvjv8EbJSQ2dYX6Lw1iA4FSZ8HNHzOp
         1OywjWvXKgupgIOLWRYsH12GTRwNrP9SY1t+AH866icLdz9PYjzAi0HnJCJn5RA/B2cb
         WO0xMvHyrLFSwlLSnSPkMEqPO3tbB6AiE8pBuBZcUcXG1OxTrPJx8ZvVjlw5P6q7xI3p
         I/YlyuBW19/hBOEmyrrGV3tH06MGpo9adMN5rkNmO+S8RWpQrYRJ2skFTvJYm2JEuh8b
         bEJCFEZ1/rwPZc+npWgDwopSiBK9KQuqiUqilnBzlp6duZo5wLTaH+OUE1XdvCEzTwoo
         X7Cw==
X-Forwarded-Encrypted: i=1; AKwUvBwW2VoJVXBsTq3hzL+MUjcIiB/MfbIs56qUsprEAAR3JuaeEH7UW/DaFNKMk5aGu7yrAw7by6l3b50uCw==@vger.kernel.org
X-Gm-Message-State: AFuF++kY/ZK6fREunFkCZRTHNc1pNiPCVIBAQ0TYRE/lQAdP3dCw6A6F
	6VGsAQmI8Y4hO6O3eCXJHv8/4DiV0/2Dqhb8NOrzuB9bjAtOvChVxccNBw+mbZ4j9mbACMC/a6T
	+Pj4GN3CMSpU+7Mjwdkt5NHhH/mcoLD17L/ZO+4U=
X-Gm-Gg: AYBFou12wawQG+sluKXSy9OXN9jw9zJruZiW5gc0+D99pPpvy6f+8b0JYpf+fXMrkPQ
	YITq+xI56YYODMA2hUlX3unI2fNIr4jfzzNb9iuoLbwrbKvtc+oxNfVqVRqQNdcmNcFglWk7Nwr
	n4UTSU4NTaOAnl26Q2hVIyeWHaZXBZmZpFeaXWPvus8bA3FjKwzm3ptIZSJe081GOsnLc1aaxpt
	6T49Reb6kwnBta9rnfFgixAT3IbnN6dK5AQAMMjYhuD87LKP9AMGTb36qd6AWmOdR0l5KWx4fVF
	WIcJ8pKugLjY6dDqiILDzcNlHa9QbMrbtuwWpiJ8GcwAVR9Fiy1MLHlT/NBdYCTfBH8U+Qsj/Tp
	YI6ifzcgoKcXfKqYrzHw/bBFFf9uWoZaQQ5PRIx0AXg==
X-Received: by 2002:a17:907:c17:b0:c29:5340:182e with SMTP id
 a640c23a62f3a-c317bb4d250mr588692966b.2.1791469681494; Thu, 08 Oct 2026
 07:28:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-alpha-hugepages-v2-0-8e108af2d961@gmail.com> <20261007-alpha-hugepages-v2-3-8e108af2d961@gmail.com>
In-Reply-To: <20261007-alpha-hugepages-v2-3-8e108af2d961@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 8 Oct 2026 16:27:48 +0200
X-Gm-Features: AclHuK9MTZQWArXmwotud4oJKmlLTivFsz8qsoyMOcL8h1IMQPbVLGFB76zHeI8
Message-ID: <CA+=Fv5Rzq8_6wYKpaKb6xfZp6_YECw8bRmTLawA7A8if3kDpSg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] alpha: describe the PTE read and write enable bits
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Thu, Oct 8, 2026 at 5:24=E2=80=AFAM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The comments on _PAGE_KRE and _PAGE_URE said only "xxx". Describe the
> four enable bits as the Alpha Linux PTE defines them, in Table 22-3 of
> the Alpha Architecture Reference Manual: kernel and user read enable in
> bits 8 and 9, kernel and user write enable in bits 12 and 13, with bits
> <11:10> and <15:14> reserved. There are only two processor modes, user
> and kernel (section 22.5.1). Linux uses the read enables as its accessed
> bit and the write enables as its dirty bit, so say which of
> __ACCESS_BITS and __DIRTY_BITS each one belongs to.
>
> The names differ from what the hardware calls those bits on the 21264.
> Its PALcode loads the PTE unchanged into DTB_PTE (21264/EV67 Hardware
> Reference Manual, section 6.9), where bits 9 and 13 are the Executive
> read and write enables (Figure 5-27), Executive being mode 1 of the four
> the processor implements (Table 5-5). That is a detail below the PALcode
> interface, and it is also the layout of the OpenVMS PTE in Table 11-2,
> which is not the one Linux uses.
>
> No functional change.
>
> Suggested-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/pgtable.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index 8a175e0c2b42..d22e28b956fb 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -65,10 +65,10 @@ struct vm_area_struct;
>  #define _PAGE_FOW      0x0004  /* used for page protection (fault on wri=
te) */
>  #define _PAGE_FOE      0x0008  /* used for page protection (fault on exe=
c) */
>  #define _PAGE_ASM      0x0010
> -#define _PAGE_KRE      0x0100  /* xxx - see below on the "accessed" bit =
*/
> -#define _PAGE_URE      0x0200  /* xxx */
> -#define _PAGE_KWE      0x1000  /* used to do the dirty bit in software *=
/
> -#define _PAGE_UWE      0x2000  /* used to do the dirty bit in software *=
/
> +#define _PAGE_KRE      0x0100  /* kernel read enable, in __ACCESS_BITS *=
/
> +#define _PAGE_URE      0x0200  /* user read enable, in __ACCESS_BITS */
> +#define _PAGE_KWE      0x1000  /* kernel write enable, in __DIRTY_BITS *=
/
> +#define _PAGE_UWE      0x2000  /* user write enable, in __DIRTY_BITS */
>
>  /* .. and these are ours ... */
>  #define _PAGE_DIRTY    0x20000
>
> --
> 2.55.0
>

Looks good to me.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
