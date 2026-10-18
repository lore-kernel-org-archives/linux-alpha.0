Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B563A9870
	for <linux-alpha@vger.kernel.org>; Sun, 18 Oct 2026 17:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345850; cv=pass; b=sK4grDcuNYl0lZ17q+6j6E8ljKYzmI2wWZYA+K89g3IuFLoHlIDW1SV8fmAtFEuFtOBWdEeInWhB+YRniOS+a+1uztHD+xDa/ttJ0iaSj6VD+mFWjSkgy5ftOdJZH5fCr1fxfFOK/jpzJnbTnYi3pZLj3X0VYydpRFNSKGYic84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345850; c=relaxed/simple;
	bh=WXv6UKA/9yuqwbZcgBBetRCfLJaa7efW2S21doIVN0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpDZ0j6foCA+5lCdycJuWeJAcgBg5/+f/ZYdUwvkWyPXrPEflFEdoM+KCfAeO8Mh8htK6i1zJTATzsRsrW9QFM35a1ZDvETQzUHq0zFRM4RDPR31ohGlwqFKJvNMzXFRlPGZlnX31zQVyzxYV+5Mc+r156qa+hfLhkB2instqY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhdeuN19; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhdeuN19"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b21cf1a580so1456744a12.1
        for <linux-alpha@vger.kernel.org>; Sun, 18 Oct 2026 10:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792345846; cv=none;
        d=google.com; s=arc-20260327;
        b=UYFPwZMBtiBEOtxhv1ARYNsIE0lTMygnnQ4qKGWXvbSuEP1P7rf7tMQLk3iW0xK05r
         F5DP1CHbda/OEIFlkQ6vDg+uqHgtpNwi03hgZfYcY4oqnPlINFSVoYeDHAgT5f92mBUL
         Bacztz4dj9pXAE8R882Od+J7iQNBqGTyRYrG980Pp00ksjbzhmj4waKsCRRkyECzDwnf
         Ve8gE7AbbjQyZIwviHaZx+hH3LdPmchSVMdFxPFf0ye24xf4nokqVue2nqvcD7UjQeGO
         RLIGxh7O+R4KfatL+idWnThPaxKr+mq9BFpsIp4yHv2HLvuxwKBVneeu4tx+klqI0Lye
         OHow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UQ7W9KldKYkaSyjjE5daJncD2A0RYd8lziVm00Ic5Mo=;
        fh=i4AMr0a7+Aunr/72FjFyuUdVPVUwngPrDj9iRuIYjQA=;
        b=eB48OHPg3NTwgDWfVTdon6ihbGwWy4tzhdEjExbX2IUcdyQ8iziDhjNEBYY7hGLjBB
         JYz78d5v/eOQEmDsU2JQla3b0jjVK3Je1okkNYxSn0OjCEQapd44xNtM+JkMNzpzDNrR
         5N9/iBT/030rpotDI8OgDnfdViNLgewqs98aGfw9LkT0JFawIqODGv2j0ISmArwVWaVb
         GCWFWs75ovQdRV8Tq9QSymEEvSDUmA16TA+3V5QRhchTrD+W/sr0SGwM4q9jjuv9oKvy
         Kxm02Vk/wFX/o0pSVcxz3YMHHx5iPIPVxrs36lumtLIutLLlmwx4gucD/QtTld+YENvD
         3HXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345846; x=1792950646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UQ7W9KldKYkaSyjjE5daJncD2A0RYd8lziVm00Ic5Mo=;
        b=FhdeuN19hmZwMH6SNxPtLNo3n5D2G+4Yfk8Huc7HsCL/lffihO3nLDtCvzv0oZ2441
         TdntBLL9ZVXG4R8WrRtei/u+WNZ7J2tWzTacUrghbUOGqyhDTG/KVXSd0zg+pDil0R4c
         8WEQ/5gtEJE0TL7e/KKNp+SS+c5FM/evaMNldk3Mjnv95C2vGu8pkEWlXf0cnKsu6P/m
         IafNE5/+Zvx2QunzPM8UxMDNcVJouTGbMkg5D36W0e6eZKEv9yyEik6EeIV2DVqaLA1w
         gQMAuwY1GnCnmKkFi5dckgtqOoxlOgebmqMiGxvpVTO4qvk0eNfe/aoUCwjHaoePOthR
         qh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345846; x=1792950646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQ7W9KldKYkaSyjjE5daJncD2A0RYd8lziVm00Ic5Mo=;
        b=ZiPZfyz3AOq+vWAWtdvNP7pY3tqma/2c8qzCONCs0+K8zpSjoyKjx9xs4yOij4im7A
         4wsLi+Qa7rIyrxa8V3k29koNQV0RzERoJvwnjrBfxl7KO8FRMJfuRJiBinWieXR05ymg
         Wxhcsr62Yw2PWHrkmvkskOn2wSMscBc7Z2Xma68wQ2Yo/FHouYNchbMyn1QMWy97PqyL
         mS+gruUHRw3ta2e1HOgErTDR2V9fxTGjb3FjH9nzzxBC1Sn1F8fuQWsu/6JnxePewz3z
         j+yiY91c6BLDppk3K2nSsm4BZfnnpXPWhn/Wn+gkYjfCeswm9EPUnSMfvbDuU6ZVtSpp
         hm1g==
