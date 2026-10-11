Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FD5339386
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 17:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791741450; cv=pass; b=Hgs75CfpdESUxSvqRV93GpZ80kWDFAzzw4W2a3K1YVRdMdEUqHLLZGg6pCLVHTnOiS5/sm3pyzIA0N1/YAZrnzb90yoQwiKmVvNLLXYFl0z6MTTKOf2x3RR4tv7VAvOoubbah2DfAUuTPdVCdxIdoAD2jkNoJqb/ATQ95CmRREc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791741450; c=relaxed/simple;
	bh=vv0u8vo23cbfMgzNVqcLLtv9/ElCfp9eTCctT0UEpkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=thDwmjasi2v6de4J9TR2vGPIs+rN8WxiI/zhlcI6YavDtqZAl9RMW4/0IFHlabPNt+srUITxbJSPdZAgJrQNx2A9jEWli6b4NV82D8VCi+rgnShHW4gErIHdHPdphekUsdsrP11+LJPLePt5lxImRb2SqDnmSDBByDNIlZzZaAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJaVnmbN; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJaVnmbN"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so847132a12.0
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 10:57:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791741447; cv=none;
        d=google.com; s=arc-20260327;
        b=UkiHoUMQVF2NACgnJCXL0N5dnVjcKsfHjkCxYjj5v905wf6kcUM/Q2cR0XiheGF4RP
         sWsBQiNFJbm6Cv0MaO1uIYeubYQSPWq6UfdBb+wHeyF5pRMvLUKZkkepF12sKDBCPiMV
         4+DLbOCfVBEyg/QQ5bQFaaSwpkbOJbp6hzC4vdpT2SrF/KRxRpiAuKOSaZd6g6RMM2Ia
         w2gLVF+jcLsRrk4fi2em2nFwaYTyzS0RG05kGgrzvvl+IDAov7oeJpzKFlx+vji73+fa
         XnqtU/ivT0hU+6YfdHU10MweBD2gJKgGhi12JcNZ6aMao6yUpeovWV+rz51cN+nFOmyk
         vOQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vv0u8vo23cbfMgzNVqcLLtv9/ElCfp9eTCctT0UEpkA=;
        fh=3JPIIwKgQBX1a2T9DDzVDpj3EycSJhAZOihZS2Y1KHU=;
        b=OXoIAyIhBUwXT+tGorIZKxZytMj50kU+/hKYw6Y23fByJM3Z9ZXaQIww+34va6slyb
         so+Za/ciGc8ZRJrW/M9LwawrRL7BzuoCIh9iGOdyNJe7L/9Nfwa0PPE2T96KM636CSwP
         CKdijX4m53nIOsrdcl6IxgMFbbfUqKTmJgrt1G3mcUnBs8b8DDB1vqQtXfUZwOQreb+E
         JTrEbaROkb1bhEyEBmGLM/QXxlJdaMPGpl3UpHLfKOJieb1GYi3OmNH10lETBB/xLYul
         MN3goKoPbLljBgF6RqHPa2jaXmoBFvV9no+HgyBmpuwc/sR+9Ws8xug+dVThQUYFB3+a
         q1Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791741447; x=1792346247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vv0u8vo23cbfMgzNVqcLLtv9/ElCfp9eTCctT0UEpkA=;
        b=BJaVnmbN8RomVt60emh0wOzJ1MplR3D2i9RM1O9V8MJhnilKsYhnG+qqQbzJWB8IiM
         jEVsccI6Wn2rGBnvFUd/lZW51I883Y9etPxJCdKDp+ow7oAv+3EESxnkGqT+Ypqu0AR9
         nKA4xSM+moF7wQd05dxGgx33AkxOCq27BltSZoaiqNSgB394TfFP7BUtVkmtX3Z3CDdf
         LiJCjw5b8TaneazjNTbKnyzifvYp8mJYT1K+ii60jrF0GrkZaj26aqP4O0+q+DtKqDeB
         DqGWsxiNGdfCipIFVj8MvvRQlXOdAFKedISJOnTHHa02gxUNb2ejOLWwriWm0ewD3Aqr
         59kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791741447; x=1792346247;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vv0u8vo23cbfMgzNVqcLLtv9/ElCfp9eTCctT0UEpkA=;
        b=NhLIhBQBfqQPn3DVPJ5O2lfB5pRxJQyxgO/XIU+v8W+f1EaxEqWi/BszmFqMMe1TQ1
         sa6kCR8RGDfaizvv/oOAuzKrJDwwbaLhVK5fzM1fYn+2PqZ3yXhfxBaIa53AEWigNLVC
         FPkq64HILNGGbqmKRGws4IjL03yyfFP42Y0JeboOsHhI+3ifqgsNzFAU0K0po/QW8KPj
         hgrZvejcHLmQ6FxC3xT17hDJeO9b1ZToVw3gA1lHi3fF8KKQ8zyBP0A618AXOjJ1eiA3
         OucfyOyFJrJFdrLHq2TnEeG3zWD3wIFCAEWrtcNzw2yG1+Sg/s/VHUYtLAi8AF2ibIQl
         wwcA==
