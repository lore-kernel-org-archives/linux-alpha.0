Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADF63B83F9
	for <linux-alpha@vger.kernel.org>; Fri,  2 Oct 2026 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934981; cv=pass; b=dju9B9LTQJEJ6px61DsRmeLhcMn8MtiT0YLs01eWqDgPYBUUvIcP3sfNUhWIUZgTlqO8az95ko0qzKdkFdPDFcSypEEGFKEzY2kynDbF2zIP5uf2jkbfPSodsu2op5eCa2Jwr0B4wXSutUoEi75qPtlRyBkqVoNaEMnBp+cyodw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934981; c=relaxed/simple;
	bh=PIV246cnJxiWld6fG73VJaAjdRohhc5UJi70mQZSenU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JujZFILqWb9XHgyFlAXpbvESP+11l54GcDraG/iEfqna6yuLzylTSqh0s6xfmnQF+RsGyUyZ9U+mxL8FgNRQ0TR6ss0FcCfpzsqpNwTiPzDOEhcy10CLYCGhuot+A3JkdLu3OmrOhC5N6WX/w5FIqyz/3d4CaDJ6xYF4JfTyq2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMf0RdAJ; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMf0RdAJ"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acae8342d2so1568649a12.3
        for <linux-alpha@vger.kernel.org>; Fri, 02 Oct 2026 02:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790934977; cv=none;
        d=google.com; s=arc-20260327;
        b=csE43nFeQkrwXcqCjM+U7hVdASOvXsHNSbG/goGKOj4SEIMyMgcBd7Df72EZCATdUA
         v/juiRcqc1v9+bGn6Aa2wLu2XYyppd1ILm/M3j0z502W4cv/mUlUhzCo5woVm1k6//9O
         47SUBTxq61Xd1PFyj2aXLex5i4Dp1IcOWq0fa1HmQZMpNwCjlFncw8ywykALbUtfivOq
         jEgMghybInHiPZ+9Ua4VeIgkrKk6ryD+FRRo3G4ikcO/vuOoLyyjW0bxFjv4uh1caK9D
         DSH6Pg047TcGkT4ht95vhivgH5cY3ON53xH7wszBgzg27rwaai98WYfRa7TC+3j1IAWo
         APJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7+JwjfY/TTo9tiK2/DA1dBsTMGVjOohtHrYWOad65DM=;
        fh=ViAatGiZ05dh3a394EUid4cQpUnAI/U35CAucij+cuk=;
        b=j+G0gaaih1FpCWoELx55UkC+vDocCxJ47UKQMnpDJ1HYoSV1odz1429s82T76fqypR
         tf8Sbn5Hz0UXlqRBgVfLS1hkz2ekGKmg+ZJEC4iIc8mvQ30ELbbgJSbomQ0wEw+RrJb2
         UADMOw8BOzhSx2ydHP4D39Da6is3Z2UlOdZ/896by2bMCuqOuMXqaSKer28mAtuAausI
         RtefAQx/su6T1/NVKcfng0W0bapxX7veTc+73y5AzrNEm5p+Ks5DzfBdxLG85ZmhgOFN
         r7utlSv6xlPz/FEClXVNvhVs1QcPnLfwMoB317nxDek99Z7W3Whe8gebSs0mSg6jn8BK
         PwfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790934977; x=1791539777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+JwjfY/TTo9tiK2/DA1dBsTMGVjOohtHrYWOad65DM=;
        b=SMf0RdAJizkAP5vY3PKiQ1oa2Gp1hKvfieE8nbmR6iONyGZZMDfOZn4PCJ+vsSMYH9
         dZEIGvDV66W16pWAtdFE/O0/hAe8y6bslBa4r28yVIOZi9QbDUy2Ssji7Wz2jbZghjyw
         Jb3mjNVTsCx8jUKonpyZ7BpN9GDK6t3H9dQ8IugbVxKwGXLcAtHgwa+LWUqzHVk/rbYp
         QbQyl3yZ3Vw8Sbmc0+nDHiBYw9w0zBJjOevk1qpNmoabQsNEuQ5qx4W5WdSsd+I0p+kk
         n8+njxVVY9f55oV69VrsTrl1ohdmE0UB0+2SVBc96/IQzj58cXP45LFGbtxbFkdu5l7S
         lUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934977; x=1791539777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+JwjfY/TTo9tiK2/DA1dBsTMGVjOohtHrYWOad65DM=;
        b=YN8PrmnvVAsrE7DkAo91yYmF0I3igVgS9B6wWetJjb4EL/m4mpn3VWkAdj9cP3RoWy
         jsATzjSkNBTu0LqwLS7TA+n7rJbjzeHkiqKo1TtulNj5yoI+SlF/ED9/kJwhS2bI28We
         v0bQoLS6ZaZP6Z1QKk2pA9FULpY4jztVU6QpTVql7NSdjHmmIwqF+2JhCB94mDlzPNju
         2Sl9lLkWzNabwBR2HJ4cO8frZNVHns7k0Q8qU/j2YFnvb9bMABhhPV2uaj/M1wRdJg5G
         IKAa1CdBsnoG/YVeV3x7YprbCnxwkQXcFq3mRkeLxlYxkPf2N5RR1eaK/YR8uF1Oh9cc
         8O9g==