X-Forwarded-Encrypted: i=1; AKwUvBw0lIt74/GErik7JvyNsTaYEONiuZmZxyKqogBvQ2UhKMFJXDUuSd+xVijhvD8C+9F7/CTFBx1YVyEIUg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLTurs3qE2qthnV4/WU5SRefhM4nvg/S/gM5OF+DCh0kKtb+po+
	+pgECS6IiailFhksi6AYha2/zoEctYjvByxdxTW7nHZ4s9hynsmzfHx1vmstc7JTkzjW45uVQxT
	dHXVAtRMobdQxIewrLvbBJ55EFEZVcWc=
X-Gm-Gg: AYBFou2QR6HiKG31LTuaJroSrJnH7cZCJO8fRYNRwuyiu3tEwW78tc/kT1sP/aTjSMX
	OKx+Ym5rJ2hKVzZW2eiaisY10RocpjvOig8r+p7DjDdH2POfmRHEKa3UrapjZxRKBV7rRgfx+lX
	9h7/yx1uKdYJqyU0VPUOCmFbbfOgK6JavwniWx1igI5upkxRF62ijC7gHsNhV6SsEbimJYhDnhw
	txFuOK4TWiIh5Puxh3VdNtmteDlHYvGvrIyFCTERGmGeXmAwXlnRZLcmiWZ7JLD4E1AsCXxVrFd
	UBSIEBsdmPIfBkpY8v33r2Mr/FPEq3vXdUq32N2hMhylVtYEvT1XyFU12ZthwFZ4KKM1ve5dQxl
	jqbgbv31IjJ/F3ZuzMKKT6hRRcKqsTxiYJmaO4DZeow==
X-Received: by 2002:a05:6402:4487:b0:6ac:a1e1:3f88 with SMTP id
 4fb4d7f45d1cf-6b3a814b026mr3327488a12.14.1792345846166; Sun, 18 Oct 2026
 10:50:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018-alpha-perf-regs-v3-v3-0-52be85332c57@gmail.com> <20261018-alpha-perf-regs-v3-v3-5-52be85332c57@gmail.com>
