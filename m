Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793830293;
	b=AbBA80a6xWTU3LoG0IyqGU1N9x9gPyJTl7KCzLMxz1gk1X4sY41eFFSMnETvX/BEEtH4
	 Om+RjVQOmyZyr/4RYQcUWN8NslnXyeractQCpLls9pz+UrVXWgdv8vaVcCdD9PefwasgV
	 //CoTLf1LwnmWQT0fhKq68ksdmQ/yS2Awf8RjuPDmDOtPa/5DBCxM24Fpi/r4u1VBcZ53
	 8Rd05MG1QHDx3mNXXUvCF//TTtBbcIYjQHyWHPAQb+5fbnxEV0iknsjCOHbmXkTnoCYyI
	 vzdoU9TqIp5zj7cpkDEBsmUbGarIgs9+YiVC+IEDPD13m8wtyXVTwhSZCtomaxmeXUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EGlBiCE9y1aipHpdTJ2cp7Guo9/hRSALY5Dt5GVDzPI=;
	b=WEmnB91xH708RYJGDW1DCXF+QGfAiYYmcJhh+Rvz+ISx6FIGsWn/yXjFFmzJqqmQcRc+
	 qq7hEIv6mU0o86T5H84LY7fUnMwcskhslfKvf0c7mwVx6W7AYx+y2/zaW5xJr9My9gL1n
	 gb9fwgkFK9XapVDEes6U/lTUat++5E030spdkKHKg8xjDECoDMCjCXrTZasfWVG+j1Sh1
	 RVUrM48YVcrI+J1P445klXh5+em57+o6lI0wKkRcXCy9j+gabWjs8onJp/CJqYTQyjBFR
	 p71kQ2c/VHpBpjm7aWl/NLU7QRSeNMm+pEEz9bP/JQNj8JtMWHkBXq8BKuEkJtPvmiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uBBDdSja;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A016606A33C
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 22:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A016606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uBBDdSja
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so1925422a12.1
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 14:11:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793830292; cv=none;
        d=google.com; s=arc-20260327;
        b=jR8uS4ZKk1JZrjlKH9kV8WP+m2OtvIvJrWx+Zq28dtGnpY4HPxfSOp/N9BHzHusRBL
         z78w1FNsTnJRJJQHmdjMjg5BnLillUrBYtoLjt2XzD9cxYkls8EjP/4TzfeHDg1E870a
         RgwLaj2eHgTrl1RQz9PSz64ob4edcSoRVCo6p5KUnShtAFA0qSIf27/bPIKqfPgY5nP0
         +W/pTL2sZOfHBhaRXPW3ZEsVw2m4ozHV1VX28JfqOnsYefap8C4mIX8a1+pfT13Xtzcd
         vld3qTe91sCwxHfYT2kcvcZODzDKB+/DddzRvhnqbjP+a53kQdpEC5CmJKfoYrhIlsn8
         Jv/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EGlBiCE9y1aipHpdTJ2cp7Guo9/hRSALY5Dt5GVDzPI=;
        fh=bE2graI+CjpVvHQTr8s7L2/HOU54R8S3AqzPRJNThjU=;
        b=NLGaSWsriv1hvn+jgBSLU/hWzLIr8CWQchBWQZPIs43BEhRCdHcYg6ABLZ0RkYm2DH
         YYfPEX935ox6fuJAcbKqMsYVqIgf4UtgfV/vZBtORSjpVcmHxrnsLW5+JCDkWjbyqey/
         pHRA57yqLCr2Sp4V0eCgDZ+BLPMUSBOVv5hIF07w/AiAljnm1fygd0826YYb+mR9YH8+
         6cZL2DY6s04Eg8gzAlLEmd1AIVQT2ZesaZDu7qvSHq9AGJVn1YwdKqwEwlobSEfboPGo
         PkdPMqfL6Qv25nHp3FQJk8TycrUuKnDN6QeMZm92QodPP3MFN8cH6NvjkpMAD7V0M20t
         yChg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793830292; x=1794435092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EGlBiCE9y1aipHpdTJ2cp7Guo9/hRSALY5Dt5GVDzPI=;
        b=uBBDdSja+STCfVqALRK7rclaXxEKAivtHrRY6liSZxvT4tW2UPkEnpTCB9YUAZHAyy
         yh6jK4sh5jG18piBsbOxg5fyHPXBvpFlczChcjTBd0m0dPn+vMeBIZYJ/4Jwu8mpGUma
         0diqU+KkvF94+LJBH3k6F1qIGczNqSkkBaf2J7n0CTFAI/8+wqAej4CW551XZ1jy/bld
         yPe61/ZgQ0SDAyFpkNttxP+6vKUZpWiA6TS8hAT+Htr+YN5aTMyHCBUls4X4DkPrK83o
         9yX4C1JDEGBC7KsU6hWj2S7hH+rMIgFPDotvoxkUffRts2/kCj4769B57sgubzV7iSd5
         M3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830292; x=1794435092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EGlBiCE9y1aipHpdTJ2cp7Guo9/hRSALY5Dt5GVDzPI=;
        b=u0M2xwzev+GeKH8AQ7PVA3YkOKDLwIiR8D7LjNnCArm1OKNUFoRtItxIHDKk0q5UjY
         BZPZ+AL4zpMUGj5Ta+ekDre7fCs+zGgogFIhjZnqEWfbFKlreSKlb3+QLUHyYqmZ/TNy
         Froj5GIQRDC3NHeZpDX5Ue6vaKRIcneaOVm2YYMmg/TZjwcXxIodIXpEnyU5vbOdvLS3
         J1HMn+Yix9Yv9U6MvSENfFqonCbXMw9suyfvwiqq19D/WKsNq3D5GKOD3+FO3W8stwHi
         Abktyk7jPQVZXXXJVdzUD9FcfFiKiICQqWTKNcebco3Xw/27PwiXnBqPgwB90q5peNbE
         VHuA==
