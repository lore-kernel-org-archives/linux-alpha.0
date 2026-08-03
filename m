Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21D3433BC1
	for <linux-alpha@vger.kernel.org>; Mon,  3 Aug 2026 20:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790630; cv=pass; b=B0+ixd0k1jjZiRRvpUKLV1mDzo6mRdqQagZMWxlsFsAybiO3Qhb/zxTC/2uXFp4B76Cz8CReff/gqo1cWhgUsboKHmf4AJOV899Y4YsEay/yF5kdndHHaP45b8DNEjhIM6W8bbzikTo2l1hSO0Jb245j7Sqcr00cJPUMxj8FqP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790630; c=relaxed/simple;
	bh=WPvWk5jQOFsRIWCA6Ydfa4nFq0ilXTV7ToIHXjwOqHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIsVRxq6QPrjLr/n7chB95zn26Amo0+7fKNV3mr6JO4Zaw4SLPmGeQ0w9woqTDhURgBnRuRDGMmv4fiP5yaQJvhaHksYx9Z+pkg06+aihhVOexLQPUGtZ9Z5Tip30pyt60J0Fi7Ste9wckMP4y4PVF4UAUmFvw2M9WoiDLM4i6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7ytidaj; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7ytidaj"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a0ddef4e35so2430988a12.2
        for <linux-alpha@vger.kernel.org>; Mon, 03 Aug 2026 13:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785790627; cv=none;
        d=google.com; s=arc-20260327;
        b=Rg28sqsJJqspp5FpdKEt9sB23yCehFYZC51lowV+blz6ckBd9ywJzox7M5C+Ev4DJ5
         hzHNjJCsrX4WgeB8IKz8tuYhJJk5hpWvScXOaYoC/oRyi+vwVSOkSxaiNY0UQ11bozsX
         DZxyrMZWubxJ6jEyJ0eX/cuZFANEWmHKAaFqz/5r75WKW83eRC8Wpu/qFCD2h3HbxHRF
         YFpITLoUkAXgA53ojR9O48aV/+Uxvpbo9MYxIn5sH0itopgTwI1kjknHX9w66UIjkLk2
         NA/2xNS5nB0kOdpXexZu5sk/Hz5YQy7VBfYqIRgfXaCt5vfhDBaXsoHWAqsOB/L7fsBQ
         C/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9fxx0B02wBdJaS2C/b2hy+gR8nRXboJM13XF37xgcRs=;
        fh=eBfGStrbMhSy7u41T2c1M3byNLtasXR8oKKOv5te2QM=;
        b=dhmtdn8q1g+mf4lvvEU3kW20YjU0s6zJHr/UmOE8M6AoFjxkFwxBCRIwxfRhpyj49F
         E9qsmwjZCFLbRrhkN4RRUUFVGAj4jlY9RK3FhBxeF06omHHQKP1ETR3gzJhQhHolgDvE
         YpIAkeZeNa5B2SiEcXvf+wvKydPa3Z1XnNGzSdHkHlCgBrU0n6/4HKlxS2M/TvoqCd5U
         kHjxNCjlhw5rcoO6UnzCrBqdDkW3IpoUi0ZNvunW8Zf0OBeLfLC14rwcl8ZdboRgZeDT
         kms07HjzGfcVN0k3jY0nDPGK9ugWV8/dGV+dA+EptDJ46yGMy6rUof3TTmAFzX/4u8sv
         4QPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785790627; x=1786395427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9fxx0B02wBdJaS2C/b2hy+gR8nRXboJM13XF37xgcRs=;
        b=I7ytidaj222vFUoGVQfTEFwT5vYpVLJrasRdTWdAY01vKJ6inRV4VDP2Gwa/G1ej7Q
         ugDEblWJXxR55/eYKIIB43ZSQ+v096GUusO8sioWSdgwDRWrzrhsW0Vp0qXsO2RpGW8U
         zsIgu3ZfoaF+k9lfzS99MUq17g8hXA0udHSaAhv7Kl9CHTFCSC7w0oOpCaifJAc/Khx0
         gbm9D5+W/cKah0eNCmJznmiyb4d4M8LX3RPY8eSWu+qKH+YTyfNMUNdgQJK29+LBz0gb
         hr9eWHYJcfXt+zq/Em4Ve3xOk96jmmfzh4BvMTAkjxG+C1g/dGn7a7eYdjThR3/jdBjW
         HynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785790627; x=1786395427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9fxx0B02wBdJaS2C/b2hy+gR8nRXboJM13XF37xgcRs=;
        b=RxQDVueIEkTguxRxRN+9weMrhG/KLzId0gS2vG3JaW6y1WxCAMYu+qtM8A/WCqZtDf
         aZI/yKHgXXwUC6iixxlJp3k9QGxIsJRBGL4GVyUesdwlkUxRwnKsvn60vDzLfy0K8dXC
         PcsMx6lR1fZM+8U8GMWwyiECPHyfAqBQu0i4OM21SwSFbVxRV89eRElg0xPJRG9/hvIY
         niStNY2wtohO03yVpuBSkFjC7WpLuc3n2n2KXQtfb20DoSA2O2ZL4JjgtstuuVximu0P
         kIdpAgEAUm1iFTT67pzpMXxVtCnGia6gzv7Z2/2llSzFsmQLIyz1ddJjsdOy0uU8apsc
         Jpag==
