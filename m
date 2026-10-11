Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5823DC4CE
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 21:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791755291; cv=pass; b=JGaHC1AZ6+AyOqIMrsKH63En2Pk0sJj+AFlyl5GZU5YUD2Er6gUrEPeaMtWLpjHY/pMsXQvGLQ73Hf3aESviFbCXBc7fiz4RE4QGRQA/27Syo2n3pBqMfj0tkNQQry6Y5jUFV4f73kofPI14zKbsXWM1TpQGxqOz4uCVUHf1tEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791755291; c=relaxed/simple;
	bh=yGC7Wvk88O3E7QKKMndYn3qemkncNe4qFrBd2PU6+HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h/wzQzuiN125bosJ+IpJiu1Oxgx1rRzPZjsaNf9ZtJwml1/TEQtPVls619uctqK56mrORxeGr4/kfHoBPiS21SvYfMwDYG/yDKSQ5oRxl5KWz+qbT9QHDc/1pRnyXxQ23uo1ghuwqqj8ETHaJ7FWD9UFzRyRqy8Fgk7GstUhbIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BUdDBLpa; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BUdDBLpa"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5337fa12431so187071cf.1
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 14:48:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791755285; cv=none;
        d=google.com; s=arc-20260327;
        b=QrO7qBZgVrRVQ3GuaWlJGSXEthSi3Rz6OCjLz8a+P0vgsa4RGYCKc2sC+MRtbeEzCw
         TGTe5PHYb9cSxXz44Z9RyKlmWL4dzqnX+D2tqq9maH4Q3wuXHEZmNjq/eyl4zBt0dXQa
         vKBxNZ+6H8m/zuFYHOQV5k1h3y9ngifDZ1bONO+sPtNkHAbgp7Jh1Ge/x1cvT61y3LU0
         NN4NE+VdNxioDrvs8DA6JJ9i9/wovlk2ZhTQM3cqh9VKIfih/KZSEmO9gQaHaVND9rAZ
         balw1jhMR2l2U9eX3IabLvI/gSpZ7uULzoGy9z25TedhwLU5Ac4DZyF2bPQRLBeDVfjA
         P9Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pSoGFJkMmBNVwjYD5umh+SpMh3+8g4woByg9LqJWVSM=;
        fh=FBU0Djm0TOzTbz0LECWWbd7JSt9t4o02bBH4myQFylk=;
        b=iKzcSrCb3Czw7wehSo3XpWSofgNBD9q8gVR2GM7wUcvFNgwtM076MqrUcyfuVMD96X
         SIwkbTWFMrHE+fP9V1Pzx2oZzbAKX4cfLK3ALYw7ZvjHNBD+sU4hG5y8FuTLPEjdwSCF
         oRd7QYfLkyfEcE3lriOO0w+aHs9zBvUhjRGiZoXAnPsVQSfdxa7IUur+WYGtHwC8K185
         gAOefH5Xhtuoj5g3udx8XmM5ZVG3TyJAZqdhlw/li+32GIKfVGE04/ps0gUSxDIs8+0k
         9wLtKcZM3TQmrMCr8dyAyWpmH3JTlKmRTfpg7njwP1PErcM7JWLLRZ0EFLzdukzgXEJb
         cuWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791755285; x=1792360085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pSoGFJkMmBNVwjYD5umh+SpMh3+8g4woByg9LqJWVSM=;
        b=BUdDBLpa/EXu3XY/NMqf0FVbyOWfBWcg3IKBW9JrN9IycTJv7WMpeccYUXkabFFJ4T
         bF34KCdNrCaXht5ItucP7FhVQ8ZADG95VsRfXUn2kcfyFL7P1kEoTGRvQtlYnHJELvB2
         GN4oQp88szYi90EG45FVUpDN0If4ettCJyJQFu9yism4yI8Q/q24b5ZutzWBXK5cwKJX
         rMjK+5GBqxsqnZY4qK/NpZ1Cbb2gMC8MEteKyNhdI3YFIkvJe4Y8ukdw210YVkwss2Os
         7FGMVGgZGPfWJ3kVFKbXr5SQqH4ZAWgz5zL1nasseg8jqhfKfvx23X0oqC8bFqc1YQuM
         smjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791755285; x=1792360085;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSoGFJkMmBNVwjYD5umh+SpMh3+8g4woByg9LqJWVSM=;
        b=OmWTDWXFl4g0f6HjpfVCv/027PAAKbo8z0HVfFVR3YdJReBfgrNQWZzGgsLEbTs544
         0WSruOiXDkIJUrlCKyNOgLCdCaDVgcxxzR6lzXSRhjpy4k+qEMEHypynd2vbuB3C2mL/
         w2U4APAaEFrVPcwJruQmq+UGvHSOr1dZTCTsfbY+rFYWna1GjpNFomW3zf+Tb73w0YGF
         WeSbQ0ht4ei+2727DGRwnoDc8tJiTmDmUL2WihaS3V5SDgAL2LtBkaqq8R08G1/CvKje
         TP+n5s0sF3pdTdfsazDJp9oVUE7mKXkGzrdjdVuW7UyjOMx0zJLxLu4CZ/5vT5IrJre0
         Z+uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGfXVdNh7eOGSyJGZa2iHySiOOGQWiTklr8ZmkpJwEx391SQOOJuhwJqHcXOW7xlNGOw5DCmvYkb/Enw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIrTFtT4MyaMcxIppUu1VCbIMwwaOQvtOvKOq+vQkTl9KPPlFTQ
	r7TXk0N6EKDEMiBRuLvGRY3lG+pJ0QyqvNrqhCxPHzjshWySvG/mI390ov88SLnKv3HxCSzjg2t
	CG+1gD/jccBbHXHhTdQW7vW7aEnrB5KeRgw/OWjPG
X-Gm-Gg: AYBFou2hap3PhtmuBt0H9/sf5ZV9AlpMzzf7b81npHi8iqT+T/6iF7Rzp+FQwkp4aQV
	rW0jJUkWdXVEwF77U+v3iyCXwgvffpEjxqiLlohwdU/sujrxKKqMZ60O7Ac3uxarqqsk5UsE6GM
	bTejkkIzdVwq26cYl0zGXD8BGyJqBkNvtlAsRgocAGfPytjimSBJnob8QVGxX/iwwy3EM5dkbcd
	P75MDWHuVe3etw9ED9Sz84Z0zR8eaUElffw2769cB6THB1wDCW4mfR8JPYFY4UDyUGN5ea11uR7
	XJumnqyqQyUX9uUQUO7Ge+OzRc6AFdcDUbHB2cpr2EYZgrgw7XOgF+uc
X-Received: by 2002:a05:622a:1116:b0:532:a17b:9581 with SMTP id
 d75a77b69052e-535b3122949mr20485051cf.3.1791755284649; Sun, 11 Oct 2026
 14:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 11 Oct 2026 14:47:53 -0700
X-Gm-Features: AclHuK-IE1KAcxUEfRF4ivWBjkQ6viea8MAPDf15Zv9dPut0fJ3asy0p1dyVVfk
Message-ID: <CAP-5=fXcWRrsxYMCmb_2BK58PHMtGwQx2iKDE0hEZLc+7_DHBA@mail.gmail.com>
Subject: Re: [PATCH 0/4] alpha: perf register sampling and user stack dumps
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 1:16=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
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

Acked-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

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
>
