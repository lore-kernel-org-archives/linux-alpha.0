Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85221285418
	for <linux-alpha@vger.kernel.org>; Sun,  1 Feb 2026 22:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769983305; cv=pass; b=DxxgVrvPLr7V+Nwiw6aJAJRgV2lbsTnQ/ZapfYG7GSXHLSRjdA++rceCNFWUaeDfXQADjyG28dtr/6wFRYKJBnGu7jUPnBlLxRf3dBPahxsGkGFoNlL8UwXcc30wIliXvqLFExqqEK67KoJXNA+d2CD3SvhzSUWD6Ss7le96W3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769983305; c=relaxed/simple;
	bh=wl7Jk6JsU5yKG4duQoEsXxxYC+OIwiJhzlKIg8HfxyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MsMc6oZA8MqTkv/AdA8BOEGynhKoLzgs5jNt1dE//ORQajjBo2Jzd9QzZmn5hxBYWuQFy3ubTB8+XFyqQeUaxiWhK8FQJdjhzJs64Vv//3NFKUxW+9fhzo1UqDHwD4oMtOlCiocntf2wgMqoZoMt2x91EPrLD8HCBC+WyPL9vqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUP16xwB; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUP16xwB"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6580dbdb41eso5832182a12.0
        for <linux-alpha@vger.kernel.org>; Sun, 01 Feb 2026 14:01:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769983302; cv=none;
        d=google.com; s=arc-20240605;
        b=GA/VfyL5UNy19GiKI5Emph25NDjCrIGF1Qn25uoF3QcuOC9Vpvlv36yCJwQ115SaPT
         TJOZNDKPnEv3//9PUPseZt72E+Wg9pxEBJui1ioq1NbfudFMk0BWBYQbij7DSuy2P6DG
         DqVTsnHitF6FqofCvo4hNFW3ZVOxbI5nZ+nbXRMtMXQWcGaqjRXO+sNtGY1HZTUK3j9C
         b3MIdcVKQ90itFQoEks991ILG9ge+Rt4x8q745oxQ1ZQe9t1YO4dPxgjw5v/qodvQ+ga
         UqhB9CdxrKgowk3uWVWhvB5ZAOd0NddWR7S5QaqYQlRJV6n9WBTYHMOl9BqWgb015ozi
         h/2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nxxXeMZ2Mj2NhEcakAGevZjWJ8Zk/OwUaMBA61xjWow=;
        fh=9VDmDoiMlHlDZVob0Wac4AFkZPILGgqKTjqqt97+4TU=;
        b=ZXW683tb62taw0n4rwb5sqRLdBkyhxT+rdDKha/fEDclXDQfh3YW1LWjgK74XOxrIW
         vaz4YB822rQRqAu2CJsA9sMOxJbJZNVhHLObQRtI8RlNvSHVJuqd932YmHTrvUVvsnxL
         Wk+DpQb60CAoFAHXFk7FqNMaIkNZNWKFDlmpttYjBjIwKBK2TfCOu1I0lTLyz+h3/vrB
         23ixSJoA6Sw6guQxVr69dUvT5I2423Mb6J3bwPiI/4EV6LWRbGre7QfEAIwC3KLxdj+V
         s7knGVk26/mA2DCJ3RV8AxxEbkDjpzKHekqGPywWWUsNuVfx9VVShO8X5sKKKS5hpGcE
         PeLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769983302; x=1770588102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxxXeMZ2Mj2NhEcakAGevZjWJ8Zk/OwUaMBA61xjWow=;
        b=YUP16xwBByuCeANUpL+tqGPZtwW0ekBJQXjxvYHrQ+BVuJhzXlLPUbdngsjT9o0vf6
         uYUmzrEUKPWDyYwqImODBU03rkq/5q2r1ZRse77/5jbzZ2ZbdPfRWoEgDFXi7tvZQDib
         KKiwOMyTyPNTlE6DbDFUXbRkge9P5LbCelPWFufvSIQsld51sSM4Eb+aQDvPUDu+HqZ5
         c/EuzGYP26bua1tM6AhlMjxuishxSbB0C/tRmJtMEllP01kG1m4La3rFduj7FChnHhy9
         DMXci+K0JH5BarH9OsbnSb+egVIt1mbKSHqf6Rg3thvWSqfOWPIJWg6A+uJuZWSkOoYT
         3FYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769983302; x=1770588102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nxxXeMZ2Mj2NhEcakAGevZjWJ8Zk/OwUaMBA61xjWow=;
        b=CXAhDV6cMgL2LDc3HmI9OyFKgDecr/KmLXWdqcWVjhdBnujeSbHlQ9Oe+s45aVQADA
         hEDuwjYRsYMz9+AC5FqlykdZqg2OvBm+gDGvOd9g8NPxrAHFFhEd70CJMuid/Ylz2Bt9
         wDMxKYw9xPxtb4SykxUwH0W/1/Ns/2B3fMq9GCZBLU3CVrmJFGqAzz1Piee0m0bL9Lyl
         KIyFDHSy2mL1YnEww8Usgy2AifWL+0YIMVcNs3yrpXsBZTJjMpQ8jSWyRutVkQy3TIUK
         /L4dWbLZQl0BI9CK8ubeNqvqwLvF0/mtPBE8BxBdr/l5QTbwuAZxWIPs9RGh4otny/2D
         1kqA==
