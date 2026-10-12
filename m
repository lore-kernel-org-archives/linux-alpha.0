Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28153AD50F
	for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 04:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781093; cv=pass; b=UoWk+28cNQQ/hWAw9JTOnXv2aCbTTNshMcUIvSwsd6/+2PNeoQuVlbwKg0SoqI68Xe0TFKIXZBxnC1x8vb7LfFgiJMCPZ4S9YKdDOY+JL/3g8lRmP0RfBVg1ewdkXAoTTzBirlv0BHdM7jEu1UCJhiJLlJ4abgeFBuMa4bVX34I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781093; c=relaxed/simple;
	bh=CbeNc2AaMhtIK8r40L1vtYnXZoUmD9EShDnhDcrXSPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqB41Y/aFJ/cZs4ZIpUhlD6P699TAbrSuUC2t530la738SUzwU6XRZn+uuMlTDOkdza3UKmgnAMm7wo90aZjRQAzispUbA3w4ot/Kenwah8Zbb2BkDCcuqmBybQTS8Hj4nuB4wl0I3quvpPsmCUYdF/eUucZkyn27BAJe/klqto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeBJ0/qb; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeBJ0/qb"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1cc392d8bso269592a12.1
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 21:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791781090; cv=none;
        d=google.com; s=arc-20260327;
        b=bd+zlyLTlZLojoTGnClqtPmJQvPSVHStvDLcB9/WqTwIyhv4uADc45m6UDSLGT8dR9
         CAJmgUbG6tkuMjWKUHB+Ac2hlwI7EH4UpVocLODLpBD76/DSYcOusNuQSe5y02FxHpzh
         LVRiojgw7+UdSpCh/Wy/JLrpIYWno4b20bzyu+dMY/N5chdBthU+EFwuBkJ9bVes1ksW
         8Ka9jlsQvQIHznNTQRSCwBTICohPXcCOrPdiih1VqRa4zkEz8oEtMhzII+AoZSk/jU3i
         xAKYUUEl/RJ913RC1GRN+eHRaCNjTxrF2lrx1AnTSD5jTENi5uabJfxeAURGMYbmFR8C
         0FHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BWJ08ytHN/opOqIBCvIGVsDXGqGAWZ+1JMUfudfTNpg=;
        fh=1azpPjSdOJ+1NjmCAC+K+0cC/hQGX/1yaCjv3YyEIQ0=;
        b=IoWnjhxAfPaXlXAXXnSH75sThE7S3o/qNLAJYjj/UJDoDnZSZe5o/19gJdZG9G09bA
         P0RQ5+NSKEPj3NR0WU5gDEv3kwRPxPNWLOzMktctUWqK1CTYrvx9JDej71JpQYlOchKJ
         a0aSZfYvS3l07WNqFm0fbPrmiR00LWcStzr5JzntyZ1XxlvOyZrt8cxAVrfpFkZemQ5w
         WuqBOR7zQVUXP84S9wJ/BM9oXG4aXvgVoPm4fTbnckigomjXz6FwKZV8lppOM/k6wJkj
         O7A58ThL30M2P/eKBK/xPjUfPPQUNZACQkbJcRekdYJL2Ea973dBRW2JnV0+NvnQAD8M
         TngQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781090; x=1792385890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BWJ08ytHN/opOqIBCvIGVsDXGqGAWZ+1JMUfudfTNpg=;
        b=UeBJ0/qbkwVutzI3PJszlxt/NFhopJsuKy9vPURJl0ihJ/sjjk6uDwl1TXizXD62Ed
         Ao8oLXkvyEdqyRcbdrdjH/ZEmrjbs731ZhYn4GKrPW9t6gMPWTEpEjXlZG8lm9TQVL+N
         ISTE6Bs04K8Kg8n77F5CZumTZbgwQ2T42xyw27ruHRhV4f1lnOmyOD4fYKtwCfpuDcax
         osbzyjCkX1u83YVEU/P9lIP+/Dg3OtjjHhHoSAVJox+opwbJV/d6XgfwLwMUWhDVSihe
         7grdXN8stDnnaN6bC1RQZElcR/KoBZgH4O0Whqo8NpUA6nSf93RxeDXzbDZY8YF3wZrK
         xemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781090; x=1792385890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWJ08ytHN/opOqIBCvIGVsDXGqGAWZ+1JMUfudfTNpg=;
        b=rfqBA1/PhDsK86XERV4ikVKAo+OD+t/Li5kidHdYp/P8d41FQCuHUgm7zf7Gip0brt
         0wNZ2MMgtfjkJIKuFdZx/TyS2X9zAlFFtIUz9ueIdK/1NlpVSku4ORzEpvJoSy/js9aa
         duN6Cq6BIvUcNerUMz+5Nca51djJp0atIkuhbwheh0pABRNYkfc6DD9DsLZDTn2w9Oka
         cTWFPfQHdtgryJNIfxN32VaQKjsED97zUWAN9vUPUlTJll5pQl9vu41vUieW3l8me0sh
         1N6A2s7g21DuCi83L4kq0cfZqmKaKXB1nMBD4zv9k/uT0cHK07MGG0vlxdK8NiOqcP8g
         nMNA==