X-Forwarded-Encrypted: i=1; AKwUvBzPBTt0XoPMKY1VhRxd3/lLMd4X2sqpf4uSpuf6zQMuLwB633PIYRQLdMXa+LiRANXrkDewTzk9A1K2sg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKj/VB/TiapaI4RqONflQtZ04Igw8b2QdBuTvJmxpN6i/GU6u5s
	pluBxwjEk9QstQ5lSe779LFW+wFhi3rvNRjldWQ8u28+67lMvTC4rABXstuR30zcKGXF5dHxM2E
	WVtY5cO2VXgbUC/SnzoKS0gMoH3OQU/OxM86n
X-Gm-Gg: AYBFou07W44rxx9brvhFs4y43HRAdsprKSGmE0UU9ZvWgBqMyP22lIGw/lmgsZYlmnH
	YmlSPlyBjcLIb/o7iJ9u6DAxbj+9ZtBBPcbFXcb5rShuR/wgicGHwic6WyAYv27gYCsofcq7uhI
	Cv/bjVXB+6oejPIsC8TIybrbUld7HYnsPBxEeFmZ2KoUfpElfhslQIftq6l26Ov9E6lTXq9WAFO
	+rTDsxOwGfiWaZvLimRvdM4jGh0sv7yak2xVQJuo/6ZfxJi4mGSaxCCIVlD9NXVJiJkTzgAQoBf
	CBnGAtaRI1PySI0a9G6I2AsXzETaFXTDI2fJq+nLfwmn7oAUO9xSrL7Nr1ks7OrP0IfFzA+3k4s
	lsaykojdgggZJOr8B2bk9ienSdlS2VHi4/Gi3KFACUw==
X-Received: by 2002:a05:6402:501e:b0:6ab:e30:c9a7 with SMTP id
 4fb4d7f45d1cf-6b17c23e3bcmr6751589a12.10.1791741447143; Sun, 11 Oct 2026
 10:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009115627.969047-1-linmag7@gmail.com> <20261009115627.969047-2-linmag7@gmail.com>
 <CAEdQ38FAO=9V5VLbNCTE+8oyA4hcd2kYL0t=UYHkHTpWBj_-FA@mail.gmail.com>
In-Reply-To: <CAEdQ38FAO=9V5VLbNCTE+8oyA4hcd2kYL0t=UYHkHTpWBj_-FA@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 11 Oct 2026 19:57:15 +0200
X-Gm-Features: AclHuK-v0A-9qIiMWYRGUniSAjPB1V_8t7ZwGE_oKW-OkEmDc2yZJTZk47qD9nM
Message-ID: <CA+=Fv5RSvMUVwCjvYnnA1ZJ3fvNiekc2XLP_SbL0oUFNiPacwA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] alpha: move Tsunami machine check handling to err_tsunami.c
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Oct 10, 2026 at 3:36=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Subject: Re: [PATCH v5 1/5] alpha: move Tsunami machine check handling
> to err_tsunami.c
> In-Reply-To: <20261009115627.969047-2-linmag7@gmail.com>
>
> On Fri, Oct 9, 2026, Magnus Lindholm wrote:
> > Move the existing handler and PCI error clearing helpers without changi=
ng
> > their behavior. Build the error objects for ALPHA_TSUNAMI so that all
> > Tsunami configurations, including non-generic Shark, can use them.
>
> > +obj-$(CONFIG_ALPHA_TSUNAMI) +=3D err_ev6.o err_tsunami.o
>
> Nit: nothing in a non-generic Tsunami build uses err_ev6.o until patch 4,
> so that half could move there. Not worth a respin on its own.
>
> I built each patch with W=3D1 for GENERIC and SHARK, and the tip for DP26=
4
> and EIGER as well. No new warnings. GENERIC boots on QEMU's clipper with
> two CPUs.
>
> Reviewed-by: Matt Turner <mattst88@gmail.com>

Thanks, I've moved that dependency to patch 4 in the upcoming v6.
 I'll pick up your tag for the v6

Magnus
