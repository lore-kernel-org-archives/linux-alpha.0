Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793286127;
	b=32PU2+LIIUwLNQd/IltJC9m8JCHCrSqLhU8Y7fC6Mn91eQbrZ5fD58WFVKWCQj54HKv/
	 lTw79/XD4ik8Toiwj9GMVtTN6NI/elL/c59DALYZPQj5yV8j3k4QiLaiWTdKubuzf4Pdh
	 /jIjDp8DZpbwzgtVLLDNO4l+usEQ4ncVI7b3oywqANZBOx48I/i4X9oCXeFTs/sk4dQI/
	 XSq8rnfnnwZu321DX3QAJ0IKLWBvgkN+bl7FxA71hrUNAm5mB4tBIrh2W6oI8sNqTWSmK
	 zJK+q0vMbQ+MAr+SWz6C1D4Q3b4Kiqu/Pp71/7Za/YSvqR4uLrW3ttCJTyS4S8yr1hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3pv54lpPQ42UJPfl7NiVIVr5xpTo5h1NIoL6uWP0Qlk=;
	b=atJpgDSXrx1psDzRlz7hMRo29VEgOwe9O00wLYC0hFzOrcaLs3XmzmcX2/IGf6adXhlK
	 JPbV+OSxrKD0bRjG04pRHxwn1j8+QkJvEqFN0j1nOHwwaRDR7uzLHHpIMI2BKjfs87FrV
	 lpbkS7QNqV6kQN6lsAedtMuK+gkG6HA8c+d/OysQc2VaqQQeFaXKKjbvcDAT/mCEsvoAj
	 PCwGcY9PN6HCBKEz+XonO+tm8SGGo58cN6BHVAND5hvOEIitUTxQ+d74iBETplZ31rUpI
	 3j1ruoVVmfkrehxiPwrUSjkWhAsDZcPBtSBIZ/IDDeXt8kSCJUgwi/+jxRXidO1Wi4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=At8KQKvW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245B2606A32F
	for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2026 15:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 245B2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=At8KQKvW
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c40f29667e6so303613466b.0
        for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2026 08:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793286125; cv=none;
        d=google.com; s=arc-20260327;
        b=IvkFKMK6D7hbW6E3S98aATZml5svspyntwbgLfRSqFzo4QVF2rk7GEWU6/hfbfFO3Y
         dOmiwuD1XB1R3iOJ2+ZUc950EiwSvaME6oQMb7ax0J9wwfhcCVWBrWQCkUawisRktLUU
         Ux7s5A1H6oZM2V8GpWtBTNk5JYHm8b4rdjRn1mARFyFEOQR6OIX87KZ/EWCSDdY7RzUW
         ch5inpUO2nE+cbfZl9GVPYfe94OIgkCZQL2h5o1L63niUmcIC50oY/FKUgyhbEP069P7
         dQwTqXBNScfoupPcwQbYCvHemZuHuqJZ/5sVmldbeeQ/SucG2MDgJki0dBOfd6HFwFBk
         dMWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3pv54lpPQ42UJPfl7NiVIVr5xpTo5h1NIoL6uWP0Qlk=;
        fh=eVZMk3ffrirrT1/c7gMGR1oKtqMk14gp7K+5JHgzbrY=;
        b=j0s3dcWWicD90KMztWcamj0x1iC9qbRmHkgki6tEdfgKpXJmvKyUEMRhOMqawokBY6
         hcaYJ+kVj0J8+qMybLaOhqStwfk6E/6/2HJlYEKSAquIMnpqkQwJdt40PiMc5iGmIPlZ
         hMQ94khN/qYnPJFQv8El8LRrP41e+81azlL91f4uC/CxjEc26zPUTc7MphayQ8+oArmz
         3OcuTmDe8lwRWGd0XN5YfZ0mNQuSUzx4tsy3IP6oAyCq6YGWVq1OuOJMIfx7OptmMUrR
         Fb8dQ2Nk1Q0uUwpsK6eufB2sHeveR4aGRpRvcklzjyXA5E6IJfVeb+LWgAH7YvdG1Xje
         u0XA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793286125; x=1793890925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3pv54lpPQ42UJPfl7NiVIVr5xpTo5h1NIoL6uWP0Qlk=;
        b=At8KQKvWo8fhNk7ywdT7FNDhpC3ba7IwiYlI7QmFy7Zh3uJJY4cGFeNFCR7BjY9ix0
         Z0LycXeX1d7ozowebTUnosQYM3e0PA4OBDFuKc8XhQQWprwTpYgrRgeFq5c5YRtM+/J1
         APL9/PifUoPMDSW0FVca4S4a4DhjU85h6eVasm15MpBB4SSd/uFe9e2USgS0tVMxtSom
         N/qyqp6LogRmNVZxui1J90unNeWqvpYBjFg8EMdUWe/bycEmgEEmkx8XeMd2U5/u01EQ
         3KuGQZpZJe+HCxk16t3EEUK9x/XgzJHEVq2C7X7nbLxwzAcE2FV8kKPE3ctva+3ZPMP1
         7V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793286125; x=1793890925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pv54lpPQ42UJPfl7NiVIVr5xpTo5h1NIoL6uWP0Qlk=;
        b=mrODrElk4cKS7DcXFm+FOg/bYV3wDts7vgsDpKb7qRriOKlgHX+vDSFoQS53mV+uCq
         bEj2wLKx58Vv6BIPauxem22w8VaSYUTuT0kWgUNTxZMzxah4mkxJ1VCNrhHbbHizhGjk
         /Tui9vcVpIX6cwgyYJnEqJeCCACLtPzWyFjy+oGeLJn7RJiJLKkqqYM1oZf7gMgx9eer
         KBcE4zvu15pmxKoJHMW9N7TWIrbq/sV3/gddcXD6wLEJOr4x/tHYJlLVAww7ly580e9l
         e1p6tF4u9G96iepxom4fy3eTUs6Tm2S/j3ugekz3Hve1pjZ861pbBHeKMnz5RxO2e8oi
         6Kxw==
