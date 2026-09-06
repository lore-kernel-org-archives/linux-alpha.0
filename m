Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5EF3859EE
	for <linux-alpha@vger.kernel.org>; Sun,  6 Sep 2026 20:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788727492; cv=pass; b=kTxBqMSD/SpXbpO+Qh3IExcpJy2u0GU03WQmhq4nE0++YqZ2Hin0M39Fu4GWs7787bCzft8glfzVXPo9o6acg0XLEBZhlfgtOB+r9k6M5kTyEfEmh6RPWdXtjun7usCYJQfipNkCwfpZZt/BMNsAze7ML41cYMjOOp1AxpvPas0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788727492; c=relaxed/simple;
	bh=qfahVnAkOq9Dy0GM7LrueFYNNe+ttAyxCGh+kKGHkNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJu/MWGUfyd+JQG9l++AnbLng+dgRhFLgPCw9d6KU+USNr8Qc2MR7YCeniYSl0CxBRaZ5v4K80cB/ttZIjpiqjRLbbjvY0jS52CixCb6tRoi1sgW1JN5waQSFMJTCtZvmNPL+QTxYztAw9m1270cDjOyM2MZDlvbuGkGltmh2PM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvuJLxq7; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvuJLxq7"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c25ee9d1264so44261366b.3
        for <linux-alpha@vger.kernel.org>; Sun, 06 Sep 2026 13:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788727489; cv=none;
        d=google.com; s=arc-20260327;
        b=qWeYAWeKW/ZN3KArAHzQAh8PKpaQq0+eGugxzGPQkram9E0tkX1kEp0BAnfJptD6f9
         wP8k7Qgx7EDr92B2g5GSiUs+dWeqpxop25vxXz3ZkC/HBQRl6lUVOxZaerUeqAaCfE0R
         R7oSFMjyx9pNb7T7vL2s2Uj3uFxO99Gdtos5yyPfqw5Yjt9PdOQXYhzzy4RqduZTc+k/
         +CnJ49dF1flClunBPw4L/wkVFn1ZXTGctAJFy8YxxX63n78RrUU6F8F9NuU/j4ui+0s7
         mGytYH6jjA2jzjeWCwDxfmfxkxBHUA+0MDQhQETvLRVwliA9wIAOEj+jfdQ39gULH4M3
         0Nzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qfahVnAkOq9Dy0GM7LrueFYNNe+ttAyxCGh+kKGHkNM=;
        fh=cGfe/zdKuJqwTTfdyeo4v9z7CGyA8E0pac0SSPi3+M4=;
        b=NqiIBvncFng6pv8JhXEZfWYv1pD6E8c85gHtqqix+d1IkjneJUUyZ/OgTpFVxkhRuM
         lBuIUQPmmw4YYgX5VtlWkej0Ho7NsChGVxac88me00QB7B/Y+FeNnOY112Pm6Gz1frLu
         dvz6ZtAjHlNKVArLJINcOrpxtfIoIziKrxI1OwItlr3IUC8NG202X5lcab9/Ft1U0MaS
         OXks8Nq/gpLN7w6/80lHnWj+0t1eFbTzDqv0UqtFZZclY14m/Mbjt7q2H8TYYzhq36Qp
         ewr94LlOiOBMydulAK/4oldQkpuuByuTfISBtyIhd0cw/y+3Ihtk5W4lkc9lg2bfBmM3
         6s7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788727489; x=1789332289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qfahVnAkOq9Dy0GM7LrueFYNNe+ttAyxCGh+kKGHkNM=;
        b=ZvuJLxq7UnGxQy3/tdKxGRBTo/vvPeoBfQ0i0xekofZOIeMf2wV2W+VDhf44hQ8Z69
         jcux6HyQMsL88AyR0/n+TjFMuX2rbmqgrEPLF8Xf51KCFvHuVT4yEBhCuYvXAylFx1Ot
         wzZC3RBgQ+Y9PG6O/qb1fSUtnfAOkx48gyOjQyO2EV5NXSyL2FDmEXFmyKvnnqmh7EXE
         V67vh06NnSQTYiJ8XeMIBt27Ow4JKaXoiFPZ6UC0URp1kP67uZTJFd4wbR9PpTyKlwff
         c/ddNP+A50ar1QYW6iFhpbLPZZmh2tHuLQcy1exGq4XP/SwBPsdbXOBtHnAAVejojsrZ
         GWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788727489; x=1789332289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfahVnAkOq9Dy0GM7LrueFYNNe+ttAyxCGh+kKGHkNM=;
        b=DMdAkdnoS/9aLbMMAMGrCpcuIqcRNHkfPvlQ1WYWI3W2YOthKD46ZdNsebxE8NBJzt
         nicYWvfS2fAmPOPFiTZ0mddQSNcDVdxdHx18Cdj8ywuW2yO71xsm/GX1zrRmYu+lgoJS
         zbDGkT8i01gzDfSmLxNcJ2Eda1/yD/sj4Vpm5H6z4Z/vqxoqIR4oi5UxuwnP8i462S00
         F/5uIHSBqQIWAK0CF1heCEUbMsGWF8DvZbv6DzZ5yuyLZprTg7E7B+3j28qXIl9vYmBr
         55m38AUTPLpZgZIWUvUmDcOMgBLxzu0ca2U3Cg45twjJqk2BWOVFMrhstuRtFHSdPFAw
         uFLA==
