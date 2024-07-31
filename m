Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED76F18044
	for <linux-alpha@vger.kernel.org>; Wed, 31 Jul 2024 19:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722455495; cv=none; b=mlR1EO1gvxt5IGHItdmxhmFEN/PnOVsWww9TZRxdoX00rXKe4Zi7fwvgKN4RpAfjAI7YL20F4iv25BDBbOD2EGJO0omYhwzrr/DcePIgc0fM12DAYG7vXgz4Z++ESfmohW9jCmxUjOODOvFVuuGUFVFDSgKMH9njIWNLrEUSXF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722455495; c=relaxed/simple;
	bh=VMZGRIt9Bu914/UR0/IET/FSQPvWBZGwluvLZFH+orM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZiqhRBlQL0slHziVQiMKkXYeTgabSdggEDLKVkSCgJh9/ybt4DvUVJkxrxPsygbOeCySvj2n9bKj01bc005V3k1UyaUaeXhFaxxKIbl4K91rNRVaWjQOu8mxdmFi8pqGiJ45r3jfsDyd8BrpTEX+e+mnzgi7JeogHvBPzH8P21o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f4M3CFfC; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f4M3CFfC"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52efd530a4eso9638195e87.0
        for <linux-alpha@vger.kernel.org>; Wed, 31 Jul 2024 12:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722455492; x=1723060292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMZGRIt9Bu914/UR0/IET/FSQPvWBZGwluvLZFH+orM=;
        b=f4M3CFfCqExnc5fFAHSyALV7zureYWB5qfPFjRQKv7kcTCkgMgV1XwgFWwdh0ZxVoK
         KIEZS2NeKA+/fy/TNEr2iSvbScHho6zUx42H0/vUTKXM7jmFvtIh3AfZD+RjrBaadIFQ
         4Mm2NGjS2rl3Hkda+P0Z7xM/CuOMKe07ICEwA/4bWZkvHtROHKr2f51WNj9b3fqaGzKZ
         xnXBs+fwSDHjE2XcDYCTZ9HKkJkW6Qci/OESrCb7U1FngZj1VxyNuAJcqw9aXjlY65OI
         x6lCquuyN5hBX489ZGQF6qlO4QecDOklnGqBNvQxLdzETFYWrEdzgqUwxWs4sPKZzUfC
         ct4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722455492; x=1723060292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMZGRIt9Bu914/UR0/IET/FSQPvWBZGwluvLZFH+orM=;
        b=saILW20HVdovURd5aMglitltdgjJVXuEcHinVLILmQPuWqU+BQetZEV1ihHW3OM07a
         D+wkA/f4RHmLo0CrAWEi7HoXAcGzvUxb2DRrxcTjQyZj6jpFHISch300ld0+vOuLV6U2
         zqg5B7ENPtjB0l4ZY73nWrMcnPXm+pJi3QOH4ZNr8ku7ca77/X3Y2/8M2Msu2HMJcwuN
         rcGfMeixUgQ5TOD9GyPScQMMTb0p7FumWmitzIVdAhfZf+FnkkYQLvzMvcGwG8US8Tza
         jDyRNBOanmhm/fE9DMduWZkDsmEEN6it3ptzyX4YitzqWYTrnOWXA/E36DhSaCxMznRg
         mTdg==
X-Forwarded-Encrypted: i=1; AJvYcCU/PpdKuP20VuDDAl8c9nwbuxrH6uXWprX3noCcXelvCh7kCrZDHelrx1OG2SB3vGpyJ6KyEE9IXflK8DxHk5tzb8dL9PnUYus5hoA=
X-Gm-Message-State: AOJu0Yz38Te4MNSxOBO2gfjWFUG8oyKJA8WGskyBeSgU5ny3hgY31Zxm
	LaEPYaGduGCIJZW7egFhy2yRr6WSlavdtfrXc5lpnoan9njsQs3TqwRlBN2el8wKahRMwH1btYA
	i+ZHNnU6GxZ/eCEpPPddxlfs2pnMefau6s5mWkg==
X-Google-Smtp-Source: AGHT+IFo7dWMrZVk0qmzwRRLNQJvLLW7Oz1e417fjF9Kw312OQHEVuGlf44xqebNrqhX6w6HMPuGfO2OVeaJq0nSOW0=
X-Received: by 2002:a05:6512:1c9:b0:52c:d905:9645 with SMTP id
 2adb3069b0e04-530b61b1939mr53045e87.13.1722455491760; Wed, 31 Jul 2024
 12:51:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730152744.2813600-1-arnd@kernel.org>
In-Reply-To: <20240730152744.2813600-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jul 2024 21:51:19 +0200
Message-ID: <CACRpkdYaK6_2AY0D07wTc+BFKazaTxhB6qmuJeKir89FM1HL=w@mail.gmail.com>
Subject: Re: [PATCH] alpha: fix ioread64be()/iowrite64be() helpers
To: Arnd Bergmann <arnd@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Baoquan He <bhe@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Breno Leitao <leitao@debian.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 5:27=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Compile-testing the crypto/caam driver on alpha showed a pre-existing
> problem on alpha with iowrite64be() missing:
>
> ERROR: modpost: "iowrite64be" [drivers/crypto/caam/caam_jr.ko] undefined!
>
> The prototypes were added a while ago when we started using asm-generic/i=
o.h,
> but the implementation was still missing. At some point the ioread64/iowr=
ite64
> helpers were added, but the big-endian versions are still missing, and
> the generic version (using readq/writeq) is would not work here.
>
> Change it to wrap ioread64()/iowrite64() instead.
>
> Fixes: beba3771d9e0 ("crypto: caam: Make CRYPTO_DEV_FSL_CAAM dependent of=
 COMPILE_TEST")
> Fixes: e19d4ebc536d ("alpha: add full ioread64/iowrite64 implementation")
> Fixes: 7e772dad9913 ("alpha: Use generic <asm-generic/io.h>")
> Closes: https://lore.kernel.org/all/CAHk-=3DwgEyzSxTs467NDOVfBSzWvUS6ztcw=
hiy=3DM3xog=3D=3DKBmTw@mail.gmail.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

So *that* was the problem, I was scratching my head over this one.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
