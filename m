Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9979D26CE2C
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 20:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748840; cv=pass; b=FZwrShv/3GeityGeWYQW3ccszJeChTeF+4oeyUiwcCBe3oxjO7e+5PnubJf9Yh4tUoktXeyJtc1v+6S00TUP7H/ZoEsehxojU+s01zlKSktutZfcrD5t7bwUFtULAyusaFmijQN+OIBe/FraKBYHtpF8whAJbc2suZWU87Iq4F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748840; c=relaxed/simple;
	bh=bYL7lEF9EBPQywYdkV6utsdpe40zrBCiNEczQQi1TLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJVq+DIjfnix4LxAmkOl6hokQkuqYMnAqRW6BzVpavvhWbp5Hfr8fySvZsKv/7RtK2zCsDgJM0Xh/tQhq/U9BcMxo1HNs+YUemSWzStfMHZE0KfX1EuQpOpFde1inZFYPMNnT8jiyFsV1HGC6mTMko0RTRctzoN7nhv35hpDTr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ep/6CdEc; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ep/6CdEc"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53397554beaso14812651cf.3
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 13:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791748838; cv=none;
        d=google.com; s=arc-20260327;
        b=bueVxtzQ3BD/HEdYaUhG65aHmk6/GO6dPOVATeMoRgORTicAFGRegRC9SXGO+pcMsH
         XGGgRh7GLhYhvMygPRPrM3likroehKzwmwG6+1mrGvKz6aY1LXU0HTG90dzTHa5Bxqk3
         2jZECL11Kr8xzhmQwEqTkYCMjCy7g5WRVW9D+uxJTrhFv7PCnCTXbJ5uV1SgmBwl7yy/
         g4/LQmt3RHfItEyYiUedkbqx8UqrPBtnqAKagPC46fgcvzQQ5gspWGLBaLcVoi+BN9Ib
         zt+0dsKr8nfNDc83Q6mGBpOqRGqtUPyt0nOznpRKfElWeN47WPmoP0uCO46SKrSaU+jj
         LKUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zEv4PBcdGJDyHGXZpS5PeBl71OvDfJp17c7butaS+8w=;
        fh=l7PZk8w1dWFaAE7nFA/xncvvVPoLS22sJjMIda9Y9uU=;
        b=ZymcO+I5IK+MbtRgaB+ePrUHuJyDYyfgTwz4aa0q6dRXbBWSd64yX4CElcRtgXcGTM
         B84toroHxBdkfwK3s4nWSBIOja4evCc3rjD60OGK6vGPQ4d2PUhaa0NvtWW7wPqXPnUS
         k91Eblox0KO8SE+YfaJJBm/QCxf2iM++ljHxztE2BJuDv+dN3G7uOhrHefzPEIJs7Tkk
         /Lax67FTPpvCK8/V9rKU5s2wzrNdOfMw6HsjIzE60CfhZScxhYbMaNhG5bCwHR1SXpQK
         NMw9uCpcX3mgwfDpCoqwR/Epf5/7J4s60bZ72zziM3EGwRw9iZmNapJq0tlxaEu0UzYy
         OTHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748838; x=1792353638; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zEv4PBcdGJDyHGXZpS5PeBl71OvDfJp17c7butaS+8w=;
        b=Ep/6CdEcIuNyab+Sd/BW1/3cmUN2QX03LY0g1uoGNp0JKVx573FVCbS6D+5ttzRqQ7
         kSciGRNEAaNdnp2J5rcRV4Ej+SZwWNcl8fDL0Yqyb49wpANhIkJirii3zwblHWVnpcFC
         JcsWB3pR+IoH0rPDY0RXWQLQjvgYUX3/GO2mEINHC1dnDf/SYLKWH19CZIDUFq3MwPOQ
         qF7R/G7fUoWlWkwJm5UZ+4X5qcs/e4CH+Ukyl2yp0dNufcN3ES6YtfBnCq6LG58JE8vg
         DhD/Bwr65zqTlsQxkYuxPEP/yGkzJTU4+HP2Uu29g2OApxgVRd2+E7h340yQ7GYsWZgr
         vr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748838; x=1792353638;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zEv4PBcdGJDyHGXZpS5PeBl71OvDfJp17c7butaS+8w=;
        b=Xv3P1xPto9ll/IxWtlZbKAFbZxwNavBKfzNBGcSHmKfSDXgHN14LSs2nfaLCy9Ybtz
         E5/jyCosnmcN2ION4wbGwCMKOHxtbRk00gDZNsQ7uPVqCfPQodk+Ewd9YQ8xz7XQwshk
         a97u2NhMTf6UYeeKf3GRo39KktnyjcxHHtUakQ6RHuroJ0hT65It/qJPGx0b3aifdej2
         zY3XntmoXhyFC8O865WhU8bM5t5YKTwaH2CVYIJWLSmiooPyRbM/3xKZ4hlp71NGRdDy
         m4udc9QwsWMZ5MfFeDl6B2MV10svOKT8uB0Tf8jteKViY6k5cQvRvSGzKTWEffay9EsX
         G8AQ==
