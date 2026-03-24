Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871FD3F65FC
	for <linux-alpha@vger.kernel.org>; Tue, 24 Mar 2026 17:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372354; cv=none; b=CYen+ZtVJ6hYVVksnu1OgQJyBF/DYHgboWYNk6dCnxG4IuwJlhkXldm4iN4bbCrd1Nz/DYQsWwltBGVRevv12VuuG/00dB88DBzfxNFct7kn7gBbzKbJS/kl37DI4bbxnramyLs6zRL7juoNz9W2CUCOqGEYMe5uj8PZ4w0FBio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372354; c=relaxed/simple;
	bh=3GEJwPfpmz1HAcFqPqDcCHr7DP7fs2OA9k1TBgcroIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3TR8ml2LNDeffWJ6tXMDqy6GoPWnbDvfcVwZGd0ZGbacXp9TznaMhtMVL4RKjBqCUcU2EdLZLSvimx1m0c6j8EXZVIc1l5btZazVnJsWr0VHVVY3p5WAKvuc8QshzpzppY0X9zAp82N7G0lzC4OBE/4s0ckYHnkZwgNjGe+tOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82a7539851fso2259372b3a.1
        for <linux-alpha@vger.kernel.org>; Tue, 24 Mar 2026 10:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372353; x=1774977153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imA4hBFgRxEV6K6PxesH3aFI8Gk9es7sFYCGiASF9lc=;
        b=l8L/gejyekwoOdyyDDoNV9DZCHvdSD/8KIS+HEFb86osQwkoBl7E7NU5jkHSOwwXD3
         rYzS4H0n82/b8TsT/gvtymGLxZNV9FajGovM1vNp3f5ojMiGWMHDofMnR0bFVXIOskSY
         fxZJir4rwGKVhC634XQcjqNlHFTkEd3xE/hn0hUnDMZgVZryqfDkSBy0GB/0kv48ydv6
         m4IO7YhCz1y8GvtOY16hyduscQK+sDT7xxsjoIbJZj46l2tILJRuDpzlOxG31gTuzknL
         uUXN4WAgtFR02Chz6mNpMzfMlKZvjmMUjAge+GaKMUqEn+TRGL7d2bn79IF0hr4XMQ86
         mTmA==
X-Forwarded-Encrypted: i=1; AJvYcCX3Pi46yikURhIyRpbbLwvktLfcTpccEB4/pQF17Aad9AWM4IizjATu4dehg2HkH4UU8c5XHG6zm4dmdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyylNAmMuAe8NQcstAzLVsB7TJVU0OBSIIHehdp7Xva3h7zsdHO
	mqgFR61tVgF6gUP5ifm+27LlaTbMPMIVYERJeuo7D5kowsJ+IjBnULGPyr/kpbrRKC4=
X-Gm-Gg: ATEYQzycYEfAOdoaU7X5Lg2nsViBg/bIRctUSG0SF2253N854kBnOdIH84Ebh1nF9nt
	p71qP7htAK3mfO8IDVIXtAjGx1CtmAMzi+e4YY3N8VpnvTN+lj8j///4BwNhwjbFJtD3eTIUz7J
	bmqEGxO3QcLhRXfrrbbeitsa1fcsPc35T1h46Q3eFuEokubiHZb6M8PQhJzgiLAHMwLcIBnDewx
	TUOB9YqcjKGwAAeyzWL61eP2Vnv54y0SOVcf30MgmTkGmoGNAw/B5jevKk9AmLRRYe0GEgep9Zz
	acaP448DUsrXvRdwyr9EPq+HvTWJWVIM16ujlnj8HJq2ZKtlETHGusfEs3UO1F3/EEQZLzFuNlU
	PkhSNN/u6QJqvzyOFKOsWM7V8RgggOoDmAddT7wUYpxU9RHvfn7M5y6iRIQo/qZYg/6/4ByzObB
	l/6MinbmCl6BWLH2oiqALUj2qij6S1C9MtkaU+jdF0RPq3D46ppN158LmOS1AWGmE=
X-Received: by 2002:a05:6a00:1c81:b0:82c:21df:807a with SMTP id d2e1a72fcca58-82c6df06b38mr429433b3a.26.1774372352670;
        Tue, 24 Mar 2026 10:12:32 -0700 (PDT)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com. [74.125.82.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03aa7d8esm12648698b3a.4.2026.03.24.10.12.32
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 10:12:32 -0700 (PDT)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c10a2e2cd1so5743566eec.0
        for <linux-alpha@vger.kernel.org>; Tue, 24 Mar 2026 10:12:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUE8v5H1PRbSeye4RcUD87++RWFofa6x07GpDA1uVl9w5AyRFfmOVcif2UIXZDbz4/p3w2Qxso7kMElEw==@vger.kernel.org
X-Received: by 2002:a05:6122:1da4:b0:56b:5978:22f5 with SMTP id
 71dfb90a1353d-56d220a8b85mr416671e0c.12.1774371994638; Tue, 24 Mar 2026
 10:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com> <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 18:06:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXX16=pih34yehj=3bJkg2H3ivGUj_34JDg31ABheLE5Q@mail.gmail.com>
X-Gm-Features: AQROBzA3vydAXwvxX7mNaSzU55R-3eBg9lznDuFtNbFYtRdYd66gsLQKONTytjo
Message-ID: <CAMuHMdXX16=pih34yehj=3bJkg2H3ivGUj_34JDg31ABheLE5Q@mail.gmail.com>
Subject: Re: [PATCH 05/10] am68k/PCI: Remove unnecessary second application of align
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Guenter Roeck <linux@roeck-us.net>, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	linux-kernel@vger.kernel.org, Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC gerg

On Tue, 24 Mar 2026 at 17:59, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> Aligning res->start by align inside pcibios_align_resource() is
> unnecessary because caller of pcibios_align_resource() is
> __find_resource_space() that aligns res->start with align before
> calling pcibios_align_resource().
>
> Aligning by align in case of IORESOURCE_IO && start & 0x300 cannot ever
> result in changing start either because 0x300 bits would have not
> survived the earlier alignment if align was large enough to have an
> impact.
>
> Thus, remove the duplicated aligning from pcibios_align_resource().
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  arch/m68k/kernel/pcibios.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
> index 1415f6e4e5ce..7e286ee1976b 100644
> --- a/arch/m68k/kernel/pcibios.c
> +++ b/arch/m68k/kernel/pcibios.c
> @@ -36,8 +36,6 @@ resource_size_t pcibios_align_resource(void *data, cons=
t struct resource *res,
>         if ((res->flags & IORESOURCE_IO) && (start & 0x300))
>                 start =3D (start + 0x3ff) & ~0x3ff;
>
> -       start =3D (start + align - 1) & ~(align - 1);
> -
>         return start;
>  }
>
> --
> 2.39.5
