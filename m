Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793295525;
	b=ehn7VSOIG3HRL1n1C8m3k1lfikdsbpT03ziae7mEggurJ8mbfUII55gjv9Waax0GA2UF
	 NfWkIiyIGuwTQZU7wJWU89ACtD9USz6ETinpNHM1yWi2yOzdgbvo1uvj490FQ7f77IANV
	 AOnAX7MVFZxx/Gqw8qgVCBZhWpiEK9M+sL40GkXEviNJMvGNhMKo+seOiHx53yR7fwyFM
	 kgCLNrbBa8Rpn6wMvmW4WpzVJbaWzUtrV+12CMlSq8k6OVAC3j87kYYRGhPBYY+ZK1EXL
	 SlwlSLMm5StUO/WlGeVRcPNEMwnxtEJCQJ/37+azZ8Me50gxfmE4HorzwU6rJCtxCTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Jnb2ggFy/68cuPuLhBQIr9m8EgIXZTngDYovAtQO7jc=;
	b=y9tQqaDVf3OOnYxw0xb0XFgndGqhHIfZRV9Cx3zJKQqEofADH+MSZzeDaFQ7y2Ik70yb
	 ofiDsyu1yD8Dvfyyh4B3l4vTOk7OZovSdAMKL7qJSbqu/7+E6fqRp43KiuzqqH31TiIZc
	 gim6+S7RzuHYSQzwJnqbP71wP9wFM33++s3CyWD8kZKbgjKaByLxOHQe/peJhG2vXXdSX
	 eZukPjNABa7Q15Wd3zy4xlSD4n9YzDeYRum3g4RWA2KgXddkRD0xcLd04hJshdhdUtdV/
	 ATrZRLR4F5A9I3nalNgi8U6LtuId8BsMChOj7VBDuaxJRR3oeEgrAK0IAPPQ5qV4seA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WdOK/Nmn";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13CF606A31D
	for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2026 17:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E13CF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WdOK/Nmn
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c40e30c26a4so212874166b.0
        for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2026 10:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793295523; cv=none;
        d=google.com; s=arc-20260327;
        b=MKUgYh07CONiayWk+c7q6aXG7rSiN97by6UEvLUUi1HVZmnskre1AhRe4Zra5O4wF8
         8QpvlTDrvlIOHmQoXPjyf2vPgESCBpatVvd4TYCpedFrpN/uJu8jFioFAZvnBNUXDGpk
         8X+vuKRP+v7M9ZZ07zvFcl8lAaag0Ip6ipJSR8lXYxh6BfR8Y49tE1zoJI3L9M86YMqO
         4TP33k1DGs39dHOxoqpTxWw9sJzOna988OH4iDPrCnfTTIdPJfhSRf+DTfwzUAYxdKH3
         SL8R2pPgcTrwjtccOPcGAH2ZEt8vMdfAXDq1s0mUR34GW1MjiMEzGm2OH88L1m2giIjo
         Jk1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jnb2ggFy/68cuPuLhBQIr9m8EgIXZTngDYovAtQO7jc=;
        fh=HeFkZooaIcvbYcRwrRaQsmAL3af2882hVdhwMq6BDw8=;
        b=h68WTave38UkJSwqzRPsmfXTIZrVvprLSYRyyhamVLx2t7e/ILqb+tTfSRF/wVXm5S
         eB+mYRWAt0hVuKZ+25i5JkIw5eyuAWMvI/Za+CsEr/1UKfAT0IkAhMLlrssVfom2GrQw
         cXTCdZcGgfT/9gemN5YxfurMLRsTsUe7CTwlt+hk1QIMPV7IAU8VnKKQx5Qzx5aTL5pF
         +yXIRlCScN3JhQ1HcdUvySEIZLQumS7EgLSqTy1g8jRTAaPXqTzKrfTDjGP5PNqSvIyV
         GMzaf11Lz6/+66oKPnyiSBP93YJONlxtbwq08UVsJS0tMiScr/yyV9L52XLKy6gUPu8R
         klMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793295523; x=1793900323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jnb2ggFy/68cuPuLhBQIr9m8EgIXZTngDYovAtQO7jc=;
        b=WdOK/NmnJj+0TX8YV8z1q/DKcXpxJQbfndklH5sBCCZuKZZkbRxchJkx3BGXfHQwEb
         DfNN7ahPHVpaGDCk+IdV+0yyCfm+HfbrkHuzDB0Fw3+jfFh0qKBRiEWWf75WrAAtkqeP
         f5KFxYFeqd1WGB/MQ46ddbDg6FGFHpWB91irCwQfFiim+dOMQTG4BKBI+xYsKwBDKOW1
         3NNofkg4yKoEiCQ33IC+d8JpnAi5vs1v7Foca1Liog7Lc7f2B/vRKWsJoh3Ttz5U7Qe4
         EHkh768OqJwGj3M0KwrRp/7JalebOMV6sdVb8MkYmw/2YYj3dCAh0EbaOW0rsCcXenS4
         TOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295523; x=1793900323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jnb2ggFy/68cuPuLhBQIr9m8EgIXZTngDYovAtQO7jc=;
        b=P7WcJ9v6tQt+63sOX9GczoZ8B4GP6+vpNoLF5vedeoSH55cUv1PKakjrQDfHpDRtlA
         pJk6Yb9xf4aaeS/nnIgUtWBIiaOkG3WhP/72TlSPtaB36EaMle2KnGL+kz91M0vOaysX
         6MGT1ov/PG9zYamzXZMWYAGXgChbBMcy93LSSQUTK/sfrAH4S+AIt1KcjtyBdDkP8XiU
         2ZJzu/trsq6Gv3bBliyhX7JOeWRmQCnmlbxyEq4nfsPu/p29DgRGk5gwSRN4tp45W/bh
         Q7VmZSXNEXnB5OmU/nrQJisNTMaO41xJCkEd0p3Ssoa/K0vNnw+TXSJsznuddvQ0RSy3
         MHwg==
