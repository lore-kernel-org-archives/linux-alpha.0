Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E532C40912B
	for <linux-alpha@vger.kernel.org>; Wed,  2 Sep 2026 09:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340324; cv=pass; b=clZMau9t/CxOQ/HNBl16xoqEWNvVvZYcXySlZmXHWOWVzzpp2afxtgafTmEHLDoMQO8aE3qQ4c78gCdLGDnCUtR5X02i6MYS49ncgrm1665+QNkQkqGl0nDl5YQ4Bp7J0RzUskZloDkodL07tt8RTjT8BHSt14zJc0XtjsHi3vY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340324; c=relaxed/simple;
	bh=zPIeU2nyncnp4qwag62RzVvPwiBDgS0DFxIK2uUgu98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OjMVjp9xvbrCGeeWlUF5D/4ju6LPrUA2Bbs1yuHAN36IF3Z54EzEGEEivhLxVfueW33hw591ov221TMUx9A2gIOBe9f+5hu/4X1M/Ut/tO1u1A27BdIgCH78sPTfWfspOy5rGhmoj6NJkvYe8G0apG6LBBip8/jvxRi65b8hf9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KE/lWrTh; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KE/lWrTh"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a18e24ad25so1158560a12.1
        for <linux-alpha@vger.kernel.org>; Wed, 02 Sep 2026 02:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788340321; cv=none;
        d=google.com; s=arc-20260327;
        b=KmXKBUkvOgG9IoRzKD0u2bNUqZoBR583ezsKh3lJHNAH/rYrDBIFR3zC+lF0HBZ4KI
         iSA4f3XnXQy3fnBI3ejC7oO9sIwYej534TzfVCQdmfg8zTdeXDvWwpNiTKnds7CNlewx
         Dd8NbGpXxA2yfQHqj22hzxYdWDT7/2iKpNSAnG2ZZqP/cd+P3qYhgziDOlwzYCfioCrt
         wW/KQ++g1CUagP61zeWffJPtflGazcYmyXVZGKln0hHpSoKu0LNzh2QwPOZZ4t82vuPx
         daCRJ8A7colBaTA5WQxLlv7SBE9tOi5/LUdWVK/zPWz1o0Rkvcj889/nfQV2+BEIo5f3
         s24A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w6ZzURnfoAOg1rVh3HCbKIn42FKY1C5XP5qqd+lFbxk=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=ldCzydGA486FXpBIOa9jraBY8sfOI1w/LTz1ACrLp6P2I6bNHwm+xOs8ohaHFaQpLi
         Mr2RR+znKL0Hx47W/aHlXt5yLxP2CJxXeAXfeiVe9qtlaRauPFqivv3vNa39VnSdsgAg
         4aWcxld11YPfxrCUUemcCKU3BKpTZag3QadP0ynV0T+uD7pGKAYXDG/YA5UudIkTYiJS
         V2aSP5h95mOD1A/oWlK0i16y/zFLWx0wQUGorDnLLZVJoV+WvrkqL94O3sYYGmCskCzs
         O5h0zc2TSrVk3fKpMLSxXbTYKnQlzYcpnJo+qSJ1aAgU0r6TGfHqjQpfo6b3B14Lj7qx
         x6HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788340321; x=1788945121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w6ZzURnfoAOg1rVh3HCbKIn42FKY1C5XP5qqd+lFbxk=;
        b=KE/lWrThBxJyVm4GN2jHMT81bex6vHo4GDXQnYEtBkeJrtnwvydRcItsnXnWoblue+
         rpKH43hSbly4WZT+MjqghRwu4tzjoEbvW0FVmmrd6Waxd/A/0JR/f5HbjYVmlUUspWsr
         RKaKKHJIG0EiSP1j4VtolYUf0tyNPvxCmB60H+rlgWkhCL1fmKNOounegBlMeUTL7O67
         ldnfRDgbzu5+NihF5FxFDDo/lBPFqpE5/nCPl/Fqfen0jbqs73P6X+qCRDHnVChx2EzT
         +f7K+U9ZYis2e5xPUiiONchedxEK2KPiHj29m/4HiFukUhKmUXPyjgHIpCpG+yeR1SM9
         8H4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788340321; x=1788945121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6ZzURnfoAOg1rVh3HCbKIn42FKY1C5XP5qqd+lFbxk=;
        b=qGypj9G2KFfixtdAQTDMfO7UZUzYqmwVnMxSO68nbuXlCGxmovBIzvzBE6zwyFaSy3
         waOQYdkWA/EsvtuPK8dfqgVbv0a1CLG/DM3eU8W8G72S6dx8q3/SO2y7zwj6Y5eZLaqm
         ABubRw0slBvaSrI8tDOI76FrBvSHTnuZOrn8wFqHxCRCJEK/cMYWGkZwos4GIncqJK8a
         x40Mb/ljRjIdX/Q5Cgsb0V6cExgPc14V0G2g5pQ/3/LFWVcV0oTKkAvzhufK3gD/GbeA
         STUfcyRlTJamph1t68gCuj8LSPw+5BDyJrkth5CWJuTRgEfMSZ7msr/jgRq4SL6lmdKz
         D4rA==
