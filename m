Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DBB38E5E9
	for <linux-alpha@vger.kernel.org>; Thu,  3 Sep 2026 05:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788414176; cv=pass; b=k6y1nC1W0w7Q993YDaUZix0slBWiL6QmciCnz7CCmv43DDdAnync5zwCs4cFbXsbh+PyDsOd//oaG5IThzQTKQJZzYwimW+pJ14YGseY/joOtZICSxMj8LHght4lVDFHqhj50bgJ+ss3mThwPMUcFSFnkxAOYD6deX8aemI9MBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788414176; c=relaxed/simple;
	bh=87Zyyw4GFC5ngPT6uAcFPpo1YmyG5KfY5IVxNusfOkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NcN78vNIqcAx6Qe7v4ID9t3lTIV49wjeyPFetCnEFPN/9VuXg0CV2dSwd2LTiK3MCDYrkw+epUUo3GCjmFqW2Yikb88jnR6mgsxzvTnvW3QId+pEYuaeZpjG5PhUELenvcRbOUi++oQYWX2TVOFfeZOu28hOTc8TGGaawupe+RU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V59YVEOA; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V59YVEOA"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a682579c72so2621556a12.1
        for <linux-alpha@vger.kernel.org>; Wed, 02 Sep 2026 22:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788414174; cv=none;
        d=google.com; s=arc-20260327;
        b=cd5SL+HCCxQostS2Rua4eWfdd1HENfRq2n+ce0yJdRjxyHfA5CpExiosohWod9geDc
         3YP5db9BLsl/OXOytBTwAbE2+Eo9SAkkzqrEhQKMWNUFdfFpvZ8ed1C31krw5QPKhemM
         35h8xNGKRgfPZFReCXKe4c5ugcp3+MlB3DdXfQ2qLOG3lQwz+w+QJkBVolzo211kcEAb
         IdEjXdxUXoWLRNbtIrl+MYPHoNRnQFh59SIhtNreCPNdVlO5tFVxobA+mrTnbsmnWaKl
         QiOzKGMsXvMtHVf6K5iz+bb76oH/6dR0ov+VLVTf/maV0zcncHfEBKBq/WOnNm2nWiRS
         061A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZCDPRSfQ/uak8RTuOHMHrP0RFeolUV0dQQ05nzSxjgM=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=ersFrICLrZW74Z0GoYRaXtR+51K1GREAFiZ3NKMtkqozAkHIoTZySBQ1CiwNAq3aQ6
         sqyty0JXnEMbEnr+2xHAB7Zp2EQznFX1FxA73PhyOVboNyEuy84gc02t1CR3DgglV9CT
         83jpSX1uEsctIhO5RD8i2nlos2ytC5qD3PDgvuK1cgO/yCwCxcrJye/0uc1si7gdbDdy
         /eSnj1Pd2wuyVOKFAwJnfdYyxo5Vc7LG2OJqc47gG9HjWvLumbiOrTSlcQ+3enCrXoQ0
         WSVc7Q4syTUXCT0827s9VsgwY0ipwqDRkPjkofTp9O0XozrY977aMNSR7jIp5e6oKpyi
         scPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788414174; x=1789018974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZCDPRSfQ/uak8RTuOHMHrP0RFeolUV0dQQ05nzSxjgM=;
        b=V59YVEOAqcUHQXUtHZ0zqQGdfeFvBC0F4OOP1Lkt2ZwZOjxLGesZhH7VZhIUewtycz
         Afl2WPwvYCgM6HmScXJ8ybMHfJgJB//hqvfA15Y7irjF8LcGCzOKfFXxVF2a1vGpCPfK
         K7MBOKn77qjQceeudJjYqIyGcmyifEyitnq6vxcnOSTIk9SY4rDQD3E32Kb4QDek+elA
         p1ckysXL5GSmAORAc2MQ13tAMZlM8voNV+ZtzBKmsP0LCyrU0Rcrlb9MYDhdmIc77xyQ
         a2NBwYV+bRd2O9kKReH9BXnqwSBOPDSEia6sEu5gD/pyDn6T9jf2Lr2z65I4Jzhgj2mR
         pFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788414174; x=1789018974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCDPRSfQ/uak8RTuOHMHrP0RFeolUV0dQQ05nzSxjgM=;
        b=gVx40dLaDmBpXPLprApIX3evyTjHN4xaz4xgXnTCqL8nKrOnxARrDfpM19OCuqlhTK
         RZrRnxY/BwY4JD5M58Kuwg8Vb77jKumjiNdQZ6UQiiDsunCXLmzKjhzYf2yUMwqCxvvr
         ODIdr6fSZv1CaO1xSkQilTjWxIHCtTLRuINkaevxWbOD157czccpx/8f6uUExNHgzLEe
         F9PJEdVs3A0qp9ln9bxGypOh2dfuakXDIxspR4tGc2QkQItutXWp7On4YmAN7E2cVpzI
         KrvYoM31lyHvBPSF3BdL0uNiAwpKrcMqXBlqXoafBHRWHwsRa+c9qaPZWCbh3+S0URJp
         7gZQ==
