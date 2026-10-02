Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D033B83F9
	for <linux-alpha@vger.kernel.org>; Fri,  2 Oct 2026 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934794; cv=pass; b=EGtFxZb9M+18oLyzHKCNJmwjc6v7+w7/b9C/PosOjGJUg8ZpMAqmcMU4yoqzugTMvoI+UgLAyw4khgLS5vyc8xbLHHSApwQH+mAhyfGUBt6Y1ZK69OwVRr1vpOotlJekBWfU05NO9q0QqJqymDPHDaZ4yd3QUn5S6Fa9U1NgCJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934794; c=relaxed/simple;
	bh=I2iVAnQjuB2efbREqOoIFm3u1ZAEbnkLwA/mRmKPRhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rR2U8dXccA7TXEz2CCIgqR0zYuuETYEu5yZOUW4E4xKeT5/IIhOSRV+sTy8qSHu0K/ehIXPWQp6Hnntn2PXveAj0F47xCxZjmiqF7tnFB04DOkKI/WBCt540hxEcnzGpG0OdH9TLA7UacH/Bja0znG4abUXmmeGhrVx6ciqkzPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUMCz4qm; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUMCz4qm"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6afa5b9150eso368847a12.0
        for <linux-alpha@vger.kernel.org>; Fri, 02 Oct 2026 02:53:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790934790; cv=none;
        d=google.com; s=arc-20260327;
        b=lkNowFyRt7VhlzyDW/EBb8oNs6+7ugIXFTMjXlHg1zv/BLit88pV1yTcil+XutMOZj
         C2J94lEpy6BvUwUFzogk/EH7h4FpbC02KLTW1eiwY/3VFzhzZ/y7EHK1fCOZgL6e6sA9
         Kr9hAyuVOGCerfBBgR+oTKtJ5g2oKG2pnWvWm9zqL2ErFgVlEfVFoURBqLX8n7tRu5sp
         8ReVdrYIu/du5+0PS8Zj1JFMESd54Pm8M9/0YZOHfCzjT5WkiQiS2bZPF0Qu4hylHePQ
         h5NuDlDceNMmfYHIrTq7PJlZ8woFz2I40MWSzdXw/hMW+Q1BQ19EBT8qkg/Ug7LhqehL
         3log==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4arSkmG1a9JYvWYFRd6H2E/qKnzAPGl35h03AYNFrrI=;
        fh=ViAatGiZ05dh3a394EUid4cQpUnAI/U35CAucij+cuk=;
        b=oLPSI6zUI0W4wgjCe1hKyEyMMkhPLDjmGfuDblBB9npD6oATQcHnerO2+uF1+/z9DJ
         68rad89RCUw3wHWqDunCKpTB5ae3bHWz/J2OpMby72OYDWG9UkubBlkBRjp5xoSGD+w7
         FJmJOrXAgD4WW1l6SeJbReqcCWoBQ17m2cIK6SD4tVlcz64xAVzkOie0aMpEu1B22pGq
         JPx6xHAFVRViIPxhv8w9oVEZmg4cePMjzXUgevmMrTOXEHsLc6/nuCiClFTMDFdRzu9Y
         OCC1E1/DWpoHQRkQwAwBR9yFG3uvEnnT3sC6PdzAj4vNXN8gTBRMSThOoowoWUMkqlEw
         fs1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790934790; x=1791539590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4arSkmG1a9JYvWYFRd6H2E/qKnzAPGl35h03AYNFrrI=;
        b=iUMCz4qmERGAlenNan6CUNOieacNgnSjS8mHjPiYzXWcLS1E32pe3W3AsKwPpGRlpL
         lf9hvXbQkeBLQCRc/gvTsb1hIpXnEKTqW/W4Vyv0pI9ewAb4uGLFRTGaw+NK9zkBhnt1
         1U2wUwC/IR4H812RxRukMhNzOPzsiBpcuC15NMPEsTR5LgpoMKdqgBc6WIkXbKkAysDF
         jK+4+eQWAt+wCOxR3IsjIvsrC+sw+97G55N6mHHK6586adrnKWvrc6+aPLJVhyP1r1Qd
         odISBgTUAjpmhJu1wmXSlfw+Uue0GUraOhPoS2tA2kJ6xiXKdSE9EgeVIs+Ly4GQFCaX
         FS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934790; x=1791539590;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4arSkmG1a9JYvWYFRd6H2E/qKnzAPGl35h03AYNFrrI=;
        b=EdgAKXXau3wY3Z8qPuyxgz5H6n2718P4jNAgoqibsEnVGh+yTbAZCtZvpedEJSMLLa
         0F8KNG3p86LbPE39st4YMZeF1mgTTrmPitNn+hsTTvdTuhIjHWQuRF3BH/X11Vpbc9yb
         HkmkzhHzDTlQw0C9r7dB2uMNEiUcPuXuha3sa8x4OLhMbgUP8o2Rjf6qKMgVESPGC/ny
         5Y20eYG3OSluimukokrbYyJioSzclUK4ENWyh0fd8U5k8Q0LIciz8vl6DPHNuXmvVb+Z
         NgZbun8r7MFUe4ygHeppnnl/22oMXmF1BQDo5zrRFHKNhxBPQZSyyXAa3FLFu7jyTbNi
         9u6w==
X-Gm-Message-State: AFq9FYLoZUDnelXZyt5CtOk/wTf/TIkhFB0zwQkq9h9qr3Y3YNzyMMYo
	6AQ3psFtYsL4xjfsn5uDZv70O0yY6cLd1W7IZ59VYDe8jDqVm1V5N6FEE+GNxEZq1az7RYL+1vj
	qL+fAY1HciVe5UHaQWTkD+CUujv7MgFY=
