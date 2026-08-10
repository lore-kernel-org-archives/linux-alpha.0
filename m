Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7997081A
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 06:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786342570; cv=pass; b=Zn1SLNVm9IU44SL/68L2Ed4BJibCrKCdeNLR+/QxvJbNdx4cF2JXbon5qsYHJRU9mM4upmgAEnURyxo/SjNyyH2LgN6psm+gNWNyuo9QUabzY6G5+UJb+NoSIWvgBV3umqIGq00O36D8FgC63P3hZy7yyz9/QkNBy61jacgzsgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786342570; c=relaxed/simple;
	bh=wXFX7iGatwEhQDvJx2Fjd4ulnEve4bDwC/G5yoT7fvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qcd8Xq3SIk0kvS+g9l86JTPW4caKN9tXueV/6K+X+bHfqxfVnZNIp4x/egxfNSoMYVam0qm6YiMGOnwJovrGYVyAetSvLPxr13rBCMjSTWqZ0+q21R+flMKEMpZcw9DKz24RaQoz5xblWGc2hQ8sA3e7FvRzvDGaPZLMXL3To4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jtz9VN1e; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jtz9VN1e"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso6011505a12.0
        for <linux-alpha@vger.kernel.org>; Sun, 09 Aug 2026 23:16:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786342567; cv=none;
        d=google.com; s=arc-20260327;
        b=RQF+NpUC/mRCovbYKgKi857TyFO+AezyTB/GRPVysbbVJQ1aV6qwmhgfNt/+ojLGtK
         9DtldIB1xXhkcik33WH1PBq5efvIYRVv5cqwWB8yedRt1ADAgI4/eEvlwOOKzBHoDPhF
         bq3SrZG+7GcdHM/hFUMhoS/XHkhYEcSNWrbj78tMfeLL8syC+p18OvcvlXdx1nJuxg9d
         2aZMyDb8XXSPwHvmXu/6rfnzhZRCHk3h6zL+6aCjSCjykZtsaTmldMeYsJQX9bwzNI61
         J3/EeXV4WkcoK8leKXh8kkw/ZswEzHy8K2t/Lu/nes6esaQHI59DDcQalOfXg1gAa10R
         HmzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wXFX7iGatwEhQDvJx2Fjd4ulnEve4bDwC/G5yoT7fvA=;
        fh=UsxT9vAnm01jSIQpeyovccjG75aVT5YsXqAefAC6948=;
        b=bJMAZpIutGT8LxY3UfJpQoMLgUsXg+PjHhNUf2Y7a3mlo7wSeIx9hO+m/JiCT8aYvW
         sotq5VZqI53EL4D8xqj1x7dB8W9ny0oIqcjNjklHQVjLv8aQR0unCUfpzoPUDqTo+srs
         MzAjO4LjtQWOSdYzWGB14U52cn/BY9IechvKAoR3rU+3IvKVPynPQz6Bfgw3RXkYsgtY
         uSUglesrB6ze5iwB/1g7ua7tsnTU8FsM3YKbjW87iOsi9/BG1fQj4IV+u1VnQ7p/Tk2a
         6HyynYAf8bv8X1maPQ/7hEySvcRze0ycOLtDSrdVrtIkXU5bowUFdamDB8BGViEQHQHJ
         2HMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786342567; x=1786947367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wXFX7iGatwEhQDvJx2Fjd4ulnEve4bDwC/G5yoT7fvA=;
        b=Jtz9VN1e8uZ/wbAECdVZqb7GwFLjwPWFHPCcdmzUeJ1XSloWUtQJMQ9k3UyR2w/3ZT
         b6w6s2HePUuudsbcGUfc2XyJyJacrL8dIb9Gqomr+/rBdyGZ1wwaUHIV4mzxjsMCt5Q8
         xsyXXpefifmZ+mFBaKmB/bfFsKkVK0D8YuAyFDFOxRR01AW+AEyVS/oYRXaf+MFEJCOo
         WYmjkKJ2UygVjvCBNSsRBkpXqc+Jw0y+VDxNCKB7jXY6W9vQPzpKX4gnUp5m6Mr+huuj
         A6QupWFDgTY5JqWHqT/dtqEi7YdIyC7Gw/4vliFrmF3GxUPBZ44s9e+TTND0JTOvBGGu
         /pQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786342567; x=1786947367;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXFX7iGatwEhQDvJx2Fjd4ulnEve4bDwC/G5yoT7fvA=;
        b=qdLiaP83AGhkbaNMO9EM2g/YRaWeQOLbVyI3lhcP7iLx8af6faBzyXPWDBzBYVH36N
         FyxJZ9tsRb91Xnaze5/zTGXAIPNneWTJOMdozFkuTryfWIrkPY1HkWmGujlSl2xdbGl/
         9+N6bNorUkEf6tQfAkP0YE/rOtYmyxBQ1yv0XnuyDv/RtA3A2KpEWAf7mlqxo4+Hspas
         TbSht8575WWdsje1gt4EJ0SzXo6MMkj69IFfwD8nhq/t//gIc3QRLOPbZPiX64EMM1aQ
         S6kNW9GnISif6p/ppUfBlzI6lHCxpeIZx7mNdholnhPBoqD4lGvCT786LLZOWq9IkHR9
         5J1A==