X-Gm-Message-State: AFq9FYJQMS1RhUUctHGIs0HtuBmR0hUTdxNbV7ksHx4f71V4dgsaUtGx
	KGwLjnVCcr8TTRmnmf9rLA9fUophfzFOgkp2MKJJ7WuKbvHhUn5VH3P8RsEpZChX6S2mgoNTeSC
	OwSlAgca1VxS5KDUKzDVQYBseeOShrKE=
X-Gm-Gg: AYBFou2IS+sf2Wcr2aYqYsbcpp0HlpGnqtbtzg04pQ/kE/y/iA0Uq+ofeOfbERUtOPK
	PGOa+bSfwl3vXuemBsudBXlS4EvG3gdflSRwg5wcpzVdbAMjlWL0U8+DjPT/dKhr9l4NuduGDUy
	s1qWHFrcKJI3lJQlMfN/UXHyEA7cU+AFfsDx0E1C0EvVrZEEv5h+RNmppDNA2nkgKjmOS2OgnK/
	RHydbZ5MH7lCMV5UVjslg1qM5UhXYw0aot2jp22AUowMHJqb/iT1rLk3WDsIPh7arSdYru/eUnk
	nk7S9+4pq0OCjzO/KEGxxZqkCtsrbWMS+5PNRb4VbUPdC2h1ylVLUno6ZvScZp8AB3avR20S0Hg
	4FyMwAH0lRiBRAIlUwdxU5qoj14AAvSzilicOdgdwI0U3x8eFhCC8
X-Received: by 2002:a05:6402:388d:b0:6a9:dc6a:689c with SMTP id
 4fb4d7f45d1cf-6af9e301663mr1468421a12.22.1790934977199; Fri, 02 Oct 2026
 02:56:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001165018.415526-1-mattst88@gmail.com> <20261001165018.415526-3-mattst88@gmail.com>
