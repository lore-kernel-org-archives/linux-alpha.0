Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793332771;
	b=3CY3ccIdA5CGqMKeyOjcdSN5UUHdRrnl3OFxNTyXZyuzJz4nA/YEDpt64gizOdE635RL
	 o+qi+TRcS6BmdOZiIn4s9GzLtfe7cMtwdu1+TuP7WG17ECBPkFJKoTvQlYMLmvE9OPp0i
	 YOUKyUSN6Fyo94k5OKPp12teGgTXmjA9vOUzearozNm3y9F8Ar0afotA2RIdb5MUZ1+PE
	 0N6nWreH0y4X14VKGdJR699R/AHpd42sy+kwiGpfzU7urQbGVFoLloiIJjKHGaBp1zEMT
	 CaRmux6c2tnSTrcigKwXNt3Ag7mNiJ8tYxS1gpp0jyDuvh6ltXGFZUZHk76tGJJFjGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793332771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FOT2v3eFb29HN7FW8NdCrAqVBUnxkiOGyHwF4K+pcrc=;
	b=aj2DlpR1DMNOXdc6ClkHrt613+2oit5HNICabVl19v8kf5RG8caYuyOIp89iP1hpCKMm
	 ZeAYGhYCFOlNxemYqoKZYIK/T2OEIdYEN76c8oSKpN6Pp/WOEa2sx2lL5x8yOJe7Sad1T
	 AA0OIUzpCUbn6ZzhKKf+Z25pL/vqqpfVJgE8XXiTBkGJlpB89EbzzucRs+GVLEVHSn4XC
	 4UrB8NIe4FoEeoZGFkIbrSILMwlmqYCsAeZlNxa2qeTnx6Vy4LPoW3y2euKdDG5iQpMKn
	 e0rzKfpOGOmrY+2lnTt4SAJD1b+OlX4Q+TS9HjBSnwE7+ESjzjCRv4FowkQrNnbNbig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kOm4/A9u";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A540606A31A
	for <linux-alpha@vger.kernel.org>; Fri, 30 Oct 2026 03:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A540606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kOm4/A9u
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso2986121fa.0
        for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2026 20:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793332764; cv=none;
        d=google.com; s=arc-20260327;
        b=amSH4nixqlxLzmxgaRMjnJS+9v8ELpZTJH8fwEDOs5ijPrekRQXhz4EKjgs3bRclxI
         jW0yU5G52wcm1Ah8rbHbMfhwebR+6zw75ejIEXjSgT7plMINwqw1jpevsHZHwDO/Y9Qo
         +1X5kdvDsrxCSTlKTQJjLSqcVfsdzwrmOXWbL1TCx/2w6okh79yvTmIEtUM2SU9AjKng
         1jATeZ7baiKjuBhptdVG2jYn1ajwUNS3QjC0MRcx4eazic8mLoWvh4oRi87t+2oBUgAx
         ePtTXCZHHmdpPH22Am7o5d6K8UB0pG2HUr1y9ZnCaTDg4WPrmnkVg5FzkZif5YXJJK8P
         J15A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FOT2v3eFb29HN7FW8NdCrAqVBUnxkiOGyHwF4K+pcrc=;
        fh=6x9WEDPEp6v6GhyQLQURAExZfHixqM7tRVERhPIrMZw=;
        b=oeJy4PZJXOc7CrJk77jgB/rr5N5xuboAtgXDaEPoRIwNiT5UgaoeeKwXVgvZ1uHAc2
         rXkIPA+q9ELA8rqyxFnDNWzcpO7c8ztFLi08Bzb8xg52GyZGis6RuUWe/n0CvQPb1Ggu
         urDRXPvcBG3R5U2PivkSJBmlohmtMPMZ3eZ+iUeyDNNJhV3UgiZc9gdVwXYmo7mBlPGg
         xAW746FBwIVr4NFqsSfpJLCNuSvTpaZ0vJUr8pnetR0iXWobQjHW8pI3W/Omgs8Hz+2v
         a1WUJvj5+2OtnO4c/Ic8GdROXrjWN2ZL5bjfxiSlBJxt6X0G/G21LnJZWPHCykG9lPqB
         3koA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793332764; x=1793937564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FOT2v3eFb29HN7FW8NdCrAqVBUnxkiOGyHwF4K+pcrc=;
        b=kOm4/A9uYwuoxIElIPkqOL6pDbf17izln7xJORCwomxPzYzFRAjWGx6dz/pFDFMKvs
         XvgdHHpsG0mYL7sSAfudM1W+DTArUE1vd9/NVrpfOrDCIcKqecx8mAsX3+6ZUbD5DD54
         rOFOTaCkgCxwj2UgQQUjJNrqYho2ZY+KF0u/coLUSvBD/UAcsoceiJWqJWzf2sFL/lm2
         ZpBCebJYk9z+LhJbF+A8uOr5ltcjX3SFjAZI3vBDkHeOzbRWYIHO+5WH3EMyWHfa1lDL
         stl+QLqZGL8MlL6UPoQoMq/ZiuTkHu3dkvq+RLU3vckc+l35nZZ9dWOJsZfQAv2+Mw6v
         Q0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793332764; x=1793937564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FOT2v3eFb29HN7FW8NdCrAqVBUnxkiOGyHwF4K+pcrc=;
        b=C6Ir2zxObPCCN149DqDW5cKGifysOg7LjFnv1Xy4H/CIl5Ilhw+tzD8lNVSwsfyJSc
         RhFgFr7fCu6gTnemGazBN1O1yVcc9MJfqdPBtCi4kaUT4wCVnsIrpabrnTTJirujYZmV
         tzpthUUel42o/+uocWceGtGGipt+6R9a8ohJgguh1pVlipv1c/3M4P5ST8qmea5HzBb7
         vaTwMgiNtjtc4bRyuYKTrDPBnQdvcdiGNiWGYJ3qztSfg5giyD150Vv1jgpzSq/ZWiDT
         wzIrCDlr45SBYsgJYLe+Jy0ttJ003uyEIJD96FXnO2j3AYZpkVP/K1z88xcbLv3QWRLl
         TMSw==
