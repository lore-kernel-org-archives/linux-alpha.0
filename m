Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA8F374E5A
	for <linux-alpha@vger.kernel.org>; Thu,  3 Sep 2026 22:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788474953; cv=pass; b=a+92mHtFr/QYl0AIL19TfONU5heFfXv8CAxGxQtzNL0AmKIXbzfaUG9TMVtCgsWZWZ19WvRnSMCUAZYJ8qoCDIj/Bs790qzTyFckhDSfyEejMNroEZFfyN1LteMcSsmnxk0gJvPTQzjM1OWb3zIP+ue5K4Fz7KxObM4sRrGu21U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788474953; c=relaxed/simple;
	bh=BYrXSNtCBzi65h/Hlol13R14BAGVRzqQ0p7bwOhEWfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7ynWiCRcA6gQAXb6NnetGVX0H/XhemTnLxJBuYBAj/D9948KUbhkTYQ/0V3eOf+kiq5n/WjQ/Rbnlc5dYMI+FFls0Bbt5PnCfL0ODkp5Bx6r3miv3At1AHxzBU0wCNNV4bTUd8+mMokROn6OORfMiNfEwkxFAnHwCiIlNVl194=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuGvqp8q; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuGvqp8q"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a60f0dbeccso410322a12.0
        for <linux-alpha@vger.kernel.org>; Thu, 03 Sep 2026 15:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788474949; cv=none;
        d=google.com; s=arc-20260327;
        b=PLx47ZUF1oV4Dow7dfK2hisy3zHuZIqSXy2KFCXyqTNVH9zM31JKVkoZbbJHJqr//G
         hCrP+kponr34waP7Id7EON0dPjqx37s96Z/d2aMDKSiJBR4Un1PF/qi+8flV8XWz/HMr
         EN2MJmTQuKNHGHekGdZIlbwoTadj7HxWVsMPPmmmXFiDivUdD09FgrRBbSqLfUisnLr3
         aRuCE9NDvB3ZvxPHAI5HDyE4JgMReaY7oQIqjCxo7H8QeFgwmQRAGLFZL3Uqv/QMouur
         pBTjk6jYfVnLoUmcYE8JyIwM2jwLChYCtbBR7H1H63zb/R+a2kDuRe/jNaeU6rhecRMZ
         XFUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qEtNs3um3+kM6/cXbt6+nwO2g/oyh2psZWCJcuPwPHY=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=dNx0Nu9BfIU2okM4ZgPxVZtli6uN9Lcl30/dtQETi8+MlVCnq4q+w90V2Qo2cS0Bwa
         tNJQFHTvY47NMS6K5KPJlzMnqffk8+Un4bo5aU/M3tHEUtcUxMvwcaDLe6hicSb/toDK
         EAR5Bg2zFjkyNgBgQxsG8lHZp90TLHxQMsoesOVFgRQ664PBKQ0WZwWxwwJAftB981da
         v8XP95ldpEu1hKaYtlo+62licuGRzki6nfO/bijalpqp2XQ4N0bkHjHi2vBwZxLo99PV
         u6vTRO8Zh/wOrYKdlwXszgibKzPSVOr7uPFKOVH2tM68Qj8+LXWrH01ST6J0iaQtshm7
         i3wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788474949; x=1789079749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qEtNs3um3+kM6/cXbt6+nwO2g/oyh2psZWCJcuPwPHY=;
        b=OuGvqp8qk2fC9ZxGkf8usQsZSsx2HFdx7pUqBzxijirtiMi9gZV+ok5VkBZo9lqXpy
         4XH7t6JhyZEmhw7CRNJn7rDMENcjTu61PkiFYyBTIGTF+8bJNYwStb9tgi/9tPZNO/H2
         5kw5h9io4ldydq/mnpXBaGOTOo7aMX71xwCuAp2x2kGBv7aAoAeDiaq/4N9lM9z2wKbD
         mRiMvYGAEv2pS39wUomlqYpmF5JerHJ8z+RWHpiss8Ypm5kr35HEEuTgm5K2eHig92DO
         6AQOjtL7USWmdmYhfQbvJ6QUTqvJjhJUmr1orce9FJeaEOaVTDVnjLeLBO16BkBtYHgM
         1N3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788474949; x=1789079749;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qEtNs3um3+kM6/cXbt6+nwO2g/oyh2psZWCJcuPwPHY=;
        b=jfEig4O/WU4NdHg6QfqZ69cm9xxZmwbUPtaHiM8054+JjJHKYznMgQVJkNlDGESEt4
         0SFhOxV0MiYFKV2DwA9DYf1mZPL5TvWUXcvdYxFuxKswF4s3mtUCUApgqEGkXkhSsJAC
         0fmYaEqjutuQ20qDQle3y93jJjXficzDmpqg/YD49IMPJZfLvJP3vJAPptpodU2rblbX
         jaI7GuIbf57XsNryCqPNvat+r8GZ3FfsL3Sf0rrb1oT9M4bQNgHd9I8hvhIQnPTx+RMe
         JzXCvw8fubfAC67o9fxRYZYxIBQvOr1LN7rTDVpqU7GSSSG+li/ZzFc1bjjtOGxR2qnC
         WeSQ==
