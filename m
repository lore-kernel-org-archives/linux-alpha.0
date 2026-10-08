Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC39E3D16E9
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 19:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487784; cv=pass; b=QWYU9dD8HRzSGVSDvfvJEbjyzf6g3hI21dnv6f7TI3YCv5iRJJe5y7zdkI9KXNGcoo7rJl6kPJoleUqwE+BZxwxTw8/hQmOnUwMCy3UuJSAzLnJ8RfU0TPzsAIOKMXE6onqOtE4sX6LfiPBDZIGuOlaoFZYXnZ1Mzf/zx38CsoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487784; c=relaxed/simple;
	bh=bH3Ys777xJyJceuaHq+fKZvqaHs2+JI/CEfT6ut+TY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4Gd7jR6lJDo0OZjdMX6BVjq5ehMZ9cx3IQcgCvL26xT/YdsOJojumS2CcERX/APLzYiulnKpdr2VxSYiX2rYb81GT6RSb0oS6qmbyqP/y+AFb4fJJmR0T9zsHLn7OI696AogIBfVuCvFIfj2z8aoT86+7vCqlMdx7C8MWgRpyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wn6s8tb1; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wn6s8tb1"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so27503151fa.0
        for <linux-alpha@vger.kernel.org>; Thu, 08 Oct 2026 12:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791487781; cv=none;
        d=google.com; s=arc-20260327;
        b=Y7nTJuH7ZtV5VQrnNtPwqoviSn0m90fHbsuP/vtTigWAHrI76jR2w6j2py6hsvHbSl
         21U1TEIIuHPSuk2YVlv0antxHrtP7ocDKOikmIBB6BpN5PsvvqF1kCQAiDOSHiBn8A2m
         i1fAnnjZg59cms58YyDlUkX3m6uQf5b97Z9eQgDKD96FOOEajqQU4BSMPIxoiJHQQRhw
         zcsKAn80fNEbBD026hVUZQjt7/ZIbMUbVU0AXuXr7i/B5CMU72ekMG0Nle3XqNoqquXD
         3fI2Frpf5MoLMW6jpUuqfCzzSXPXFbQ/vefyr7FpHKEhEdvkIaPZTlpPPAzKAe9S7fOG
         6qwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bH3Ys777xJyJceuaHq+fKZvqaHs2+JI/CEfT6ut+TY0=;
        fh=so+pDzbAmNAAzp0lauAurK5F29HRuUwlhtZqo+ObRSY=;
        b=hR//LXn03r4nAzSBLZm+zqbQQuIqWowEHTbOAjY28OdVGiN+LuSzL6D3Lq4Am4Li9i
         xmJRO71bMiyllQ6CQ8C5fWSy0IOy/yPgUCkZSIQR5GwwMjj9VKg3gLTHzmj0qp6H+L2h
         tU7VXJnsgAV/GtH0/LqhXyMI/fLitjSYolSTnjbhd2ubhHKMmQLlq3pfLMHxd6BanNeJ
         CyxO2/atp7tIyxyPIXGe0kS6qOHE2O6T5L9px+nZXzZKfaFYOlyeiMJhBhNh2M9YDLaf
         gyo69a8w0jIt8oWkoGXtCtXVL31+JzgLaGTS364BjPTxbFukOr6YOKhIOLA4Fk08z+Q3
         TzRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791487781; x=1792092581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bH3Ys777xJyJceuaHq+fKZvqaHs2+JI/CEfT6ut+TY0=;
        b=Wn6s8tb1eiVxlv5gZBq8iT3KJpGjQLvnTO/AHZIgEXjIZG+Lhz3cBxz9g6pMTSivp0
         wtTeLJOmaAiPJSlSQOd9Ej4zOx0wKZ4ym1gMaPC+5iNC/XwmE9do2x1yWrR0ZsT3WHTh
         w+VsM0qSr/2GWJx1SzOM6Eby6osj7AxkURxNuREKFU3Ova6vf++oZ9+etNFhyam1NALj
         Od2bQ1cx/eFsFP3UDnGod8REDTBpuxc5k3J6frNul3JoTNVqwgWMjVadxVY7lHJthEaH
         ilc/QMDjwZp2s7n7giziRaMUj+76BvUF4Ofor4aLNHTC8T1qC9C6ChFjGbX5KO1AgKQ0
         k8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487781; x=1792092581;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bH3Ys777xJyJceuaHq+fKZvqaHs2+JI/CEfT6ut+TY0=;
        b=S4jFXaR9cQotiepWFwNynf516BrQbaYofWa5A8An7sUs4bWNnye3M3niJIAyL2HoAJ
         95jZVbk/JRkHToSmI4FukjV8H49OWuvoPmlEIibkiR21rUjwxyY0H80un20XEqhOhCr0
         sI4Z/jlNVb4OP56WXU99olDd7jZoVS1Gmx5IG1FC4cdcqEjutYpmrBXh3nqi7mqk7D0g
         Ze4YcOflW8HuCp0eRWI4wGnS5ZBsgKSqCyNIYATgptfwGesGxsMFzyDLq6OakdkdXoBj
         A0BkP9tvRPrEYwIeIKNofyW5IVG/TUQKO/M068z+f3ePdIGlq98vP6EsDbOj6xzN2lI3
         O3Aw==
