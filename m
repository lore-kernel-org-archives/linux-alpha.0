Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56B547C0F2
	for <linux-alpha@vger.kernel.org>; Fri,  2 Oct 2026 10:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935428; cv=pass; b=C/40TdSnv6Wetl3kmCY5YE+HvRBeOmTrMHUF1MZvMFT3EUiUw6Cn5m85BTf6B0yvtV67aQPzL8zpWH6T+MeA72gETFVzK8XbZ+nx3t3jI9can0fPoAOovPlDY44tndMFzAtIw+1Fl7r93dxEPqg+39GM7mNojvFzVkBatUdwzjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935428; c=relaxed/simple;
	bh=D91ZmX5/DQfmBGh1QApViU92sc/8wjfGHsUQosYUA9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUGpT8lCRmRqtaSNMB+iyTwfFq6Bm8rJMPfBeukMFgNHAkJzGYaBRKhvPaRvSXEVS4GkzhxOZz+Esl/iczxX+elpLPHRLUBTiV486zCZEg2hXZHuyI5XhKfFQ6VA3R1Lg6Ce5AW2WFdwIQcojIQTl00cjYttrvI0D0/vZuJvFvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iz2oJYfi; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iz2oJYfi"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ad795d5205so3831647a12.0
        for <linux-alpha@vger.kernel.org>; Fri, 02 Oct 2026 03:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790935425; cv=none;
        d=google.com; s=arc-20260327;
        b=RI0eOP9y8kTZcgg0UHHyG5vUXXzc93mZS7F2PbRFbrR4Jr6beYKGRaxWQWQgKrtm/X
         LanqiMFnpiPXNKgB/3f8pvSjEwkYdD/Jr/IH0aWv6MrkSsTq5muLb4SLPjEl7db1f2AT
         7VJpFptDxX+D/7otdnSp06EJz/2YWyRRePkzvHZZVWBNqZ66y1ne6V2mh1Bng2PL0W7F
         0VOvfwnExxbL8QipHjnWOpmI3roi+9l9FDqLKBmYEAXAhAykBPWvEZLqdk65EM9xtUYI
         fZ6T4XWU730aLLh9n0Q3klMCRn/wUDFljrbcb1g5Gh/nbqoUD8dY6Pc777K3iud97ldE
         hvrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lmwtKXOq+PnIrfUgfJFUlAcCYaMW7Om2GdzLnnAGtnw=;
        fh=ViAatGiZ05dh3a394EUid4cQpUnAI/U35CAucij+cuk=;
        b=HjgC0ZMQulMZAw2lcVIaXfv7ayUg6Th4kd+KCSE4aA3kSShy9+uxpt0tjc1VwsRs0k
         IEzWsN9QwGuSVSj5CbiC0/J5j41OvQhy5F2l0hWOaN5C9kSnaniCFU0QbXS0W6FeeDkG
         i8c8ttV8CTK/ql4fQrmt76lVwELGzUPIyo20LxWQGWSxMrBXgk0ubk7M/vPh9EYfqDau
         YomPWXJPf3IygTrhy7/PCUEocEeMKgeCMbzFsgYzwjwvjHw+3hO6LGeyYJ2J7Mf9arwo
         8JvlvdAdokbmKyJ7KhXEWQdrjSK+/0sK8OTfNOE6k2FwZBFnIYSIBpWVo/KqFQTNzhLv
         VGPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790935425; x=1791540225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lmwtKXOq+PnIrfUgfJFUlAcCYaMW7Om2GdzLnnAGtnw=;
        b=iz2oJYfi7zbXtkaoi0rBzFo2M1L/79Y/3j+HVGMO+PV/S4z4b0homkqyH1xYair1FC
         pQDuGxd9RYmFU1xXIc0b/UDsvL1icThbOrVD3xl5vEDcywrWUVj/nkQKcql5yXKNgEg6
         L/qpUPxdnEhTyMxOpS85VuAlSNS163sOAUQ3z6P2/op9Rf05G7XDnJ/XuBi7I60NCJlx
         Yyff04VHla271p+ZFBvv4yeo+oquwYio4mZK2MpNusuWYLqTHU7PeZYJAZPSkZVCTQLt
         9PqYmOg7upXRHKM9C/iQbrM9UzU/KseDvD/Z14HkBk4zYeQzMrURBJ4aYAsrdHi01KvT
         7z+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935425; x=1791540225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmwtKXOq+PnIrfUgfJFUlAcCYaMW7Om2GdzLnnAGtnw=;
        b=zwXyrXHnmNWgWUBj3eqW2wts6mdVD4smTteyVjXUtDCcqtC46kAARo75sm8AEW7gzG
         aAodToWB8/WHRbVD3oJRLDIMgzPmTCIXb9tJ2jJ0U+LRpVuyQpIl8avWaGs9AZz1Er3A
         7yduDt7VR+OGNOUDpKfDr+YlqIr9cwjKjW0O0hFsF2IAtgiX1nk8+lCIv5ASLpxwQZKM
         7Wu0DSGntyU0vI39hFvl/yO7OWc2R3l9bbk5YjAWx0ocLR3xAmwi/XtXdl57HBGlYGbW
         i5sLGHOup3Qa0jzvtCJogPXdWlYdX0Bl5lcI8agY7dA1TZcbum0RMbe7q0SGqJHR61O3
         dY6A==
