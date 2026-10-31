Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793465817;
	b=VyQkU4qoZwsedSdWcnRRanWzx7JXf4hARkzjIxkM1r5wfRzyMYU8epL1kCF9G57jnT/I
	 EJNyjOhAjjV05HzBzg89MZ9KM7QvNzbnjpgkdZ2LfoJXEuE67ukIPrJgDfwzlYf0hqUFW
	 zByD04/l9Z9ok0D6zOCQYcakJ3I7QRo85MnsvrG3LMKKTrp3Ml8NVc8ssYg3jRY30vTI6
	 M7JeAJK7mtQ3NP1hU48W3DNRXlE55QuKpsZw4VUfcxBN/jxf8fh1NI8fkRxt+80CrM9Ur
	 5Np9UJVmUG+sEwwOkCwvi190d2NMgdfCyEjzXJL7EjiBchMFPrBaliVoz/uNF4Z7jZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5HsQn+K8WRVcTEBks1X7UbNy0Qj9FUVgHxdKvavTijw=;
	b=P5HSYTVBf0YxpJvjnWOrhrRUduzA2U7DTtajdJhv0r3heY9W34Lw7C2s5Tkm1yXlQX3D
	 0ZEVW97cUsuSJSh+LEeV9fDIoohxCeLeT5nebWnAI9j6EWeiDb6D4YYxC98md7lwfFv12
	 W2A1FsUG8KUXQNRu0jPYGR/KNnC4Wx5Ilc228gOVnNd4QparZACY/juPsXSnVd038fK8h
	 mLRXCscWLPPabtGrmM6GehpN9bz5gKiSdObBaPW9r1jEK3dVGA2o5S98KSM53+0R679ci
	 xiykEIlXESf+bDF0rxn2DEFJ/E8ecSqX3u6OCOaH3AuUeoOlUaX5CfQML8IsGmigT7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pRhNZdpa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FEE606A31A
	for <linux-alpha@vger.kernel.org>; Sat, 31 Oct 2026 16:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1FEE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pRhNZdpa
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so2241397a12.0
        for <linux-alpha@vger.kernel.org>; Sat, 31 Oct 2026 09:56:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793465815; cv=none;
        d=google.com; s=arc-20260327;
        b=jEjhv5ROuzfKv+F1SChKK70WtGfptiEA4RIznm/wsOkOyd0Xw+EoapBKLH9QzjfiSf
         S/0T2jfVkRixZWPNvI5HPpC98MaM0vJqigz5IzBpRyxaxIty/p4vAuilmiQjkT7W60+w
         +Wf0NVwRFqp8i/ONL07IKU43R04JS7jDxaEehMrBiKeGhK1bXKOGnIc24bjM+Jvnx9Wa
         uxIBuqWbLqPdP1qM0wFT0Qzyq7QGbjW/BloQEc2zrqiXq77b0GN5DmCn3Je01OZFagY0
         OzPn4nmHr1ivSfw7BlsMLppr4aCQrUwLks/maCHjrIEQpyhj3720dmKjGgf21eOQvk2X
         fXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5HsQn+K8WRVcTEBks1X7UbNy0Qj9FUVgHxdKvavTijw=;
        fh=B+3NefWvfp33CMYsHHb/TaChN47/NkN1/ffjsaJ1qHc=;
        b=GDblmDS70Zl+wE48OmvJRmclimG6YJdDT0GGFfTLcvjuOoXdUKXrYSkOemFMw5vxRI
         JA2p/HP33zaGkAGWO2h9TgRM1IRjaQL1YrnmVQ7y50gqOEAzZyEMIN31hiXnNeDokQK5
         Usujvt3Q4cTJFuecxKLz8c4BpsVMQXQ5gJpXU9eU09kMpCrFiyDEVe+fii4BaJpxNr0B
         rVIOPqaow/+c9Rpc0IUB87Srto+9cHI+EZPOSDEL5pGoxzt9pO9DJaW2L6mi2H7RuzB4
         jHvOVJXLFB05Wnp+rrkuRdrB2CPioBVcvRUGy1kSQusSmNC3QZdZGkWYONPjTUwQ5rEV
         qBew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793465815; x=1794070615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5HsQn+K8WRVcTEBks1X7UbNy0Qj9FUVgHxdKvavTijw=;
        b=pRhNZdpaQpuD/DUfFEwMnU+S4r8hXkZIlNiw05lpKyGMFbu03Yn0xOjPZK2W+NXcsX
         vpv6J0xZwT+fseXy+hry9PYW9akel5JR6dDK94C3l6CvvoV5rjRDDQur7yGUJ84IB7TB
         Vq5U2qLARabEaHBXA6orhMC+zcjBKYM+MDX5CL+eErqkjG2n3QghA6G89U2DAz4AwY5j
         t9qydXkaS/lca7N8CM8yhdveM4aGUHBLfBHfiBWsDBj5aIoNM+/N+xtgkC6GulXMpbPl
         PR1xG6fg+OLJV4r4HVfASJb73BjxpLXSBS8Mp08pCNYk2MwPqY5OwboE7XoS1K/BRSV0
         tHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793465815; x=1794070615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5HsQn+K8WRVcTEBks1X7UbNy0Qj9FUVgHxdKvavTijw=;
        b=xat/KtSRwpi4qhOmyVJ706Azz9RH2wqKsbzUKv0LSOFTJ3ezIjtc6nLnmCoEaoR8LA
         c03iyTwdCDkkajvmG8pqzWFjQBjIQBhxC44dgf6te0Fx7qHbi+ifHMVE3gS/D6tY3qy8
         SZn2uswuq7xZTU9qb4fcl4PO7mZcTq1SXO9yh1umVN6bNvx7DKIj9bllccRcbo6sQiLn
         jb8azmI/v2evzv56McJ/4zekIdDWLxdvMwL0yiVBNli0pgFJ/cg6RVXLWhlb3VsrZ8PN
         D60lC5BRA8EPsrNYjd9BQaD1eUx8RKaWn9o60+QDeqWIluioV8xnHCuDo8lclANkt9IF
         USeQ==
