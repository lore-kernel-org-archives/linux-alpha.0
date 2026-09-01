Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9773845DC
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 23:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788304855; cv=pass; b=hrY/amrcUafDQyutjBEFg5NOT7AQaYA2+yOFhpRwvi6pqPX8MCnWwaeODCDtFWB4XpJ7c1u+KFnZO3fRKKJxLjjQeJHnDGKyguLptMyhMCTQCl+QvG/AMNQcndh1q/hlpX/E53+v2+SlKA6QmeY8WnDsm/zABZscnDd3gya506I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788304855; c=relaxed/simple;
	bh=m4WYWmpto9XzX3GRSm05r54OR/qeUwP6VipL3NxPpQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sWO4PVGd6PkD5kAbJPrIsvydmSjsLfl/R5aqKzzqTndgCAmcJbWFHVeH97Ts9sff401SFskFeCfbt3EelXy0GB6I0NiLYNsUBrKdK4E+appIi6AMg9VwXXAdHzIrOV35Sf5AIXMrlRRRF1dQt+OEDW2tz6y00z5+Ekjei1srILA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcG4cOl+; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcG4cOl+"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso691079a12.0
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 16:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788304852; cv=none;
        d=google.com; s=arc-20260327;
        b=bKu/K55GyQohwrf6hvkWinL0+3aHkT8BGI/YBTkmI4ZqoZIvGvhP7mqIsXljfBqloY
         sNZ/613KPz4hsFw10LXPw+7oQtcjq1hO3nrWaUCskpiSC0BRfh2IIvz+7NGcWs2l9iSc
         eBSYyDgyQsYUraUwqOLRyHha4jM9sqLCr/Uwp8+jMonS+r36T/T1ee4csEWTLm8COcuR
         lZ8nK4LPNxZwavLKEu8bCCe8iPmOWnZ1RpPaoDPTvUgEKCmalnYAlStURLgkqp5e8z8j
         OI5TYmgawPf8T/rP5HkExm85XwbOdYNksPeONrorV7rc2DLjR9FawUSh0LazSOJIukU3
         CoMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hTDDNvmuJ7sxDXiEKyMab4jWJTRs9ZKSqT7pTFye/Cg=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=f4DBUkPUPOnWijSmcGjYLxbJ04n74gnb/rv68MTWt8Na/k8bTneNlS1uX34yVk/eHO
         2dhEh8TQat9eKnRDCn7AQNDIDEEXVHsWtP6rFujSXeg0UNRCH47sJlhSJhbxCZD/7lJQ
         bBmG3udXGJw3Q12JqnqoCJwzalTk0hakR6Nea1W+dCie82ON2S/mmh2lKSCyB+t/iHYs
         vO5ZjuFIOCQ/e5Vt8C8mw9BE32BXzcqSwps9wVtXysgqETa2nRhnBwW2FbwOsgg3/Tcq
         ShUTyRJ6hePewzNvfo0IVbvNkz6ua0rTveejqBxmJXjbmFh6h/692+/RYcL3omzEPxxL
         lnsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788304852; x=1788909652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hTDDNvmuJ7sxDXiEKyMab4jWJTRs9ZKSqT7pTFye/Cg=;
        b=fcG4cOl+BTuOxWFDa7lDEgvqmlx9O8lNZYWAb11N6OgCCrc2EwCswyBJEPl9CgSuzO
         sUF3qwwAsqtE87f0hIcmBc/CFVqJ/gB3aji0yYLg/YtAyp/2WQj935ecfdzwL0lVa+rH
         NfchWt1D8b/HpuYzVb3Ynhc9h2eGbbWpiQXLjC1nngownefDiGxneyAgY6sQW4LBlpQ3
         kmrKV3eq5tRRXUD1sOQZdBzJxKKWuR1uRVKXLBHnKTrAOfCCA4VIDqrn0iOq8np31jIT
         2tOne0H0Jlu8kFqTyRmwDTR0BlsNkJIqilZofe0hxU1v+3VfOtnc6k6Je70OmZ3IXb+8
         dPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788304852; x=1788909652;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTDDNvmuJ7sxDXiEKyMab4jWJTRs9ZKSqT7pTFye/Cg=;
        b=nYWmReAy7AgQFDZuEURgL6ZCoR4RZxEx1Np1muXLZAlZKi0i3eZM84cMOLY6ERv7jD
         tljfQQh2PC3Zvl94UqJrqzA0ROaympTJsLwsKYYftOTWoEeKv8IxTasESYwu0H4PhW7W
         gXnl2pWmiWgD+56s0BoUJ7FH8W9UxDIhJD5uvWwpcr0m44b9njajnVjpNM4pWTmMCFcI
         PcBk6xtzUZm3eTbqC2iFLw5dyVBezvEihT1vKiacImix5A1o88KyyRXjRmoiIxtRcbxm
         YF/IXuONM8FCUarulsiPeL+xObQHN7sO6b+dx+45ZcVmB89iFnYLFKWPFJ3TQKv5q9kl
         dSMA==