X-Gm-Message-State: AFuF++n7KnG1n/rmbyiWuK7kF80tJu7A52YZJQJsNNTwkIxGz4NvPZzH
	AVz+IvJnV0GiZv94A1MnT0G2p86/JVB+f5EMajCZyKEDEjbwbMjUAnpcP23h8tDpLy7nS4foXFs
	MBV9bxwrdQ2K8gN1aKPqFyATCZgGXnWM=
X-Gm-Gg: AYBFou0QRhH6iRAhDTk4DVOelUliZBhstsjWrsj/lADqDloFr/2NwmFG+UkgYhB7LFG
	ijHD2oH966xLPQseABGYgG8K2KA1Sgrcxt4XGfSZE+Lsoo70M3F2oDbFKWy2zs5dwBLE6eyOd0o
	S0dWFRFZgSxzZzR63R/Thp6oiSvs9mBjrjVDQYrojnZ7IwxjTC+PoEsVuTmm6QGz5cC6HfAGIhy
	YvHQHa5+QF4YUGRyaEpNvapVd8lGW+YR9cCoyWTLbd2x41HT3nd7SkJ7NgxSj+l0iD0K+nMwN7U
	zyl9U1xTDQhaWXzm4nhHBI0jbJ5DmvGf8paM48nLujr/aSFz7mUXkgp0j9BCpvlzJEM1Z2f7myE
	acxdadNke8O/FjZDDoPdwtRltkk3g9Fc=
X-Received: by 2002:a05:6402:5187:b0:69a:b38d:403c with SMTP id
 4fb4d7f45d1cf-6a68257bd0bmr6072430a12.7.1788414173358; Wed, 02 Sep 2026
 22:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <46250102699dd2f07b6ee19ca58edf3a9cdfa0de.1788277742.git.mattst88@gmail.com>
In-Reply-To: <46250102699dd2f07b6ee19ca58edf3a9cdfa0de.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 3 Sep 2026 07:42:41 +0200
X-Gm-Features: AcwNN1UnFePPk7eUF6fem1Ufjb7mKKV8jK2wedJp3tRtopOOcvCECK1QmRyMBjk
Message-ID: <CA+=Fv5QG++qpvECKiSovEAqXevCUrBtaFsADvn3B780pYd40vA@mail.gmail.com>
Subject: Re: [PATCH 21/24] alpha: select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> activate_mm() on Alpha calls __load_new_mm_context() which assigns a
> new ASID and invokes PALcode swpctx. On SMP, an interrupt arriving
> between the ASID update and the page table switch could see
> inconsistent state. Ensure activate_mm() is called with interrupts
> disabled during exec.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
> index 827b224f2f8a..bda8443a7323 100644
> --- ./arch/alpha/Kconfig
> +++ ./arch/alpha/Kconfig
> @@ -37,6 +37,7 @@ config ALPHA
>         select GENERIC_PCI_IOMAP
>         select AUTO_IRQ_AFFINITY if SMP
>         select GENERIC_IRQ_SHOW
> +       select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
>         select ARCH_WANT_IPC_PARSE_VERSION
>         select ARCH_WANT_LD_ORPHAN_WARN
>         select ARCH_HAVE_NMI_SAFE_CMPXCHG
> --
> 2.54.0
>

I tested this on a two-CPU Alpha UP2000. I ran 20,000 successive
execve() operations pinned to each online CPU. All executions completed
successfully, with no MMU, ASN, or page-table errors in the kernel log.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Magnus