X-Forwarded-Encrypted: i=1; AKwUvBya6csmKSX7IKSEMUcj0yn77DQglt6sk54ZF8gwpdwWbxE/Lz0BaU5uGCHO+UCb/bS+44e9B8QERe+sNg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJbsMSYQWUd21kRwkEvhlx10o/fOphMpU2a3DNQqMEZpLngyBM8
	omebzFWji9yr+5RlUqzWWOYWG3MszvHo9wdBKMOV5q1L2sISS2Cl1rewBrNMfAmqyXYq4IT4j+P
	6M6zgeFol7P61Bsv70+mlTiFX8u+6gss=
X-Gm-Gg: AYBFou0cRDmkhdYQoY1lVL4hsd2neqyE9dzFmXTAS1y/FtBzkWW2TD/mq1Nh70aNS3I
	k4I0TYz6iRrl/B7UJjnm8GTwWs/2LmA1oMF1G0braOQLLF5wQhse6L+MQqLHKMPWfz0axFSg1xh
	gGk/VgVegwLHPZR5vthhakYDEJolcL/Z4kmP+MY6Q1Kieep6utb0ZgnLBlz7c3y+0I2VMseQmuG
	jpoa6+DI5Oa40WkX8R+lqisLtRBiTpWEKjT9ccZEC7sKdCWcMdfPB0GrV4turm5oED2MJK4NHNS
	5DzqhwGlz9RBoorQ/Bu5Y6t4StquHGi2iIQlufUGqeVN27bqcHJel7o+PhqrNu19VmZyZEkAs7v
	DeFnr4qkRMDi+Xaml0KUZWI+ro63QyVQ2HmgZKU+iVegdkaI6mp5nFKuHhht6+i5Vt/6s9Ys8gS
	MPpdE7FjpfuDR/qSaUIEQE7N8=
X-Received: by 2002:a05:6402:5007:b0:6b4:d1ed:95b3 with SMTP id
 4fb4d7f45d1cf-6b4d5727afcmr4034555a12.41.1793465815192; Sat, 31 Oct 2026
 09:56:55 -0700 (PDT)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com> <20261030-alpha-profileme-v2-5-c702f1c65272@gmail.com>
In-Reply-To: <20261030-alpha-profileme-v2-5-c702f1c65272@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 31 Oct 2026 17:56:42 +0100
X-Gm-Features: AclHuK8up6u9Y3pPa0-yJ_2iRNWdsswN4WKtEkOWWp8jiOXqmU8vIfOM971mbzM
Message-ID: <CA+=Fv5QJqj0azuYhFE0PNZp7EqBgDzxvuTiW498kptnGBz1pHQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] alpha/perf: optionally randomize the ProfileMe
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

On Fri, Oct 30, 2026 at 5:04=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
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
> already records the value actually written to the counter. The jitter
> is computed with mul_u64_u32_shr() and the sum saturates, so that a
> period beyond 32 bits cannot overflow.
>
> The jitter comes from a per-CPU prandom state rather than
> get_random_u32_below(), which takes the batched entropy local lock and
> triggers an invalid wait context report from lockdep in the PMI.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/perf_event.c | 37 ++++++++++++++++++++++++++++++++++++=
-
>  1 file changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index c9d4b13817bc..c553cbd6c7a3 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -16,6 +16,9 @@
>  #include <linux/kdebug.h>
>  #include <linux/mutex.h>
>  #include <linux/init.h>
> +#include <linux/math64.h>
> +#include <linux/overflow.h>
> +#include <linux/prandom.h>
>
>  #include <asm/hwrpb.h>
>  #include <linux/atomic.h>
> @@ -33,9 +36,11 @@
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
> @@ -59,6 +64,9 @@ struct cpu_hw_events {
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
> @@ -246,10 +254,12 @@ static int ev67_raw_event_valid(u64 config)
>
>  PMU_FORMAT_ATTR(event, "config:0-7");
>  PMU_FORMAT_ATTR(profileme, "config:8");
> +PMU_FORMAT_ATTR(randoThe v2 arithmetic handles the large-period overflow=
 case. I tested
randomized instruction sampling with a period of 10000 on all three
CPUs of my ES40. Repeated runs completed without hangs or kernel
warnings.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>mize, "config:9");
>
>  static struct attribute *ev67_format_attrs[] =3D {
>         &format_attr_event.attr,
>         &format_attr_profileme.attr,
> +       &format_attr_randomize.attr,
>         NULL,
>  };
>
> @@ -367,6 +377,22 @@ static int alpha_perf_event_set_period(struct perf_e=
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
> +               long offset =3D mul_u64_u32_shr(jitter, r, 32) - jitter /=
 2;
> +
> +               if (check_add_overflow(left, offset, &left))
> +                       left =3D LONG_MAX;
> +               local64_set(&hwc->period_left, left);
> +       }
> +
>         /*
>          * Hardware restrictions require that the counters must not be
>          * written with values that are too close to the maximum period.
> @@ -738,7 +764,8 @@ static int __hw_perf_event_init(struct perf_event *ev=
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
> @@ -763,6 +790,14 @@ static int __hw_perf_event_init(struct perf_event *e=
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

The v2 arithmetic handles the large-period overflow case. I tested
randomized instruction sampling with a period of 10000 on all three
CPUs of my ES40. Repeated runs completed without hangs or kernel
warnings.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
