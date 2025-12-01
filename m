Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DE91E47C5
	for <linux-alpha@vger.kernel.org>; Mon,  1 Dec 2025 06:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764570868; cv=none; b=qfQIvhC8K05uFSz8oV7I4ylqMMK+xaDiNjaFf8d5VWfshsfO/+CAtXeVqw62oU7N84MnJgU4SdU+YR5MpY55XmAy6RFCrZr4UIYMb8chb2tjFd2hwQfriO2yPvXNx8gD53mHCSDW5FPva+mw8wzryTgk+DV/7GnnWR2vddqMawk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764570868; c=relaxed/simple;
	bh=G3bJXxKB0OvK5glIc16XkdUB6qO60CT/36ico0+potw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tabZyQYiCoKZcDG5k1d0b0IalSSxAx68l9BOLO9Pz3F78GWCyzFf/7hwMKGYJn1wjVlrfRlZVDWLC9AZdr8syetID6hl41jQceT7q62Pk8bNnulrPgpt67tgvWE/CRwvvHooxEpcYoR6e7FZPcsG+fG4QiOgclMA75+pbQinxPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIbqAe8B; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIbqAe8B"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7373fba6d1so598653166b.3
        for <linux-alpha@vger.kernel.org>; Sun, 30 Nov 2025 22:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764570865; x=1765175665; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AuEdYFr2y8Ncl5PZxT24fykDYA0NvVraPxOJDl+o1MQ=;
        b=NIbqAe8Bp14fhQIXbfECFEeKzmeNCSQU+F0Rh8vKMceLFaNhC6bezS5+8t3b0Sa5Fk
         tu4QFPvErxsIwDu52UwVfoEwbdhdtVrNMjalG/agGUe6inHsGBqnFmxLz7WjSGQL1YpQ
         saLQPGDy5cA9TZWjmKIYI2Z11GgRh78wGFWcEVemOB0t3ONki9U66zwzP3UxL+QhzLHn
         aheR9nUgrhMiesGF6nQhl6eE+f+WgvqsnJyH7ZR38K6Txq/s4DdlT7QBOVt5JbeIoDu0
         PWs6HhpDgUcxFUSsi6mch+7etlaPKI8i43zv2i5eAj4JavVMf70W66d1qcpQ/JGEDHv1
         h1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764570865; x=1765175665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuEdYFr2y8Ncl5PZxT24fykDYA0NvVraPxOJDl+o1MQ=;
        b=khmOttIjg8mEv42beBRlyVhhyjsd7J5rJvryha+MPCR5JEiK+SP+h8QSnY0kww549i
         JkFLXmLzVmW/09GYXyxX5uYumCD4hJp/FsfXynWkRlBd0UZSgw02ZEBbe5JKbbp1ch29
         V5qWvMn70EDp9+U3ZC4TIvC1ABjZuNUxMyXVMuMkLaGAqbI2knsgrrx5wkcXTa2Dm1NF
         Dtn72pJfavDyZpfZLFTzOvYqYYUbIVQYUjVIW+AGxcbzp6ssgchPdY7UebsHow3zNp3j
         sFXE936Y6gkM7bsgEAE3lWS8pzx13K72gqxsjCffJ1/eDenwX780H5nBaPb44Xd4IFUH
         kXVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVKAHK0L2uhxT5j2VzLz+hlr4xjCBbBenj25Sd0LVKsk5EcIyvZfklZhcug4tARo8WKlfw2vUDji6d3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJWUoZoNihVHsnhyQ0dHR++ppTyDNdkxIVGkRCiY7/GuASIM7q
	cugo5UHxF1Wp036AnSbFVPsZc1ao1YiKTEmQCwDxs1sSTWztyFECFQdgiCjyWTPMmpJHL6Yq2SZ
	eGeiwdLAyzQJHaz43XDXjDSY6OL2tcrs=
X-Gm-Gg: ASbGncv4VAXut/xEooGwuHYHIIcqoQ3zGNcky0lvcwbrg97kBPE/TnIXDoEMAdAFjHg
	5b/MhSpoHnb4cuvwohkjrnDDPGhI5bdbYYOdCfiPql2xHJWofu/JKo5rcjMOtJEoxz8dyQgrpI8
	w9s5jaa0GYO2s349smct0kGxVu3VS8v5rSCgaRWN2p3C8imVQYwQNSrwqrO0sRt0yqWkHY17BpW
	8ZXqDayyMRSQtKvQAa30Ml9Sp9QvTZwW/iEBiM4H/Rd9n3jntgCUeRFvVsa4kyWLfF+er8H
X-Google-Smtp-Source: AGHT+IHQ31h9PNGJBgyhLtIpRF/GwfpR+Tioqpida7NGrCv9RrsSCbpBSbCFl14nszwr1zymYZlOSPuNXq+Vg2VKjW8=
X-Received: by 2002:a17:907:3f9c:b0:b73:7f1c:b8d8 with SMTP id
 a640c23a62f3a-b767129709dmr3683363866b.0.1764570864900; Sun, 30 Nov 2025
 22:34:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <99f1a93cf8cd4f0ece8611be2860677084663aac.1759359610.git.sam@gentoo.org>
 <alpine.DEB.2.21.2512010346580.36486@angie.orcam.me.uk> <871pleyhqc.fsf@gentoo.org>
In-Reply-To: <871pleyhqc.fsf@gentoo.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 1 Dec 2025 07:34:12 +0100
X-Gm-Features: AWmQ_bkOto017B5gX4e-UHpKNG8Rz4EF34-lriZUxlUmfabyo1HrbMh-gJ4VTVo
Message-ID: <CA+=Fv5QeyBDLXazGFreV6F65912nu=eEAQGoU00aaUO_7emPqg@mail.gmail.com>
Subject: Re: [PATCH] alpha: don't reference obsolete termio struct for TC* constants
To: Sam James <sam@gentoo.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Stian Halseth <stian@itx.no>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> Thanks, though I'd say I was more being gracious here and that it's not
> strictly required to have them here at all.
>
> Anyway, Magnus, I can resend with just my Signed-off-by (and nothing
> else) if you like, or can you do that in your tree?
>
> >
> >   Maciej


Hi, Thanks Maciej for pointing this out. Sam, lets send it out again
that way Stian can add his Signed-off-by tag as well

Magnus
