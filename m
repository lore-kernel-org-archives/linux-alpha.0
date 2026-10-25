Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792965703;
	b=CLspYD8O3iGT1k8jJXNE+DukOjlasA4rEEEE7dBzrjuYTUATDklVefNl7R6YVVIS7c52
	 I7Gt/gc2w6hsmiM1ZpzxBfPI56w03niqPOBRQceMPzmuTtUuVy4XpN0sSIIittMyfnONB
	 whJvmaO1fI89uIH46Oq/xxxBKn+AKQyO9dn1vYbHpQwu9G6ht9K6HXPWYC55mhjs6D9x6
	 TYNFDMs2ghh3tCyDCGMoyfSuL4/Si3z9Myw2U1f9LIu5I2KMZAZMg/xWW8WOg+1V1JIVN
	 Z3CC4DpGOLl08Gnx/236xz5bmA/ahXMWXEohKqfh8uMKlIJGhFjIH7K4Mj5s3R5y9dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RGlfky/kbSvYMvlNPauc6AogrKOAX6yWUZF/o3cy2kY=;
	b=mOCsVL9bs7Q4AVJwCqw6d8if+UB71zPBn5/n7sJCudWVfKLXPupWwcJuHVrQ4INOjngV
	 qs2hcTUgrSod1o1TDOWprKdm9qSKjcn9JS5RwWSiV+9FsdXggS12ZZns3D8jl7ba9qHgF
	 20zTAhFKBvB4dwPChtel/L6Y/GfT9CLNesLJ+pBs04HhbeQBL9PyIofNd0kRW8vqb2nqq
	 /sHTLrRn+JqtCdODZ3w8qvovPRRNU12b2V2ILChEdRVVuyeQYHwwhNA96X4mDhrxYWw/6
	 9t9WPWWO/VyFXtHI8y1qUlhRr87MhQ+87oCBOMHcb3PeIFiUN4Ue6MDUy+MpuhF2Sbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mQTqNWsa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC69E606A31D
	for <linux-alpha@vger.kernel.org>; Sun, 25 Oct 2026 22:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC69E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mQTqNWsa
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso3082799a12.3
        for <linux-alpha@vger.kernel.org>; Sun, 25 Oct 2026 15:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792965701; cv=none;
        d=google.com; s=arc-20260327;
        b=K4LHlN1F+thEancwmxw2pW7M1S9GEmeACIZ6F/GAVzJ00hTAgwjTxahT6XJtAvZT8R
         FcNAGQSXTMlz2rwhS5xjC6WclNee3BPle5HcjgEGkqZXbLT38EZSWQo6g4Fbru8wlmQt
         KJR+uxEdPzcRt89Nezu9wnnZlMicTSxRr1DrYekRcz2qFR8+8RqyfUpYUlP12oxWLX6H
         XeG1wAEDb2tc2D6UNqvkw3RmF0JPtrVJlLys5Bn3JaoMnPTzVJOJyji8fZMItzpyjeAK
         6MryKV2ae5qAz0+4aVfb4WnLUWo6DKww8M0mqS4i8WpRshR8cmIBWx/gKP1fo0Ff39kI
         65FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RGlfky/kbSvYMvlNPauc6AogrKOAX6yWUZF/o3cy2kY=;
        fh=gUVgaXwVcBQ3nZohgdff1P/nNhXLFgUOUFIRlmYXDMY=;
        b=V1fMNHnr9dgrQo8Y3Iu/3MA0rb5lCaGYLNPpmgiBAVtP/RlnX1Fj6ahyI+2kk0BxoX
         2YfxotGKcm+EeGPYXfAs8P/8h9Tiu3KNtp9WjtzrbjK0lT9i4R/PIXlX8o/KHip06rcn
         0u483QN4G8cSr7VgEqKRt9FJJtZkfIX5aaJPaZ1SDSE9UEPPyyTAttH1S9yvn+wgQPyx
         BvKgrXBFVu2JVx+/AnH16IXDEQLMtGPa7gtY5MEVzkL3B0NMPxzB975O3cyi52FpTTyT
         8VnbcwFfVR8H0Z+6N3Y7hY/75T/fwbX7PfqTHJFWd9rUttfevRMOYuhw+s6T0YbbPyE3
         x4xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792965701; x=1793570501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RGlfky/kbSvYMvlNPauc6AogrKOAX6yWUZF/o3cy2kY=;
        b=mQTqNWsaP28KlZxGFeJR0y+EVK/2CMqREV1iqCJaBvcJdV7FRgvMFnrNFcPy0bMpAE
         gaHiKNgEvBzDtWUQai4tVtr1YEXiAfmG0Ad07Tk//xDOzjCkvtEEAG2+zP1EkJZtanL8
         zEfRnqMui4CLwIZ5gqhyNuUH7utRthl/abV2YLJLIeLhyoQLtYep9z1yTfWMAthG4nXi
         Y23gcTF1MDe/yCk5HjcnLlBDJPW3y1Mbxahf8FzTAQTxz8q0QqI0iO3gk9uZ6jJkJtgc
         dw/QPZcG3tnVdkeb/L5rf+5PCGFHx0b4wJ2S6AfP7dIqWl3uH0cyK9xq9PV8In/Hwhrw
         j/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792965701; x=1793570501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGlfky/kbSvYMvlNPauc6AogrKOAX6yWUZF/o3cy2kY=;
        b=URtQygADmP0iDiposToJ8S+4WWIhc5uhCn26tEGe1wshYnipQJ2PbHktfR6AlFwWTQ
         8FmXSypHqEg69USUetl2EywqkJUW6PMB9Oe/j53HSorxyiJCWn/kN67x4dzI1X3IOA7E
         f/sfMmkz/+6Cd+JFXY3ja/ja78l/+nTh5YDrNm2ACEJyRUkqS7URjBsfy7RBQIz7HZyq
         jFRkCxIQj566N9vShS5PLBRkuq4cWJMz1A2QgPfREUVcCG2rbPf0s+GvFCtDKOd0plEg
         vzbvwNiEd44DTjdksJn2lRgYah2tI/2zMqRdLLOP94h98p+tAXuas7uzzlz6KPgJT/ht
         ZMSg==
