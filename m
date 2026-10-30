Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793332816;
	b=lZm/lvv/GsydJErgkzJCm5gtTjvNivulBY0XFS3sv6S3+/YctpBSNKm1aG1lSfakOoPp
	 mVo50kLdb455AQ8aY5LLyrEfJMrjkdK5TmEZWUINyPMpgYR2ddSvU69T9611b/DLtWL3c
	 TlVU1Y6uRaRCmq53GZsFRWlFwsVCKfl4nVBKy1eOlLIxXh3RCKQfT1zV9vket8ygdi6xH
	 zwjTM6NGR3YuvPtJ79dhCRAGPhAkdvrc1Hc0XwVlSmVU28MWvIKGab3GOI+ZCSOaMpECG
	 3SuedBgjF4ovCynKsuu5nsVxRkPdc+RyBqJ1+eg9WAZvbRhghykhcrS1VQuLCWmFUVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793332816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w+nM/vAkuCP/V6D3oVU+Bkna7/XRYF0/nbbL7krfSm4=;
	b=ybSWkJpqjPkii7eVnBNL+E1VeHaexgwGJHShzyKlEeD0e45D3IHLuxTri4vyejesvYMx
	 m6ct61KfK3pR6o+2rMflmjYIK0tqrVlX3HzIuIo6YvYsw1cjY9D8hwW7DjV1oBHCi5M5V
	 z6gN2WeUFxPsuBUbmpNY072CoK6h6CJZ7ymb2RYM1098ARbiLAjyiOE2WnDMUMI3fELoX
	 lZv7HgZEW6MiwsaoaFKmck/tDkk3SYyPYWq2jYqhPLASAvDMXMIdoMKyrYcGzNc8SjaQ2
	 lvOxpOWz6zGfu1GhqPB+Vq9TpxgKjP43Ge+4TzDY4hFcbhgCSnRhjMxOwKOTFDyj/xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Epqzn++T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555C6606A31E
	for <linux-alpha@vger.kernel.org>; Fri, 30 Oct 2026 04:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 555C6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Epqzn++T
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab28f3e4dcso11680341fa.0
        for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2026 21:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793332814; cv=none;
        d=google.com; s=arc-20260327;
        b=Ikoy98ED2OyQoeYq2fjBKfWrVcy8J8oh4tVtnO1e6ydpKpLaSfsGf8akwhFPyn3CZ0
         6SlG8bBgvPpfmmE0H2xyKgB+Y+sGAiko4FTTmHYdKcBbq61qgwea8MiqQihCotH9nznU
         0bp0VUoUiAhFZyF/fqgPu74pq8SdUyOGHJanaYKIUJISaVv3EzJSmZXwKVV0DZ0nlKtw
         4zk1oHBJtiqrLeSXiBnd3HHzeox4Th4xndgNoCwpk+eXYToXOAVBhDEElLpjfb0PXPtE
         faytQLIJb2FN2nwtwG6FR9pYcqSBIQvyDi/EBzaEasMvgcDy0UGLvsYpxmzTrI/ckX5Z
         3kVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w+nM/vAkuCP/V6D3oVU+Bkna7/XRYF0/nbbL7krfSm4=;
        fh=93332Vu/sBf+P9lc2PEmXOgQdNRYzKC5OGTED8feu8U=;
        b=BALKD2ANrQiRs252MzSHc+ceAuQSQXbprDUQSBX/kY0YChzqsYNbsRhDxI6Lfsxth7
         cNmQhk6CrTfb7rBfbOenJ9QKnptdV36vPEEoqK668tuuF6Tvtc89U6simAtDpWJE6enZ
         2JVwidqEQCxRDwaCjwKvto+rOO2+M7BLl1N3FMJdMuu9iC91Nye9oIplDPOOdclg3Iuf
         RGeWH1r94pY6qO9F/0cLylb0v8B+xWCsfvzC+c7U3Qlk0I08KdzQXzGNx5u/6KJbSibK
         UKR0Mu3wjiyPjczA5S62tne0TfzG0XJe+ah1bS1wVaaVYveMfdoufDHn5kc17weqPaN5
         NSlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793332814; x=1793937614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w+nM/vAkuCP/V6D3oVU+Bkna7/XRYF0/nbbL7krfSm4=;
        b=Epqzn++T3ThHlw+p2SQJa62uo0Fu2kGBJpXoBicTYzqSdjSehXr1hZjLptWfjIiXJR
         pJUpUbU4BuEYZm38r0Rw2O4P/EvFduucyYU6TAsyUqtAEiZNP8FI6XujHB+4HA7Gva8J
         0ytOjdd2fQOkdFHaly+iuSq6qh7BnZ3LszMKs61zPfs1e//5PKcBH96VCAf9QKdMhSSL
         ZU9BkOHmvzEd9p2R3kyxcQtWW7Wk+34ySlELX+gmgKH+Ug7cj+hk4nUSd9/3xI00DsW7
         anYJqlX/RjNQdU2NrUFalbMYh2Pa+kT/+EAKIbcHfuQLyvbk4FaG7F9S04mUAUIaClta
         MOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793332814; x=1793937614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+nM/vAkuCP/V6D3oVU+Bkna7/XRYF0/nbbL7krfSm4=;
        b=za+qll0oUxYdvqW7zqcx3F5OSqdDGI2KfjSxMUBoLapZU9ra28MFCZgpnBA2gyPW+6
         uyLpGnGAL1QUrfdyuaTDhO7FzlQE7yXk+TuNG8clj2A5dct2eZn4mX731it7AJhqQ1Il
         xFFcs0aC+xlYCBt1QFqXHUMY4rVA6+Xo+1E/g+4GquxMKOrXhWbS6yXPL8LOISQBrveX
         W/pVaXJg/IWG7jtlSGK3x2qNIFVoOe9o1uBoey6naOXkTqul49ww+XeqD0KQ14dXvqY8
         1hDvQuZFaRCW0xMNTzJty5MveDyMSMFPsQ2H7Wo32+Tv23s52LaKMkCOGPo9Y3WZgALb
         1m0Q==
