Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A272D3376A2
	for <linux-alpha@vger.kernel.org>; Tue,  6 Jan 2026 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767717027; cv=none; b=YXf3iyTg3SaXWI58J5yUjXuZomv0+HQap8ZAfhBPWzrx7ye+1SCDtt86WKZf29w/J7oF1qr5fNeXmmSk6bpWF4SgJmXp2L3FjDSCMnboZOh+bteL0cs/UuAgjfg5wlLNGGGyBT+K+RIOslpp0mQ2nSnSRooI4ZEYTaZUUqcEa+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767717027; c=relaxed/simple;
	bh=U0j51mleQ1XhvbVqXphZJy29E+snKGgnLb9jc3YD3Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rus+Kr1hj/NzjMNcr+3xVU+sfQUiNNbBcu6JNUEoQp6d+XPfxUqbkh7TvocuK2oWFPPCMCBr4GfUysVFxPuZUOss6GghvU/KE49giYODmrvlgD6vRj87ioUKAXPLingLzmnU8o6LId3B3gy1Ti6N1uMFD44s+JUzJ9GioBfQdg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kg6tEjkV; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kg6tEjkV"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b736d883ac4so226156066b.2
        for <linux-alpha@vger.kernel.org>; Tue, 06 Jan 2026 08:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767717024; x=1768321824; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YFywE2icKNJ+cB7uTyuGoCkXxbifngq0AAd5tIXgGGI=;
        b=Kg6tEjkVXeWggMleNA4u1nE3Elaq0qOy6IJ9HN5XnUzZ8v7iVTjBghY+RFmI59/0e1
         81ViLmRLAnO4oGs3DOI+gsaGXXblp1Foq4aDEJuJzycXtsOk7XEjL1l7w8RHcWUzKGSJ
         cO+6hd0PSt+tvnDaGODYdtGaqs0VVARxusywnvb96HZQHy2yUoyxYXY7SCqL1kLCaXnz
         7G1BbEoaXRCxfFLiONXXsCiGVo3ceR8pKUMk2h9ED2XsB73ef6nCtYfZlLJVbWaIT9nG
         z5lRhCGwn7NbvvE8j1DjwkBQEk5vPKSLf2ZZ+C/I/huwWr9moXgY1r5zbljmToXBOeWM
         4nrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767717024; x=1768321824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFywE2icKNJ+cB7uTyuGoCkXxbifngq0AAd5tIXgGGI=;
        b=CUwAwHf7D6IbVr8lpvECqk3ws2fceuL9Cmrk57vlVOh5gutxaVZuH4QtNR8FxC1mTj
         9OxtEFwPorXzdjNm0RLKlGxb2isYH3REZMPPLrcvyL8sxjlYI8rmfHWc6rhGDNSahJY5
         xn6gqw5czOzE28Xo8tHQrGCEGIZuQ20BXgZf2dV8iz0hEUHOtnGziwApV+n4Vl2B5ce8
         AzFTsYxKjzWflJhSxM2wKEoztYUb9QVLkM63EXBnyASD/XkEAO/a+8PCWXshCcOYvBkF
         4/uQlFBMuKFNxC2pBnftnyxjN/kiL/GEvBlrvekCR1ACwF/yF8/GV7iFNUGOr2vEGrC1
         DvQg==
X-Forwarded-Encrypted: i=1; AJvYcCW7Zuc+38fpq+pIbLQwc0G+vnDWHTBcnVFrPkCgF8Ss5W8UZVW2+hFjxrvKmdDRKgxB+KqmfIgLjJ2ACg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGZsPNzqcjVYM1MCz+l/YgLPyAyvb3Z+J/uJlTRFjQfz4jz3qB
	TgRp0yjSVat6Jt76Z3mG8y8BmJ/xaPQsJmHWOcYBFDA4yxYZatGc/kMGByIcjnsfqS4eL+q4tVl
	HAmvQFRdZBjtDhFLRfsz1cItEfarxipU=
X-Gm-Gg: AY/fxX7GvHrKgMcRemwUa8iuXBHT8kduWamh1aXk/GvA41r+wOO1dGmIHdhsJRr+X/+
	KZO+Yt4zPrX4xJ62ln/UO6rWGf5Vxvl0C+dNmiBCLiXkELpTpeuyrzf3CEBF0zA/FVm09sLn1HB
	Qk6l0ccrSlup/AEIwi4emXA1Rnh4ugr/yqRIFwRlITRGCkZnEvMQpiVTucnmWi7LT9OOsSMofR5
	OhVH6b8KHstC8uCU1VISk+q8x55wn2JenWKPid2w8VCvuGZWXYFZo21LcUDyCUEOrMCrHpS
X-Google-Smtp-Source: AGHT+IGiqs1gDfUISyBczs4HyJmVzzzKZpgRC6NkJpj6fa6eM1SDvFi4fb2rgcGA7Eu/T1LDB0EY4X8+Kh2dwLV669s=
X-Received: by 2002:a17:907:c15:b0:b7c:e320:5232 with SMTP id
 a640c23a62f3a-b8426a49324mr367887766b.5.1767717023650; Tue, 06 Jan 2026
 08:30:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251228063440.2623595-1-safinaskar@gmail.com>
 <20251228063440.2623595-2-safinaskar@gmail.com> <CA+=Fv5Ra7fFTd2wA77iM_6X7NooApfoMJX5z1j60cXex_uxm7w@mail.gmail.com>
 <alpine.DEB.2.21.2601061310110.45251@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2601061310110.45251@angie.orcam.me.uk>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 6 Jan 2026 17:30:12 +0100
X-Gm-Features: AQt7F2ryRckCS1QLF5YuAHz3r2RQu9Pt7ESbBtlhCipsrDrEYweGbF2trlCO0MY
Message-ID: <CA+=Fv5Rw3vJGLsEyuKOBMyZTcQd=ayV5jT6bhWNn=uzXKsw13w@mail.gmail.com>
Subject: Re: [PATCH 1/1] alpha: trivial: remove ^L chars
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Askar Safin <safinaskar@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>  As a matter of interest, why would the presence of ^L characters cause
> any issues?  That is just another instance of white space and it has been
> commonly used across some source code to separate functional parts, e.g.
> in the GNU toolchain.  It can be ignored unless you actually send the code
> to a printer (which I suppose hardly anyone does nowadays).
>

I guess you're right, at this point it's mostly aesthetics. ^L is just
whitespace and the compiler ignores it, likely a relic from the old
days. Some editors display it a bit oddly, and most of the kernel seems
to have pruned these over time, but a few still linger in arch/alpha,
which fits the age and heritage there.

Magnus