X-Forwarded-Encrypted: i=1; AKwUvBxPZ3jeI47aZmKc9r5Lrta0mB3UglOV1KY17Rher/zms4+uN3RoNALIOGx1IDpRxz5NI/y747FTPt0xaA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJGqMujI6BbIjAlQh7b8k0yQ7FyTYY0EJdxm3Ntb/gHCP3sxqMS
	qyk19RKzT+I4hfxxlysHkAG7yfStyvsYUo7sgnypY+eg23SDyYHeIHt5bxiD6N22JpusPdKIHDc
	KCBaRgm36pk1lovLukKl4g85YDDOy2OU=
X-Gm-Gg: AYBFou0hjIrqpNaeLi3xI9Ze2oTyD/ozItdBGpMfTaYh/G//D8vYYW4i6qRwbCLrkrI
	59LJb1TfObbnQcPBo/3Jan8KheJq8YfgpDCtzpqXrt1eHDNerDuQUTbiX7LzhCjEDmjqdfsxPaO
	pTWRGbvY1k9cGZN3Do9b3c10pbgTzBD5/KBLbmBlV0X38VfoXZ10GgbemZTskkI1KLwi7+/RM4U
	N5D/axhmy2E0rF/WZlyZxL25peoClSdOkwKS3cyb7Clg8YLvCXS+kXJGQY6O3pgrRKiOdmTcJZh
	Kt7BmhRPjjukeWquE9iKCvX7FPFfc4Xp57O6UgfUjA/zGojYC+1OHuJocYYt1cPuEzt+MkcgQGF
	kkJU48HE3kemqfw==
X-Received: by 2002:a05:651c:15c4:20b0:3a6:58fb:8540 with SMTP id
 38308e7fff4ca-3a9c2a6f0d9mr491601fa.19.1791487780457; Thu, 08 Oct 2026
 12:29:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-fp-exceptions-v1-0-c99d75608e60@gmail.com>
 <20260803-alpha-fp-exceptions-v1-3-c99d75608e60@gmail.com>
 <CA+=Fv5QUxT-T0XgXccAF=1_6Dz=nCpY=NQu=ruOrYjbB+q7YCA@mail.gmail.com> <CA+=Fv5S_ZrHedEVPR9Oet2Egg2hwy33pEqEXaQa0zGdQdNjWRg@mail.gmail.com>
In-Reply-To: <CA+=Fv5S_ZrHedEVPR9Oet2Egg2hwy33pEqEXaQa0zGdQdNjWRg@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 15:29:27 -0400
X-Gm-Features: AclHuK-YAox1Xf7NjC5L8Z-SfaibsiX2e4acSu8a9kwaQSKw1rOePouwIqBhWL0
Message-ID: <CAEdQ38EM0FyqYZH6b30oxScZ481dGqnsqu23iePLdx2gCpqzxA@mail.gmail.com>
Subject: Re: [PATCH 3/3] alpha: determine tininess after rounding in the FP emulation
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, stable@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, dalias@libc.org, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 2:13=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> Hi everyone,
>
> Adding Michael, Yoshinori, Rich and Adrian directly, although this
> is an alpha series, patch 3/3 also touches the shared soft-fp code in
> include/math-emu/ (op-common.h, soft-fp.h), which your architectures
> build against too (confirmed by grepping arch/{powerpc,sh,sparc} for
> includes of those headers; parisc/m68k/mips/x86 have their own
> separate math-emu and aren't touched).
> The new _FP_TININESS_AFTER_ROUNDING macro defaults to 0, so the
> intent is no behavioural change on your side. The new guard it adds
> in op-common.h is a regular runtime `if` rather than `#if` though, so
> it still gets compiled against your macro instantiations even if it
> should dead-code-eliminate at -O.
> No action needed if it builds fine for you, just flagging since it's
> tagged for stable. Let us know if it causes any problems, or feel
> free to ack if you're happy with it.
> I've reviewed and tested patch 3/3 on alpha already (Reviewed-by/
> Tested-by posted).
>
> Thanks,
> Magnus

Hello all,

Could a maintainer of this code find time to have a look?

We can take it through the alpha tree, but we'd certainly prefer some
review first.

Thanks,
Matt
