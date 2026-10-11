Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E46432304
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 14:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791730632; cv=pass; b=jvBiTRB7C14JQ9ewcOwmygKUd4AXi9t+uICgzTENr6Jb2NDZGMZvnSOYX5SYFHWDlk5Zsr6Z3kzhgNLGC2c/vLE3VyvAybh2TjyvXUnQw/G1MjtUCVKOilmCaavs9v8LRtlXpyhwH0QhLY/feZpksdk28swp8bvQZmxOkBfFyno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791730632; c=relaxed/simple;
	bh=7a8cSShZ/qMj+tJyNWKjrBEs8maoUp4p4bZ9r6GxGyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WA46YPMYuILwM2wcrglg4F2XL2x7yctLsgq6gyLKCkESAEqRQJf0rJDIl5b6uBaHIi4IPdyXDduMUHR9vfLBB99w4WDlrsn7ML6uZ7qnn+SwGK9QdKRCdp/iHq4yfbhqq/RkydNCmDeK7qfkfqxkxt1KhLuRULn99O/CWXx+kZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0xJpInk; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0xJpInk"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e5e801487so191178166b.3
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 07:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791730629; cv=none;
        d=google.com; s=arc-20260327;
        b=QVaP7kYU6O5Q+C7z+CcVxXPA9hdVG5BTbR7kjCxcwREBqBlgZOz8Use6Z6c6km8I/p
         bvm8oOGQOAGBrBVLA48huINe/lX6fxhct9ynyjvSkUVfaLOQMHX6BRV5I25heGv4rne6
         cU7W6EuW48mme81PNQ+xzsW9Z+FAtXePBJr/BDFvPr7Dd4b8vOOVjwf6JpDVvR3LASwD
         uPKtqM4XC4LQBl/yv7ZEIx8ySNlcCPsRzTaBozBMdume0QPDmlB9c71Y1crFSPvoiFXs
         WILHv38Q+6epPffgbEza3Djzu49VP5+tlW/56eNDXsoWIII+5olu9op1VwHqVU4n7ZNv
         Ycgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7a8cSShZ/qMj+tJyNWKjrBEs8maoUp4p4bZ9r6GxGyI=;
        fh=7g1l5xnkxeWg17XfKBGcDLy21dV23eBCXJXBT95d60M=;
        b=HtV7ntA55ENYlvT4Xrq5VYJCYMHrWuc41G7UR9RJKm9nEqokcHrXnhgko3ThiMjQOi
         GRxuQO2I8gaOZ1uO2VyBj1zTlj5o89hEVadMvA7cz2CCJ2zJ2tLPCbkx6XHmoBcPlQsA
         h9WXvlkgbnDbnafqT6UzMbXQzDphXeI6IR5IDELqEeYqtU0yd8liXpg6HobsSoX10eqB
         UwKu45t6b1zNF29cMd55qJoCT/JQ6/Va17KmCHsJ0EDnETufMWjdeTLzcAJAF6Cp930R
         +sGKcKI5nhKHUr+XfmpiET0C4er6X/fAjCk7qygqB6xse1K7gn9IDzpQj1ryUPeF20Ip
         E7jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791730629; x=1792335429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7a8cSShZ/qMj+tJyNWKjrBEs8maoUp4p4bZ9r6GxGyI=;
        b=T0xJpInk527P5Uc+kfKw9g1/+JuinmdKqKRLOSMytoInRtojBvFdDpsoO347ZbpSth
         hvht1KCrikk6yKfX5/3vgRYcaU+cbAo3AJWTKZdH8RuwgWpGvhT+lAw9F4hp9OWEfq1R
         USneKZoGAgTh45Aa4pfCLGDAHju3f2uEFHHcyqo7CBZ8m6pJJgF4+TNEokUx4KMiudoS
         ezIzflUGTgeDBKu5XQRtQTira9RgARSlsN2x5wLSdIRu7x3biO9EF7/d0yG2X/jkZczP
         vIEHkjo3Z69iuYLpxg/sPi2V7wDo44se+n1UD2Yq7y6npJjRZ2yqSE4Ei6MiQMp26MYw
         8EPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791730629; x=1792335429;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7a8cSShZ/qMj+tJyNWKjrBEs8maoUp4p4bZ9r6GxGyI=;
        b=IEIj/vOvkeY3UFk/ay4GUiBgndkQmPXdNhk5g1KChu/IYd+vUoB1hRwug+NWW/t/0y
         hjQSpzJxFW6LgOZP8I61fpbeYh5PDPLijJJnQnq7dHRJulG1iNt93R2VWHK83jnTFrQd
         HPoZ+bF9YyRjMKqp5B+WjaTvfTI8H8SqM/J4pPm6J3u+mU1/vp3Z6obenQn0+o1lEGCw
         brNEAYuyo4VDeED4MXc1sVSrfI9m7lxuAMxkiUcwiO1Oke30FprsTqJWjmwLFYO+AZ40
         nhOktCFnmfHDN5NaukumSKL97ujvNYqlehmMsvPbJV7qFutVFWc5HX4HYFziDFIxlaEr
         K2lA==
