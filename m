Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CF2367280
	for <linux-alpha@vger.kernel.org>; Wed,  2 Sep 2026 08:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339021; cv=pass; b=X1PwpTgSr8XEvTjTB3zaUnjargNqVTdyeAlm4ioXnKlkTFex4D7uh76v26ik1f4g6RYBIRIMv8kOK1rwDu7lVhFnoF7sc1OS6kMStb/AM9sNzYxCISl3zHJgBUbF5MAj1I+OSjFizdQ2vFogwCmSArQBHSCTo1Q9gQsAGqntc1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339021; c=relaxed/simple;
	bh=sLw53KeXCRX5ku9tFSnggMWYgw3NaH4bhGi+ilx4QqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwP4y6XKh7GF/dP1C97CeObC+yafZ6h2QDRQvB+FC2GMO0rjIiDEK1FSgxvrfqOoFjqBzmbT+lsUEqRxmSna1MB5egNjjdiIMr/BhTxvBmO2TEXUv4Ln/YRHeBTbyJdcmnT8NgqhKiomzajPVeb6z3H0D7VckR66+Nbah4cK9ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTP3lM7Z; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTP3lM7Z"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so763222a12.1
        for <linux-alpha@vger.kernel.org>; Wed, 02 Sep 2026 01:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788339018; cv=none;
        d=google.com; s=arc-20260327;
        b=ZHPXZ0vQ7pa6TX+CHM7xpBlsD/weELwaB+L86gPsWPHHdPZdiVdzAzPsOfXDaDn+uc
         e5r3U8AefbCatzLHxyeXzpeqIC/KFkRZPglgtNXKV4jU+jYSI6F68pThmh2hVIgiLygA
         Ii6dvwSqbGCnKOSKNn6LX2WBCn11MrIU0t72opsm5Hxzi41lE4yICi2ifQXA+S1WIU8n
         G1g8qXNS0VFW18YlQ6JrJP7NzuDevjVcyyYnmXsGQuYJzt0zYvtVjAx0LUdJkHy1SkEV
         TGiwPi2g8rnINGUgTlMrO33i7PvfY9w5UKxTmwttiF4elytjcwICplsBR1OIowuN5Jin
         u8ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PMzEMVAE4nv1F6Owt1NZP1/SYZY0ERgbfrHrgQDr880=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=NiHRq5/YoILUr3BXXX3Rh+BSZZUQ2eDLM1vjjYpOBDgpetdHrL5gqeVEiCk70kr9pc
         Ndd76FbygY7ungKuoHaKXbQcHs7i/9q0Ev9JNIbxMe4AejV6NwCKxtYgXsYq1+PSxmjn
         m0vBaRBDp2cCA9tFygfTl7doMtKl4VSYdTx4ODfrJ0JadFsdDJ3Lz8RpgvgSfWfO8pZx
         s9r3Kf9QTZONdyVAaC9cSjwVtJ1nfrSGbureDxXqgc1PlRn+n8ty45TTB1/KdfGpd/sM
         K3GRZanQyMWvfKv0z4TwGhNUHZ/LwN+gz1yl3pjI+SkE3UOakKSG20CKdU2P10saY4gr
         xkCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788339018; x=1788943818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PMzEMVAE4nv1F6Owt1NZP1/SYZY0ERgbfrHrgQDr880=;
        b=PTP3lM7Zy3Pdw9Dtw60cg8YUdvEMRBzcRWRxdbbRm3nNwk0yMWHw/hXVZ5XXMpElXO
         vRf9FyhlEQ6NlBq4qJjf9IhlzWl7ZmhdHR+4W+sjaU1/5IWbo+re150A01WUKdGPFIZc
         isdDN7ExBL/nihXfYcV3hR89GBXjp2O0C4fjkxpYg3f2PjgAMxmsBsJ7FTmhiyBvX0FQ
         dgT780i9nBbxmmnPOZC9MZxGD5HWTd3RxF+ks9gbbP2Bf8HuEZkHy/kH1YSux/zBeM7/
         vSkma0bioZqcnpJbSdTC1xGvBzbOu7GJyCvCwBni9HrLHS58552jIU+EP6ySRo/Zu/i9
         NBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339018; x=1788943818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PMzEMVAE4nv1F6Owt1NZP1/SYZY0ERgbfrHrgQDr880=;
        b=UvywxbEJz5oq0eRK7uDSwukK2MdAV/wtTMNcoz46AwTcR3AcSR5aUjhtvbx6aBDvAR
         NZK80DQCI7hZwBSIuTfZxjKGPshGNXfl9K2pMmir1PrvyZRilLtJk65dl3rNvsXoA2/5
         X9Krjs1JM3kaSc2kvl3qlEs+1wsgdrmosBXH/xlJ5B70bMMRfRIBlMwqKqlb9CdLD88m
         ydjSRC71TARCZyWM1rUyf7a7ngOUX3d+HC2x+LYvM96W6CaNH+OZDmB4WGx6CDd7Q/HT
         Yve0VCn1x9kadCurROaFVWZ5eGe8l05tDDBSBL5xCUlw4N1bNtFYG41+Bkyv0F/y0FIq
         9mGA==
