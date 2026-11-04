Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793818468;
	b=iZtrkXMSJsKagL90VaxhgFdWGcg8aIvPK6mLCcxAGwmqZo3/LW+jiQkpDgYt6+uhx2Xl
	 9f39JUJyVYU8YBkEtHPMSBjG2s99kH+D0OvFPNhsgruB2VazRnKpDk0cJGnhxIJHtWZki
	 gFyC+3n6K88ZeDeXyFP3FizjY1KkwCy3K7VgYM/pelskVOwg4J3bICIOpj/LXzZZueQq1
	 e1h1KEadiSrIl9lsEk69VbyKIYvyj1Rr7+5k8jx8bZxsOxbD6jeFbPdWBTX9qA03WuLEk
	 WdUQuo1GrJzlwzQ7Gb/v+Z89bH8OJvXfViyEWA4aRr9sBGxbtfxtfwC/rS2IRSsOj5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+uQ0/+i7Rib4A9xdMc9HRUVG1zZvttqJsRXd/p7RWSU=;
	b=QQiIwYrf9JimRXGCiRpKyWfGtYNqb9r/1WhGCkH/lXnuN1kQjhKoor3zF5ZgWKm2F7pJ
	 3wwlVasz3chCT5yGG5XrU2LyRHbQdYOW+34EhiuJYXXWBN2dLE+pvvujCH24b5dA/uoEb
	 dlGT7ey3NAu+Byqew/Mn81IyEyHJm/kMdF0QhrcBM4HTY/kXwRyr/4XwrA7dyE6CjssTZ
	 XuUhZkG+zdihZEcrygOthnyxmdjP9mlq1AnyaxPj786pGTyXdOJUOlOSHAdEeSn89FFqz
	 RjiaiUHvg7wKugKq0jHp7gTkd4cdHgzhXKHJhn3N//HqJGhGPh5JrXLb6jno64oQYVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gacQa9/v";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC6E6082BC0
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 18:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BC6E6082BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gacQa9/v
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so9409361fa.3
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 10:54:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793818467; cv=none;
        d=google.com; s=arc-20260327;
        b=W2Rf6Vwdt82WFcZmJglfjSdaRH7T5+NVX//TaxEFWTlYkB1Amu35swoIgkHo40GIdn
         Fdzcu9ZnXeS0AamaACYaoHuCYsl6rumQF3//sXl51PHeqg/wruni56S683aeMMR1EVAq
         2eLzFlSZGmU+kNTyFBs4Ahm7Hr+ZG5jCkk+aBkP8DB0stguVimw5CpERj6t5dnTehftA
         7LWdZ6hugMO/a5PUSkqaDBI8We+3ISEIHDBWhsTDEDQ2Dszv3u1ERAEbuuwx4n4jrnPv
         DULjgjFKzq/XmrNyKGuCooUKC6L/1qwifJu9pay0zyUWiCpUghvP2k2qv2HqUii+BZHd
         r4Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+uQ0/+i7Rib4A9xdMc9HRUVG1zZvttqJsRXd/p7RWSU=;
        fh=S72IE3gFTmEmRfjd3qfSZTdiOW4bRkLghxhfnu3yXxQ=;
        b=aqkpTZfszM5+SCUbNVob+fq5c2io9WE8lnj0Eya6TJlXv6FlYMws79VKMjJ+08VRIT
         dKq+d12CbuGsjI4lY3pXLr+p5fhHxYbZOFzvYNB6+QGJrJuWSyEhYDJaBa61xLkDmvl8
         Ll/sLJtRLXcoAQx/VMNFlcBscWM+KC/ZzxyuRbciYdaSYxLPDTjtyfuPNzg6uv95LVUF
         UEPbifeYtZAXLfaQHZnlbMk9UOTTdrfSdDLxiUTCpvPSrYO53BRzyIPxCUUKK02zBlMd
         xKRGZjPw4ugP3ox+b5Fqozf9sinEwz+QkaZWhSdCCQPQAaXdZfSWhl4Yfwh506tQMs+C
         XFfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818467; x=1794423267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+uQ0/+i7Rib4A9xdMc9HRUVG1zZvttqJsRXd/p7RWSU=;
        b=gacQa9/v1244DuV3ul3QkghxUOJZc5CCfhqJ0JmuY6OAdKOmEY7KWaW/X1IfSJF7H0
         wowY/q5HyT0D6fMiots80HQrC5oU1FZUTwRiURYehYYtfNuszMNqiD3aTAvmk3xA3Ruu
         nWCqUmqbfu4NVIgCPkoXT0awJEk2AJyCCwep9d+AFalK0q0xz/FcGz557N3qvw2/i6qB
         fIQOWMaYvyxTl3PL2fSERaiW4D+cd2Uzx/Oe/laZh/zHkbWmJ+RN79xGwTbMy2LqO/xm
         HWzQwf555u3GkfTEmBMnOfEQ/3SaW8/z2bYxqgp4pcp5bRvwN+Jv4yjWtFWqcBdsg+/A
         /pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818467; x=1794423267;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uQ0/+i7Rib4A9xdMc9HRUVG1zZvttqJsRXd/p7RWSU=;
        b=v6gdXyERX+zoUbkHV9uocQ8a1VNqGInzo7lhjrJOqHfYOlvnvDwa8MkD/cPta6mpVk
         O3IrKJXEkeVfcpEBBkUuogLPIk760PCUvMcbEotDYLGeHLIHqwK2GfLcxZTUfpXrdV2m
         pgGNstctBTuLYbxNYebjVazjtmT3FrHWZKQfs8ZVYM3/AMVonC6fWVbGJOwVSDP8VX+h
         Sbpzf3L+EykLf1VoJTZhrmMn6Lvd+//89XpzGGmFBSljq69X7zX5SL5pW9IK753XX9y0
         7u9gTWiZO3u0kqvEvddnY+9e8XhlVjZ7myrYcWC6VOXvuN7xr6gh9eB8b+Cc1+rjp10O
         UqdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIWg5Oz02eLCRw9AJYvAvWFVhs4ueXPdwFGqVa095edIjK2odS4KeMyitsI8wNvkvAubghzrKSzC3qXA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/L6chzaSD6GclWgG3qdfzj5pAWEbgBdD99CV6y/dHajjo+6/HF
	CJhwNzzExXnqfkspPwQlNMLGnnFW8Zx/bgxmu+KjitjiGZ+89rIYkqDlZTOt0jnYsJatKY+ppHB
	dKG4s0U/gjYr2fJzo8bzZlp3p4SPADK4=
