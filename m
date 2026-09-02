Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332D4411FA1
	for <linux-alpha@vger.kernel.org>; Wed,  2 Sep 2026 21:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386196; cv=pass; b=MuBFABIjqgZFmWdSHXGUq+4Qa4D2bQntJJFTwsQiGF4yir3j0NNxImM+qlpplKd6E8Q2/XJLv6R/oJWJ3aPJI2v+LK3jIuv7EoenFumHiubU8H3spA/WBVQgzhP8TMiGbj5BiPvU0o6jVboCmFR0WS5mGTQegoEqah1PlvRHSrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386196; c=relaxed/simple;
	bh=21/nJ2JG86ZmyudvdGJFQmlHwpTTr1KQYUF2u8EakGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NyEjMVtvAzwa2SdcYvLNQhfGCBIKfuGlMYxFEjH0izU7bM5Y6krbVsfyvNFi677k1mR76HjQZGr2bgnl8S091tMVegN2mwVVb86WXCTPSPjbxV0yoeGK4NYATFoMNHNcKw1Nv2/iecaW3JLlUsCG4SYIGs4FwRJgN11mSMds1Ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eObhKXzc; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eObhKXzc"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso2635753a12.0
        for <linux-alpha@vger.kernel.org>; Wed, 02 Sep 2026 14:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788386189; cv=none;
        d=google.com; s=arc-20260327;
        b=K716lzOWM6oyRA33lxTGv14BBptOo+5v+aK+Bg4v+rKlcYRIaTYaPnf5kO4RPCpyfa
         fYU7piXUq7RS8VsaoRdavGvH+DvIV4jvsqNVwPI+uAdDYgB3vMKtEh5a2+fEfwQ0nc0N
         zcF4i0mPe9rccv70qxV6W9grbUSTzOnRsR4ctrAt24oJNXwankyt4jlrxLQg767sg3BF
         wBpL3OhNt1K/vSHm71HmAnR5cYyJUKUZ4XPFO0QD2ho9IjemZIYAkdNLaTfQkwgok1et
         cMwoOfdzotOpwKRo21jGvEqGbIRx/fV5qVErn7f+1m2EPSkaGXHakIsDQ+VhFJJXdSQV
         1Wog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lcF/ULVELGwtuvOq9i4Lf+ITn8c75wezBXYyv+4wehA=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=YvYwPL05DNHf4UtC4XNSqSj2RADN5usoSWsvyVxCO3BybMf0/b3Vo4szkdXc9NSboP
         z76+hiKRWQ2Zr7vtrHd2uZnKx4dShcRl6w7gkFeSs1Xy4yyH1pn7z2dJVUD0aUYmm8av
         Er58k1fkt6nHW7/EKsvaPiciiaU+YKxmrcU71Gol9WyaCSrwVSEtSDnvUA6KEOzB+dcL
         qYXvZ10iGJxlE76VbSnQaBBLB7Wagrkedu+Z1Y19eRbenI/eqKXgNR/zLAOALGIyQ8Wy
         Xn0ImURYQ4djsUsngzB8ugZ9tIjK+ZmbzF6GIj9+qiCoSxjwcGBA9nDxaFDkm6T0GjQz
         I5jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788386189; x=1788990989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lcF/ULVELGwtuvOq9i4Lf+ITn8c75wezBXYyv+4wehA=;
        b=eObhKXzcfiSaSbeB0/f2H2ZtvP4+jCVvM9EG+w0o424e21gOheXiA46MQq48SXYNHZ
         4/zc4Y8v+LY5Ri/Ks2GhCXQf3ExMK7MQT5xNtGGy+z9Rfm6XzXzqmAS+vkZbTMQFY2ig
         rU7nFo/9pO5nFrPhXw4DL9/DAF+uqSeZK7KaJc/mri597WzbuPCKPRaoo5jm4I+Cu8to
         b8Jd7yWlp+76Wm2Ayjjg/5IsfHopIeHg00rIJlIzr8BAypJXQj8i5sTEu3CZyiDp1p+b
         lIeZfpJbz+68BnLxGWhdRrYkGURwxye1zcsOpASLxVyO82QFg8kSSvTYuyatd51Lts/G
         Ad2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788386189; x=1788990989;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lcF/ULVELGwtuvOq9i4Lf+ITn8c75wezBXYyv+4wehA=;
        b=HMRl210L59CHdDTWjjlyZ5FC4qLGb6O11IaGMcCEQd0OL0fAqKgW/R+LDO/3Ozj7sk
         FUDWjJlT0vwjT+Q84odsgb5uAeP1AM3qhYxAelnKi89090jgc7PGyOC61P+K9qdbcFPJ
         xbuWC0aOuc0PusLn6MrHUL2Q6RMhlxRn80aptZKgkTQnSeXbUNpZxJyD8w634NAEPPzb
         TaXTK4y0x089aX3VoKywyfZwgSBaDlqre5thrK3srCvIhBP+DX44qkyXVjn08HTjgZEm
         CTR8sGRcRs4bB/fV+tDk860e6MConZCVokad14TGCb6y1/Vf2TdBal7JXZlkqm/oyFE7
         OGVQ==