X-Forwarded-Encrypted: i=1; AKwUvBwFoxcRCso0jaC+jL/Cv4Sr6E5UsoQ5YQ1TMcyt0tO0dTjuPOf7orP8dwLKPs5u5Fh1bEXnBdCp0cT+SQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLNI4eypty6Srdnu3Rm9jsiP57fDsWw+JH2YCl+f7zGaOQvnLRc
	Oef2oHO2KO6IIaJLZmk3z421KrnfUtEWDBUjhQjbsYuqA1YO9dGMcbkgcyGs8yb57L0JTtP2BXk
	EcN9sYt5uY9jElHDiaTNNPDcfXohOGY4=
X-Gm-Gg: AYBFou01C58Et33Xa3J0omVOXrUwjd0or/pct1+dlWa2AqiXw7rw5YuRJVz1A84CvKP
	rWUuq8Cm7bION8vhIp1nWttaOaJB9tgGQSZtL9cwswiOzo83MVuGzczcOeFkPwbQmYidG/k68Dg
	GPur4gyFrk/BI+l37zUWdlcA+3KhVHc+rx2A+r+qpQvvOIrXMUQZ1+XiIlAZ31GnmpXPI4sSfw8
	lY05lF9D660IexdEqQxdu9MPONcDsjl7Aw3konAia3ET1G2AsziNjxrucRdiCRIJn8Ox7PnEkpz
	Pip6YWxDBMGZrvKrToPoxpvG1phwJWKH8zaDBtCvtH2e82qCIXmSx/oM14JtRtsD0nRjJljpjF4
	NzYPPernCbtFh06ULKqIjD2XDr2bhK9GuFY/5FTIPki0NtRvl7riHexKm27+qEMTxoWdQ
X-Received: by 2002:a17:906:794e:b0:c33:ae8b:817d with SMTP id
 a640c23a62f3a-c49bdf9016cmr515625366b.46.1793286125001; Thu, 29 Oct 2026
 08:02:05 -0700 (PDT)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com> <20261028-alpha-profileme-v1-5-d44b52bf2500@gmail.com>
In-Reply-To: <20261028-alpha-profileme-v1-5-d44b52bf2500@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 29 Oct 2026 16:01:53 +0100
X-Gm-Features: AclHuK-GNrjKeGtxUttAzHxHHU9r3Wn59K2y6AwVpRTg9_F9nYsnOjJyieFCY_M
Message-ID: <CA+=Fv5S5S3o1=2LetFuLQNqjtuw0DTgxVWAYAiAVvsdUNgNEyQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] alpha/perf: optionally randomize the ProfileMe
 sampling interval
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
> A fixed sampling interval can phase-lock with a loop whose length divides
> it, so that the same few instructions are profiled over and over while
> the rest of the loop is never seen. DCPI avoided this by randomizing the
> interval.
>
> Add a randomize config bit that varies each interval by up to 1/16 of
> the period in either direction. Only ProfileMe events accept it, since
> Aggregate mode samples already land a variable distance from the
> instruction that overflowed. Counts are unaffected, because prev_count
> already records the value actually written to the counter.
>
> The jitter comes from a per-CPU prandom state rather than
> get_random_u32_below(), which takes the batched entropy local lock and
> triggers an invalid wait context report from lockdep in the PMI.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/perf_event.c | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index 06c9afeb7c05..da8262c74d04 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -16,6 +16,7 @@
>  #include <linux/kdebug.h>
>  #include <linux/mutex.h>
>  #include <linux/init.h>
> +#include <linux/prandom.h>
>
>  #include <asm/hwrpb.h>
>  #include <linux/atomic.h>
> @@ -33,9 +34,11 @@
>  /* Layout of attr.config for PERF_TYPE_RAW events; see format/ in sysfs.=
 */
