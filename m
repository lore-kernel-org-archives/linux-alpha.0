Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6A73939C1
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 06:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786344145; cv=pass; b=bvdfCT85WDePa+/hKFh9twZ6Gc8d0nY+HvpvFcD7FBvEmmDCa5ThkoK/cFPXVWxKtZ+hLsMlXCEfDpiXDJkLdh9vMU4m6XgRo7b1EJS725Yt3xdvQNspbJaNoCLbN0pUqQDevonzlUSKPaTkHRQKkS4FITKtK9zU2B7Bi1M1D+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786344145; c=relaxed/simple;
	bh=MPmUQPToCeBRj6eDXQma9EyWvCUep+Zsa8yo6BWxZdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lioUIbYU6z28xOvOo+pJnuDrbEBtQJRTjaI8xuxpHJIIM1EEXN+iqKGrcYL1BVzZGBPVl1477UNB8zYI17b3DuAeu2uokHyhfZA1UYe88CGAZ8zNOSq3ztbFM96MygKuyW8TYyEO6+aLZs+h3C42oBhOwlayKkAKRhkQ3EjLxS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=maBFuwzx; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="maBFuwzx"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso165617966b.1
        for <linux-alpha@vger.kernel.org>; Sun, 09 Aug 2026 23:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786344143; cv=none;
        d=google.com; s=arc-20260327;
        b=ha6CfCvTUeRKkDznvcGJf8fCmR5bDrtyqS27/oU/L/AC9i/ADGg6gTKYpGU48t/tbx
         LUEhwwQCkeePBAvKwsCG2ShLfzgyeO5G828VlFtm/1Tw2XyxvVzYWsqvUv05d6rwMDbg
         hM1pbae/W3BkjKKjhGda4OTIPgsicw0jzjRn4i1/QegFPuaaH0ICeQsAf3tmYNvUHXkg
         XmRhN3uCWZ2BC0wc2xHe73cRIz3LV8h06NF563YmeUKBQ/6gH7V7QUGPqKOuqbZdtY4b
         BfbavYjEmAa4jrYFz7farjNtB8G+HT4U19USLSm7NJLRRjmI/7T6YM7OKvZul8X1DDP4
         rSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MPmUQPToCeBRj6eDXQma9EyWvCUep+Zsa8yo6BWxZdg=;
        fh=z9ON9LR4bXid0VaVJGX/+rtc8xCDJIYxSh/hs+xK/7M=;
        b=DeScjvXr3KMPygBnf/hM3un9w62qf912H2cnoKhdAPGoFYwdcVgwRMdJM3Mdlt7POW
         r2MnDtGAqrwW++2+0zWHvyxhg6IgvTp7oq4XGLL+ILNdhoLOxDFTHoDufL7dEDYbKkUB
         Nqwj3SnfNqhMlc/jkTyUVqIqby3HvZ1jjWoEqJmeyBAPXb4ejJG60PKFD/SqqJpqROCR
         CeWluhfjJP6R8b9ESlPV7h7UJwjB2lFKI3dY9NMDDMi6jmvJdRvv2Zc88WP9X2J9m0e5
         yVbzZxHEZCpgTQ2BV9k09czsxVLzbqXL/tboD2ibqyI6Axcav6zJPfIFztZKoHcpYDWc
         gsxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786344143; x=1786948943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MPmUQPToCeBRj6eDXQma9EyWvCUep+Zsa8yo6BWxZdg=;
        b=maBFuwzxwUKQtsgInJjQes1buf3kW9e/FYNENhTlhFeWars5sPKmDyEgo4CT98ULXA
         bJbz6gojmfubpFP9/xFvMqmuoAv8AqS0/MyTMwPqsy0GA0qYHnw3nihi6GKsESsZqFGo
         PVZQG5yS+TUKVf6iUUfs0aoEUNt/eorCA+NvhAGrP6KYto7LTCRkSCKMPw8ftIAMb5Ic
         bEPWWrUXZ0y7Dm8jvAGpiMf2zZgIgbFAclz/q3C8U5PjaBCsqVLZ7aleEFTv6vBrOKfa
         FFe1FU2/y2fhdlwo7bsRaN85BJvdfSqObEoedjFvLR0IEwefz4IeMdVr7eoiHhbTAtbK
         X5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786344143; x=1786948943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPmUQPToCeBRj6eDXQma9EyWvCUep+Zsa8yo6BWxZdg=;
        b=AmPv6J6BDu6JEoKyCy4qM1OUf9aQlejCS7kFQgNv2lmCVFtD6smG66J4ivBSkVB8V8
         FA4J/uRqPxHDolyXdlfSGs/uKO2BLJUZtOoxJJDdlcZtCEnhMJGOxhjVXLLI7nuc3bhv
         +Yt2wlU6GVLOJFzsPZEMmjZl7S/5ud2To8wEAmzVPMtxd5NsL3NKpnI0hQ+GXHw1VdlL
         TS0IcInr2YdpDtUiz6x/tNKa/pQTXNX+GZhhJOmPhpX1lCj3zMWtVvt97AaDJDxsCiL/
         9EQkNwEEd5HHIosumrQR/8HZqJpKxJ78TRmWzloOHhiuDn7fuzY962hoc0yik6KRuPcv
         CUtw==