X-Gm-Message-State: AFuF++mvCHXEVFO1GIX6XXsOyGqA+g6QOXU1IGd4kOsAZLWKO4mWMHAO
	kuUt6WjeF1EhsnJY2ww7lm/wyBXdDIGNWieCb7d6ABOqOx7vFIMCKWSZccmCQfsiyjNKju8htIQ
	KbLSypDE3gFeZWNuFSrf/fJuWSaxQt9k=
X-Gm-Gg: AYBFou0rEZM3s8CwQcka8reuVAFrN4v/nc1m5NjjnBH0r8Xku0aNOPvLG+mH8ZamEkm
	zSQEiumKNu/AG1WvaecHMNDiDlEPEjq34ezeUNNHJ6RJs8sl3a6HHVuA2/ugPguSk+jPk+YpF0R
	36UYmc3Rsn++MWgpPWtiPwizGs2L+EGchfavyvpd7kjVVVrqRSr1XSo7KqIxxYtW9rmS7d85/ty
	W+sNbrIHJN1fsS2MfY0lw3kQyBwzwL5Nb8G7th1jQ2amYlaltjKTWKryEPwvHWkTTwbic7uOdJL
	Se4IBeMLIjDcVDn5BqTCO5ljV4dev94/dsaIlHL7s+pXvi9sd/VpRTyA8qesIURq5tG1C8o191J
	Tu6drwtgYYXx8ETo9Y8JU/0DLC1L15IU=
X-Received: by 2002:a05:6402:388d:b0:6a6:32fa:1e9b with SMTP id
 4fb4d7f45d1cf-6a682b00f79mr2064313a12.19.1788339017543; Wed, 02 Sep 2026
 01:50:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <526219643312193e0705586965703d16a6d4b60e.1788277742.git.mattst88@gmail.com>
In-Reply-To: <526219643312193e0705586965703d16a6d4b60e.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 10:50:05 +0200
X-Gm-Features: AcwNN1UfsVzHiYRlk45W9f-ig8jXrEui6eEwmgDU4LEI15AEUnxVGQlmXTsgTvw
Message-ID: <CA+=Fv5Svs9qgBZXwjbH4qFBod5DFf3UYo3FG0=ps1NTVimB11g@mail.gmail.com>
Subject: Re: [PATCH 09/24] alpha: select ARCH_SUPPORTS_INT128
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> gcc supports __int128 on Alpha, and the 64x64 to 128-bit multiply that
> the users in the scheduler and in lib/ care about maps onto mulq/umulh
> rather than an out-of-line libgcc helper.
>
> Gate the select on CC_HAS_INT128 as the other 64-bit architectures do.
>

I tested this on an AlphaServer ES40 with
CONFIG_ARCH_SUPPORTS_INT128=3Dy. The kernel built and booted
successfully, and the bits KUnit suite passed, including
genmask_u128_test:

  # bits-test: pass:6 fail:0 skip:0 total:6
  ok 1 bits-test

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