X-Forwarded-Encrypted: i=1; AKwUvBy6jstFrER/+arrW79PTUlwyWJkrFO9FPwEB1la35vQaAy5/X0j8b1rcDEuAEQP7fZVT7dk64L/1ZiRXA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIHKcG6SjME8yl6s4EuFn3iqAiwmmrb/9HH7tfmxOoLalLodUi8
	g1h9l6zrIuIl5CH1yXaiZefAcW5YO1Xq5SzEPccruvREcp/DN1vxgZaHXUHkuopfqmWjvN8Tqyl
	g574GsKXm4WBKsVOPhgT3wFk7danfHOM=
X-Gm-Gg: AYBFou2+iXNRmAxoM8bP2P93TdmAddpabGgYFPsVvX4BsVA2zXdh1oqti95HqAhL3zJ
	k0tMyP8H04vyqnur6DdBsT7uWSifAUgNnGV44vWrw6Dj6ba3eKxBskVL7SOKV/3eRdNKOO5W+A9
	tVNwIFDYzFxnz6CYqBL05L9JcEnDxRqr6mxkIQojpmVMC7Pc+pkkHR/CkWIIy3raOja4SjEcerw
	LWfrf8oAIzpEMHzP0jZ+M1gT+bqiSvy5ll4Aw62hz/sCWN8P+BO0OM337r0QGwNW7lp1trZgQ+K
	6piEo12aVS2vB1G2ogK/yzjsT2C0OjHVB+5K8CLmyPYotVRn9TixhSTspJptQjKveR7WLLmTtIa
	Gbz9RoOLUb15KwZhX7S/cmOQfXuhflglC5hxxmlckflAgzcxTPXUy9uN5/XzqL0r7k3yIteItz3
	tGCAPy5/KZkQWvqLugtcDfdg24hmRcjGaFL4QDR2etKL0hYXDWWFqm
X-Received: by 2002:a2e:bc26:0:b0:3ab:13e6:c351 with SMTP id
 38308e7fff4ca-3acb7966d6fmr1569531fa.2.1793332814462; Thu, 29 Oct 2026
 21:00:14 -0700 (PDT)
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
 <20261028-alpha-profileme-v1-5-d44b52bf2500@gmail.com> <CA+=Fv5S5S3o1=2LetFuLQNqjtuw0DTgxVWAYAiAVvsdUNgNEyQ@mail.gmail.com>
In-Reply-To: <CA+=Fv5S5S3o1=2LetFuLQNqjtuw0DTgxVWAYAiAVvsdUNgNEyQ@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 30 Oct 2026 00:00:02 -0400
X-Gm-Features: AclHuK_oJ3s5RUCirMOkhYNov1PNLqWTliY-wAZYDiCbHMWHZpexW4vczKNrsL0
Message-ID: <CAEdQ38EwMT2a09rZMcJDmots55b6bcX0-ARWfb1sC7w7n3VkRg@mail.gmail.com>
Subject: Re: [PATCH 5/5] alpha/perf: optionally randomize the ProfileMe
 sampling interval
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

On Thu, Oct 29, 2026 at 11:02=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com=
> wrote:
> One minor corner case? This  multiplication can overflow for very
> large  sample periods. I guess normal sampling periods are not
> affected, is it worth using overflow-safe multiply/shift to avoid this
> limitation?

Yes, it overflows once the period reaches 2^35. Unlikely, but perf
allows it. v2 uses mul_u64_u32_shr(), and saturates the sum with
check_add_overflow() as well.
