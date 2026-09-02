Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123B7386C3D
	for <linux-alpha@vger.kernel.org>; Wed,  2 Sep 2026 06:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329841; cv=pass; b=ACAcvh61Gapz8hYrXHGzUodS7PqtcnyeMOGqtgBYOD8+ZrOxlJzEF6zWODzs62ZxJU0rWVYTIDkhrSXRCnuEhtfQQofGl4B/LQC9sNPTFFolTD9H7UTSkOVK19aA81kBBc9B/YHfHCFZKjFHvjb+RIbzIU6sRGdHfvejK7gkN/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329841; c=relaxed/simple;
	bh=0j3td7v5wxG8neXJQDCf2nWFgrTb+LYj2ojmXpsmKeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fg5pO6cItzFeQJPOk0uz1qtAmVAxoOX7yBxor0dr/harJXP1vfPtzQ7KMxxVSugYcih3hr0gR7QNODB2L+VreUJoj6Ja2/RgFCaJbB464RptMCp2mYcsZ+6lHaYXh2KcYiwZ0ENeeYCUl+HsPOB0EkyMhT3p8vGZQKgDKQy1gik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/Q/Ctz6; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/Q/Ctz6"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so1027345a12.3
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 23:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788329838; cv=none;
        d=google.com; s=arc-20260327;
        b=CPuKrqBPAgaQyPpnZ09lehYwa38c/s7m4wORsgmiI8LgastD8p5bjTmgm72blq4e3b
         vRbeEUH1U3/MMFM8x0Ts+tNRz4XHwEi5ej/tihRTZgBv/5wECRkwiCxklBo/u0+VlcMD
         uDrN1iBGAzUWe5VxGjVcZVax+o2euWio9LgiCS3MKBL0Hq/gOF4LrgUjFWpLQvvVGTBP
         d4zplkGLXsmjlL5jA4KA5alGSAmtraL2XYgcN1iDXWzsflmcusYIFXjQ/I+39ph0TEzD
         Z6LjJOU9Whh6IL8c+J7+fH9Kp+J6PI8F5+Eyu4pg2FJHXwEuFiNwdgnT9brqa/0JDRYM
         UArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0j3td7v5wxG8neXJQDCf2nWFgrTb+LYj2ojmXpsmKeE=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=JA2+NfXwQljUElhCf7NGNEAeYCw3S7NvAsY0FBwVUufN2OBcx6Sa9BI+SGaIY5YxWp
         VMivufRolMfjt9/wxcv1GjZsDCSaCH0FkMKiiOBnHP/SEnrDMcGHPRkNnNRnsSgr8Y5f
         f5k49ojxfIcJUWb1M8bV2M8Ai5NBAAA2QRVp9QqaKLpYbuy4MQbsEqnP8dfX0Gf1NqhI
         uyMyGIX7ABZTyPwoCFjDxPIJM99a1uLoYKt8NUmlbnizZkJCz8c+TTh/oMpy0mky/mz8
         vkmPzL0Z+lqJIvSfdRYghXcFsyFP9XVDSxqjUSl7YIu+bUroioQni+ilTCbuVZntzBCw
         QJ9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788329838; x=1788934638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0j3td7v5wxG8neXJQDCf2nWFgrTb+LYj2ojmXpsmKeE=;
        b=D/Q/Ctz6poVKiOIWjOL9kyluA0opf43BI3EGxQI/jSoOYyxNhdITVsdcpWWE59XzHS
         83QUkgo5n9Ew/jVvkkHkDlcGZeEmQd40NabyO+Yozswdnk7NOFq3vTXZdDAFqzEmRJPR
         gHwZcxA1JI0iSAo4g1HgqmNUeIFjs1p3HLT9d0z0bYKohrtWXsQeCT2vKPVJuaNMooZ6
         BPIeDche9FVqGv59d9b60qZqSzJiPhThFv3uPP53PzFnzt3mvemA9+ez9QpIWtUsKZeN
         pGvWg133ygjvW1BXUbZJH09tv2UwYb9aEfHLlgHzfxPjliWwxyqOWRiGk897aZzCcjB1
         Is+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329838; x=1788934638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0j3td7v5wxG8neXJQDCf2nWFgrTb+LYj2ojmXpsmKeE=;
        b=AmI1YGWZyjeXwKyF8jH92q3/8C6NXiv0k+PF5GfcO32xZdkJ/e9g8Ob21GU0fHrs7+
         3mG5jVRDWjP48HmWy7zoR7zFW5/FVCl43nImba9FDzRuwRBlAuemZ7UZJpN62x3zh88W
         MsUl8T2gGzOMB//KmcS/psDqAllt8S7lOXTcH3+rqkWMJWVbQLmn/ARaDNeqdSrC5rI2
         Vgj2J+LBl1TVVHbSwRJWNyZdgLFN9mf9og5lXKUd8x7mH2ZAOhZgddqrMiWwoVnFYtcq
         JoQmfgzlVDtmKDnKL0X7azjnVV9w4MwEpcctWY+9FqArT4Ly+SNGD+pzUwTe1MKg0w8L
         fCZw==