X-Forwarded-Encrypted: i=1; AHgh+Rru4Zp/A1F7YpCOIKjFP5l2ocCXeAoP84mNRUm+xR5H/gR/zW4dBBOvpMQj/k+vxB7TxlajoEtrdEmhqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT8aoFkdgffZX5WPJxaIIVnE0uKYhz3YbZManbjvTVeaWYYaj+
	6SP4ESUpRdanJC02NRActWtismaQ7F89V5WUb+c3mo5Ys224vnxY7fvUJt0xDSVwxmjxO3GSW8m
	qGZPDcbYN06xujqoqNudtpRnQnuYlHdk=
X-Gm-Gg: AR+sD11RaLFdZxvKqGGYfob66mC4J9QQ0bS5BGRXoSWYX0BnkLVWrzp3k5hQBJfezR2
	ne+p5I3M/w731qDaY/xZpR2GhfmrigEf+MWI4l4cftTnvrioc51vt1Q4BuEtt3ELNGXgeAa4ZJw
	/Qv/OdvNcBtRtroPFi7Wiou+eDHlLkt1ZwIGpvOMu8qmhxotuuaBKYi2Oi1y336bjoKxLKfFDdu
	wIRjDC61m/aliWg4OMrpuP8NMWsz13U+1kAS36y2mKteLLXyFR4GAv2YFJIHgrVw9daOZ5cnRMS
	E3KWm3mZ1Utla+76UHLy66MFiG0WTtbJosKRUE49jFYbLIbaIPStzIz4dNTI5/exFuRIY3AfoQc
	FdHM6lot6awtyBOF+uBTxzCgx6wFNr4I=
X-Received: by 2002:a17:907:94d4:b0:c12:aaec:342a with SMTP id
 a640c23a62f3a-c2039dc32d9mr1830753066b.16.1786344142531; Sun, 09 Aug 2026
 23:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809085208.3262799-1-linmag7@gmail.com> <20260809085208.3262799-5-linmag7@gmail.com>
 <CAEdQ38HYF0KWE0pxRBdWYfr9e0q8HqJ_BQu=_Zaredb3Xp+euQ@mail.gmail.com>
In-Reply-To: <CAEdQ38HYF0KWE0pxRBdWYfr9e0q8HqJ_BQu=_Zaredb3Xp+euQ@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 10 Aug 2026 08:42:11 +0200
X-Gm-Features: AUfX_mwDi9sf5C8flIMsdoqbzjF9lQOPHdu_WEqmT8Jiub9TQoRVi5-zUqzRzOI
Message-ID: <CA+=Fv5Qfw8M8CR2dShhV0sfUvmF-M40iciqx1ShqYOF3+azOFg@mail.gmail.com>
Subject: Re: [PATCH 4/6] alpha: only use a targeted tbi() when the target mm
 is really current (UP)
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de, mcree@orcon.net.nz, 
	ink@unseen.parts, macro@orcam.me.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 4:45=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:

> >
>
> Maybe rename this patch to
>
> > alpha: fix the local TLB invalidate in the UP flush_tlb_page().

Thanks Matt, agreed. That describes the actual bug more directly.
I=E2=80=99ll use that title for the next version.

Magnus