X-Forwarded-Encrypted: i=1; AHgh+Ro1IjdhDXCe1RRVa3OmQ1B1v4Z4PNUGT8f6l/5wOKkRkC/IkpF8H9CpULUo2rkYRloN/y+upIFznoW3uA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4IG9di0OyYplHtSZspJKvwWB8jGymuhdziomRN3gKFKTpLm4o
	SiruNQ/+ch6pwHqIWnaJZP0aG1jD91QKUxfupP9LIUk/mdOL102JUW+/YTqcx6764TpT6jPJecC
	0bD3MHkwBEDVjd3L25X++MUmKY8yvc5I=
X-Gm-Gg: AR+sD12+KfW7J7jYm7wUHh5KEDGekmwABvnkDi+WnQupGDdSQUAP4HYyPQAkPrG2ORQ
	JFmT6OWUhvsuur9S6WXWFhcgU+vyknt/bpB61EjodCKND4HWYpash5Xrtjpex/AcGpKdkxqabwt
	ENNPUl6wNrGUBk++Sce8dNbHyf+0uFCfbzJ9XK6Totyr0uC/mtnUq1sSO3u1Cq6RThYnG7Dvg7J
	/y/YhYtGJm0vZvkk73ivU8gj1Oi02hjcA2KCbNvZ5OfhjpcxcrsKI7jLXcFyt8X+SAkBY95tgAP
	CdXAkMN00lX3zKPYQE+d188G3BgrbEL/6gHnUFKvSPkF+mzIVMbqVhHtuG7oajoB7L0Xjt/D/LT
	biw/97RDOwluRMuCb/x2gvaIFpu73yL0=
X-Received: by 2002:a05:6402:538e:b0:698:6620:d988 with SMTP id
 4fb4d7f45d1cf-6a0a7ca9786mr9097514a12.15.1785790626968; Mon, 03 Aug 2026
 13:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com> <20260803-alpha-clang-v1-1-1c4ba5ba7a64@gmail.com>
In-Reply-To: <20260803-alpha-clang-v1-1-1c4ba5ba7a64@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 3 Aug 2026 22:56:54 +0200
X-Gm-Features: AUfX_mzrOfpDet5WZmR5E0-xCU3tYZzg7dOpIC85BfviGV_cxmbzrWshM8wU5MY
Message-ID: <CA+=Fv5SBitGj+c08Ymy3_JdeErKrRS_s5_RYgABjMraQUFg=Ww@mail.gmail.com>
Subject: Re: [PATCH 1/2] alpha: enable building with clang
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 7:08=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Register the clang target triple for alpha, and pass -Wa,-mev6 only when
> building with gcc.  That flag exists to stop gas emulating instructions
> the assembler thinks the target lacks; it is a gas-only option, and
> clang's integrated assembler does not emulate instructions in the first
> place, so nothing is needed there.
>
> With this, LLVM=3D1 (and LLVM_IAS=3D1) builds work.  Note that the alpha
> backend is not in upstream LLVM yet; it lives in
>
>   https://github.com/alphalinux-org/llvm-project
>
> and is a work in progress.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Makefile    | 8 +++++++-
>  scripts/Makefile.clang | 1 +
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
> index 35445ff2e489..54283705911f 100644
> --- a/arch/alpha/Makefile
> +++ b/arch/alpha/Makefile
> @@ -27,10 +27,16 @@ cpuflags-$(CONFIG_ALPHA_GENERIC)    :=3D -mcpu=3Dev56=
 -mtune=3Dev6
>  cflags-y                               +=3D $(cpuflags-y)
>
>
> +KBUILD_CFLAGS +=3D $(cflags-y)
> +
>  # For TSUNAMI, we must have the assembler not emulate our instructions.
>  # The same is true for IRONGATE, POLARIS, PYXIS.
>  # BWX is most important, but we don't really want any emulation ever.
> -KBUILD_CFLAGS +=3D $(cflags-y) -Wa,-mev6
> +# Only gas emulates instructions the target does not implement, and only=
 gas
> +# understands -mev6; clang's integrated assembler never emulates.
> +ifdef CONFIG_CC_IS_GCC
> +KBUILD_CFLAGS +=3D -Wa,-mev6
> +endif
>
>  libs-y                         +=3D arch/alpha/lib/
>

Hi Matt,

I agree with Nathan's suggestion to leave the
CLANG_TARGET_FLAGS_alpha entry out for now and add it separately when
the Alpha backend is being upstreamed to LLVM.

Could you send a v2 containing just the arch/alpha/Makefile change?

Since -Wa,-mev6 is an assembler-specific option, I think maybe the conditio=
n
should also test the assembler rather than the compiler?

ifdef CONFIG_AS_IS_GNU
KBUILD_CFLAGS +=3D -Wa,-mev6
endif

That preserves the option for both GCC and clang builds using GNU as,
including clang with LLVM_IAS=3D0, while omitting it for LLVM's integrated
assembler.

The revised Alpha Makefile patch can then go through the Alpha tree,
while the scripts/Makefile.clang change can wait until the backend is
available upstream.

Thanks,
Magnus