X-Forwarded-Encrypted: i=1; AKwUvBwYIhBDPwJdiJ9XuUqSvZ2E/78jY148XdMB32lA5nc5ijYQ1b7cl+5EM6VyE/pOsIR/VnZPVIoheamKSQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIYd/t072h72whZ5dDg9ZtkqjvKaqCp3dFTt+61+u9r2KnXS85b
	PWvZhvaCuu2XtHawR+fJoPqvrQ2oI3EHp/OlMT8OKjBuxCk67XHh7NX8YI7N90Xw0D/JnAJVVk4
	JXqo/+GcuU8e1WmbD0fSs3iP8BHOxDeU=
X-Gm-Gg: AYBFou2xQru8BuL+MPkQyqQr8rswJ1cCMByBcuZF5rrSSeuJNrtv12XEMGdtkUAiL10
	0Q7+NXbc9tWePkm/EbSiM7UL5k1wir4jZO82zLgxoFrjpBmvkmuBFnKcb7nlccpm6MN6vDSgRLX
	dk16UoXgVlTb/uf6w/SJaEnX3z+OitNEGYlG3x/0HXZ0ulqq7eWviaB9zGp+Uh/wVkW/k79LAgQ
	stCDk6QOIM83FnVQA9T0xG+xdcxiDutJG9969N9J+lhgUDnzIoebpGQSHMHePzunMiRDNx0Mf1n
	WL0OOiLg+zEIsHsKIYWjKZJB3VmdF+xHTAEQyEQuoXiTE9uBq/5CxQ18sojjDaAQDpqTyaJE6Ok
	RnCYKcCG7mGwfWzjR7vDdyN+GQCwtw56fhp/h25JtWR4EUMbGf9yabWgNEkeDUkT9tUPE
X-Received: by 2002:a17:907:3e19:b0:c48:a838:c17e with SMTP id
 a640c23a62f3a-c49d1307e11mr311139066b.14.1793295522951; Thu, 29 Oct 2026
 10:38:42 -0700 (PDT)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com> <20261028-alpha-profileme-v1-1-d44b52bf2500@gmail.com>
In-Reply-To: <20261028-alpha-profileme-v1-1-d44b52bf2500@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 29 Oct 2026 18:38:31 +0100
X-Gm-Features: AclHuK-SY1_Xa-c9wgWP3q7LRAU1TLOJcpcznXRsfIIxmsCY3IoLxSzQH8m4NoQ
Message-ID: <CA+=Fv5TsDjMcd8+ZPPAXWzw-ox5yhvYJqiCBUfj-6Jm0Lxf9aA@mail.gmail.com>
Subject: Re: [PATCH 1/5] alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the
 logging options call
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Wed, Oct 28, 2026 at 7:09=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> alpha_pmu_enable() passes EV67_PCTR_MODE_AGGREGATE to
> PERFMON_CMD_LOGGING_OPTIONS. That constant is the counting mode bit for
> PCTR_CTL, which belongs in the PERFMON_CMD_DESIRED_EVENTS argument. The
> logging options call takes a flag in bit 0 where 0 means "count all
> processes". It works only because EV67_PCTR_MODE_AGGREGATE happens to be
> 0.
>
> Add a name for that argument and pass it instead. No functional change.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/wrperfmon.h | 2 ++
>  arch/alpha/kernel/perf_event.c     | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/include/asm/wrperfmon.h b/arch/alpha/include/asm/=
wrperfmon.h
> index c97b82a1f7db..1fa9bc813263 100644
> --- a/arch/alpha/include/asm/wrperfmon.h
> +++ b/arch/alpha/include/asm/wrperfmon.h
> @@ -23,6 +23,8 @@
>  #define PERFMON_CMD_I_STAT 8
>  #define PERFMON_CMD_PMPC 9
>
> +/* PERFMON_CMD_LOGGING_OPTIONS arguments */
> +#define PERFMON_CMD_LOGGING_ALL 0

The Alpha Architecture Reference Manual, Table E-18 (page E-24),
describes bit 0 as:

  "set =3D log all processes"
  "clear =3D log only selected processes"

That appears opposite to the changelog's description of zero as
"count all processes". Is the manual incorrect for the PALcode
implementation we use?

This preserves the existing value, so there is no functional change,
but a short explanation would help reconcile the name and changelog
with the manual.


>
>  /* EV5/EV56/PCA56 Counters */
>  #define EV5_PCTR_0 (1UL<<0)
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index a3eaab094ece..2d9383425357 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -728,7 +728,7 @@ static void alpha_pmu_enable(struct pmu *pmu)
>                 maybe_change_configuration(cpuc);
>
>                 /* Start counting the desired events. */
> -               wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, EV67_PCTR_MODE_AGG=
REGATE);
> +               wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, PERFMON_CMD_LOGGIN=
G_ALL);
>                 wrperfmon(PERFMON_CMD_DESIRED_EVENTS, cpuc->config);
>                 wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
>         }
>
> --
> 2.55.0
>


WIll test this all later on my ES40

Magnus