X-Forwarded-Encrypted: i=1; AKwUvByv1POwV6Y5tVCei6fxe3Dqyi9AUFmSWY3GYsH4QLyjY3sq8Ht6WA/quGKlo0SGGizXfMvj9QbQpoiymA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKTilbpqoM7Vgk9gGZIZZy6DRp9CQoaumWCblKP4YM/z0nHPK3k
	i2MJ5BJ/+MvYEfAP5FC37eVQNERZbQjhgHbSk6NXHTDEsWmCbzPWfPtz+vu/1stlccDGkkO4MqO
	/66GK7kJ7FKh3BU60GUDfQLwOdieaeZA=
X-Gm-Gg: AYBFou1R4oIFEExa0+icy7IaGo0o4j7LpcoT+7y/2j3ujm3/FwOdP14f0kMi7N8K5iI
	fMiig+88bUBzLUBLTHWnqJazhVoZYrveKGPlTOqifSyTdpa3RetodGoAKDYFyF5ipBMn917XgIO
	4/AKqSkfsFWVKktDUsmQA14juZ8mPnkwIJTRIVa6LYT1NuxqlpfcT0sOGXSSmdfEi5zP9I/nCmH
	PxVu27el+IRNlRtEIuiu51wRge+sOI4uuY8kSyjRySwLqrcmqQxIr1unoixHx/TeTN9G0MrdiJp
	etsI6gSVw4mPwZ1FZCPBUIFy/y0S0zyii7Dsw25B0gB3nTsIW42WqJAAHuMTQJseURimjF4owas
	l0rlKKYOOyDXMdqgAnI+CJOg0UuW9ytqo+sDPWGmQ+rSpgKNNRDlKmir/I5/U+AlVhwaoWzLpYh
	tojrnBiCxwGlHhVGiVYQd1FyU=
X-Received: by 2002:a05:6402:56:b0:6b1:fe71:dd4f with SMTP id
 4fb4d7f45d1cf-6b443000260mr4663395a12.24.1792965700946; Sun, 25 Oct 2026
 15:01:40 -0700 (PDT)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025074237.1050419-1-linmag7@gmail.com> <20261025095252.1749067.mattst88@gmail.com>
In-Reply-To: <20261025095252.1749067.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 25 Oct 2026 23:01:28 +0100
X-Gm-Features: AclHuK-eQojPe5lJyn33drATNBGWugIoWrGtsC9eLOJyaaSVhTFrZYxNKdFyp3M
Message-ID: <CA+=Fv5QxcYhWtp1GgtMWLSzoXLXNdFkx7LreTDsPU2abv9gPGw@mail.gmail.com>
Subject: Re: [PATCH] alpha: fix PR_GET_UNALIGN flag mask
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 25, 2026 at 2:52=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Sun, Oct 25, 2026 at 08:38:50AM +0100, Magnus Lindholm wrote:
> > GET_UNALIGN_CTL clears the flags it needs to read, so PR_GET_UNALIGN
> > always returns zero. Keep the UAC bits when translating them to prctl
> > flags.
> >
> > This was uncovered while running the strace test suite on Alpha.
> >
> > Fixes: 3185bd261882 ("alpha: separate thread-synchronous flags")
> > Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
>
> Reviewed-by: Matt Turner <mattst88@gmail.com>
>
> This has been broken since v3.7, so please add
>
> Cc: stable@vger.kernel.org

Will do, thanks for the review.

Magnus