X-Gm-Message-State: AFq9FYKZhXcBLr7NfbRr3e/j0bQRtlqRL7D8YZauSa2+UvWmaVcIm49A
	OTJ2bIuKkOxdMMpTVkPw2fLyCOSv+1hDr+2QvNOMmrpr5W4RPahkRdWzaAMnYT8K/rlC2O/km9c
	F+cCoE3NiM6cvy4Y+rwagn9AU53PUDUA=
X-Gm-Gg: AYBFou0yYOLIB3Fh5w8PE/OtE4wQYjStoOYeYtvaZeUMXvGPTcELoHoAgqoJBeM6Sjy
	PFiKv/aixEJ+j69VztsFx3LzEVXTqBGwQqpjdw7Mc1i6BkZIDxX7COl3mc45cXSfxPZUEICTqIm
	RtNDC+Qp38N8i2fjehiL3Pa0CY5T1+2AoDevq4AJYd40lnh1XcST9bv0596+FL5efUO4/E1CTlX
	kg0Ac9rw4W/9ZvIz66aqJ3aLICZHryIe97sSazRWLPOPoBjuZX/sc/O2tq6mHp/nElYGCrj7ITd
	X8AEsjUeOQwfCgDD1LlkmZ6eGp3wpXK/LI5LIJjLlTkXUDcg+bZQiT2S+fLIvU+SAM9Jlfqeqlo
	KToSXkd73CqGQswZ2Nt+6dFrSmvYVEC+ONEcflPen6Q==
X-Received: by 2002:a05:6402:24c6:b0:6ac:b9b5:8e7c with SMTP id
 4fb4d7f45d1cf-6af9e2dfc01mr1113872a12.17.1790935424109; Fri, 02 Oct 2026
 03:03:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001165018.415526-1-mattst88@gmail.com> <20261001165018.415526-4-mattst88@gmail.com>
In-Reply-To: <20261001165018.415526-4-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 2 Oct 2026 12:03:32 +0200
X-Gm-Features: AclHuK9ZDs6B0m5iPOa25sBkFhPAV9J-38SblIdwRNaVUH1MCKgWXAbykWfmkAM
Message-ID: <CA+=Fv5TdEtG89KhMACnRoYEmvahwkSrf2j_UjVsdxqQRqGq07g@mail.gmail.com>
Subject: Re: [PATCH 4/4] alpha: default NR_CPUS to 32 for Wildfire
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Thu, Oct 1, 2026 at 6:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The AlphaServer GS320 has up to 32 CPUs and the Wildfire code handles
> all eight QBBs, but a Wildfire-only kernel defaults to NR_CPUS=3D4 and
> ignores the rest unless the user raises it by hand.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
> index 0fc61d986a7d..b5b02bb42aca 100644
> --- ./arch/alpha/Kconfig
> +++ ./arch/alpha/Kconfig
> @@ -483,8 +483,8 @@ config NR_CPUS
>         int "Maximum number of CPUs (2-32)"
>         range 2 32
>         depends on SMP
> -       default "32" if ALPHA_GENERIC || ALPHA_MARVEL
> -       default "4" if !ALPHA_GENERIC && !ALPHA_MARVEL
> +       default "32" if ALPHA_GENERIC || ALPHA_MARVEL || ALPHA_WILDFIRE
> +       default "4"
>         help
>           The kernel supports at most 32 CPUs. Only Marvel and Wildfire
>           systems have more than 4.
> --
> 2.54.0
>

Thanks,

See reply to patch 1/4 for details.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
