Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793905894;
	b=yWR5yTYwOplFExYIwBiGfmoUrFj3AUvTvvk/hmz/qkCNJp06T0U0LwnOzjCfYuQUktm/
	 Nab26M4Y1IWG7iaX6HV3ktrbTe+JCoHD/en/9kpsXkucSuNM1ovUzkWUHmK1jGspuspVh
	 IlhDBYkEXfVeSDfP0GMrnHkUMbqbLvCS+sHA2D2iruzJ2BhKv3ThrMutgfeUUt2dnMrPE
	 yLwTjCvvCKPIDolzk28Na79Y6lOtMoUZBNJV99aaz0SI0+HAWAIs5n/iZfALuhCdJBETy
	 iLCzdlnDCqkmGou+dYxwrRAMQIMVmBCCCoOYZ+BOVNh2gmdo3S4ic54Ua+WVX5Y0SSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5xfLNd70a9iJW7TLASfq9ztkIr5MXc8aGM+GIXNOZK0=;
	b=UVjSo8zdYQQV4976ROtT1YFoiXji0iNStmF/g+WrpcYbNLOpNIrhH4si9TV7q/jnaOqp
	 y6p1ePlkqo4LWmODbb5BZuh90xIUyodWEWjhr6u5ck0ht0/OdGKw0M3j3rjzzvv5VxFIS
	 69K4beuyp0OqlVssFM0c39Ac9DgDWR4mptRjX0MiTh33P03A+ccBSom9PW2cvDTUwzwRz
	 1xZdbK3e6uE3tqaHd7X3oxP6L2bP18Cf+Mbh5xDrhDPhuvvojpUJlcWWVQbiMqv9LUyy/
	 CrP6Q4mn2uMjn4OUVPs9J5C3Gfa1aTFCSpqwa6a4ZLUGdB6Uq7jGqw1zJ0ELvBJVKZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gguh5mw1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0311C606A326
	for <linux-alpha@vger.kernel.org>; Thu,  5 Nov 2026 19:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0311C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gguh5mw1
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so3689797a12.1
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2026 11:11:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793905892; cv=none;
        d=google.com; s=arc-20260327;
        b=h2u+BStCUrEfY6iHZHVX+M5zJANF7y0+kOMfxLIbcxIrl54QXf4X1ebzimTdvAc9Z3
         QF3aks6VH+oBI9xZmJDguZcYNtnAzpqT/RA+YXdKp1IRzf5+VntCdLhvXFdqeQJJFfz+
         1iApNlW0/ZkU62+W/HzexkAgoz194/cFzr/BNmGttDQXpfsg3C1ArNATneIZ75J5rpnk
         rEKkBa2zY3C48LqPCDHdJrPJraL8YHkd4AFO2mvinEFwiNhkzA4dF4mKkTq1umPl0xW8
         KMPHaZ1B80spyi5ywnVx8bnuoI9yE2CgI1lGnCF+BOBbRxfzZIBEqwkcazy+n3shuW1k
         +F/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5xfLNd70a9iJW7TLASfq9ztkIr5MXc8aGM+GIXNOZK0=;
        fh=dW7fzMT8OHAP4Uf0bg6Br8phoG7N40/ujaCYSieMZmU=;
        b=Q0wLyyyPv3AmMkvXIgNJCKMi5gEcCqLP68ePcrBFonbOCv9f+rvrRYoYyybr8Q+i8i
         JTpinJEdVrExcN+lbKMARRCZT1uGWMZf35hWEhBZuhlqRFFKQ8o4w7kuC3eTnLeX4l+p
         ZQjOIDFUf5StHwMsEneOtkC5vR9sJIK1KxDi6knrmLm2PQ5IJL32fITtmno9/p6Wksuc
         qUH95PYcZ+6SPYC7ohWfuS6pNMI1XH1KOGx72BnKyTIIeyyTWhU6f1HfxwjKHlkcZHhH
         1sKn+zFTvi7aI+D7HfMhwNWDRXjDEDjL5jMbP1r9rlShOgENWotv8fgcvpdtPJQCz4OM
         wPKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793905892; x=1794510692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5xfLNd70a9iJW7TLASfq9ztkIr5MXc8aGM+GIXNOZK0=;
        b=Gguh5mw1KI6YBUsJFzC/Hk6S/1l0z07HBEw6ry59/x0/EYnGs0ARcmd8QeRIpPl7+l
         8+GtqlOVfnZgPU6qCcvm8TS/TrSF6HRjkRlfyeZ7DP9t/gFx/5AsNGKrUqcLLELImjMk
         jQF7OfOFBkOosjPUTcKF5dK/nqlYU/vlWYcWCQanUHsQJc2iFmjI/X5lXxs4Plx44UpS
         DD11gjLzF2dIHd/VA95jSZPWRigF7VX8NUE/7tS9Cx4gCnUUfxKUnWPHFmRRxeBK1lf5
         7wrdOP/98n3ig7v0ix0WPpWzGT94G1alpMDOGNjw66uBhuX7kHTfM1iPmbYkIUhDTKhj
         11sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793905892; x=1794510692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xfLNd70a9iJW7TLASfq9ztkIr5MXc8aGM+GIXNOZK0=;
        b=j3L4i0Zsmdn2YoB7oc9JS3Dqr0KZ0fDTmdwVlFWsF7KCZIR69wf8ZQzxTZhOV0DAfC
         /ms1+y+YE50EQy6hszts6nP3XwpJB1RefyzitOAceM9EJUYvMtCGvfuHVSqIPYeDyloT
         eYzUXqX501ivKc2q6ly4xn+J8r9ZsYDj9h1S1FvJIlQNHu2VE4woaVpKlviiDf7+oZpD
         iVfn85cg6jgRyqVtFwGwMzBzMvAphxUaVzQZVwAbOa5ZujIeBWk4xLdQytcrkehDEPjC
         oXrX/EFeLqQq+NuZutEjEaZOek+o5sikbz7eoUwopXofhG0pK2LMrmu2g1oWS62ODcSk
         v1rw==