X-Forwarded-Encrypted: i=1; AHgh+RqmiYzhhf64XUxQLLgDBv3Pu0Ej7KtiAblnwYRLqSfI3SOGn34b6nOBesORB634PeSIswZLHm9BTWS15A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5TGMRgP4GhfQUer7t2T4KKRrRQHfmGQKSq+Too9mozENTcr5l
	X6tifWQy9eSElfED11uHbX3CoZx88Nx7zWNl7qA0uyEomCOLO3YBIusJEzlDO6ImYAVqnmNyEhk
	rs58J55f2UpN6bNzwWXsQzh76MRPR7KM=
X-Gm-Gg: AR+sD10Yv3EPQdTu2b7ZQB/DDpthiAnrqsLdtVND6QIwdT1SgNnkOTs49ST+aS6Yjj3
	zJnI485n8d69wbLQrXjovkWUDyfDoynHrxUN+rNZcm6t2LN49OwbzO9BOFObrRquF7ymx6BqEKF
	JB3KDXFiY3yWovdZVwjSlW4djbY2cYcW06sLkjgcC9YXB1/rz7D1MZeZF+XB541MU2G+/JluI/v
	ELC6Oz04e6u9gGjf2qrFQ9XjTS/GcpkvyTgb9FmGDOERdDFNxJ2PFA6fo5WVJve3/gmb83wYX54
	8B6ibsjv/wRI9Q5Y6d3SgzkfCcnBxMkGfPpDadHuLKZvRZwLFpg2R6IcEGqZ0sJeORJEheFLUvz
	aUhxcILcctN4oaMqZMFKyJifEDlaTcBRByDIJsUhoEg==
X-Received: by 2002:a05:6402:3252:b0:6a1:6da8:a8d1 with SMTP id
 4fb4d7f45d1cf-6a1f4da49ffmr6508633a12.2.1786342567559; Sun, 09 Aug 2026
 23:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809085208.3262799-1-linmag7@gmail.com> <20260809085208.3262799-2-linmag7@gmail.com>
 <CAEdQ38EHDfxJVsSOorF30TCsZAoCG1D==Bv6Z0Mz0uyNvRPftQ@mail.gmail.com> <CAEdQ38E8SieeGYY1GcR6c6vaZM6wWfz2ZZxW=oc-8m29UHXsgA@mail.gmail.com>
In-Reply-To: <CAEdQ38E8SieeGYY1GcR6c6vaZM6wWfz2ZZxW=oc-8m29UHXsgA@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 10 Aug 2026 08:15:56 +0200
X-Gm-Features: AUfX_mzZU3CG4lW21Hlk0YZLJ0mgza3fYIo-41WwPLCKB9ufzraAzpnJjAcY5Lk
Message-ID: <CA+=Fv5Quu0kXAt1jNO60GoU=Y7ex9FuJR3OAXdp6n6Fqwd0-Ag@mail.gmail.com>
Subject: Re: [PATCH 1/6] alpha: run check_mmu_context() from finish_arch_post_lock_switch()
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de, mcree@orcon.net.nz, 
	ink@unseen.parts, macro@orcam.me.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 4:40=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:

> > arch/alpha/include/asm/switch_to.h:12 calls it, then finish_task_switch=
() calls
> > the new hook a few lines later. Between them the rq lock is held and IR=
Qs are
> > off (finish_lock_switch() =E2=86=92 raw_spin_rq_unlock_irq), so no shoo=
tdown IPI can
> > land in that window.
> >
> > I think we should drop it from switch_to.h?
>

Thanks Matt, agreed. I=E2=80=99ll drop the now-redundant check_mmu_context(=
) from
switch_to() and let finish_arch_post_lock_switch() handle it.

> Another thing. Pre-existing issue, I believe:
>
> preemptible() is true in kthread_use_mm(), so the hook does nothing,
> and ev5_switch_mm()'s asn_lock =3D 1 stays set on that CPU until the
> next real switch_to.
>
> Benign, but patch 2 depends on this. patch 2's own commit message says
> current->mm can be true with the mm's context not loaded
> (kthread_use_mm), and the only thing saving that case is the leaked
> asn_lock forcing asn_locked() =E2=86=92 flush_tlb_other(). Should probabl=
y
> document that in one of these patches.

Good point, thanks. I=E2=80=99ll document in the commit message that kthrea=
d_use_mm()
can leave asn_lock set until the next real switch, and that the later
TLB handling
relies on this.

Magnus