X-Forwarded-Encrypted: i=1; AJvYcCUf5HMmdpH89TbXBh9cxAQMeFp3lZihEIRujSeoDIdR7ShvIOS1dZuaSyKvoglRsNGCsVQkAHZ7BITRxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbuOReRxCMSpCdIYHsu0wfR2pbOVIta9lJ/i/Jc8clZKTpW5dG
	7+Nh5jLJq+zVAD6ujWzO6SbP+uJhCnuoDo5nj6qTK+jcDYy1uIckPKHToHNvmgemvc20HXZy48Q
	JUDISMgz95keSfyppuE2SvVQa98DQebU=
X-Gm-Gg: AZuq6aJh9JuxOtS/7t8GrA4jp2F57jyXHvHQyWLleWjoicf5pNV2OJ8npTrQ5nacnUA
	2ZcVmjWx/3HuXHbsx2Ab2mCb/iNGTlWbULb1SFFLdKA94UkStEFooz2gxNbvx3wHvfy39YF9Oaw
	bNwfNLagWVM8CjwDuoKlTWnbFSebkhPhEODszVqcYA/a7JoP4RfGB54qBhqf9hByiXL1MoZBOBR
	duWFIGUDFaJbjz2KLjmApzfwIjZdI7lJpay3e38BvP9o/EGAnxb5+eANzVuwIW37HAp0uzysxSD
	zPtGuuhQa0hmvS2dp3DBm7imI0Xb
X-Received: by 2002:a05:6402:90b:b0:64c:9e19:9858 with SMTP id
 4fb4d7f45d1cf-658de58d61fmr5598076a12.22.1769983301701; Sun, 01 Feb 2026
 14:01:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1769515122.git.zhengqi.arch@bytedance.com> <3380f40a89b73c488202c85f9a8abf99fb08543b.1769515122.git.zhengqi.arch@bytedance.com>
In-Reply-To: <3380f40a89b73c488202c85f9a8abf99fb08543b.1769515122.git.zhengqi.arch@bytedance.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 1 Feb 2026 23:01:30 +0100
X-Gm-Features: AZwV_Qj9VNkT5OuGD6ka3IvGbnZ780_iMCZkDjCZeudKZ-RrGhxplhYBmunMjcY
Message-ID: <CA+=Fv5RhxvyxKr2t+pHd1tbGrK57P-+b3pGe1nVaK_OLiFt2wg@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] alpha: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Qi Zheng <qi.zheng@linux.dev>
Cc: david@kernel.org, andreas@gaisler.com, richard.weiyang@gmail.com, 
	will@kernel.org, peterz@infradead.org, aneesh.kumar@kernel.org, 
	npiggin@gmail.com, dev.jain@arm.com, ioworker0@gmail.com, 
	akpm@linux-foundation.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-um@lists.infradead.org, 
	sparclinux@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 1:16=E2=80=AFPM Qi Zheng <qi.zheng@linux.dev> wrote=
:
>
> From: Qi Zheng <zhengqi.arch@bytedance.com>
>
> On a 64-bit system, madvise(MADV_DONTNEED) may cause a large number of
> empty PTE page table pages (such as 100GB+). To resolve this problem,
> first enable MMU_GATHER_RCU_TABLE_FREE to prepare for enabling the
> PT_RECLAIM feature, which resolves this problem.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig           | 1 +
>  arch/alpha/include/asm/tlb.h | 6 +++---
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 80367f2cf821c..6c7dbf0adad62 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -38,6 +38,7 @@ config ALPHA
>         select OLD_SIGSUSPEND
>         select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
>         select MMU_GATHER_NO_RANGE
> +       select MMU_GATHER_RCU_TABLE_FREE
>         select SPARSEMEM_EXTREME if SPARSEMEM
>         select ZONE_DMA
>         help
> diff --git a/arch/alpha/include/asm/tlb.h b/arch/alpha/include/asm/tlb.h
> index 4f79e331af5ea..ad586b898fd6b 100644
> --- a/arch/alpha/include/asm/tlb.h
> +++ b/arch/alpha/include/asm/tlb.h
> @@ -4,7 +4,7 @@
>
>  #include <asm-generic/tlb.h>
>
> -#define __pte_free_tlb(tlb, pte, address)              pte_free((tlb)->m=
m, pte)
> -#define __pmd_free_tlb(tlb, pmd, address)              pmd_free((tlb)->m=
m, pmd)
> -
> +#define __pte_free_tlb(tlb, pte, address)      tlb_remove_ptdesc((tlb), =
page_ptdesc(pte))
> +#define __pmd_free_tlb(tlb, pmd, address)      tlb_remove_ptdesc((tlb), =
virt_to_ptdesc(pmd))
> +
>  #endif
> --
> 2.20.1
>

Looks good from an Alpha perspective.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