X-Gm-Message-State: AFuF++lHpq5qaN1uPVArA7R8D3UZ1emnWoi/WSZqUW5XlOAO8UBmKjQK
	BMVCQ7mW5pmbBRAj+Hco/UOho4mb6cJkZEcgIqY5Od4LtsV3ZR+sl9+IzuehaMYhARWldpD4Z9k
	OMiZE4liTUdr7wwfDCB2tT9rd3/OVCS8=
X-Gm-Gg: AYBFou1n7iKvfu5wOGaCiEMuLjdPk90fzL8jKQ2zbdlad62r7lCjksW3FhtdLnLp8M+
	qGh4Kp+CraXfnf7vPGnEi/5jURp0eYVr1zhQCmFT6DZY6BsVaegifMWcIERgrqd3/hzSMcXnHdo
	gTzeoEsOPaSQY4gRuvsJQ2K2dJ4KmdryR4+b+zmoD8B2qfGQz6TQH/6Yg+zt8+RByF4zC98CNsr
	OQdO+fhpBiF/bJxJYDrLjdldxqFrO7a63HtaQRsABwih8QgE+rXezbM1+r1pMXCC1dqt86qQQ1n
	zlvCGzktTiShHXfpba5SE9GUaM2kn/YmoMfz2oWS2aSLCsk2SNruX4jK31+m8LzpZS427mzpopK
	F9bPFvJW6hB4bPPtCucSEHkz/LejESu4=
X-Received: by 2002:a05:6402:21d4:b0:6a3:f63a:4997 with SMTP id
 4fb4d7f45d1cf-6a682567131mr2177249a12.3.1788340320712; Wed, 02 Sep 2026
 02:12:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <dc9ec3ff88fd895cc4daf846bdebe9ed2a58d507.1788277742.git.mattst88@gmail.com>
In-Reply-To: <dc9ec3ff88fd895cc4daf846bdebe9ed2a58d507.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 11:11:49 +0200
X-Gm-Features: AcwNN1W-bysK_UU6D1gNJGL4hkeLn89fMcgmtQ7gQeFBsPWL2yf6N6O3MoMWeZ8
Message-ID: <CA+=Fv5S=N849_UN2AS-Q1aY-34wvVaY56gWY1ULG8hpNV1kuVg@mail.gmail.com>
Subject: Re: [PATCH 10/24] alpha: select HAVE_ARCH_COMPILER_H
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Alpha already provides asm/compiler.h (wrapping uapi/asm/compiler.h)
> which defines architecture-specific compiler intrinsics like
> __kernel_cmpbge, __kernel_cttz, __kernel_ctlz, and __kernel_ctpop.
>
> Selecting HAVE_ARCH_COMPILER_H causes linux/compiler_types.h to include
> asm/compiler.h, making these definitions available consistently.


I tested this on an AlphaServer ES40. The kernel built and booted
successfully with CONFIG_HAVE_ARCH_COMPILER_H=3Dy, and the in-tree
test_bitops module completed without errors.

While testing this patch, the FFS KUnit suite exposed a separate,
pre-existing issue in the EV67 Alpha fls64() implementation. The
zero-input tests failed with the contradictory diagnostic:

  Expected fls64(input) =3D=3D 0, but
      fls64(input) =3D=3D 0 (0x0)

The EV67 implementation passes zero to __kernel_ctlz(), which GCC maps
to __builtin_clzl(). The result of __builtin_clzl(0) is undefined, so
the compiler can optimize the comparison inconsistently with the value
returned by the Alpha ctlz instruction.

I verified the diagnosis by changing fls64() to handle zero explicitly:

  return word ? 64 - __kernel_ctlz(word) : 0;

With that change, the FFS KUnit result improved from 8/9 to 9/9 tests
passing.

This appears unrelated to this patch, since asm/bitops.h already
included asm/compiler.h directly before HAVE_ARCH_COMPILER_H was
selected. I am mentioning it here since this patch led to the issue
being discovered.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