X-Forwarded-Encrypted: i=1; AKwUvBxHJJqDYxC44BSbZSw7wk7FDHgult4Je1QpFEorarsYDrzKn4CiEWRsBAdV6DD7JbUj9SPE/91PuE4L9A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+R98V3rJR8FT0MhRuiRT5n9JOJnZKEYomuXwB8ER0TzRERLK4l
	yiM7bsao3cAtyTuK9owXJeG0bQXT0N/onhb8MMTJh9M9MVPGWhlRJe6Uk6WMsruZoY6A3NYgbUA
	5ixDomIdKDu5+LQD/JATI3kq035AhafE=
X-Gm-Gg: AYBFou3yrTVbQhStBqoG5reTE8qSr5hbAopPG+PNbCt46aepTwXZ+lecD4jJreNIq7y
	7MgKipfgoZ6ZKPmW4623NksEbdPnV2dz0sRo+1bjW2r92O5h69QrTce4eOa62Fi8aY+y2ell5m6
	nwVbsynZ8MRVk6pgD6EjOsPXDw9ONpK3M6iUgpzKfbUJpuZoUoBqFZDzqueJt6IslcHoCBKQymR
	7vGnFuhDmqLpTv98Q5U2om2CKHdca5UhPnwLUMLzAl4ZbMEYkc3a1+ph3CDrHkNq3gcs6LDFjQZ
	mmXeajm/QxiK82y/nPDNDOPCmMCbnACj888KtINWsslepbpwEScBsthJ1Qrf6jM6uPhuqp0oIj+
	HXlTM8LwJzaxvu0io3924qFYQlcB09C+5HUSEFZyRRUl3UbKSnmu0K366nvySSK/izZtuQiwCar
	991C/TpShLeFm15Og2yxuL/9A=
