Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792965111;
	b=JmcQdLHuOXAUE6bSDd8PHdgpDfiGtPlYQ2sFC6N3HMr5lbmSnWL+QsZe1gCSZpnJkXht
	 h7U6SV6+2Boh00j0Bos7adzXcz6V3HbRQNLni30TiDDejyYzqbtdoGTYhuxmSs2V1YaVr
	 zvZ+qXOJxmJ3GHSfw5/Rr3OqrGs+JjKZVlUIGOTwjtfLs49gcc8MOd48gX1+8Ml7giYZd
	 bJdG8NCM2tmDQsvLkClaKrlZnxsz5UCMEH4XSqfH4bRV5BvWuISrnIejcfQZYqLMOGMcU
	 boAsyN9iawmZDRuKD6pJD5NghOMhsEdktE47caBHX9mWgZ0H6m7GDcEr0exN81MKWWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZqgNS4Dh7bRrtMBkrqtS1YGYiBq9bbUChB11hsUxU4I=;
	b=IWGEvtDy+EETHkoyLuyP/uJDUlNXMU4qffb2xLqraz0/tYLu3nU439VKZI4TFqWvFKdR
	 7he0Yaa9bXgYEEvWkIbz+ZzeRWJuj8N5WCatoYOgSAWk0p7VKV6xigmtOFdZwYHtZk3Iy
	 4vx5AKFrLAPZcrzGKKZKoi2pW0cvDgaK2P+yOqiKET2Q+dxaZTeUTypX0nfUTzDPFOvNW
	 G3gnGJ2JTyo7M8EWCfoubtCuqux0HrkmCMCStlvu0qjMgZyRktLm2oobq/0Gw1cuIRBzC
	 OxXFoRLj+2wzC5/EyUnt9WS1ZYNDl0o3YS6ih2Dtsgux8gxFqBaatvkQW7l1VRsGzpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZkxTz9PJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41663606A31B
	for <linux-alpha@vger.kernel.org>; Sun, 25 Oct 2026 21:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41663606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZkxTz9PJ
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a595487d43so17280331fa.3
        for <linux-alpha@vger.kernel.org>; Sun, 25 Oct 2026 14:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792965109; cv=none;
        d=google.com; s=arc-20260327;
        b=d8AcVKM2WM+BZaPK/5h0WyS6+9elugrrsDdrXbHnKXHtFYKIdsIKh5CNTw8ZGvlyif
         Vnw9HxBHspJlWtAoQC6AUbwLGo4nWCbRojG8ycLRszQVFqjzhoW6KfaYnhuTgNf0bfw/
         Ne8LhIdB9XZGiMf+719mwIWGFLs7vnhNCQbFmM6Zd/l2GcjE1/uJiCxbtxZreM+BDx5s
         OJSB+XxZQ6hiWyJGBBMBoVNzTZjZ8sCkVi79y5jo8+Js/O3vRDID3xPsjxqW6kSk1vW5
         cI2McYoM+buxqlMae5knmUl9HAFNXVjFFKSK3p4Onvj4SypCHIijPHrpWcSCGVHUF463
         hkSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZqgNS4Dh7bRrtMBkrqtS1YGYiBq9bbUChB11hsUxU4I=;
        fh=bHVZzUXhUHMDpcC8Sm5hGw/Kpz2e0rvJq895VlXDJuI=;
        b=E1e8+R/pHG/0PHi/BtEciq5BvKXZoMqZz8m6fMikFMyhJciz2VazVj8J2/7d9MF/Og
         cKDthK5xTNhSa4BtZ0ZrXksGAA0iigPeVcaFXEbu54XLPOMFR40tfsZZWEzrML0pBkr9
         s0dU4fbATMc7DLVQYDfgAelXGv6s/oxJDck/wxxmOt0LifZ5/eqWsI4xM7q8WpwdRoVG
         ML/YwnypVV6jrMquf4ddPIAGdhInInhR9R+n8SEVj8IQ3uzLX/fB2Lvun+CxTt0dAvmr
         /P845e6sUPHlITe6rH6hvyj27fk6RLI/PNS8rkXSGVVQ3uQz/0WufN1ir/pWQ/K3tx6V
         mYAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792965109; x=1793569909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZqgNS4Dh7bRrtMBkrqtS1YGYiBq9bbUChB11hsUxU4I=;
        b=ZkxTz9PJsdf1uiaB5yJMoOTaudKGV9yNtCVP0LVZSFG5x0Pg0YuyixX2z/uTjoV7+4
         oguxoxGKkVSxKttRl18Okx2wEgAM6Ei7BJi4K2uAo4zkZDIFQwWRn5ifPcYq0vcXyqyc
         dvURYPfALrEAJracziTMrit9qffGxZfjoYb0t71KiIoJgRGlo7CGl3ioVHeZ7MnsYg9d
         WGWb+qQRleuA+F/hpU1AuNpHvIE2XSI4g8LfAJEMfANELvl5OWw93W//3AlJHsZTpLpI
         b+rlaM1IGQV06N9pvEFgH0unbBtwBirbUcmdUii71axDtvziHe9QCxDrVR37lZ1HfAsN
         7DrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792965109; x=1793569909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqgNS4Dh7bRrtMBkrqtS1YGYiBq9bbUChB11hsUxU4I=;
        b=p7MioTb/X8PKgX1Ocx+LNAUJFLgDFV1HIyLrOpKOHjBicPnL3hNbleFxLXIF28vCE9
         v+bWC49dSPujLGo8KLDDUlc9QnRTXyAN6J3N+56FozVX7owCQ0RO0SBlAdaDe2jGKwqz
         CeMhwleykg6pTT16+fhKivvE1XTrdybO/qwG3C2z0c7n6sQpVsLicpU/UmTznjB+QWA1
         Rvp848yXTE2itJcNGZCOtcQp8Y3bX85j5DzhikO9bDLWHQtlpTVOPNlw00ta8aL6rTFh
         9I7AB6dZbytIhYuD28ojEVVt4vakvgebeJXNB2rh9Jhpca2pyEiVlrB3NIpQ2Fa/KxJ2
         Ektw==