In-Reply-To: <20261018-alpha-perf-regs-v3-v3-5-52be85332c57@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 18 Oct 2026 19:50:34 +0200
X-Gm-Features: AclHuK-yU7tSzanPsDFTqgaSJETZpGEAojUlwTccllHoXkgRUI3VKv_elNnpC4I
Message-ID: <CA+=Fv5SFFGtWj_Y8Y1Qe_W1ooDom97VHMiBhfF7b17+FYHL=3Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] alpha: fill in pc for software event samples
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 18, 2026 at 4:22=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Context switch and tracepoint events have no trap frame, so perf builds
> one with perf_fetch_caller_regs(). Alpha does not define
> perf_arch_fetch_caller_regs(), which leaves that pt_regs zeroed, and
> these samples report pc as 0.
>
> Record the caller's address as pc. The zero ps already marks the frame
> as kernel mode, and pt_regs has nowhere to keep sp, so pc is all that
> can be filled in.
>
> perf_fetch_caller_regs() gets that address from CALLER_ADDR0, which
> alpha defines as 0 when CONFIG_FRAME_POINTER is disabled. Finding the
> level zero return address does not need a frame pointer, so make
> alpha_ftrace_return_address0() available in both configurations. Only
> ftrace_return_address(n) still depends on frame pointers.
>
> Reported-by: Magnus Lindholm <linmag7@gmail.com>
> Suggested-by: Magnus Lindholm <linmag7@gmail.com>
> Closes: https://lore.kernel.org/all/CA%2B%3DFv5S8-Zk8-LUpZnWiBfTGSQXthepm=
Rc_-a9O%2BpEPmVW0mRA@mail.gmail.com/
> Assisted-by: Claude:claude-opus-5-5
> Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> Acked-by: Ian Rogers <irogers@google.com>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/ftrace.h     | 5 ++---
>  arch/alpha/include/asm/perf_event.h | 7 +++++++
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/include/asm/ftrace.h b/arch/alpha/include/asm/ftr=
ace.h
> index 7ec44134c804..5b75a294a7c9 100644
> --- a/arch/alpha/include/asm/ftrace.h
> +++ b/arch/alpha/include/asm/ftrace.h
> @@ -2,8 +2,6 @@
>  #ifndef _ASM_ALPHA_FTRACE_H
>  #define _ASM_ALPHA_FTRACE_H
>
> -#ifdef CONFIG_FRAME_POINTER
> -
>  static void *alpha_ftrace_return_address0(void)
>         noinline notrace;
>  static void *alpha_ftrace_return_address0(void)
> @@ -13,6 +11,8 @@ static void *alpha_ftrace_return_address0(void)
>
>  #define ftrace_return_address0 alpha_ftrace_return_address0()
>
> +#ifdef CONFIG_FRAME_POINTER
> +
>  /*
>   * __builtin_return_address() requires a constant integer argument.
>   * Keep this as a macro so the value is seen at the callsite.
> @@ -21,7 +21,6 @@ static void *alpha_ftrace_return_address0(void)
>
>  #else  /* !CONFIG_FRAME_POINTER */
>
> -#define ftrace_return_address0 0UL
>  #define ftrace_return_address(n) ((void)(n), 0UL)
>
>  #endif /* CONFIG_FRAME_POINTER */
> diff --git a/arch/alpha/include/asm/perf_event.h b/arch/alpha/include/asm=
/perf_event.h
> index 5996e7a6757e..72536566014a 100644
> --- a/arch/alpha/include/asm/perf_event.h
> +++ b/arch/alpha/include/asm/perf_event.h
> @@ -1,4 +1,11 @@
>  #ifndef __ASM_ALPHA_PERF_EVENT_H
>  #define __ASM_ALPHA_PERF_EVENT_H
>
> +/*
> + * Software events have no trap frame, so perf_fetch_caller_regs() fills
> + * in a zeroed pt_regs. A zero ps already means kernel mode; only pc is
> + * missing.
> + */
> +#define perf_arch_fetch_caller_regs(regs, __ip)        ((regs)->pc =3D (=
__ip))
> +
>  #endif /* __ASM_ALPHA_PERF_EVENT_H */
>
> --
> 2.55.0
>

Tested on my AlphaServer ES40 with CONFIG_FRAME_POINTER disabled.
Context-switch and sched_switch samples report valid PCs, with
synthetic SP correctly remaining zero.

Tested-by: Magnus Lindholm <linmag7@gmail.com>

Thanks,
Magnus
