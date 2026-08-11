Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1992E38DC47
	for <linux-alpha@vger.kernel.org>; Tue, 11 Aug 2026 06:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786430999; cv=none; b=TZshELZVAq2wFFKg5tDR6evZuyBDxgs981LytoPQ3IS9+9DdSolxfR5rKlx+sKVJFkXx5pGQ8AtvBcJSz3y4iND2ZycMAeRYVVKsvoWjDwNJVxZeHglJvjuxXVQ7WzYZFaSzJ70PZQDzu5pnkgaDa/6NVbGbjXoZ7+qGtwSW5QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786430999; c=relaxed/simple;
	bh=tZZLV6eyiwcGv5N3oyI6rD0AMUqGK1dWtQ5SUdhqr2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfFUKXDlAVtriqVhP1qBaOUaxNKjYCeWxJqPx2CbJVZ1LSDpVbPwSsXkF1NMxylfaa61Xf3kdZic+QSy5rTG73Wwp2m7cxsp/McM7XeccDWoFc6tVitue74YUNAOtxymbIgH2/CSgiBoxsvQP+K6Zw/oCL+U318l5xv3scNHQ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9770fffa5a6so558580241.3
        for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 23:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786430996; x=1787035796;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0iZRfAdzYvTsaTTh/J3ab87cNtJMKi7JiQC3Jqumorg=;
        b=NBW4gdgFPblHqgVuDABJodAkyLlokA5VdOrz42VHSmXMM6USop2/vTL5hMJwxVGaFM
         2n6CQMwRMEYdVTUqsdrzC05S07bCP/i4/5E8w+tel5o3gEhoy74mNsMSA7UbiUgzF2rS
         /qJXzy3yY4rrtq1yn9AV2zrOOIZuapKeGDS025zcKcKgT6NWirL/UXrntStwnJ6RYXMK
         C8fiw9mfXNry/V+m4rQDxFlc/R44SpBKHNlPGDPZBs8VomQwvS5XaloVFy1nzbYOgEJk
         XAvNkJtqxPwp/MCiKhYdoQArf3244En/tudhzGtmzpFhZStAqwJJyzedfvfwGa2B7ylL
         Jd/w==
X-Forwarded-Encrypted: i=1; AHgh+RroOlsYujjwDTFneaNGOT079Pbes7Z9TBVHHyy3qYG30EdwBKPUaR7ib035dBRiIFjx2KQ16ux+GBlUNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgsbc3FGa4DA4aC2yldRhJxu1XgAKi5QxgUlxp2ymYqD0ARog/
	bdjTDhgkt80o0Q2dO1pAoV3NXNDnNqU4xYfT1mAmWeAMC5zIHEvHye7hbsX+2omv
X-Gm-Gg: AR+sD11wdxBQB6nly4EuDqqFqd6PSFYQw6yi754RhgVCuknJlNvsNM1bfXOzEpxQQzZ
	WHJ8ooqgYhrI3MMxSuDxTgnQSV4MWSiKuaOUqVx7ZJJX50a3gVtRF++K7AXV+BaMkeK6cJ20MVj
	TgDXTKGwA8jLmNAe07nAew9MmbNjb1EMGo9WAswG1clRqgAHnvFzSz3BhibeHUf/58YQwsSo/Ek
	6DpwfVwA++vLDz/7kDd+V7cUUHtJwSqnUkc9+L6rfhl9/4lZm4a30Xp0tYSzoyt3jP0XfxotgVX
	7lCCwOmhnbioJTNI45xyKrfFgR32Yo3o7daHTcxcgRlBXnZDXoKjk7DDcUD6qUD1jtKZ3TMxw5Y
	9J+WSSYPAbMtDQkhnMmlRneCFOwcTvZvs777ffjnJXaXhFI+tJagADM5USI3Ye4mQ9FB4Xl6SUa
	L/6pGvOG9bWY5emh7AUYX6TC6pAiWlu1e3aoK0t9bbrreSCecuhPF9wKkzZifGT6O+8YZwqiSmC
	LJPgHwCbxuVO+GhOJBM6mqyZTl7/j9Pbahy
X-Received: by 2002:a05:6102:f95:b0:737:4cac:52f8 with SMTP id ada2fe7eead31-76b54f87261mr306541137.4.1786430995937;
        Mon, 10 Aug 2026 23:49:55 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76b6328b2b0sm205956137.4.2026.08.10.23.49.55
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 23:49:55 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-74ac3ea9c60so675601137.1
        for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 23:49:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrcpGRpKZuLkH8pOZbv2fLDb6a3IS+SxuqU+cwaJE5hEfUEH+7xUAN8rXFBX4TlBzEVXQE6pZaQiDwtpg==@vger.kernel.org
X-Received: by 2002:a05:6102:c4a:b0:738:ecd7:1984 with SMTP id
 ada2fe7eead31-76b54a7a17fmr283026137.3.1786430995503; Mon, 10 Aug 2026
 23:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811042119.3652929-1-anshuman.khandual@arm.com> <20260811042119.3652929-7-anshuman.khandual@arm.com>
In-Reply-To: <20260811042119.3652929-7-anshuman.khandual@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 08:49:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
X-Gm-Features: AUfX_mwgji-OqM2d70As4nCfmG84npBMa5IuhuEcV5XEKzcXYS3fe_Pqx16lD20
Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
Subject: Re: [RFC V2 6/6] mm: Drop pxd_ERROR()
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Anshuman,

Thanks for your patch!

On Tue, 11 Aug 2026 at 06:22, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> pxd_ERROR() has been used in generic mm just to print the page table entry
> in pxd_clear_bad() before clearing those out with pxd_clear() later. These
> pxd_ERROR() macros have been provided by all platforms which basically did
> the same thing.
>
> Make pxd_clear_bad() use recently added ptval_to_str() instead for printing
> page table entries thus completely dropping dependency on platform provided
> pxd_ERROR() macros which can then be dropped off. First move all required
> helpers in core MM into a header file which could then be used else where.

Oh, the "x" in "pxd" is a wildcard?
Except that is not, as it does not match "pte" ;-)

> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/m68k/include/asm/mcf_pgtable.h           |  6 ---
>  arch/m68k/include/asm/motorola_pgtable.h      |  8 ----
>  arch/m68k/include/asm/sun3_pgtable.h          |  7 ----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
