Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793738176;
	b=EoNqOEVcSGFuYZSraKajC8LHV7+c6W/8AWa6nVyD/8vp1/Fcc7EV5Z3u7t8VFKZKQCHe
	 1KdXFuDgyy9CRN5BXNWQhVgyqxLGPexULMU0osMjI3ADy2r7uktoPtq2siZm5EXGmMIYo
	 YczPI0UKhRWgeb7JxwOyq0HgL4esnPKD9N3dtJ7Mo5hwnT2xVy804ZR2Edlh/RbuNbVLd
	 Sx8uyKGrxk8NkYpnyWxYXScAXNIcJ3ckd7EVhugZrGLfem29dxWuVXqgxIglLRhu9Ycrj
	 GqgOBzmgesrdI+LeKV65MQFznx+a9fTHCLctEGUAdGB3e+SZo/eM9YC2JWb+LPaYf7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xQ4+oRgLtbqlKeiqs+JELHHN3xsV9CKXX0CLSPpUZjo=;
	b=OvYLt+Ro/Js3uWYoJJ2qfcsjuPs39fd+E5dWXt1R3xs+Sj6hh6u605ZEKeilU6g+mZZX
	 SZFwARxpu6C01cE9ES2fM6U14T+GfZOpLc5cz6odvBy24oh0oSiUsKXb13nvOt3aZQDZd
	 4Jy78HTLdseKsUueDNP32K0NMyLJc30k1XExmV8GxWtVOKLhLp1bB2YtKZWWonOotU9nq
	 p4P5uqJV/EldzvekT3vBT3Ef0ORBtq96krRwYJ0hr75CD2BEdoffao/W+WOSe2MBM0x3N
	 ffSQhHKTP6VbCLOS6xkU3I04JMEdZBVZOCCiHyEaSMrl2L3EkGVcUwKTVE1R0yo0gqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bf9JONb3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1E8606A324
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 20:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A1E8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bf9JONb3
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso408521fa.0
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 12:36:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793738175; cv=none;
        d=google.com; s=arc-20260327;
        b=CxKJ6PXynZDOUgRh1YEpbO5JvMo5u+3asyxzJgVNUI8bVr1Eclp/qCHNN/LkJ5Cv9p
         1mPQXN7ELk9hrGLnjkNYqjPocLAKOsAxaOKttfwVrU3eD0ym+lbAmb3LKYmYBWm9kkN6
         cQw7zNpSB2tiKMvo83dLciQ0hAb7LqtqyH6bFFOvn7WrzCWP0FkR6+hcf2P0i+Lz7V49
         YawT7Of80mWfWMfRPnrpYtMlZQ9XQhn+19ZlgiYQIbzI576RqzapRd3R7+I/z9+SBF4V
         jTv+uIonHopPFDMMT9x3ELoor3O5RBJFYj48I5Cn46TP4/VQuXi8O7pgupz2wV/tfD+Z
         xjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xQ4+oRgLtbqlKeiqs+JELHHN3xsV9CKXX0CLSPpUZjo=;
        fh=acSpPAIRQz0v0aBTB9hzD7qXSuMYSZCOaTthWTY7j8M=;
        b=NXE3Ij/GtFw9V0FUzQbI4hYwC9OsSekwuTzDTkWl3+OTrYEbClF8Gz55w57uNOKBVD
         wsqxRmfpWILqoe0t+Kd32YotJgi/tvG1qTjV3fiaInrneFOlmTE2KndB9fR3tOkuiFI1
         XWjWG9X0WGYNlYx86t3piyfHzxqykhE0cVsn8Bp0tEyBQLZorE0IV8c09W2i2ftHL4p+
         tWjMi6oC/EK1ptO68Sh+igXs0NPkEYzklQFqfiHtIobtRtsJFrzgR0FcuadjAyyBTWDq
         2UHzEhsk+yrBYZRI7FhL1jtQ70xxNE2/eh+dl487+woSEfXABzdnEcQkpB9Gp1bFDZTi
         t07A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738175; x=1794342975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQ4+oRgLtbqlKeiqs+JELHHN3xsV9CKXX0CLSPpUZjo=;
        b=Bf9JONb3tnHnffKYegeTecqFiyDWbdgWPTHUTayiSdHMFN5ahHLEdrlOc4Ka2yqU16
         r0wPdQz5WWPa2G8gHOqWH8WQAr8mDq1kdwkoPYPNgpyUTKN0ONz51fv/I+1MVfySyxip
         tC3LkYQD2rm+4thrZvujp/3VARnFED+6alYiLfHH1AlxX2CrBTURgD8BuzlE30WHqMks
         3jpHP549hG6Q/+M9EffK4JCNFIsFomDb+6hivIi/Kl9BWD3Tw/6FKwk/0A6TvPGE9HlW
         Dn4vT0JDBF7X158LdSpAemHTLXG1PUX0fanexjTn54/EW+UTS3TP74uiomxJHa2uLc2T
         mdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738175; x=1794342975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQ4+oRgLtbqlKeiqs+JELHHN3xsV9CKXX0CLSPpUZjo=;
        b=pgR8JrD5iKvm45Z+3NQiX2y8joDZKUmZNHYqJM93uYg0/VbvFZh2ZZmXGe10Ba/tzG
         mK+TJHFrKKMRyP2e1mR9XHjsMwZRrZUhLnxy2FMm1EqkDeHNXEQiyibUVUQGteMZYG1z
         1lM327L72NS8EYT/DpBQXajqgHLpnGLLraXKp8aT6GLXY6LgHG50ISVgrgLmnqGCoyLq
         yzsz1LYwYIHZ7qWZdAfYt/jAk6D+eW1f43hKI31LvcN+kloSYUqfxCo6qLyT349l52n+
         QEVeFPnYzZEgm8MqG12piZRH89uEhVmrlP8LNW9SwZDg0a1b03+tJpgIO3C6WSMTcdon
         hNUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJQ8JnK/NYgp02T512z9nYnWOdQSkUcAs98MY3tplKPJVDxphaqHo4P8OcMa8WeUsJKtE+DiiHE0iPnA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Uv4aMAwOMPuZSZXEg9E5pdFy4nX/t9TIcLDqKi5LcV4bfDxMD
	yBEeP5FICR4W7/E7FNqk0lJ9AffPxHeAxwmpdmRM6qUbKlWIZOoFdrwlfo+OGqRkwvZPId6oQM3
	es+BqG885FauZkrObIR/1EbwbahZCQWw=