X-Gm-Gg: AYBFou3GyZsxLD3iQlNsCcNpCHNCa3+JS2u7+J17dnxFILtzuazAPYYeq4e29Bp8Y2n
	vJBsW6V7PEBGN7bhuywmTZvxTk1JJuWDSW7fumSPM8j0uYDn6qMlhghPn2f/4GR0544kTHmy7iM
	0TZFZACCxSEzfETRy+FO1e/780JvmJoWZZyJ4jevnuHmBvC6V++Dgf8k9XnDklkprI9gICb6AGp
	BnCxGH78lIQIgWDH/mXVgaSZvJ6Isb9gpxrKT3lHODl/gZ3J+1zz/Lftr0n5UHqEhdjHQgEYluD
	AN4nrqxDvilpRDv5JWWlssN+NxSD0nwIq+JK1bVGJLfKk2DAGpSTozXm+Qf+595DXMTPzq7kFQE
	LDRstaYgMC4ZkAZIbhy1KJ8cu2GdEWPM5r3J4yEQKJQoHWKj8EFuGcqWzAKdXGswLLJYsBI3vzT
	HpapccMBTvuqR3VaBTnIqdcueDyKCZ0hV4nvG+PPjJ49ql+CnnwHVA
X-Received: by 2002:a05:651c:150a:b0:3a9:8167:62a with SMTP id
 38308e7fff4ca-3acb7b6498emr46627851fa.28.1793818466526; Wed, 04 Nov 2026
 10:54:26 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
 <CAP-5=fVtMnaoF1JbVFJuiRqPx-2izJafs=+ov6eF_PYFE9Xrxg@mail.gmail.com> <CA+=Fv5SO2NF6834Dq9pV5tdLrECnV4-1oNPJnD38+Or9u54eLg@mail.gmail.com>
In-Reply-To: <CA+=Fv5SO2NF6834Dq9pV5tdLrECnV4-1oNPJnD38+Or9u54eLg@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 4 Nov 2026 13:54:14 -0500
X-Gm-Features: AclHuK8nm3ftnjmYgdiV6kBSrHAe3PMoyReSVVB67Kenr_T0JJtD2lmIa1lZRcs
Message-ID: <CAEdQ38FNa-7ELRuDN_N+Kw3eQ0oQ9WWQ==fFULKc50Bx4nCWdA@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] alpha/perf: add ProfileMe sampling
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Ian Rogers <irogers@google.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 4:02=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com> =
wrote:
> One detail on the wrap check: alpha_perf_event_update() also advances
> prev_count on an ordinary read. Should we cover the case where a read
> has already accounted for a real wrap before its PMI is delivered?

Yes, v6 handles it. When alpha_perf_event_update() sees a negative
delta it adds the period and sets a flag in hwc->flags. If the flag is
set when the interrupt arrives, the handler adds nothing but still
takes the sample and rearms. Writing the counter clears the flag.

> On prefetches, the EV67 HRM, section 2.6 (p. 2-23), says loads to
> R31/F31 may generate exceptions that PALcode must dismiss. So seeing
> no Linux fault wouldn't by itself tell us the access hit in the DTB.

Right. I didn't go by faults. ProfileMe's I_STAT has the trap type, and
on the EV7 a load into $31 that misses the DTB shows the DTB miss trap,
same as a normal load. So the prefetch samples are split into misses
and hits the same way, and reported as PERF_MEM_OP_PFETCH.

> I also checked the saved ES40 recordings: 344 of 266425 samples had
> both PM_KILLED_BM and TRP set, and 53 of those also had MIS set.
> That confirms the Python decoder needs the killed check on EV67 too.

Thanks, good to have that on EV67 as well. Tools v4 ignores TRP and MIS
for killed instructions in both the script and the C decoder.

v6 adds the wrap check as a new patch 5, which shifts the ProfileMe
patch and everything after it up by one, and most of those changed.
There's also a new last patch from Ian's follow-up that lets ProfileMe
events take exclude_user and exclude_kernel, so perf record works
without root at perf_event_paranoid 2. I'd appreciate another run on
the ES40 when you have time.
