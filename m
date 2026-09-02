Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A174A8FF2
	for <linux-alpha@vger.kernel.org>; Wed,  2 Sep 2026 22:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386558; cv=pass; b=MEjbPk4CpzavyYZCXbwY7Gzkm3lpf+Yx3Z7oysYEtDU8SDaaG0/7FiaNCY5jW/VmadGexGjg9ZeQST9scZAopLWJwS9LW3rhMySi8JA1uWErhdjr9aJBcdaIrZE+Y1KbV+gwb57hgzJKKNlCF8o/DqjlIRulqAXudebaRY01k4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386558; c=relaxed/simple;
	bh=joRGIrqiwIoYdt0oy36VOO5pA7IOqWqvIlZ7DjLDbjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QCwifScbPQJ5fpwu5lFNEUsKz8IftVzroAl5T/PNGZlsM4OIyxH2D3CDBiB4l0pgnkRn+QSyeKznCbS3WJE5ZmbSMLGd16hGtewfuISdx2UqugRqoYSJHkpSILGTCk02nVjSMhk3Wx5CNSg5MOmWKmmV+JYBxnFoBPoScs6K8UM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxMiIeSF; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxMiIeSF"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so2881637a12.2
        for <linux-alpha@vger.kernel.org>; Wed, 02 Sep 2026 15:02:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788386549; cv=none;
        d=google.com; s=arc-20260327;
        b=SVv5zJBeYtRfdlq+XTN3zvHl9+i8AQVn/7pdtn2tnjdoIie47+kBpPiLZIi82+itFG
         AutESBk+Gl0TDWfLGC770c3AfIAMPWgA+vmTiYdxQsgq0/KD1OynFhO92wbjkmfObFDn
         ZdzE5NfYSaJMbwPh/JuNC1ObS4CRk5RK2ZMrUxXeGlnYMe/tRnUob5i4T4zq2e5MLi4T
         I/UrP9pkocFfkcI69fwNaiwQMYjieTUNGKjZfp3x9uJvg07iWX07mVCYUk76Hg+0+Ybn
         U4caL7LVhyouaCQFODFxyvoQQYNc1/+lG2RaOkgL3g/kl8v/GPacVjlIefQYHBc3uZUk
         CPZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=joRGIrqiwIoYdt0oy36VOO5pA7IOqWqvIlZ7DjLDbjg=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=aPMCwTArcgGXNVHkmHYHXwtFb3b8lHGLMPrWfmQjPxOQnkQMgT+nZkdBaqglSpGuMC
         OwAAKlfS7SwBNkWKNAX1X//+3ESripBxr47H9nYWPGJd6YhnwdXIt2Y/9RihZYhoIba9
         UwyTkj/2rMVooDvlje+uom+5HAzdNRu0UG1IVHjZIJWmCKnpPJ0vIM7r599KtRxE2krX
         8uygq18RUEInpRNHA+eC2Qt+H2kZfJH3oI/GnCBBJFR1vajuQs39Suzn48y9u8O8euGh
         Bl95MK98D/NhaNKugP1iGypSM3wM0xs4ZV7zvIPJJMw6mgsBl2SdeAHeQcAo1a3Tg9QG
         opGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788386549; x=1788991349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=joRGIrqiwIoYdt0oy36VOO5pA7IOqWqvIlZ7DjLDbjg=;
        b=kxMiIeSFYSjZCUVfTIg0irPescMXcGRf04WusuTmIErkxxFFDUQnz/hNqGWYiKJYPC
         YziWto3BojizzjVHN+7rbAyx/cq/9DcEaLp+nwkHZvS8XThlAnuF3G8JLAP9D+tgzt7s
         8yFohk8fsu+QOAVJBvcx8PP2TTruf237Us/8D4mDI9hE4UQsX3WcCoX0RtnajRYIMmTV
         +WaTH/dJUgDddeNPVRZalMBkyvF+NeJTOatWsdzgD8AavB+9N8DO3QKPGRzUBddo1JFF
         pptIurkFFoKfIdo3T5x5pM0RhzAnhbSibOkmE7ihZusZ88f8yd5mimRbFh9pnJCjEDO3
         Dc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788386549; x=1788991349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joRGIrqiwIoYdt0oy36VOO5pA7IOqWqvIlZ7DjLDbjg=;
        b=nlkoFPianimDGcj2DTg8+p9+6EyDaS+eaARQ4TbRrMlgnhpBh5ueETsxI+z4zNwmcy
         wAM+IcwLsnP3YY2LzpNAckJx9DR0msEYI4OxxGQL4me0Q7GkgWwPtjQjW1nvmc0rj/xl
         ooD9QeSViuM+64OgNtWc/WODAd229sSPy0+U+0DhaIO1Acab2i3yeBOupleYlD6aNjXi
         1CIMsmrZaVhG793YkhMQ6KPd4NfqT5a9v5Hof2Af6rI2qhWSucUcViArcu+jHjY8yp8w
         k4zb8XonDuJuKTBqLqwL+MU7/b7niCi1EPFAzl7JMmn9q8tBfczjKcH9NPQFCk+a5EOy
         p8zw==
