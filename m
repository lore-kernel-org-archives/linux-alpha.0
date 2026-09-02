Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86FD3CE0A2
	for <linux-alpha@vger.kernel.org>; Wed,  2 Sep 2026 07:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335380; cv=pass; b=DVATNKSYj/NvNvcD51zVjXtyKTZe9R21sEriqVDikcIrc0JdRBbZVkJArhOuTBbnEoibP1IVrawic66pF5NQ850/KL34sgZYJQWKHsgSmuBrArTUTq34vf9Kl+r3RTHa1YWTh5NTSqmdcRhysWLdaShK4cTXBIekjmh4fR++PCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335380; c=relaxed/simple;
	bh=F7vGYidjDWLaP+D/oNMFuaVf5OSgHfGgGXW4qg6LDbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLW3kUshundY8uvYMeFxsOqkm/ggStiMI65d8q8F7Pg2daMxsJj2+BVZOPsSfYaEaRGDqDM8Jsgp2HB+oUDKbzS3qnmy2MRGqYVeHsAirDyB1/8DSuNEC+S4Bat4tpzO+rkY1wUgoL6Mfv0Y3JkEuAJJBVlIBoMM1YwAEsyzqn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nH13l8Ik; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nH13l8Ik"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so1212054a12.1
        for <linux-alpha@vger.kernel.org>; Wed, 02 Sep 2026 00:49:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788335377; cv=none;
        d=google.com; s=arc-20260327;
        b=h9xkhIRK9I6UKz3eBHEjEB7ECxCiWyEXI8X7PfEjhad7PdX6FcnXzoSsdiN7ke9a+T
         EO+5bPx056w/brtxD7NGxheF4tx4p+aiCv8LvmaQi8HLgpKIduAN8OrDvqT+3LoIEaAo
         HU6T1H2aJnSNbY0sqqznA0fEded85Zydy3IiKpu89brD+/NwCNEaR6KsHhHx/WyZR5gm
         xSQjHp27DMtBtgxnviA/2jPF+aClz5gia542meCjz4V68sCVAvrnVFlj0mVMAGZK6xLT
         a2FsShsVXiLqFZ2EXptGE/cqT28lcAegpj9Dkm6PSuAyBjEeI8gk3fuBxrKcOjDGmm8f
         L4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F7vGYidjDWLaP+D/oNMFuaVf5OSgHfGgGXW4qg6LDbc=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=P91+wqqVQiZnoN0FRM1YklEtt/oaBRdni1cukxGxzcUjJCkO68KTO3dq52EdN2wnq5
         avpX/J7EZ6vrFwTQAT7IiOnchR/pmI1+oHmc96I+JMDh9MrFV0GgTlXNrr2ZVaIHK/P/
         rc2rYjh6PqSo+jQmKyAuC/lqZovWFc1kKvam43qERI0vKY19nx3CvxSQGH7pwTYC88tC
         FMdkAeTevATcs4+sc2A5bS6upptQeKL1mUWHUUL096fWtKWvnRs/pAWaf1r+mbsy8Dgw
         xCSpDTcrD6ALjB9yatUCpeykw8qgqoqVQZtgKMU5LqHDmpKb7RA0g5yHOa+yRj52Zb16
         QeLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788335377; x=1788940177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F7vGYidjDWLaP+D/oNMFuaVf5OSgHfGgGXW4qg6LDbc=;
        b=nH13l8IkUZdPoyta4pOVJrK5S7r9MV3BZLAWue67M5SLJbTrfuA7bs7nI8fAmMGx7l
         j/1j/5YRRrK67tN9OZ+vabMLxnSFqiz3QTxX5oRh+Jp8T2IM6y0m2fvxI6mRuS1A5LkU
         ETvefcKt5rqxxz65enRtbeFPRbTSLj4Z42vAdQczBBb5udoDFfBy7uWgxh4mgPkZmKql
         1Kre88DIlKaxRJyTxOZj/ZxKKTxWl5r9QzO6nI/1uXa/XhA9fSocwZiR9ZXRnc/VnMTW
         Zxa1NP49oFblCcbvvioQ4GIfi0P9uFManU910DjYWnw5Jn13ALRHyDMV86q0Nnrqnd8o
         CvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788335377; x=1788940177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7vGYidjDWLaP+D/oNMFuaVf5OSgHfGgGXW4qg6LDbc=;
        b=SLRfFyjQCUcZf2dqBl0RK1i3/As+RCZSlzrRkHSn6XsjIY8fgah/OolNBO/sR0F4Uu
         igq4fRyzJFTGIdCpF8CtX8y4fOLobYscOjdeuyGMWX2HI5S+1pyS+1i9uq2cUzZPq5rh
         rsr2ghi/1jsvwNeGd0mvLWPewBKM9UuxXRqz4wE5f5OnUJE4fOY0LgvCAyRE1WptDtdv
         rz5Uy2AQLhGuPaKOMZLD7HJkUg8KBKgyKoppecHopBLvVvBg3I+o/YhxdfWMQ4lz3HWb
         6onB/rse0x6enjafUtfxmDex63oRQDNqwKlaMWFJx30PVfqEIq8cy68bqS5AwV56ovW8
         SRqw==