X-Gm-Message-State: AFuF++mG2lTMhwcMgmzh+IqbNji/JjlWMkxnJ7aC6phE7AETuNdpVTdJ
	dnEi9STEw1z3hCYK1nNufg+NIAZQodQseK2nfjg9nQ6I+BFsg/qN1cA/Sl4UrPv3euIz/zrojBs
	goCOKOoYxr3okMDWUJ4v6AAECpUk61bw=
X-Gm-Gg: AYBFou09LYV0wY5+ZwFOoOfZWi40ADTgToXoyu1K14GqAwS5LTZcCH2jPR6KIh5C9Pf
	UswzRUg4ZLxaWUkIH0+iupJgUgNLJITqvDz8gc5q3vs/SALiO4gEvIY9KFlJ6vGAJhJ15JCYpco
	DmMVrRFdOvWirYXyrPAYvvFY0ZeS5iybQCoIrN3lL0wJfv7g4XMKHD4wphD9sgD5MzPzUuNmyx9
	0SEUZZge2wmCBNaue02SWLVNqHYgtgFQKXHnnz81ELzIQT3tWLFPSROoGQ1bLjlBtoSUAcueKhE
	k0JIQkzvn8KxQnSKgm8lOStW0yhbA0JaXaJI1iZgDP5+8LNKNl6yOgXGS2w4MTMoMziDunKKM/O
	KB4D7aVUBVMx1eCi3/N4UDqypnuDV+wo=
X-Received: by 2002:a05:6402:448d:b0:6a6:37a3:2b0f with SMTP id
 4fb4d7f45d1cf-6a68316aa76mr1514950a12.8.1788329838070; Tue, 01 Sep 2026
 23:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <bb81b54cdc536e3ae12b27b477d1299bacea9577.1788277742.git.mattst88@gmail.com>
In-Reply-To: <bb81b54cdc536e3ae12b27b477d1299bacea9577.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 08:17:06 +0200
X-Gm-Features: AcwNN1Xg-WyM-tYp_hd4EfI05lmCaEjRGIsdt2nb8QdlyNFL9Xm9i8YisuChGTk
Message-ID: <CA+=Fv5SKm_4htOVPhFASQLzf0VYsj2_K2GWz4_=LNWWbHQdhng@mail.gmail.com>
Subject: Re: [PATCH 07/24] alpha: select ARCH_SUPPORTS_ATOMIC_RMW
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Alpha has native LL/SC instructions (LDL_L/STL_C, LDQ_L/STQ_C) that
> provide atomic read-modify-write capability, and already selects
> ARCH_HAVE_NMI_SAFE_CMPXCHG.
>
> Selecting ARCH_SUPPORTS_ATOMIC_RMW enables MUTEX_SPIN_ON_OWNER and
> RWSEM_SPIN_ON_OWNER on SMP, allowing optimistic spinning on contended
> locks rather than immediately sleeping.
>

I tested this on an AlphaServer ES40 with four CPUs and
CONFIG_PROVE_LOCKING=3Dy, CONFIG_DEBUG_MUTEXES=3Dy, and
CONFIG_DEBUG_RWSEMS=3Dy.

Both the mutex_lock and rwsem_lock locktorture tests completed
successfully under contention across all four CPUs.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Regards,
Magnus