X-Forwarded-Encrypted: i=1; AKwUvByDGJkmnq/0TAnVWWP8WJbQ/+mk7a6s6XWIqx34Q8WL5RV+iqWqKWB59bicirmcT7wIA6rCbVIVe2jWzg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKcP6d1Fn9jwr2aiZq3XVOFy9YRuXf8sutOZhTEPs9aV//5LaxX
	pfcDtVM3MpVMrW0ZOdOXHt0mz9XgCac+1ThQTK1CT0hWBd4UlwD+t6x//enQ0Rkj2qTRsdl1siJ
	nrCyrb3XhezClYURXZZ/OuFw6adIcYXpNf10Ll9c=
X-Gm-Gg: AYBFou0i4Y/JkowhFmR4Lkh2o5RVITUuZvyWzGAJVAKJfMaFYz0p2lSFU2/lwZpWQDY
	0nBrawc7JkywYW6E5KH/x9HuHsxoJWntfYIJySTigUiBzQp1XZ55G+krZp47s085QbbsI52gR5I
	h5afbE8GlgX5CrPeGOKBBbR0c2TSSTG6qctvmIArwbDWFjGuusHl11aRKEk+z9Ap0wBWXKciFZx
	YGSCQiLxKlo1hSmxh7kcq5eDQL1m6QzyaxwOZP5Dd2wq8LI1iDGiFCkaYNLvWhiZvZL1ww9lfB3
	wXRH43OnCDNaNzLWWcnb78UPSXr47eCAEOecl+Qua++9sh/QDaTLrL6zBYeWrx73IduNJfi60q8
	Lz8adGLRHv9uZtD1kSdrL65kzUgNOBFlv+RNaEugIb5D0vwglKg2e1+59p5pGMLA0U7IKv0Y=
X-Received: by 2002:a05:622a:1ba3:b0:535:a5f9:7524 with SMTP id
 d75a77b69052e-535a5f9783cmr124819321cf.67.1791748838418; Sun, 11 Oct 2026
 13:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011191344.981000-1-linmag7@gmail.com> <20261011191344.981000-6-linmag7@gmail.com>
In-Reply-To: <20261011191344.981000-6-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 11 Oct 2026 16:00:22 -0400
X-Gm-Features: AclHuK-icwgsC48Km-eUTvYCG_61xgnem75VKlOo5DkjLHSa5iilCjLTl0a3u8c
Message-ID: <CAEdQ38G6KtnJVgS=5VtJQyNy3Z+LQwgaaAWc4MvJfxRGU=yF2g@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] alpha: decode Clipper environmental events and
 retain console logs
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +     if (header->code != 0x206 ||
> +         clipper_process_environment(header, 0) != MCHK_DISPOSITION_DISMISS) {

clipper_process_environment() returns MCHK_DISPOSITION_REPORT for any
valid frame and UNKNOWN_ERROR for a truncated one. It never returns
DISMISS, so this condition is always true. The silent first pass can
go, and the body can lose a level of indentation.

> +     status |= CLIPPER_BITS(CLIPPER_EnvQW1SMIR, frame->smir, 0x15);

Your cover letter says SMIR bit 0 stayed set in all three reports,
including the one after the supply was reconnected and its own failure
bit had cleared. With this mask that last report prints "System Power
Supply failure detected" for a recovery. Bit 0 looks latched, or
inverted like the halt and reset bits. I would treat it as raw context
(mask 0x14) until we know. Could you post the dmesg from that test?

> +             if (packet->type == EL_TYPE__REGATTA__PROCESSOR_ERROR_FRAME ||

Minor: Titan prints by_type.regatta_frame.cpuid for these. It would be
useful here as well.