X-Gm-Message-State: AFuF++nW/DJlnBJ1v3Ve3GRMaXo+hAl0+nKhKsRNUg+OTdsfC9wL9YrV
	Gu3ZUnyr/q2dnarSx68c58fIEzFY1F2B/vP57BtbdP7Y9vsVl5aABu+N0Uw07JqpZSTUWodvrDG
	YJ1HQdGVxEyXn/X3DCc8okKnfjL0YS9g=
X-Gm-Gg: AYBFou16QsHvtldZMC1tt1dFXz7irMfGgn5H3GGEQtO5TOmjC1LKhmdgowWmQfujkC3
	tM2v5KJAgeJFlOvqJ7RzwG6UScO+wgkPo/6ISmhEs9zz6Lr7wPHyPHnIr4KWSFUuO+huvQThDtT
	2kkQjGF+z9J8laYaH9AgNl8/rJ6Y8WR4WoEhygcA75MtWE/J72cWTPqJXEibcplvorwLrGZeukA
	G0doF1RPPXhJ4Qge5CDsrtT0pVNLvQiZzkvsd2MLBakXzvPcDR8xSAuzSssvofV5WzYB4yjZj2Q
	cMjX3aYEbCY8ku3ZnIF2HP6buVqR927YSh9M7on1PrO/Kx1HdTpTpj4XpJwQLNEHcKgH0dF0iX5
	pCPco2mjV3Z6UPkD8fz4tGA/8AiZUfmY=
X-Received: by 2002:a05:6402:454c:b0:6a1:b515:d2b9 with SMTP id
 4fb4d7f45d1cf-6a6831cf33cmr484617a12.14.1788304851925; Tue, 01 Sep 2026
 16:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <50d449ba9c3d1f6b694fafd82f2b3f72db63d202.1788277742.git.mattst88@gmail.com>
In-Reply-To: <50d449ba9c3d1f6b694fafd82f2b3f72db63d202.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 01:20:39 +0200
X-Gm-Features: AcwNN1V9d1XOE1ZXjAbtGAPkVmsAORaeREbPjoWNQZgz231Ab7OUnZnXsiGjBRo
Message-ID: <CA+=Fv5Rr-6VR=L3s8PcK3ogVUMhBLmVyRBqukR6A4cUeGGLL3A@mail.gmail.com>
Subject: Re: [PATCH 01/24] alpha: fix arch_irqs_disabled_flags() to treat any
 raised IPL as disabled
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Matt

On Tue, Sep 1, 2026 at 5:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> arch_irqs_disabled_flags() only reported interrupts as disabled at
> IPL_MAX, but the kernel is not the only thing that sets the IPL.  PALcode
> raises PS.IPL to the level of the interrupt being delivered before
> entering the handler, so a handler entered for a device interrupt runs at
> IPL_DEV0 or IPL_DEV1, and the timer at IPL_TIMER.  Interrupts at and
> below that level are blocked, but arch_irqs_disabled() answered that
> interrupts were enabled.
>
> Treat any IPL above IPL_MIN, the level arch_local_irq_enable() restores,
> as interrupts disabled.  This matters as soon as lockdep is asked to
> track hardirq state, where irqs_disabled() is expected to be true inside
> an interrupt handler.
>

Hi Matt,

Thanks for the explanation, but I still do not think that treating every
raised IPL as "IRQs disabled" is correct.

The Alpha Architecture Reference Manual, Section 19.1.2, says that an
interrupt is delivered when its IPL is greater than the IPL in the
current PS. Table 19-1 in Section 19.2 documents the OSF PAL IPL range
from 0 to 7. An intermediate IPL therefore masks only interrupts at or
below that priority; higher-priority interrupts remain enabled. Only
IPL 7 masks all OS-visible interrupt levels.

The 21164 Hardware Reference Manual, Section 4.15.3, states the same
rule: an interrupt is enabled when the current IPL is less than the
interrupt's target IPL.

Thus, IPL_MIN means interrupts are enabled, an intermediate IPL is only
a partial mask, and IPL_MAX masks all interrupt levels.

I therefore think arch_irqs_disabled_flags() should retain the meaning
of fully disabled local IRQs:

        return (flags & 7) =3D=3D IPL_MAX;

If lockdep or generic entry requires IRQs to be disabled on entry, I
think the entry code should first raise the live IPL to IPL_MAX, rather
than report an intermediate IPL as fully disabled.

Regards,
Magnus
