Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F153DAAA3
	for <linux-alpha@vger.kernel.org>; Wed,  5 Aug 2026 21:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785965253; cv=pass; b=TU7uRitZAf2U/UmNSTAdmjsFs+juAFGP1YsdeBjsoFNefxA9qt1W286+cTWA2wFAWVOkdAWjQ4KZmnky7hi7SiUPmIlyH81N5AE/Ha+1ZgCNEKQTzqp72G6V+R6TmwAHMAHDPesFBCFEyTJlksI4ZsL2iTdLH83AgZPdbC9hMc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785965253; c=relaxed/simple;
	bh=CRFBAY+HVM5zLw5Wlht8AEmJgsCvF8cPSHZXyZDpiFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pCRZb+Yn6ikaVPOk4RAT0qlqh2kzFQ9x5lT7mFuNDlMQhtf/vCW6J1Hri38l4Wu+61I95/U3bj55Xt5TXI94Pw7voMzLmTwGVjEJSqxfzt35+lqkNwKrGjzz3+isMbnSkS8DYQeg5Sgm5G+v32G6+0KPaQpaVZykkiLQtH7rv5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtQkbLeJ; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtQkbLeJ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2055573c8cso86402766b.3
        for <linux-alpha@vger.kernel.org>; Wed, 05 Aug 2026 14:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785965249; cv=none;
        d=google.com; s=arc-20260327;
        b=DqPUm+oPNS7SnwR93DCuvPph9ZLQyUf0K2B5fgkc8BF51/06Cc4wCce0xqZI787owm
         e3L7gqpfkHVHWqRoMRh83F/EaBztUJY0+wKz3Zcte8CfyV8Rkc483YkNIdMjvU6oSfMH
         LjOFUxcqYCYgvx0ebTa19FH1jT0SXvAAgigoMcb3JFoevZ07nj35s9ppoUO82DOZz0F3
         mXdOGnUevu3sP76OqTflgf/npHt7ATILMg/aNs/basQkEUgskpcO/wx3iFNkgkaQQxHn
         EZKHMMEn6gk+Y6ZWtbsDLtxMqC+q2OmSooKNkQokT2nARlV7DtATlrz/yi+BkvTKlaX+
         wrgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GOdQ3KJo0a8j9UIgNBxKoFYFjfq0XRlteuFhE33+c6E=;
        fh=pA5bCStq3Q8cm9twDsQPRkq9aLq9X5ti1g7Obc1NrFM=;
        b=OC5j+E3mQwCR8bl7JQCawxKCf1QFNewPwIOIUklH9XJbXbz6VQipZbBTLk1IsOLHER
         pNgYkaix+EhZvnEE15h8K4/uQs18wqz+5qQ/FKHZO+hHwxcZ4X0rO92KTgyfDuk3W9A9
         GF+7kPNagQdWb7CX1Et7jDJqcpfRSakyoQ6Hr1R+1vJSmHjPywGZMIfkkeyXGrz+5IDk
         swF8oERQ/k2jWxIAx4OPPDTvzfCkbqKdZa0ZWgBz9zT29vYYi7VPmw4ZVYUA1GtltrKO
         oASPZo9YqmBa5QHj5+Ti8UCSkwFyn+iuBwXncFA7PKGyHWFb90inMdkcr9YtObWazfqc
         FCrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785965249; x=1786570049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GOdQ3KJo0a8j9UIgNBxKoFYFjfq0XRlteuFhE33+c6E=;
        b=HtQkbLeJe6G/jD9t8OsAh+hijYU8IpwyLGrwwDRUmi8awu4Mj8WnHMMScGwZz+RX5K
         aOVIHaUmjZhercpSRkv0gU6sbALUwILlGaLLD+Hz7ms+Vjdi86326+IVLL4pJyApvLlH
         N1lUGG/fsyyFh5zFYvO0vxoOB3ol5U2iYK8I45LOEJDxkt7HGdEPflIsx5Z1WyAVZMzf
         Q6e+5rmnQeaC1XdFAFfHr+yigOMO958PvMXq3Z8qbu++Tr8dUlNadRrce4SwYWbosJeH
         R33emAiSfRx//MD53DWeW1bRGE2339dD6yhe1uDi0ePc0UUdxoTF2H/GgOYiQwqwy04L
         Ovjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785965249; x=1786570049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOdQ3KJo0a8j9UIgNBxKoFYFjfq0XRlteuFhE33+c6E=;
        b=guBUJ2iJzd7NLKQ4/LVpbOvrtAMOQlCYT2qhoEoFdTGsfwyxIKAeOFVPFAIxhwaa6r
         Z5IHNds+WZbT1T6rV2sYaBUTCdWcnytB32VAkxNi4tHRFpT0kea17V6x0vSUFwN1dDup
         87tMjxPCH90mDK3FGWaleI83OVkyFRLCAs/wcYc6iIY4Q+iOmoAfAaBokrUV19eZu6N4
         HAvAeaOFI7EU7k7pR+BLufv+WraKza0hHZDyMasaUeWQhz3x3lS8iEuNHiiAaDPfR4Gz
         SbMI3p3ovsgfT+gIC8lSswoKNkrfuD8FqElIxRUFIGlLaGgGT6mOA9kbYhXZWcoaY8Eh
         BS2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqlhtSn2coCneYTWKNdwG3dwuVo6Z7xNelNsK4Y0zGBGHDGJxshribVP2obfQaKdaDDM97pAr8vZma2XA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV3VjF5/vttCsAnllcSfSGdfbEAw5AiKUkCM6JS334fOtOJI0/
	LzZB4ac4O9m+r4xuJnpMn79SSOcUdTTVX751vBaTc/l5EO3gjA4zjd3Dgt6ebM/RulgZiPDmWSX
	vlkW5rTU8ZIwYmUppjshuCs1ZOsBwN40=