X-Gm-Gg: AYBFou2InH0u7vgQGdUFqjzOGiLC7W6uVaqt76YsEY8hc0GmGpAO5lp+VzAowXnGlGX
	i/C1oRMX0QJ+XTlSWDwpEjU5B2nkdh5XZwPJzS7bENINzXPldGRdq5h7J3xAKW5racL0+mxmWZZ
	CbTl1Gqdc7IaByE3nBAqYUTqGvnHp2Js0GM1f3vdSA/s2jgJppauRtWpLrtuomvDw6X9Y59rr6E
	+s7hIqu9k/GHP97rDOexXCes0zgZj4xd1BnArmvwf352ABrF6Rdh2/0gpCyRUW0JYT3mJgnejAV
	AEILitFlly/nRV6093pF1Bl7VCyVs8lD1hMqfM3uUn5zH5jdxMzUXODqJMdEP0U4xKA9lMspCnv
	okZtl5fDMKzq+frmHpp3h+ktn/BvIjErgltBB5Z5DegGDqKJP6DOwg9R9is00loV3ICoTwUPF5W
	w2zf5WzOhLQq8QOwOxYlnUq3YRfkEMVLF33sR7B3X39SWnlJh1Rj5A
X-Received: by 2002:a2e:8a88:0:b0:3ac:4ce6:8b73 with SMTP id
 38308e7fff4ca-3acb7acf227mr31681581fa.22.1793738174621; Tue, 03 Nov 2026
 12:36:14 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com>
 <20261102-alpha-profileme-v4-5-61e00f5e1da8@gmail.com> <CA+=Fv5RgTNGzApgq-YcPZ6u_My9-c8T6xMjb-_yuQRV5C53T7Q@mail.gmail.com>
In-Reply-To: <CA+=Fv5RgTNGzApgq-YcPZ6u_My9-c8T6xMjb-_yuQRV5C53T7Q@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 3 Nov 2026 15:36:02 -0500
X-Gm-Features: AclHuK9vlMkzNd2fjRaApLlEuj1lZIne7iaoIdNdKx6zdWRN1ZXEG5eUPUtd56E
Message-ID: <CAEdQ38Gd4sDEtbUqSoy3QsFeQb46Bg3CZRzmPiGFLbSqLpxG+g@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] alpha/perf: implement ProfileMe sampling
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

On Tue, Nov 3, 2026 at 2:41=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com> =
wrote:
> One remaining question, should we accept precise_ip=3D3? For a PAL-mode
> PMPC we report the interrupted PC, which can differ from the profiled
> instruction. Should we reject level 3, or skip those fallback samples
> when level 3 is requested? What do you think?

Good catch. I think rejecting it is right. Level 3 means "must have 0
skid", and we can't promise that while the PALmode samples, and a user
PMPC in a kernel thread, keep the interrupted PC. Dropping those samples
at level 3 would hide ITB misses and redirects completely, which seems
worse than having a little skid on a few samples.

AMD IBS refuses precise_ip > 2 for the same reason (its fallback when the
RIP is invalid looks just like ours), and perf's :P falls back to 2 on
its own. So cycles:P and perf record's default event still get ProfileMe.
On my ES47, cycles:ppp now fails and cycles:P records with precise_ip 2.

v5 refuses it with -EOPNOTSUPP.

Thanks,
Matt