X-Forwarded-Encrypted: i=1; AKwUvBxjgsQldDuTp+b6/WpXHQdoWSs+2HFdWgpsyPh+a8HeMY8JdVsXLOVxx+vRSjvyHC23VWvghtljtdIo9g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+OfBu+VUu+vY+BxAgxnMoh98PAgBpEpAZxLAqvTbEUtnaZ0RLd
	6jpWzoRfLcu8S2eAeaXp5S/wZUu6m1huR6wXYpbzpm5tJxFOgNgk1HbtwZ97npu/d5VS/Y/L8PP
	N6R7dzNU5XF3bnRM1exNf86LK+nXnI8M=
X-Gm-Gg: AYBFou293Vnke38KxKjX3UxIX3t4tSOu5baMIEIxZgh5yZ4Qq2+4/L+wruC9nCxvBLh
	jm1Gu4duvWIUOZ5V8csWq56vrYDbpkKAQIWogA4tJeg1RTiRSzgSPHE4+FekusrP9HgG+XJ+hag
	4uEwEfu3ZGGIgTHwKmaPRjrJSS9/YT8IiSd6XyAZx+8fMYWn7RzCfawu8BgqMPH17URkiTRyh4A
	lqzl6LqXrnqB4n+bCL/PJKcudnnX+QzioVn+iKqkbgeFuVVaSdaPVPsLax9nd95hwuOA24a47mA
	kyJF0GvxiUYMTpSAJJKpTP22JMyU9f4LOufFzHjPTziYLUP8lbDWJh/xsZXgp2YNBUO9CMIOStL
	KzVwscg63nDdmalbuVPvTdpZHiy4a09q5u3GvzVPLnFeH90K1FTw3C5be7bT2m0ckzZ7BURC1LY
	+ptvBybES9TFMHU/c1XCkbrw==
X-Received: by 2002:a05:6402:2742:b0:6b5:76be:62e0 with SMTP id
 4fb4d7f45d1cf-6b5977ef792mr143941a12.35.1793905892223; Thu, 05 Nov 2026
 11:11:32 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com> <20261104-alpha-profileme-v6-12-63362e9290a3@gmail.com>
In-Reply-To: <20261104-alpha-profileme-v6-12-63362e9290a3@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 5 Nov 2026 20:11:20 +0100
X-Gm-Features: AclHuK_C_Cie3ArOrjKqlHZt7jfTNl-4Nhbo7AW6B15vErDFBBi4J5x1cuUYTes
Message-ID: <CA+=Fv5SxHnUTDzV0R_E8KdiASOUijsSSgWFwmy=WmAdvUi3iOQ@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] alpha/perf: sample only retired instructions for
 precise events
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

On Wed, Nov 4, 2026 at 7:49=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> ProfileMe samples include instructions killed on a wrong path, which
> show up as hot spots in perf report although they did no work. On an
> EV7 loop with a randomly mispredicted branch, 19% of the samples were
> killed before being mapped and another 48% later.
>
> PEBS and AMD IBS op samples are of retired instructions only, so make
> precise_ip imply the retired filter, unless filters are given. The
> profileme bit still selects every sample. With cycles:p, both kinds of
> killed sample went to 0%.
>
> DTB miss samples, whose instruction is aborted, are then dropped too:
> cycles:p reports DTB hits only, and the misses need cpu/cycles,trapped/p.
>
> The kept samples carry the full period, as do those AMD IBS keeps when
> its swfilt discards others. So in frequency mode the sample rate, and
> the event count perf report estimates from the periods, fall by the
> share of killed instructions: to about a third on that loop.
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/perf_event.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index 32a8b5c98381..7e34eac0ea47 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -837,6 +837,11 @@ static int __hw_perf_event_init(struct perf_event *e=
vent)
>         if (attr->config1 && !profileme)
>                 return -EINVAL;
>         hwc->config =3D attr->config1;
> +       /* As with PEBS, precise samples are of retired instructions. */
> +       if (attr->precise_ip && !attr->config1 &&
> +           !(attr->type =3D=3D PERF_TYPE_RAW &&
> +             (attr->config & ALPHA_PERF_CONFIG_PROFILEME)))
> +               hwc->config =3D ALPHA_PERF_CONFIG1_RETIRED;
>
>         if (attr->type =3D=3D PERF_TYPE_RAW &&
>             (attr->config & ALPHA_PERF_CONFIG_RANDOMIZE)) {
>
> --
> 2.55.0
>

All 77717 instructions:p samples I checked on my ES40 matched the
retired predicate. Using cpu/event=3D2,profileme=3D1/ gave me the
unfiltered view, including the DTB miss samples.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