X-Gm-Message-State: AFuF++mJJhYkO2sfFI5bS2NzHkXhWXoTNZEgyCmxVKgqwkyr6i2T0oSx
	apcUc/x2zU+s1spvnTiBxHXsJTao802Yw5ZHukKOuSXIKkcQ1T0u84OzZKa6bozoSaWmUvocBUP
	YEtvwYgqEebDc/mBfTJ5Lwyjm5u1JhqY2htAlO/0=
X-Gm-Gg: AYBFou0eWVfWIokVsT7wDdwWrPqgNv++CuEzmizvcRyo8pdJnDaehWUSxZIfZ49C/Ih
	UgI22HLkgDoycdP0jGx6yqHMMiRgvXZhxOb9ITMxXS9ZDrOFdgyhY4YQzr5u7kHpVg2WCcMld0O
	6PbGa3A9+sx6CvM/M7BNsHNOOv6x5TWlUddezVHktxXZQusIGEzWTRZ8WjX8P4D+afS5GExxnPQ
	vVWQzCZJKoisUeayd9h90pWgktJISciVdgcejq3EcY1GMxf4CwP6RJi/MEzreOYVwa3DGneENS6
	Gh1fBho7PMEMmqQ+fEbVx8tmHp9dJrlwi9EorGHy14ETU70T0cG0LiOwPOC54bfCRBTdNovOntm
	eAaISwrtNAFzNDtucKPhIbshhc+CEuwE=
X-Received: by 2002:a05:6402:448d:b0:6a6:37a3:2b0f with SMTP id
 4fb4d7f45d1cf-6a68316aa76mr5614219a12.8.1788386549433; Wed, 02 Sep 2026
 15:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <ea0081603ea4f745e7c10895e83a1cfb4e80baaa.1788277742.git.mattst88@gmail.com>
In-Reply-To: <ea0081603ea4f745e7c10895e83a1cfb4e80baaa.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 3 Sep 2026 00:02:17 +0200
X-Gm-Features: AcwNN1UCPbkWI1NL6EjKRneil1vTlVTQ9KsrVdNDjYDjauNTjiiPn9Rr0PDNIPw
Message-ID: <CA+=Fv5Qf1YNNi1nk0UoJESmNyCcDXcfAe0SdYrHMOkBmLv1zzg@mail.gmail.com>
Subject: Re: [PATCH 18/24] alpha: select SYSCTL_EXCEPTION_TRACE
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Report unhandled user faults the way other architectures do, and hook up
> the debug.exception-trace sysctl that controls the reporting.
>
> The message gives the faulting address, the PC and the user stack
> pointer, and is rate limited.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---

I tested this on an Alpha UP2000. With debug.exception-trace=3D1,
unhandled SEGV_MAPERR and SEGV_ACCERR faults produced the expected
"unmapped access" and "access violation" messages.

With debug.exception-trace=3D0, both processes still received SIGSEGV,
but no additional messages were written to the kernel log.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