X-Gm-Message-State: AFuF++kaGWxFi6At72W9uqhJjyWHcFI++hKrVE+QGWDTOz31olFplt/q
	r1NUmGzKwcdFoawQXjDioabrdSqU9u73lMfUNmGRfq73goWyMdB1Qqjw0A+CPxY13jSOFqkoyUe
	dPrTPLzIH6Onn64jWp0OGUrU5bo1gEzkMrCMc
X-Gm-Gg: AYBFou2srLkKX9iGsM7ViDZaLbK8bNKGEuedGFRjFT1q9X60nmJdQjS6RHITSxTq2Hy
	Zl812CeFydTi0T2X8z9jnEOknoHqwiHuzYbgut+/lGvL5/V502DkyLRpD1nbINx0m+tBUyzlayY
	wYqG9J/UszcvpFA9UnpcPyCg8InP1fz8/+enjjuv8tP8LplmZOnxPExQ+xnPpb4+nB8bcIQHCMG
	vGpue0Ho5KdCvDyA7F4u0ErZpBSzO01KXvKPsfrmExvx6Wjn9vQeMsnp0YvctkysQDosCXdRQIb
	61z59Mi2xoT7yrgyFt24pLNiCUREQVzFSbb9pxkfVZ3zF+yS3YKVgB+YB7mM9OXzMQVOyoryJFj
	khFd5IP8NOmG1f68z0ahBW/Au5JVnYNk=
X-Received: by 2002:a05:6402:e94:b0:6a1:fd14:8832 with SMTP id
 4fb4d7f45d1cf-6a7e8e93138mr546350a12.12.1788474949469; Thu, 03 Sep 2026
 15:35:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <6d3dc767a7fe52b5e9fac3d1e4e82944d23a7ebd.1788277742.git.mattst88@gmail.com>
In-Reply-To: <6d3dc767a7fe52b5e9fac3d1e4e82944d23a7ebd.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 4 Sep 2026 00:35:37 +0200
X-Gm-Features: AcwNN1VUg3dUQ_M3pm8zKcjhEf3g_FjtCDl393r2_pQIDvCKcPQOHhmHxMy0Srw
Message-ID: <CA+=Fv5TtyA_CdL_Kg97V7ACsAgkKmEM1U=TJw4L7y5DKUd8h-g@mail.gmail.com>
Subject: Re: [PATCH 04/24] alpha: select ARCH_HAS_GCOV_PROFILE_ALL
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> GCC's gcov instrumentation (-fprofile-arcs -ftest-coverage) has no
> architecture-specific runtime requirements. Enable GCOV_PROFILE_ALL
> support for Alpha to allow whole-kernel code coverage analysis.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
> index 1aa76a2d9750..a6024590ea6e 100644
> --- ./arch/alpha/Kconfig
> +++ ./arch/alpha/Kconfig
> @@ -5,6 +5,7 @@ config ALPHA
>         select ARCH_32BIT_USTAT_F_TINODE
>         select ARCH_HAS_CURRENT_STACK_POINTER
>         select ARCH_HAS_DMA_OPS if PCI
> +       select ARCH_HAS_GCOV_PROFILE_ALL
>         select ARCH_HAS_UBSAN
>         select ARCH_MIGHT_HAVE_PC_PARPORT
>         select ARCH_MIGHT_HAVE_PC_SERIO
> --
> 2.54.0
>
I built and booted this on a two-CPU UP2000 with GCOV_KERNEL and
GCOV_PROFILE_ALL enabled. Debugfs exposed 1226 .gcda files, including
the expected arch/alpha objects. I observed no GCOV-related errors or
kernel warnings.

This also appears to warrant changing Alpha from "TODO" to "ok" in
Documentation/features/debug/gcov-profile-all/arch-support.txt.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Regards,
Magnus