X-Forwarded-Encrypted: i=1; AKwUvBy8sxl+/xsuSGs7Knanr2yjIim+jFG7gXUbQVMqKcsLUaq45B7eMNsIFkLAqrPpzzKOfBt+nVuX/wKLOA==@vger.kernel.org
X-Gm-Message-State: AFuF++kzcwPU7Co8MNyaakSwfQXxjfVwBnrrr8lSOH9zTAKFN6uFsfH3
	9IoVvSLKowstsjFFV0FuHNAl05Qz3m6jbv+Fb0nfYas6bf0iz7VUbufoQzNBFzmxjNP8GOLJSQt
	h0ewKAF13d8IymavQsSObH2rSZHh3mBY=
X-Gm-Gg: AYBFou3tXVTCRKnsCUxXQzE/kvKnZMBOCRP+B9QroVpBWhoLvaUpKSMYud+Nz3XUutj
	I2wS4/Rhrm6XoTNtmVh3RrDTjVsnvy9cTyCDSr/6tW/4jBcB37EdOp1TyZRxYP1aIcSDeqnh2ze
	BnTJsxIgPYHbnJOFSexIMM1igRFt1uuAk6LAoHf6pHqgbKCJqmjxEKx/yORt8sQ47Z20aOGNsy8
	UXfSztQYWyraEEQEdOd+o7oLgzTwOq2xjMz8bAzs///XwLXAPjv4FJnPky31Z1Me1qyPgvsCqEh
	bY0xwWzD1ysOCDCGMkb4SK6WA0j0omn5wSb0VCvYWet5ynPoc/rNzWZB3qROhND382fgWrqU/4A
	OfZlxRllF+UTRFr2uTVdsrOR97Ypdzw==
X-Received: by 2002:a17:907:72d5:b0:c26:1691:b361 with SMTP id
 a640c23a62f3a-c261691b94dmr574303066b.26.1788727488511; Sun, 06 Sep 2026
 13:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com> <20260905-arch-kconfig-options-v2-v2-21-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-21-83e8245761a2@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 6 Sep 2026 22:44:36 +0200
X-Gm-Features: AcwNN1We0AsiI87C6m3-nOVPbE0KRdcX5bT97xhlIc8oCAONBoZx_sgPyrzwY90
Message-ID: <CA+=Fv5SC4qL76Fe_wk50p=8a069mKJ8ZAyUHMrP82DgvoHAsFg@mail.gmail.com>
Subject: Re: [PATCH v2 21/22] alpha: add HAVE_PERF_REGS and
 HAVE_PERF_USER_STACK_DUMP support
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Kees Cook <kees@kernel.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Sep 5, 2026 at 9:30=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Implement the perf register sampling interface for Alpha. This enables
> perf to capture register state and user stack dumps with samples,
> supporting --call-graph dwarf.
>
> The perf_regs enum exposes the registers available in pt_regs: r0-r8,
> r16-r28, gp, pc, and ps. Registers r9-r15 are callee-saved and live
> in switch_stack, not pt_regs, so they are not included.
>
> A switch statement maps perf register indices to pt_regs fields since
> Alpha's pt_regs layout is non-contiguous (unlike architectures where
> direct array indexing works).
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>

I think this patch still needs kernel-side work in addition to the
matching tools/perf support.

HAVE_PERF_USER_STACK_DUMP makes the generic perf code obtain the user
stack pointer through user_stack_pointer(regs), which on Alpha returns
regs->usp. However, the interrupt SAVE_ALL path does not initialize
that field, and do_entInt() does not snapshot USP. A profiling
interrupt taken from user mode may therefore attempt to copy the stack
from a stale or uninitialized address.

The proposed perf register ABI also does not include SP. A DWARF
unwinder needs both the sampled stack contents and the corresponding
stack pointer, so this cannot be completed solely by a later
tools/perf patch.

Would it make sense to drop this patch from the current series and
submit the perf support separately, including USP capture on interrupt
entry, SP in the kernel perf register ABI, and the matching tools/perf
support? That would allow the rest of this series to proceed without
waiting for the perf interface to be completed.

Regards,
Magnus