X-Gm-Message-State: AFq9FYI/4CLUr1ObDpAEH2TQDE+DhuwIcU8K2vq/6b84I01+ZF1hwX+9
	LaOXjx2kN/UO0wxI9ypsj6Zh+ta+D5bE/ADU5S2wEk1YQz2NcbdFWrVo/yDUUDMluQst2Z4cZKD
	BPkIF0nCYCllwrB/gLY/T3/3Bl+pTW+en8g==
X-Gm-Gg: AYBFou0uz+jfpYoSWfA19gocC5OYeaMO1TtJa1/y6x9LI/s/EiUhBsTQT3101AY4pD8
	z/347OFNQ9damy98EQfoG6q0/skasH7lrU0NVRx7tvCp1wE3njc0trlFkhoiYH0Y+WEvrrjJ6AW
	3SqC8V2zeRlBsl4H2ZTMvvQi1A18PGQXQKWnneH3o4JX2LoXD3cNsXAVB7rgf8C9qNCo0eFQv6G
	3CHCI7EbfxnY0MNeVDaOIsjkZm5gRDitCQJlaNOMDsNG2zO5oSAfdzVm4yDyG4u+uupq1ZGKXD0
	zJEkK2nlpS/yn2zSp0uWNCdKkZxBR4UEf9k2bo8WfUv7b3X75jqaGsf9s3LCvDr37aKamYHXFpS
	26fLOgy8dEBGfbV5whmxTXo43GqAAOgFgUe3sSfvFFontZeB2laPzNYDTthwiCHNDAIZx97NlFU
	ICSSnJOWd8PtE7rLgjnyC99vd4NjULjYCnHWRVX/G1Xu8c766+0o5s
X-Received: by 2002:a05:651c:154d:b0:3ab:53a5:797e with SMTP id
 38308e7fff4ca-3ac6fd28b3cmr12259851fa.17.1792965109181; Sun, 25 Oct 2026
 14:51:49 -0700 (PDT)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025171857.8ed673bb5900@gmail.com> <fb652fa753ac027924ea6626f23f99da3661d09a.camel@physik.fu-berlin.de>
In-Reply-To: <fb652fa753ac027924ea6626f23f99da3661d09a.camel@physik.fu-berlin.de>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 25 Oct 2026 17:51:36 -0400
X-Gm-Features: AclHuK83f0SLMZUG-6WeQNjYL-U-vYZui36wj9gDzMRGQooYzV8AgsPe63L7X5A
Message-ID: <CAEdQ38FXWTvUNzePLSh+pHbOTEgs_Sbjn5xMus5VvWLc9gepoA@mail.gmail.com>
Subject: Re: alphalinux.org has a wiki again
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 5:23=E2=80=AFPM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Matt,
>
> On Sun, 2026-10-25 at 17:18 -0400, Matt Turner wrote:
> > alphalinux.org has a wiki again: https://alphalinux.org/
>
> Great job, thanks a lot!
>
> > The old MediaWiki install was lost in 2012 when the server died
> > without a backup. The new one runs on DokuWiki, and its content is
> > kept in git at https://github.com/alphalinux/alphalinux.org-wiki-conten=
t
>
> I assume you already checked the Internet Archive (archive.org) for
> anything to recover, haven't you?

Yes, I've collected everything from archive.org of value. The old wiki
had a lot less content than the current one.