X-Received: by 2002:a05:6402:27d3:b0:6b3:fc71:fc29 with SMTP id
 4fb4d7f45d1cf-6b4d33aafabmr14094964a12.6.1793830291784; Wed, 04 Nov 2026
 14:11:31 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com> <20261104-alpha-profileme-v6-9-63362e9290a3@gmail.com>
In-Reply-To: <20261104-alpha-profileme-v6-9-63362e9290a3@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 4 Nov 2026 23:11:19 +0100
X-Gm-Features: AclHuK9rURAADFMaHKSa3C6tUNWpCMLgBwWXXb11rOWiWxNNie3COpwPoW2A6qs
Message-ID: <CA+=Fv5Sp7wkgZ0PXS2RNfVPZ3z8PkFe7zesGgVOUM6oQP9Q1FQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/13] alpha/perf: report the ProfileMe window count as
 the sample weight
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
> What PCTR1 counted during the ProfileMe window, the inum retire delay for
> cycles:p or the window length for instructions:p, is only available in
> the PERF_SAMPLE_RAW data.
>
> Report it in var1_dw of the sample weight, which the weight and
> local_weight sort keys read. It is 20 bits, so it fits. As Alpha is
> little-endian, this is also the right value for plain PERF_SAMPLE_WEIGHT,
> which is what perf record -W asks for. Samples that fall back to the
> interrupted PC get no weight, as it belongs to a different instruction.
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/perf_event.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index b33677cc23ca..c9ab40ff76ad 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -1068,7 +1068,7 @@ static void alpha_perf_event_profileme(struct perf_=
event *event,
>         struct perf_raw_record raw;
>         struct perf_sample_data data;
>         struct pt_regs *pm_regs;
> -       bool pc_only =3D false;
> +       bool pc_only =3D false, exact =3D true;
>         unsigned long pctr_ctl, i_stat, pmpc, ovr, pc, saved_pc, saved_ps=
;
>
>         pctr_ctl =3D wrperfmon(PERFMON_CMD_READ, 0);
> @@ -1115,6 +1115,7 @@ static void alpha_perf_event_profileme(struct perf_=
event *event,
>         pc =3D pmpc & EV67_PMPC_PC_MASK;
>         if (pmpc & EV67_PMPC_PAL) {
>                 pc =3D regs->pc;
> +               exact =3D false;
>         } else if (pc < TASK_SIZE && !user_mode(regs)) {
>                 if (is_user_task(current)) {
>                         pc_only =3D true;
> @@ -1124,6 +1125,7 @@ static void alpha_perf_event_profileme(struct perf_=
event *event,
>                         pm_regs->ps =3D 8;
>                 } else {
>                         pc =3D regs->pc;
> +                       exact =3D false;
>                 }
>         } else if (pc >=3D TASK_SIZE && user_mode(regs)) {
>                 pm_regs =3D this_cpu_ptr(&alpha_profileme_regs);
> @@ -1157,6 +1159,15 @@ static void alpha_perf_event_profileme(struct perf=
_event *event,
>         };
>         perf_sample_save_raw_data(&data, event, &raw);
>
> +       /* The count belongs to the profiled instruction, not the interru=
pted PC. */
> +       if (exact && (event->attr.sample_type & PERF_SAMPLE_WEIGHT_TYPE))=
 {
> +               /* perf_sample_data_init() does not clear it. */
> +               data.weight.full =3D 0;
> +               data.weight.var1_dw =3D (pctr_ctl >> EV67_PCTR_1_COUNT_SH=
IFT) &
> +                                     EV67_PCTR_1_COUNT_MASK;
> +               data.sample_flags |=3D PERF_SAMPLE_WEIGHT_TYPE;
> +       }
> +
>         if (!alpha_perf_event_set_period(event, hwc, 0))
>                 return;
>
>
> --
> 2.55.0
>

On my ES40 I compared the sample weight with PCTR1 in the raw record
for all four counting modes. They matched for samples attributed to
PMPC, and samples that fell back to the interrupted PC had weight zero.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