X-Forwarded-Encrypted: i=1; AKwUvBzRJ4Jz5diy9IgbrR+0hFx+1eBocf6h7TcpJjvrRIN8RkphPqXV4KhEeWUsA6kIBBhzVNZI3++muIOscw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL8R6GqjLVVsygEd2DJqbuGTpWmBXxJuCK6SSG450fzn2ww66YV
	ZWE3w8V2v3oF5I/GlaNF9k74zpUUG4y6aR1Bfwzzhw877l5+EDvRKabfwU135CAsAIwYenDrASn
	AOUrf9UJvW4dOLxa/12PmI6StnHU6xnuhVX0b5p4=
X-Gm-Gg: AYBFou3zySeKa7bO5Gr4eunEo1UwzLWykxxU3AGMXmjUHhZnr3g5ascPW0w78n60BEI
	Pv/9gVp6qlBpO81pJuLGLgHOgE59CmZd/veg4rB5Hr5mac1S5727Z2B2ThppALVjmuG6bnMm8FJ
	pNUY35JSgq6alP9uBvjONhixopOgLqT4MUqh4F5pi7SsXgOnyf31D0wNHxhPUSOoGuGBPCw2S+k
	zvBwd3B2hrcUrllCf/GaU0qBi/W4XaGRopIqPvh8+DowRFIm+2uimbZH9/8Oti71SDAVc5oP/Ir
	VRlvlANaMbXeothqERbLqhujvVJIJq2Wjj23zzvv4eYAARsqLmNYV2TPbGE/6fqD+37+8on5VOg
	wCa8jxPnbUa1TF6m9ghgBPFRh7APRiVxl4UF53qo/vQ==
X-Received: by 2002:a17:907:9801:b0:c2d:be57:f73a with SMTP id
 a640c23a62f3a-c31a9fcedffmr817973166b.13.1791730628876; Sun, 11 Oct 2026
 07:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010142533.974797-1-linmag7@gmail.com> <20261010142533.974797-3-linmag7@gmail.com>
 <CAEdQ38Ep+cu5ssTGtb5OQwHGRB5wz+crTfbV9GM6wVDdoZqfmQ@mail.gmail.com>
In-Reply-To: <CAEdQ38Ep+cu5ssTGtb5OQwHGRB5wz+crTfbV9GM6wVDdoZqfmQ@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 11 Oct 2026 16:56:56 +0200
X-Gm-Features: AclHuK_oI4gPnyqjertogQ4m97YiIbt4SsFZC0bAfaR7XMCYgwEy5pWfnhxRf0Q
Message-ID: <CA+=Fv5Tpq1i+YbkqPUZBTxv-m9=q3iFPNGfmAKwpiwF2FdkZvg@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] alpha: run check_mmu_context() from finish_arch_post_lock_switch()
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 11, 2026 at 1:32=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Sat, Oct 10, 2026 at 04:24:28PM +0200, Magnus Lindholm wrote:
> > code following alpha_switch_to(). New kernel threads take the same
> > path through schedule_tail().
> >
> > asn_lock is left set on that CPU, so the new task can run with
>
> I missed this in v4. New kernel threads do take that path, but
> context_switch() does not call switch_mm() for a task without an mm, so
> they never set asn_lock in the first place. Only a new user task leaves
> it set. As written, the two paragraphs read as if both do.
>
> Changelog only, and not worth a v6. My Reviewed-by stands.

Thanks, fixed the changelog in for-next to make clear that only new user
tasks leave asn_lock set. New kernel threads reach schedule_tail(), but
skip switch_mm() and therefore do not set asn_lock.

No code changes; your Reviewed-by is retained.

Thanks,
Magnus
