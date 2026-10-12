Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433B54A263C
	for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 15:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820296; cv=pass; b=UvsUiW63kyWUC8bX0eK9kfpuT/Ec/4JIwI0BoQXquNnRMcXOB6kdyk7n7/WTCFjLfTOTiT3rgw2yMWub9h2rmcrgWXAWhjBRroNGf+koH28O2GwxuwZqP8bTjr05MPby/aeZdv0R/m+rrcjDneiO+AVs/V//i+cbP4q84U11rb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820296; c=relaxed/simple;
	bh=2HkM2JG2ntV4O9L1XnPwIDhp9hlRGoVV+6lp00SUDi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpChn8wAq8zbZtRD1CRmKwMFxyXUsi4BfgbIICCSv303vGSak7VQSHiUnSbraVpHWULslLaYOH+BpHtUaoh18pYW5PZYGFmrkhHxdT+ieTDM15hHiIpiob4IFpBI4B5MPs+T2OLvWB+W6q4pTjEkNUVeNV2ASX3hYaiJqxtTCBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAwRCGPb; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAwRCGPb"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2e7496f947so326115366b.1
        for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 08:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791820293; cv=none;
        d=google.com; s=arc-20260327;
        b=l8WD7moPUOpaPS5pTjh9xLd8uV36cNW4zM3VOua4B2+wI0l9JEWrgknShmpllHWNj8
         XfVn8sDP0wFf8gGbdYSTorEKpden02Lrr6ZDG7Q2HPcZHLjv8De47CER7cfAfGGSQXTC
         XVhb1HMmlSLxBDuKFS0CZx4BqyFPo18vZQjdR9Hb9WPKJDzRECr13Cmcmt/rU80/jrTz
         bqJ6vtBg/KL53C3ygQ6vTRRTfmdfq8lvGtN4MUuRPfI1f3+P0KtYMVM8eOLB8z6BHfil
         f372grqh2+brG4yWxCwySKRylJ8NxkpRU7MxXj4N2k8VczoOUcTPP/dzFM38+bzXQGrZ
         yZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ktNtTU9JVKl3ZfnOkIWLssk9gxWZSjBCu9lT+n1NcmY=;
        fh=Lv2SfAQ2A9Y2mft0rgoSL5/pfa/jvWRGWSeWRkebMm4=;
        b=UaHf/QpNoMR4ZLR4ihrsbXuPB4Z+nTNL27/Z3JJcbutDN2HwD5LCAf1/Qz/XFR0XNA
         YwjuznZPKGzD0/KRWxNuQT4NvCi2EijnCixFohExLlWtiyjgZVmab6ybreNWtf0LK4Qd
         sFLoZLMnInnKj9R6qhv3jwMfw2oHsHez3SshCGJFRTCd1Pa7ZskNWL4hSzFSOQePTYn4
         18gWk3rTzDOjIgjbfo7/4ztCG1AMz8hqHffO3w7UN6C3+GyZxHwpc+ncHkk07qHIIZbI
         Yb8g189C/uIUNJ0+58DyBSo0rtXSjAmM6EH5Y4frhEkHFp+kZLh4T36RUHSgy4EGlzbq
         K0YA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791820293; x=1792425093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ktNtTU9JVKl3ZfnOkIWLssk9gxWZSjBCu9lT+n1NcmY=;
        b=MAwRCGPbF0QPfcfV9LnuZ5kmzcZSsQr/euUjqbBg109DgnrDdDQlH30j26KpRK0iQl
         JL5pmwQXyPs/Ko/IsrXlFrReAPp+f8uvp1M74hwpmJbekZxsVYzxKdiyNYH89O0XQG16
         moK8vjGr+e2SUn+GikOB0h6Ky14moFiRs8W/u42bp6iBR3X4CDJeFCezN3W/hW8Ot3it
         C4A5UUPY+N/kUEzMWp54N+nCDePa7mz0Zqg1yeu8WjACmZK0qu3Ekb3HvR5ufGtDBfkq
         4CMUDTTVZ7LuOkzG6vdpSbswau6RzGI2QPzzob51y7vzH2grxM3ukwG7nYHrHPiux6EM
         yQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820293; x=1792425093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ktNtTU9JVKl3ZfnOkIWLssk9gxWZSjBCu9lT+n1NcmY=;
        b=fjsb+rT4Y9Thhn3ptMIg72uvbFS5b0TZJYbpssOtHo6T1rKaKwHAIPcnoLWluxmEAr
         iUsdT0bcsfiI/cXbGVdzN5MNYZNgHnp4KJzUqlcVT3W5hnyOzpYuElq/fm26LYAqqJaI
         aJOly/5hi6nlR9fe1RBQ1D08Qx0f/RxE9y5cx+gi6VRMzhWxaH1hi0IWhlA3VnULyDDk
         MB0PfXy5/DVRis/bvP9aSK4ZFMmFdMo2WZYk+K7gK4SLgDx4up7z9c6akgxlTrwjlxEX
         RL6RrqoSvwIcO9WMWFbdSi9mMqquBUk8sP/ysSHEHLRnp/tkj/nnKd2s4u04wi8/fDoQ
         7q3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzCKstw+8nNt0c9HTNK89huZOmtqJx6gms/n+HN/52/7Mvm4UgDKi1CiOKUiLTGbbSZeL+wvxpEFX/tLw==@vger.kernel.org
