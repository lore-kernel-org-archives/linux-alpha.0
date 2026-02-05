Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E39352F98
	for <linux-alpha@vger.kernel.org>; Thu,  5 Feb 2026 06:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770272208; cv=pass; b=t80QspWx/gH781sLioS7aT0bifHl52dLmFzs9s5BUoiATySn2NO4AYDZnIn6Vb4Uk4CXYU9iri10GUjluAnsNOrEipaKynhQugyw7giK11cmf/YdNfnxXFaMGnJJpWDlr3su7wOG86kThwGm+1IVE2F7i/E9RRCNNmkXtzp89ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770272208; c=relaxed/simple;
	bh=Eih5sN2bTILR3ZvH/gAnFdsIvFT340ju2uCPCiieP5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ejPf1wkRqNr6JzUS1gTgaQH/Jl6Rq7cCCk8rRnkT/fzEPKGGjPh7gOgm7tigDbr4964HzS2Byf4e8Gh5/n4okxRZk+0mF4Aj5e/98RvJPEAnOq+XkLPSBx1X3LkJC5WPE/KNGyCwvE9Qaq+MmH5q49E+QVZkjtLiGXmVaa9MeEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWkrBlkl; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWkrBlkl"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-658b511573cso1019145a12.0
        for <linux-alpha@vger.kernel.org>; Wed, 04 Feb 2026 22:16:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770272206; cv=none;
        d=google.com; s=arc-20240605;
        b=cedq8z87JuCybfVksNL2mi6UN6364Ym3EQr8p5WUMAWdI+NLz46P6gNwHsUJKRBVEa
         K+f9xNTkS/Wg8oQHONECIBwY4n/VCixb6HohYMkLSGZ/Xqozfhd+IVODXFAZfBKjDuCs
         3Axi3tYAdkB4B6Pl3sUWwnWSpm6xB92OXDd7ss0Q6GrpY36/kx6vBexQ79K1tdBsNMMN
         lfdo9pKewe/CM0dFuGT6bGC0jlQ4FOQcpA1kThXfyK2U2oMs6XzSWrIUwGFOhqHrEigc
         ELxizeRAtYHCWnlk7RL92eYHWtOlI6bUqTJxfNHi2q91I7UwUVBmZ+FjOh7Xx7ec8F0l
         SrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JA9OHnuh3M43fV/HxGh1s7Y94CvOcJ2R1oDY3FaAIEo=;
        fh=eoRYckybi3ZDQHnaDJqP+bHQ/Y1Xu4tFzzJwAnfmRh8=;
        b=FhNse7Rwk8Mj3ySf3aGUj/jXMeLWXXlMkTPQZzZluYNF0KK0dhRvLy+6Prt1dPlF7r
         yudBInmHnDVkw0q9O9uugrRd31YAHJBG31ih1T9PGbFpae4f9ZDFQ76DQn69tjt1k0Ic
         Ns3Se8Nskp19w7wkgNnIbmu3EzBFg972JgwTfTuCO5XXXlJcTfxI/sdnL6VxE86ASN+G
         OQHxHcQxdPQn4HRiY1ncUfB2LsTZlwEUoaHJEomXp/1eWXZN6crv66t/D4wrG35xVYZ4
         nWYPIRE8k3Y53dA6rZtDSSEOnGd4qqmBkNZitHJP+P1clLhA87LGq3X7vPRDGd9Y+87L
         A/Hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770272206; x=1770877006; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JA9OHnuh3M43fV/HxGh1s7Y94CvOcJ2R1oDY3FaAIEo=;
        b=HWkrBlklV2gTKVYKRdSKs0W6LjKMLVqpk9lJB7Qv1uPgZoTnOxGV6bh1ZnshHTT7BS
         7ohae1kMaYACj1DuPQghnak7lXu9qrj82JTvzdEB7Tpf0xlYkZvGW32QiPIqsh//yk8i
         VPRKksvp00gDnP9MvUWeVPslOlgT0N+Vxl43gdeLkMwwviVvMJyJxXZYPQ4cRv8fsrHh
         Tr0IuGMnWgg1NiWB/DIhl3O/Ato/aGAUINSTIIGq8YBrozDwefcVfcYpG9cHTrteqggp
         OaoHNqXxdPnb9V1Ok1w3eZXG8nmnN005tU7WdwRTA0iGe4o9JxBqnQsHQhompnCtKz0h
         z+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770272206; x=1770877006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JA9OHnuh3M43fV/HxGh1s7Y94CvOcJ2R1oDY3FaAIEo=;
        b=RE+bf1I1QqfNCGGboLp9ry5lN6TTWJulyflknu/bHKZDG4oMdUS+D3QtLI7KXaUOon
         RDoqAa4nRZFFL0fdX1ze4IH7EWDWwAZc8weTyQv/g6qV9V/bm6XjjTJcxVuvW00GPvJl
         6HYCfGeQDSfOXfmMWKTGu+PCfvakA4y1qb3QR2NPj9bz5Az1w9b0J/qsKvEj0LkwLEEF
         mFzWEAhbbGFIf2KtNBzgZ7a5o0xPOR+pSqhaSPdL3m4lVJWgOSeAJFYLmfjtarO4pcRX
         Td6VkOSYCdlTd++Wsm3O0tIZxx96vQSB/CsQHIv6y1qox+GHlS2oIN70drC6c8kIY/1a
         VfBw==