>  #define ALPHA_PERF_CONFIG_EVENT                0xffULL
>  #define ALPHA_PERF_CONFIG_PROFILEME    BIT_ULL(8)
> +#define ALPHA_PERF_CONFIG_RANDOMIZE    BIT_ULL(9)
>
>  /* hw_perf_event.flags */
>  #define ALPHA_PERF_FLAG_PROFILEME      0x1
> +#define ALPHA_PERF_FLAG_RANDOMIZE      0x2
>
>  /* For tracking PMCs and the hw events they monitor on each CPU. */
>  struct cpu_hw_events {
> @@ -59,6 +62,9 @@ struct cpu_hw_events {
>  };
>  DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events);
>
> +/* For randomizing sample intervals from the PMI, where locks are not al=
lowed. */
> +static DEFINE_PER_CPU(struct rnd_state, alpha_perf_rnd);
> +
>
>
>  /*
> @@ -246,10 +252,12 @@ static int ev67_raw_event_valid(u64 config)
>
>  PMU_FORMAT_ATTR(event, "config:0-7");
>  PMU_FORMAT_ATTR(profileme, "config:8");
> +PMU_FORMAT_ATTR(randomize, "config:9");
>
>  static struct attribute *ev67_format_attrs[] =3D {
>         &format_attr_event.attr,
>         &format_attr_profileme.attr,
> +       &format_attr_randomize.attr,
>         NULL,
>  };
>
> @@ -360,6 +368,20 @@ static int alpha_perf_event_set_period(struct perf_e=
vent *event,
>                 ret =3D 1;
>         }
>
> +       /*
> +        * Vary each new interval by up to 1/16 of the period either way,=
 so
> +        * the samples cannot phase-lock with a loop whose length divides=
 the
> +        * period. The count stays exact because prev_count records the v=
alue
> +        * actually written.
> +        */
> +       if (ret && (hwc->flags & ALPHA_PERF_FLAG_RANDOMIZE) && period >=
=3D 8) {
> +               long jitter =3D period / 8;
> +               u32 r =3D prandom_u32_state(this_cpu_ptr(&alpha_perf_rnd)=
);
> +
> +               left +=3D (long)((u64)r * jitter >> 32) - jitter / 2;
> +               local64_set(&hwc->period_left, left);
> +       }
> +

One minor corner case? This  multiplication can overflow for very
large  sample periods. I guess normal sampling periods are not
affected, is it worth using overflow-safe multiply/shift to avoid this
limitation?

>         /*
>          * Hardware restrictions require that the counters must not be
>          * written with values that are too close to the maximum period.
> @@ -715,7 +737,8 @@ static int __hw_perf_event_init(struct perf_event *ev=
ent)
>                 return -EOPNOTSUPP;
>         } else if (attr->type =3D=3D PERF_TYPE_RAW) {
>                 if (attr->config & ~(ALPHA_PERF_CONFIG_EVENT |
> -                                    ALPHA_PERF_CONFIG_PROFILEME))
> +                                    ALPHA_PERF_CONFIG_PROFILEME |
> +                                    ALPHA_PERF_CONFIG_RANDOMIZE))
>                         return -EINVAL;
>                 ev =3D attr->config & ALPHA_PERF_CONFIG_EVENT;
>                 if (!alpha_pmu->raw_event_valid(ev))
> @@ -740,6 +763,14 @@ static int __hw_perf_event_init(struct perf_event *e=
vent)
>                 return -EINVAL;
>         hwc->flags =3D profileme ? ALPHA_PERF_FLAG_PROFILEME : 0;
>
> +       if (attr->type =3D=3D PERF_TYPE_RAW &&
> +           (attr->config & ALPHA_PERF_CONFIG_RANDOMIZE)) {
> +               if (!profileme)
> +                       return -EINVAL;
> +               prandom_init_once(&alpha_perf_rnd);
> +               hwc->flags |=3D ALPHA_PERF_FLAG_RANDOMIZE;
> +       }
> +
>         /*
>          * We place the event type in event_base here and leave calculati=
on
>          * of the codes to programme the PMU for alpha_pmu_enable() becau=
se
>
> --
> 2.55.0
>

I'll report back once I've done some testing on real hardware.

Thanks

Magnus