X-Gm-Gg: AR+sD12FvK3UgyPn0YpcLV9Lw8Xz4IUBinZzkNCqAELlUV3xYDREjU6k/GMAJna/Ceu
	POELVbfjlhidjgcV+l/owGLYwM0XEHK0ErCfE/yRb3uvbyOjsP8niZjrBEXW+cxnnywZubbgTLT
	gE0bQXggwedNniDWEYQijBA3MMoB8OLuhE1hFR9l1geIJibTX07fyNnVtnMPKB8axwK7YX8eRzE
	RNIwB7KGXCQjP4E1CduFCOPJjzIi33BOL4293KmLWWkGW2sUu3aQ5pAiddxQQCU9Qne01V7Wbqx
	WWecAnHYFqF7K/geasF8HIk4XvrRtczEjmbAk8q5nWg0/WOsXwb+R4US+MmfN05hTrLsiAZNPnP
	qFBTMJxU1UZgHEE+6nMT3FweAmh1vSpk2hY99fIsz6g==
X-Received: by 2002:a17:906:ee8b:b0:c16:2f5d:6153 with SMTP id
 a640c23a62f3a-c2039c4a94emr567212566b.20.1785965249055; Wed, 05 Aug 2026
 14:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com> <20260805185557.3283233-1-mattst88@gmail.com>
In-Reply-To: <20260805185557.3283233-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 5 Aug 2026 23:27:17 +0200
X-Gm-Features: AUfX_mwhW36EMELKBgfQ1098UaTRK9ltJYMKUq2mejLmJKQ4TTnz3ZPoJGmZ6UM
Message-ID: <CA+=Fv5T-+awQU1R5cKXdEwUdtCTTw4T29DomYEFBTNakBKjOAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] alpha: pass -Wa,-mev6 only when using GNU as
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Wed, Aug 5, 2026 at 8:56=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> That flag exists to stop gas emulating instructions the assembler thinks
> the target lacks.  It is a gas-only option, and LLVM's integrated
> assembler does not emulate instructions in the first place, so nothing
> is needed there.
>
> Condition it on CONFIG_AS_IS_GNU rather than the compiler, so it is
> still passed for clang builds using GNU as (LLVM_IAS=3D0) and omitted onl=
y
> for the integrated assembler.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> Only this patch changed; patch 2/2 ("alpha: read $gp and $sp explicitly
> for clang") is unchanged from v1 and is not resent.
>
> Changes in v2:
> - Drop the scripts/Makefile.clang CLANG_TARGET_FLAGS_alpha entry.  It
>   will be sent separately when the alpha backend is upstreamed to LLVM.
> - Condition -Wa,-mev6 on CONFIG_AS_IS_GNU rather than CONFIG_CC_IS_GCC,
>   so it is still passed for clang builds using GNU as (LLVM_IAS=3D0).
> - Reword the subject and commit message for the reduced scope.
> - Link to v1: https://lore.kernel.org/r/20260803-alpha-clang-v1-0-1c4ba5b=
a7a64@gmail.com
>
>  arch/alpha/Makefile | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
> index 35445ff2e489..7074602dca94 100644
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
> +# understands -mev6.  LLVM's integrated assembler never emulates.
> +ifdef CONFIG_AS_IS_GNU
> +KBUILD_CFLAGS +=3D -Wa,-mev6
> +endif
>
>  libs-y                         +=3D arch/alpha/lib/
>>
>  arch/alpha/Makefile | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
> index 35445ff2e489..7074602dca94 100644
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
> +# understands -mev6.  LLVM's integrated assembler never emulates.
> +ifdef CONFIG_AS_IS_GNU
> +KBUILD_CFLAGS +=3D -Wa,-mev6
> +endif
>
>  libs-y                         +=3D arch/alpha/lib/
>

Thanks for the update. This looks good to me.

Reviewed-by: Magnus Lindholm linmag7@gmail.com

Thanks,
Magnus