X-Forwarded-Encrypted: i=1; AJvYcCVzNfSG0G+9VzRc5CeIfnKBMN+mxyohirrOdjK6af+PRb6oy8E3jxBvXzPEbhQq3idhqaTkvg08H+z50A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/+t2i8O38TqNsyem7q2jFooRr30uQkCXN/zAWPIKY87luG142
	/1iQzezKqJOlPPceBLasAdoT/VBAYQRxCkvSntRpnxahZag906P0IBI2YJJDCRpCCphzhA3p/5d
	9SmcbdTlx9tvDOj6XIum79lzQwmcjs7Y=
X-Gm-Gg: AZuq6aJfai3m/6LfqyathipIeBbGRG0/anRqf38J17ezXZicOm+jL4C3X37IYQ+Zmwk
	wEvD2JmH30rNieW5GFOHGwBe44+5Em84lVkhSILsRl9SIKUoT8KdMxO8PcUowK5c0xZRNsLaPi8
	hmHtwYMwv7cER6LxRxSTQYFZAUez5px1Vfm8k5u5A0S39DmgG4edg8aSVg/Bwb4ofQUpvUkvqmf
	VhREIm7B9rppo5KASIdbbX7OZRtT13tdN7TagO12/yeP5/4NBia2+uozw/ZTDmSKkTB0GJNQc6D
	nxMACXEpriIlmYCjD1j06/vUCVbV
X-Received: by 2002:a05:6402:3590:b0:659:428f:a6c0 with SMTP id
 4fb4d7f45d1cf-65949ecd97emr3649759a12.20.1770272205953; Wed, 04 Feb 2026
 22:16:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203063357.14320-1-linmag7@gmail.com> <202602041817.3967F048D@keescook>
In-Reply-To: <202602041817.3967F048D@keescook>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 5 Feb 2026 07:16:34 +0100
X-Gm-Features: AZwV_Qh9qSr97rdpX49QnAdOg99x6IlE9VbsQKJ6b3__Z5VT0o47-_EXswe7Phk
Message-ID: <CA+=Fv5S=XxDyNFdqhR3p_wEPwGEpjfE+Rqk1h1JJhactWFib_Q@mail.gmail.com>
Subject: Re: [PATCH] selftests/seccomp: add Alpha support to seccomp_bpf
To: Kees Cook <kees@kernel.org>
Cc: luto@amacapital.net, wad@chromium.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de
Content-Type: text/plain; charset="UTF-8"

>
> Great! Thanks for doing this. How did you test it?
>

I have a kernel patch ready with SECCOMP support for Alpha,
I'm doing some clean-up work before posting it. I'll have it posted
soon.

# PASSED: 111 / 111 tests passed.
# 13 skipped test(s) detected. Consider enabling relevant config
# options to improve coverage.
# Totals: pass:98 fail:0 xfail:0 xpass:0 skip:13 error:0
ds10 ~ #
ds10 ~ # uname -a
Linux ds10 6.19.0-rc6-00087-g8f403dd8d03b-dirty #121 SMP
Wed Feb  4 23:20:21 CET 2026 alpha EV67 Tsunami GNU/Linux



Magnus
> --
> Kees Cook