X-Gm-Message-State: AFuF++lWQLYyaa47h+EIUKWwActKZU9NkHUNK3F0wIX2mnBO3lbKkdrV
	VEGmwVZnZW7AeiUdeZdd3w7ptJYiQ48mK0gAWN5xdXwWA7lguQrAyVQKxC0mQ0txMsV07b5Cra1
	znhCZSbNYcvZ24/SZuxwUykwoa5VNIWU=
X-Gm-Gg: AYBFou1FfNyJRTuRDBe5AM/Lj/Q4XBnwklXJPqfNUEfkRIUM3qjFi/wum3uk0CyF7rB
	kfgzK4Fc/cFyzqMLMIpydIyxxat7CW1/wwtjN5vQhl8WEPG6s+1E5zZMquYNFs3MoIUR0aaA9Xi
	msli2Yeg1sdxTVStLUoh8hQ01uAVePyTvK+SAQVXpUMZEcCDXsAwlvVpIxK5qOa14atwk9E79RH
	pJG84INgbsOTgkUbxA3Cbhici/TBYZ/Zs4IYcITLZRLXyEDpydaWIYNG1whnR/ECgnkU520kSsD
	Fzle9SqjsGbs1aXg3q5Gc4xjPYClDQCCak7b4SoyzLE0tXexV5WSnA/74v3OofBo/sLcXN2BxcJ
	oMZMot+9JaW/FMEArchMGLTtIYTaio2xCjwki6bhD2g==
X-Received: by 2002:a05:6402:388d:b0:6a6:32f5:90b4 with SMTP id
 4fb4d7f45d1cf-6a682af9bf4mr1169670a12.22.1788335376915; Wed, 02 Sep 2026
 00:49:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <a328908c6591b0be86d25a64c543e15911239b3a.1788277742.git.mattst88@gmail.com>
In-Reply-To: <a328908c6591b0be86d25a64c543e15911239b3a.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 09:49:24 +0200
X-Gm-Features: AcwNN1XnezAoQqgA1OizHjGYk48iC3-bCSMnqidzeiMP5_SR-FOhi-5_R2NCbWE
Message-ID: <CA+=Fv5Tr7KJG9HRjeGHUq86t_bF9nmnTqyUz4GraVJRVCPrnDg@mail.gmail.com>
Subject: Re: [PATCH 08/24] alpha: select ARCH_HAS_FAST_MULTIPLIER
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> All Alpha CPUs have hardware integer multiply (MULL/MULQ). EV4 and EV5
> implement it in microcode; EV56 and later have fast single-cycle
> multiply. Since no EV4 system is likely to run a modern kernel, select
> this unconditionally to enable multiply-based fast paths in hweight and
> string routines.
>

I tested this on an AlphaServer ES40 (EV67). A test module exercised
the multiplication-based memchr_inv() path with offsets 0 through 7,
buffer lengths from 17 through 257 bytes, four fill values, and
mismatches at the beginning, middle, and end of each buffer. All
tests passed.

On EV67, hweight uses the native CTPOP instruction, so the generic
multiplication-based hweight path is not selected by this configuration.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Regards,
Magnus