X-Gm-Message-State: AFuF++lFf6gOtPqmdiOQzRddu3BaIRiwC1Ip3+++HCp0PWfCAVrWvAz9
	B483cMiB/gDw0btwZ89pAGbYSQ9YlMKkeDrwbOaUJUFcvRy19dE2O+spFiEPxIyXqX8UM9HcvXh
	55oUK7xbQ63SjJ62ztrhHUc49X4nqkmE=
X-Gm-Gg: AYBFou31xCbIcBhVJDk3CgGTuh3ssMnXFZQQzu4k5aMvYrU7OfLaO8BAORcTaREQF2w
	IJh2yRRpqKOUGtlpjhVOc4/5E8YmgUw7tyyiuVYNNOOBQeJCgp+NQxwpSNVo7tMLkCHfaWTGhv3
	iUHlA68hu3C9RiEqkV4v9GnNJL3gu4SXBZKKT92LVn6zJ1ksPtbeMTFStHvF6fnZybaWKCWRLYV
	PIh/rioy+Jylsvq3FmhQnDkhTg2tkVOSzuLQLSazyvhPohivSH3zll5MAEnaET01fBqW8vOuEIF
	W/tpYlnHmMBAjGAD3nzLeTvMx8J38VOP1u9R2QfGSAzxabwl+q3LoExXuy6/EjazQiCfc/Ztz5m
	oQvrAUzjXasH2yA7cuxXYC0MuUuYYz8c1KiZDSJQPIX8=
X-Received: by 2002:a05:6402:46c5:b0:6a6:4004:4ae6 with SMTP id
 4fb4d7f45d1cf-6a682566eb2mr5060996a12.5.1788386189035; Wed, 02 Sep 2026
 14:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <21e157eb4865cb6d2d9388941d5d1dfa2e0fc42c.1788277742.git.mattst88@gmail.com>
In-Reply-To: <21e157eb4865cb6d2d9388941d5d1dfa2e0fc42c.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 23:56:17 +0200
X-Gm-Features: AcwNN1VjYq87qITE7Acw5kFbCny_dOG0XnyqA8y65CBq98Ml7GCwlC7kFUqBG_g
Message-ID: <CA+=Fv5TY5x0e+NMaYWV1u7=Xb2fZELQ2AjMXv9a8E842orTPCw@mail.gmail.com>
Subject: Re: [PATCH 17/24] alpha: select ARCH_USE_MEMTEST
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Wire up the generic early memtest from arch_mm_preinit(), which runs
> after parse_early_param() has picked up the memtest=3D command line optio=
n
> and before memblock_free_all() hands the memory to the buddy allocator.
> paging_init() would be the natural place, but Alpha calls it from
> setup_arch(), before the option is parsed, so the test would never run.
>
> The test range starts at the first DRAM address rather than physical zero
> because low memory on Alpha is owned by the console and PALcode.
>
> Tested under QEMU with memtest=3D4: all four patterns pass over the free
> memblock ranges, with no bad memory reserved.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>


I tested this on an Alpha UP2000 with CONFIG_MEMTEST=3Dy and memtest=3D4.
The early memory test completed successfully and reported:

  EarlyMemtestBad:       0 kB

It would also be useful to add ALPHA to the memtest=3D architecture list
in Documentation/admin-guide/kernel-parameters.txt.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
