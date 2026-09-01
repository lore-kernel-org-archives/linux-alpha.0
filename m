Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708183845DC
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 23:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788304683; cv=pass; b=Cv0uBYL2Wz6bQPGSBoyJhCCxzEmOTwVL8JQn7KedshGH1fZy4ckK6AjbJ3soL741UmLkLxMT4tULsexHZm4WZY+ATrgswZ02O2VpcH3xJOWpdQ5kWkneKBZ3nppOBH4+ve9+6dKL3jTRTfG+2udScH1uS9pyzJZQ6iA3avy4fRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788304683; c=relaxed/simple;
	bh=UyC4TmoiMCI58j6Mo9O0xej2YXLg+tRwPll9c4knmbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UUuF0+zPyxBuB+erBtLPz2DmmE1vfHkD3j1eR2QIEruo0qOTNv+xSVTYTylipwmUBvVQG0InoRqJ3LFHmo5pkCTQ+l8GndWxjaWIAYnt9Vmh3r58J6CmtO2UR/OmcU/WWSxGI3Iyl0m+4z2yEUP3vDa6f6Cwuh8CArVsARKgudg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFREzumn; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFREzumn"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a5f968ada7so876665a12.0
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 16:18:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788304680; cv=none;
        d=google.com; s=arc-20260327;
        b=a4kHAMV6ek3E/VAUt3SYfzNEnQQMhZPeZNRjlsxoaNDRLumWW3AcA13JOAmVIOfyGz
         5jOUwpsviyk2Z/wu6fOHzThxDwEA62NKmcomec9ZWRpjnf9E3s98/D0syPen1rkrGdMX
         5rCQPiYeYpuT0UYOEOsTPtm6m3mtC0QN1zD66kGQIZmkfYtOiqzMvQ6VFd1Y63e6jTyt
         kFOq8EjQ/87D14WT0MmYyEqb+fg+pWxE/90jTD90fGdQHB27X8EfjwvAUxCgek7gaRSN
         vdz7SgCSIHzvwah1CVqGI6z2rtax6oyg73dWH/f6xwZS6OmLH6nP1to3Nyoy5FMMDq9+
         TbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v1NUNpozkrWM9J4tTdSVIJ0LhMAIputYc/5EJgCm5FE=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=sgXhgncm30whMakgbhTqEKv0feF88OVXRe7Jjmq9LnjNaPtuSBR6lX5DLRhipiQOxz
         xeOZ7fEH/O2dKlztB74dQXUcm4zV2tofzZR7IgLTXT2ze7qUAyB73+1Xq0FlX0bxirMr
         7mLb+gUsa0ES27xsoEiTO0C2I3z6XgTyxhYb3VVY29MuxjXVAyfroa4tIqasN4cWXNys
         IPFOdZb9+K7wdFMvxGwx1KldG5qJ6hVzFgidHYeFwDsP8w/icn+Vv1r8MOSYPnkbptRc
         v0n4TYuBAW19lNi+QuyXkzSaBcJikyRwBpwSPR5q+5rbhCGVHFiVHyKYmrBDqwzoAHc/
         Opfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788304680; x=1788909480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1NUNpozkrWM9J4tTdSVIJ0LhMAIputYc/5EJgCm5FE=;
        b=SFREzumncTogcz30kj/2AolpAkBQoj0T906I+BPA0nKYSlurOrTu1q3BwR/HbqFKsV
         0Gdxqrf02kr2qXWC8jwJQZ1OkTIqG7rxZ4xU3MAnXArsXB4HPjDvkWnGXZM1iGzd0Lzo
         bprtS0nl9rhIsM+ZNqB7R+zQh0wHGHYT9Do/JVf9bbhtiw2Wm4PNmA5wekJJZ0EuEMM+
         p9kZL16LcQqZrWTApWqr1JuNE971EwNvtIct4zJSIPQjZIdGbjZl8lw0QsvrGQClKH2Z
         +HRS7Xy20Eu3dbx2jtKClWDneJ8n1doBbknulO9hpM4HqOJW6V3+xfOL10WRPkmRlZPr
         8L7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788304680; x=1788909480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1NUNpozkrWM9J4tTdSVIJ0LhMAIputYc/5EJgCm5FE=;
        b=pr1WhVPmbKudaLZaZxKg7l5/xnZQJKBfb6tQS36DlSNfkIXfWf2xzu3WHbnFFXYRm/
         +LMoBZqQIgQf2JNFq6BqiynwUo3cMMcRBrgUaBxQUOSfnsfnqdweimC0wuQsDZthP0xi
         SlK9hPKdlptgpVpCooHsAgbmG4vBTv85bpum8t0e+XiEqL/dETe/EzrDbNQDTxVtKa7B
         D49Wx61gty/ChcljM4J7Nqg7+zzkDZKjpEberRZsoS2bdsu79kAhGuzaFUsDJWYw384n
         JHLYX8wDbE0OUvPfMd6K/7VN+FwYq1IrEqN+nf6R6WwZVWw4y3mJIA29eOkA2ikUvVwD
         sEWg==