X-Forwarded-Encrypted: i=1; AKwUvBwt0BjQxALWRJcLM5miq0u7oIJwcLIKfP88L+NrJ/ucTpotX90Z+00d94x/ZuHVNzVprTDw1y8kMGZrpQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL7t7xGejer4DGisP9dDKSU3Smlld74L3mQQIkEThFuuF6a3x7g
	aRVSeP/Hs8NDnloqharYpWpXJG9IXzMnCrpSc3QYY14anSzbFQxGDXTGVA4wA4STdF4/0a541Ky
	5YKp3GOHkp/hgsla92p1ed2GyX9ljGmjJy9qUbLg=
X-Gm-Gg: AYBFou2DBiMIk2whkwK1337RihQ5kpsEeA6z7PJ8bE5BQzT1/9G2yxMemSGaZMBqLbs
	6z06vrKHuFaKOdWGCHtUn4sUAInfxN//k7fa6yGYsfQ4auTFal+PGgFROddRDbFxv9yu/aZVTK8
	fsXkaU0kZGxy8iDrhD1VooWB0CwenhnOd+opBRrnmJOEwWTje8/WkdIcXN7+kR6B7DXrpDlDXGZ
	5MADmZKP+ddhdzM7lMDgPEWzoNu2XQGefx3XSQt5Ww+W9fP0e2eWDLGEYAtYNtw0PO8GMYTJM8a
	pHNBsYZTXoCW1AeE65k7pqoGesFfd9C/I+IJb3L3XM3Q8HgY3RLrs7tF9GHJeu8EFX0FvJ0Efwd
	i7WnXn4p3Vl26CQQKzITk7E6R3Tf/KSUgCk+aAjq4zA==
X-Received: by 2002:a05:6402:1ed6:b0:6a7:f5a1:88b2 with SMTP id
 4fb4d7f45d1cf-6b17c2a41fcmr7878845a12.14.1791781089790; Sun, 11 Oct 2026
 21:58:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011191344.981000-1-linmag7@gmail.com> <20261011191344.981000-7-linmag7@gmail.com>
 <CAEdQ38GoGhoaoymQER16qF2NHwhOGjGsTh68B8oqSzeR-LL-uA@mail.gmail.com>
In-Reply-To: <CAEdQ38GoGhoaoymQER16qF2NHwhOGjGsTh68B8oqSzeR-LL-uA@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 06:57:56 +0200
X-Gm-Features: AclHuK9J7B4YJ03biBN9Djiaei2hQpnXUSq3U9jXETC2EPL7QR24Bon1lKqKQPU
Message-ID: <CA+=Fv5TC4OTgVKXdnqDWawXBm4M1m8ZHPJoX6wL8K8fdyPo5xw@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] alpha: stop on fatal Tsunami system ECC and write
 parity errors
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 11, 2026 at 10:01=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
>
> > +#define TSUNAMI_PERROR_FATAL (perror_m_uecc | perror_m_perr)
>
> Why PERR and not RDPE? Bad parity on data read from PCI seems just as
> bad for the consumer. If the HRM says the Pchip poisons that data and
> the CPU takes a 670 for it, please say so in the changelog.
>
> > +             perror =3D live.perror[0] | live.perror[1];
>
> The changelog says incidental PERROR state on a CPU or environmental
> vector cannot trigger the panic. It still can on a system vector: UECC
> or PERR latched before an unrelated NXM will panic here. That may be
> what you want, since the error is real either way, but the changelog
> should cover it. It also depends on the PERRMASK question I asked on
> patch 4.
>
> Two things that I think belong in the changelog:
>
> A CPU-detected uncorrectable ECC error (670 through
> ev6_machine_check()) still does not panic, so after this patch the
> policy differs by who detected the error.
>
> A PCI card with a marginal connection that asserts PERR# now takes the
> machine down, where before it logged and carried on.

Thanks, these are good points. Would it make sense to drop patch 6
for now and address the panic policy in a follow-up? That would let
us consider RDPE, CPU-detected ECC and previously latched errors
alongside UECC/PERR, including the impact of a device asserting PERR#.

V7 could then focus on the reporting and acknowledgment improvements.
That would preserve the existing continuation behavior for now,
without implying that continuing after an uncorrectable error is safe.

Magnus