X-Forwarded-Encrypted: i=1; AKwUvBzrHYLXzGQaRfPmXSyu+HFcTaFdRSIxe/PzlkO03Z/G/zgnz820PkBSvCHw64dlXvi+K2VirllAsJZ/Ow==@vger.kernel.org
X-Gm-Message-State: AFq9FYLaDLYBOWavt9lgjYQ5uv2nWlQQB9AiEcpReV89Z/lBvi04l0Z9
	GtlWfh3UGv3Ee7PS2gAHFB/TymdaRaikuov51LYlSKGV0yTTZJBlmQigJCCwm0R2dGaUT3m7e16
	ZKJA0Cm1YW3nqd0IsJAWwq00O6kHF/yc=
X-Gm-Gg: AYBFou2jTCxIjiW63TEI9nKW6Rgfji/dI2+qnX8DnFXoXlJceN5sNvl0Xgdl9n+LoGh
	2GfLH/sVO6DweqXnnEdB+VHtsbvRWvd7dgtlj4Tel3oySiOtF9eutZPAwADGXuywcXRG7RI7EDM
	bWuslJEpFpb/02Zo7lzFjcq/g6iEPtBxerTEpZUXevOcGBbl7k86B6Dg14ontjpFtv3LXJby8CY
	+RDOWHMjydsFVfq3z/BZKadMjS7IzKVNmzUOsVLhUSnIOapxX6dHupR2guJsPLLdPEgQu4zY4ZX
	5QC7cFZnpDg/Dy+3PSmgcMQ+YQeBTYQFwfnI/bdkyTJwPUa2earAffZ8elBRq6v+vLlfefocVRK
	J/mwZeRteQ/8mHlTWtgUUsOUppKoU58A34mwKVuWmuyfhW0e4qH5GBGoa8P4WLl6ldStjrsNezc
	R2RPH6+4z8dRN+uVO+eTPgXI/MMoNVP8BuwNInKLmac9AN73M5kFJd
X-Received: by 2002:a05:651c:1508:b0:3ac:416c:721b with SMTP id
 38308e7fff4ca-3acb7a98329mr1607061fa.10.1793332763639; Thu, 29 Oct 2026
 20:59:23 -0700 (PDT)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com>
 <20261028-alpha-profileme-v1-3-d44b52bf2500@gmail.com> <CA+=Fv5QZhtB646nAvoMzbc5O+EdFOnZhXyRrv_1Q-LGWKfbrEQ@mail.gmail.com>
In-Reply-To: <CA+=Fv5QZhtB646nAvoMzbc5O+EdFOnZhXyRrv_1Q-LGWKfbrEQ@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 29 Oct 2026 23:59:11 -0400
X-Gm-Features: AclHuK90bCzCpBH3kCewscdgnWin1k9-jXiMf8ZZ82e4TOlEtXb6Mcvjq0xGsE0
Message-ID: <CAEdQ38H0sdgPHOi=iDrHWjzsF4GNJgVUt4GxbZ3O5YwpPc3zJw@mail.gmail.com>
Subject: Re: [PATCH 3/5] alpha/perf: implement ProfileMe sampling
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 11:18=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com=
> wrote:
> > +       pm_regs =3D *regs;
>
> On Alpha, perf_reg_value(SP) derives kernel SP from regs + 1.
> I think passing this copy therefore reports an address past the local cop=
y,
> rather than past the original interrupt frame.

[...]

> If PMPC is in userspace but the interrupt arrived in kernel mode,
> this also makes perf_sample_regs_user() select the copied kernel
> registers as user registers, bypassing perf_get_regs_user().

[...]

> Could we preserve the original frame for register/stack capture
> and supply the profiled IP and mode separately?

Right on both counts. sashiko caught the same thing, and v2 drops the
copy. perf core takes the sample IP and mode from regs
(perf_instruction_pointer() and perf_misc_flags()), so there is no way
to pass them separately. Instead v2 sets the PC and mode bit in a real
frame for the overflow call and restores them afterwards:

- interrupt taken in the instruction's mode: regs
- user instruction, interrupt taken in the kernel: task_pt_regs(current)
- kernel instruction, interrupt taken after the return to user mode: a
  per-CPU pt_regs holding only the PC, since the kernel state is gone.
  It is not on the stack, so perf_reg_value() reports no SP for it, and
  the user frame is left alone for perf_get_regs_user().

So SP comes from the right frame, and a user sample gets the real user
frame.