X-Gm-Message-State: AFuF++kXgzMcW8VqB7fhCtDrkTXZDs0HQ14H2929M2lBBaPtZMa4IXcx
	nOx/q+on2BMEH5VZb+HF1E6qt+gOYURK25ODhgAGveWPYaTMwATxebwORzn0lz056stVsoW9kLr
	8DXVmJxKIM7P3H86XPKFmOJed0DIMs3A=
X-Gm-Gg: AYBFou3EpgZSS/d+nvpwzi1TxDoAgzofVB6UMgSkj0EUzVSx31u/+Y98l9iS4SqKCiI
	9tkjGh61pm6K8LYEBNo9i2rO95coxHqp5BW6cBc9dpDsmFT+23Pjxv2tHuA+fLy0OmXK/7EIT3x
	0gNLeUieFiHdhehIQLM4uNTwFBEGeb+CffcxMYhkGdtiZSiuvknl8+Wb4Fwu6JB5iJamcTdO4wY
	ufnW6quqI3g/XBg+5nWb/W0ZUllg+yZ7Nf391+XV+DLNnLqO1nGU7oqYj9tIxnkkymSa12FSP0F
	rUju6ouSCw7xRo/YNJu8l+sNiAltOR/+2u4rbBZdhGoVTnbv+D8sCbDR4XoePfV1MB+BjA2sgP7
	A7hLqkWnNgAEDVPIBvia720xNymRYyNo=
X-Received: by 2002:a05:6402:428e:b0:6a6:32e3:9bb with SMTP id
 4fb4d7f45d1cf-6a685355737mr219693a12.11.1788304680434; Tue, 01 Sep 2026
 16:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <bceafe2ff479886d45eb410d8cd4db0027050bd4.1788277742.git.mattst88@gmail.com>
In-Reply-To: <bceafe2ff479886d45eb410d8cd4db0027050bd4.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 01:17:48 +0200
X-Gm-Features: AcwNN1X_Iv9XjGSFQ8VW6iWQHe9ti3jzAg9aVEBv_Kn7TDfBYPU8baP1_PNzJSM
Message-ID: <CA+=Fv5Sp89A1RMBi_oJ6evVVRdHQ3NmoqJ6=4oq2u1kQsESgjA@mail.gmail.com>
Subject: Re: [PATCH 06/24] alpha: select EDAC_SUPPORT
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The EDAC core builds and works on Alpha; it only needs the architecture
> to declare support.  There is no Alpha memory controller driver yet, but
> the core is what a future driver, or the existing machine check error
> decoding in err_ev6.c and err_ev7.c, would report through.
>
I tested this on an AlphaServer ES40 with CONFIG_RAS=3Dy and
CONFIG_EDAC=3Dy. The kernel built and booted successfully, and the
generic EDAC sysfs hierarchy was created under
/sys/devices/system/edac/mc.

Possibly we could adapt this to have EDAC support, I know it was
mentioned on the list:

https://lore.kernel.org/linux-alpha/20251125224352.32034-1-linmag7@gmail.co=
m/

Either way, this looks good to me,

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