X-Gm-Message-State: AFq9FYImp0JhmYt6S7SsTX6nfzbuA21xOgver5KrT2Ihj4vl9uMDiEI7
	oUBCqAMTbP+ne/hAKcptyUB+u8b1lbooXLVJWzbOtktiwn8MA3Pu2/JKShDWd9Y2DYxzxj6RRVG
	qcSUqiF3z6kdkHMR9Lbka3ah6IwlgDb8=
X-Gm-Gg: AYBFou2FAj1BNQrnpqB4Ts3MEPAEIh3qezkpRRDBkHxsG4OT7U3ayyT9NV1pxlr8rrh
	kDoPJacZbPPtSkid6E9pgI8QzdfKBO1OGsmqjNFNaDsnHGcR89see2B4ckvNRpfhvGWtiMDyboW
	dZxN+byg3b3oEdAwSwF4vDrBDUwGmSl9RqggKEMt63RvgH1JcibP/U+BklZtXATNMU3NWhYfmej
	hB/jWGhoxsoBL6Jjn2RXP0bAuy+G/gStjHIjzbX4LEYY7zlKVmU294g/7E0x0pMZOsj4z7qxim5
	YYQ42+TzqYVP3B0q94rbNufDrnSNWG7sQmIFGFMxtHeCjs8DSdFNL1ltaSfdRU+lfNc56t4B47f
	OQt8FCTtZqfg8zp2eEBNZQ5N8ZqH/MBXRhejpytWtkA==
X-Received: by 2002:a17:907:9690:b0:c31:82aa:dd60 with SMTP id
 a640c23a62f3a-c31a9d0a5e7mr975742866b.15.1791820293222; Mon, 12 Oct 2026
 08:51:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 17:51:21 +0200
X-Gm-Features: AclHuK-xhWPZl4E0ja-mmL2ZAsaPkLiMeX7H21n80nyvvKlwLIZYd2jJw2alGQQ
Message-ID: <CA+=Fv5Rf-DKCTSnex2_Y9o+VU+mbHhMNzLJyBQ1+9hTjHufXAA@mail.gmail.com>
Subject: Re: [PATCH 0/4] alpha: perf register sampling and user stack dumps
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 11, 2026 at 10:16=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
>
> This lets perf sample registers and dump the user stack on alpha, which
> perf record --call-graph dwarf needs to unwind user space.
>
> r9-r15 are not in pt_regs, so they cannot be sampled. An unwinder
> therefore cannot get past a first frame that uses $15 as its frame
> pointer (-O0 code or alloca).
>
> The perf tool side is a separate patch for perf-tools-next. libdw also
> needs alpha unwinding support, which I am sending to elfutils-devel.
>
> ---
> Matt Turner (4):
>       alpha: fix stale user_stack_pointer()
>       alpha: stop storing the user stack pointer in pt_regs
>       alpha: use user_stack_pointer() in KSTK_ESP() and dump_elf_thread()
>       alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support
>
>  .../features/perf/perf-regs/arch-support.txt       |  2 +-
>  .../features/perf/perf-stackdump/arch-support.txt  |  2 +-
>  arch/alpha/Kconfig                                 |  2 +
>  arch/alpha/include/asm/processor.h                 |  3 +-
>  arch/alpha/include/asm/ptrace.h                    |  7 +--
>  arch/alpha/include/uapi/asm/perf_regs.h            | 45 ++++++++++++++++=
+
>  arch/alpha/include/uapi/asm/ptrace.h               |  2 +-
>  arch/alpha/kernel/Makefile                         |  1 +
>  arch/alpha/kernel/asm-offsets.c                    |  1 -
>  arch/alpha/kernel/entry.S                          |  5 --
>  arch/alpha/kernel/perf_regs.c                      | 56 ++++++++++++++++=
++++++
>  arch/alpha/kernel/process.c                        |  2 +-
>  arch/alpha/kernel/ptrace.c                         | 12 +++++
>  arch/alpha/kernel/traps.c                          |  8 ----
>  14 files changed, 122 insertions(+), 26 deletions(-)
> ---
> base-commit: 8f5dbfb93440d1aba216a1a34369a65654b94be9
> change-id: 20261001-alpha-perf-regs-v3-7e23508c1ca2
>
> Best regards,
> --
> Matt Turner <mattst88@gmail.com>
>

The four kernel patches apply cleanly on my for-next branch. I built and
booted the series on my ES40 (EV67/Tsunami), and tested software-clock,
page-fault and hardware-cycle sampling, register masks and user stack
dumps across all three online CPUs. The targeted tests passed.

I have a few review comments(I'll respond to the individual patches).
The separate perf patch records and decodes the samples, but
I cannot yet confirm DWARF unwinding: the installed elfutils 0.195 lacks
the required Alpha support. Could you point me to that patch as well?

Thanks,
Magnus