X-Gm-Gg: AYBFou1P2bToqaLfFZScau2Q0jh9ZwyAuTNSNq8kYcK4I0FvHpByV/NjRzVra3bI8yb
	UPq5wKwoyPT5CtZKR8B04UTQJMDEmZkiXt9x7dUzOWL0/UzZX0HMRG7CFitrGhN8mv8GdHrkJZZ
	8OSbYDzN+hvio1dzkZEulsJCKkJLy8VIPawg7rIkh5SdL/jnnBMKXZZ2hqdYjZzI1KFl2tXBQC4
	suFn4mvw3+hFflbgojSWugxysAfCwXtSGGa/vaQFNosQBsGC772ceWaMf/JsJouq0sqwjZ/Tynl
	DFt4x0RsRrdomkDtKrAZLjJz/p2FGaEoFjYGfJH5HUg6tqWpPDz/eKv2D7g4U4Se4cX/L9al8Xe
	Oe4BdRhSK/ZwYyrk4WnlwSpv7J1EYT7xHWjAfROIvvCQ=
X-Received: by 2002:a05:6402:401b:b0:6ab:eb3e:ef50 with SMTP id
 4fb4d7f45d1cf-6af9e31f56dmr1449604a12.36.1790934789894; Fri, 02 Oct 2026
 02:53:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001165018.415526-1-mattst88@gmail.com>
In-Reply-To: <20261001165018.415526-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 2 Oct 2026 11:52:58 +0200
X-Gm-Features: AclHuK_05I1u_F6UhWNrqTl3drg919aiOwzfaMNOjFx2ztu5WOZ_5uYX6J9Ws-s
Message-ID: <CA+=Fv5Rznjz2qYiM4rtFs8iB3PefHJ4CdJxS7O+DcStWbS4kQw@mail.gmail.com>
Subject: Re: [PATCH 1/4] alpha: replace dead links in Kconfig help text
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Thu, Oct 1, 2026 at 6:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The Linux/Alpha FAQ, the unix-ag LX164 overview, the Rawhide install
> HOWTO and the Ruffian FAQ are all gone. Point the "Alpha system type"
> help at the system and motherboard lists on the alphalinux.org wiki
> instead, give LX164 a one-line description in place of its link, and
> drop the others.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
> index 92cc7bb8d29a..7c1cc676ddfe 100644
> --- ./arch/alpha/Kconfig
> +++ ./arch/alpha/Kconfig
> @@ -127,9 +127,10 @@ choice
>           run on any supported Alpha system. However, if you configure a
>           kernel for your specific system, it will be faster and smaller.
>
> -         To find out what type of Alpha system you have, you may want to
> -         check out the Linux/Alpha FAQ, accessible on the WWW from
> -         <http://www.alphalinux.org/>. In summary:
> +         To find out what type of Alpha system you have, see the system =
and
> +         motherboard lists at
> +         <https://alphalinux.org/wiki/hardware:systems> and
> +         <https://alphalinux.org/wiki/hardware:motherboards>. In summary=
:
>
>           Alcor/Alpha-XLT     AS 600, AS 500, XL-300, XL-366
>           DP264               DP264 / DS20 / ES40 / DS10 / DS10L
> @@ -184,8 +185,8 @@ config ALPHA_EIGER
>  config ALPHA_LX164
>         bool "LX164"
>         help
> -         A technical overview of this board is available at
> -         <http://www.unix-ag.org/Linux-Alpha/Architectures/LX164.html>.
> +         AlphaPC164-LX, a 21164A-based single-board computer using the
> +         Pyxis chipset.
>
>  config ALPHA_MARVEL
>         bool "Marvel"
> @@ -224,14 +225,11 @@ config ALPHA_RAWHIDE
>         select HAVE_EISA
>         help
>           AlphaServer 1200, AlphaServer 4000 and AlphaServer 4100 machine=
s.
> -         See HOWTO at
> -         <http://www.alphalinux.org/docs/rawhide/4100_install.shtml>.
>
>  config ALPHA_RUFFIAN
>         bool "Ruffian"
>         help
> -         Samsung APC164UX.  There is a page on known problems and workar=
ounds
> -         at <http://www.alphalinux.org/faq/FAQ-11.html>.
> +         Samsung APC164UX.
>
>  config ALPHA_RX164
>         bool "RX164"
> @@ -372,9 +370,7 @@ config ALPHA_SRM
>         help
>           There are two different types of booting firmware on Alphas: SR=
M,
>           which is command line driven, and ARC, which uses menus and arr=
ow
> -         keys. Details about the Linux/Alpha booting process are contain=
ed in
> -         the Linux/Alpha FAQ, accessible on the WWW from
> -         <http://www.alphalinux.org/>.
> +         keys.
>
>           The usual way to load Linux on an Alpha machine is to use MILO
>           (a bootloader that lets you pass command line parameters to the
> --
> 2.54.0
>
Nice cleanup work!

I applied the series cleanly to my for-next branch and build-tested
every commit with the Alpha defconfig. I also built the final tree
with these configurations:

  Generic SMP, NR_CPUS=3D32
  Wildfire SMP, NR_CPUS=3D32
  Wildfire SMP, explicit NR_CPUS=3D4
  Wildfire with SMP disabled
  Marvel SMP, NR_CPUS=3D32
  DP264 SMP, NR_CPUS=3D4

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