In-Reply-To: <20261001165018.415526-3-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 2 Oct 2026 11:56:05 +0200
X-Gm-Features: AclHuK-C5xjbiWGgs7Kiq2X6uCfyO0MWm9WcEBM4-_0N5B70siILbPn5B04b88k
Message-ID: <CA+=Fv5Qxd9m_6EL9fO+u7QHtO-mh5P+yR9icpsUBuPZ2Q2Cv8g@mail.gmail.com>
Subject: Re: [PATCH 3/4] alpha: link platform help text to the alphalinux.org wiki
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Thu, Oct 1, 2026 at 6:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The alphalinux.org wiki has a page for each system and motherboard
> covering its CPUs, firmware, Linux status and known issues. Link each
> platform's help text to the pages for the systems it supports.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig | 47 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
> index 920dd10e7df0..0fc61d986a7d 100644
> --- ./arch/alpha/Kconfig
> +++ ./arch/alpha/Kconfig
> @@ -177,6 +177,8 @@ config ALPHA_ALCOR
>           memory coherence when a PCI device DMAs into (or out of) memory=
.
>           It is used by the AlphaStation 500 and the Alpha XL 366 and 433=
.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:alcor>.
> +
>  config ALPHA_DP264
>         bool "DP264"
>         help
> @@ -184,23 +186,37 @@ config ALPHA_DP264
>           API NetWorks: 264DP, UP2000(+);
>           Compaq: DS10, DS10L, XP900, XP1000, DS20, DS20E, ES40.
>
> +         See:
> +         <https://alphalinux.org/wiki/hardware:systems:webbrick>
> +         <https://alphalinux.org/wiki/hardware:systems:goldrush>
> +         <https://alphalinux.org/wiki/hardware:systems:clipper>
> +         <https://alphalinux.org/wiki/hardware:systems:monet>
> +         <https://alphalinux.org/wiki/hardware:motherboards:pc264dp>
> +         <https://alphalinux.org/wiki/hardware:motherboards:up2000>
> +
>  config ALPHA_EIGER
>         bool "Eiger"
>         help
>           Apparently an obscure OEM single-board computer based on the
>           Typhoon/Tsunami chipset family. Information on it is scanty.
>
> +         See <https://alphalinux.org/wiki/hardware:motherboards:eiger>.
> +
>  config ALPHA_LX164
>         bool "LX164"
>         help
>           AlphaPC164-LX, a 21164A-based single-board computer using the
>           Pyxis chipset.
>
> +         See <https://alphalinux.org/wiki/hardware:motherboards:pc164lx>=
.
> +
>  config ALPHA_MARVEL
>         bool "Marvel"
>         help
>           AlphaServer ES47 / ES80 / GS1280 based on EV7.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:marvel>.
> +
>  config ALPHA_MIATA
>         bool "Miata"
>         select HAVE_EISA
> @@ -208,17 +224,26 @@ config ALPHA_MIATA
>           The Digital Personal Workstation (PWS 433a, 433au, 500a, 500au,
>           600a, or 600au).
>
> +         See <https://alphalinux.org/wiki/hardware:systems:miata>.
> +
>  config ALPHA_MIKASA
>         bool "Mikasa"
>         help
>           AlphaServer 1000-based Alpha systems.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:mikasa>.
> +
>  config ALPHA_NAUTILUS
>         bool "Nautilus"
>         help
>           UP1000, UP1100 and UP1500 systems based on the AMD 751 or 761
>           chipset.
>
> +         See:
> +         <https://alphalinux.org/wiki/hardware:motherboards:up1000>
> +         <https://alphalinux.org/wiki/hardware:motherboards:up1100>
> +         <https://alphalinux.org/wiki/hardware:motherboards:up1500>
> +
>  config ALPHA_NORITAKE
>         bool "Noritake"
>         select HAVE_EISA
> @@ -226,12 +251,16 @@ config ALPHA_NORITAKE
>           AlphaServer 1000A, AlphaServer 800, AlphaStation 600A and
>           Digital Server 3300 systems.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:noritake>.
> +
>  config ALPHA_PC164
>         bool "PC164"
>         help
>           AlphaPC164, a 21164A-based single-board computer using the CIA
>           chipset.
>
> +         See <https://alphalinux.org/wiki/hardware:motherboards:pc164>.
> +
>  config ALPHA_RAWHIDE
>         bool "Rawhide"
>         select HAVE_EISA
> @@ -239,12 +268,16 @@ config ALPHA_RAWHIDE
>           AlphaServer 1200, 4000 and 4100 and Digital Server 5300 and 730=
0
>           machines.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:rawhide>.
> +
>  config ALPHA_RUFFIAN
>         bool "Ruffian"
>         help
>           DeskStation RPX164-2, AlphaPC164-UX and AlphaPC164-BX boards.
>           They have no SRM console and can only boot Linux through MILO.
>
> +         See <https://alphalinux.org/wiki/hardware:motherboards:pc164ux>=
.
> +
>  config ALPHA_RX164
>         bool "RX164"
>         help
> @@ -252,41 +285,55 @@ config ALPHA_RX164
>           Polaris chipset. It has no SRM console and can only boot Linux
>           through MILO.
>
> +         See <https://alphalinux.org/wiki/hardware:motherboards:pc164rx>=
.
> +
>  config ALPHA_SX164
>         bool "SX164"
>         help
>           AlphaPC164-SX, a 21164PC-based single-board computer using the
>           Pyxis chipset.
>
> +         See <https://alphalinux.org/wiki/hardware:motherboards:pc164sx>=
.
> +
>  config ALPHA_SABLE
>         bool "Sable"
>         select HAVE_EISA
>         help
>           Digital AlphaServer 2000 and 2100-based systems.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:sable>.
> +
>  config ALPHA_SHARK
>         bool "Shark"
>         help
>           AlphaServer DS20L and API NetWorks CS20 systems based on the
>           Tsunami chipset.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:shark>.
> +
>  config ALPHA_TAKARA
>         bool "Takara"
>         help
>           Alpha 21164-based OEM single-board computer.
>
> +         See <https://alphalinux.org/wiki/hardware:motherboards:takara>.
> +
>  config ALPHA_TITAN
>         bool "Titan"
>         help
>           AlphaServer DS15, DS25, ES45 and TS202c based on EV68 and the
>           Titan chipset.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:titan>.
> +
>  config ALPHA_WILDFIRE
>         bool "Wildfire"
>         help
>           AlphaServer GS80, GS160 and GS320 SMP based on the EV67 or EV68
>           core.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:wildfire>.
> +
>  endchoice
>
>  # clear all implied options (don't want default values for those):
> --
> 2.54.0
>

Thanks,

See reply to patch 1/4 for details.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
