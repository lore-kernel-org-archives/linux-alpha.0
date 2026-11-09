Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794264627;
	b=w/zuZtZ0kGtPTmh9sUHCD1CbVzQF5wUT03/zQXGIxmUhjvBQsgETCEpu28p/NsAGzRWE
	 i8mZpfMveq1sWT3PJUKQpXcu1NUM2YOGzWGVC0Bxbs1+A5vGlK5Ve8yxa4CDh72qzC6X+
	 2oGQJI6c6rMi93/6aL6AUjy4A4Uz5sfidzsVCJr+Qtv5zPFKz2Uo8RJtxZjFFoaQ8ATWX
	 Ku78S0yhtQJI+sVs9MTrnxtYemz76rnBidHsxWIXk2CIVD6+7zR1MgvU2Hn5GVKaNkc8j
	 72DDhDKhnyUxaOdH/37DOrY6BcbCrgTG9cnueml3/nld/bMtQkx2hW6ylnY81LUSJFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6JVA+B8V5GYpRZnqFW1zVpWT3o7noCaTpT1OABug+5s=;
	b=ljVrx9rOTf8UZd7ERjTHf8WoBLjb0eJikTvzy5CNJL9L6OJIXTol9akHH//NItOQ7Mmp
	 ldhcDJcin7sJXMGrjubgvCYgKvJ6M/EyCCSQ0cNaZCrvWLwz1SiYneVIkV/+3JKFKy+ue
	 nFhEaLxMZ8ekdk8UKLshT4wmgqNkPRB8nMRMrr85y6D/gxlW/zalHvXNIjTUO25Cir2Fg
	 2CQTzjer9o0K99vnZDWPOTF1pp8BT9PAuptd7fEn4J7h/W5PycUxNfGkfd0cx63QknWzg
	 jWvF23S1S8uy/Iv8jwcFqncvXMMPwkh7va9g0QVhUPvHneRCZ+N/12i+NuhD5AXuUYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kuBOCAoO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20AF606A31C
	for <linux-alpha@vger.kernel.org>; Mon,  9 Nov 2026 22:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E20AF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kuBOCAoO
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso1771904a12.1
        for <linux-alpha@vger.kernel.org>; Mon, 09 Nov 2026 14:50:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794264624; cv=none;
        d=google.com; s=arc-20260327;
        b=hG+v8sjXsQ39onvAL+SzxO+/v6hOlpqi6YXZrbIWGLgpq/X/pjRsIjXPvJwPfxktFV
         ZmPJrMuWEElyoYgpwC23D8/IF0gauDBvj4BHfXveJF0AgNVXpjngg716d3s+RcSchz9O
         3OBz8T71FfJPzcOTRoJoXHxM/1sJeN6VBaZwK6lj0q94OCGsoO074vFHDQBMfBbdZgIv
         N089EMWvPn9aqtk0UDhsQHq4UvTxnRbd4p9pcB1xxiIM9JHT4CZaJMS4pxMDmffhAtbq
         lhABm6ezuI0TQluNa6F1vWsyMU//DzU7OF1vcC/ydL159SK/xYOOX0omyZj0tW91X1KH
         yyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6JVA+B8V5GYpRZnqFW1zVpWT3o7noCaTpT1OABug+5s=;
        fh=4VbmGAO7gKYCjDCvZx/sVzLegd1gGUtmK8m4VaK5eU0=;
        b=UCJkMg48HGLJeNRtXB6NUv3R7dp5MSeHkNmUsLY09G49EMlHWuuuteVP9FIzDeksso
         KdswTm49rvmKf5dJUbVIUtDYKvCPBCeDsH0b5RqWEydSWwAGMW7fEhReg+/9zEDhNqcu
         ZfeQXAdxpVle5TwuiKfTHqefgwfkNfhRY1u6vqeEXcMl8UCtbQwv3S3FHQ0gJVBGBHoD
         GpdmdXFmKuDVvHSiXnbjSK3bjtDnSwJVbGDTTKRu5Sjg9r9QqRVHHqZgI9qoHX+YR9ml
         Ye6VI9h6QEQ9fEm3MUsaDb59AxIjqECoMrLD7AHiDJF+7xb9S87WvSneRCzwErCa0zOb
         W3ZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794264624; x=1794869424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6JVA+B8V5GYpRZnqFW1zVpWT3o7noCaTpT1OABug+5s=;
        b=kuBOCAoOxBFc8wmNMTK6Rvj0bWKDAr6KPpBzFPPSGuFFp1mYUPa2WOvHHR6vcOMt4/
         mtbKq89PtpogcafK8HN4apLGDrHw14NOXbF6tqSlZOO/RY4Fo8eQibsE6qejuUpwCZSo
         HRy7HwB1PHp0zIiJKF/D82gmj0joofbd7TcLVU/HgIHw4SQASJwMmT+VFIFpMi3TqSL4
         r14EBOApL3zDWMk4M9+FCFJ2r3bH6u6D5XlqRCCRyyxtBmodUMR92L01XcFtgxAFIjeS
         ILXBCjP+kV3QAu8kYVKQ9bjxerpKSLEg4ox4WxzZAjFsYLdjRhWMO8vAPTdDrloJBgvR
         Rreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264624; x=1794869424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JVA+B8V5GYpRZnqFW1zVpWT3o7noCaTpT1OABug+5s=;
        b=2FtF/7CCwYP7phezJptRNjrHgpIV6pC85QowPt7nn0Ohx1V2CHAJRoKWIWwF/HFS8M
         li/e/ORdpp3bjIzRS3cGudd8LvCwmqaCfxuWQyLW6vSZXwdgQa6wpzyyoSTg4XU02T3F
         z+KmFP7esumB1VtKitMJiTKXudgK6U1sp741RHOoMrNlUpeVmDI+cy/8PzM8tLUGsXQA
         fF1TAg1CquFc4tbVzNL7XUe9j/jUbhr7//RjuFQqYzzj3r2Jn27E8WS4T0UCuwgqVfU8
         svj2eTCmOuL1i0AtOtx4VVKGgm3fLH63/l7pRR9cSGv1Kh+o9Vq77TPV5/3JT8Zk1agz
         brYg==
X-Forwarded-Encrypted: i=1; AL+hErHmcb3xq4jdZ7qD+wxuyjz7RnmbtkFz7q6vGkZtWJkxHEqoHFUeaI8oMxhXNMurl0sqm0jktOL9T+9FEw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/dL2dHmOqupODR81wBPrzHmhT4mGPWpaX9/pcc45B+XlZBt6n3
	aZAKcpzYFIJtKkR/3Y+434ZrJqpcOl4NfYv3Ssm/4EqdhAuPjBlr0hnVQjWOLTxBlq0p8hoEEAP
	BZLADPFL07z4ACymcsmSaZYazbtmdwkUCuYtJX7uVXA==
X-Gm-Gg: AYBFou3NkbZfL0E2DomDrn3vZjB9n9DvDwDIEc51VT7dfT1AzXBmS/ITD9vQhS+PGSS
	n6ZfIzsBU5kWNncYYaJoeeOZdoe0Jl7ftU6lFYUHmQ7QnfSzyq5alXllazVweKVW5sUznGBbKGy
	nvGNYmehKdyP4k0bpczpzWcOdnhr1UDrSBzv3h3PxFWvhe+dxm8p+q1bowAuXBYaoJsWgh8gsBk
	OLK4OZVVGTMN/W1XYPjFkBLm/RFxNWPfbOpQJgWjOAWYYGzIhAPWEM3E9Ol2LEDiITXXBvxbXAM
	wuomHVJ8XLmAABhRJM+ealaEc7oL832c0BCppJxFwHmSizGaz2EY81NAZlexfKOoymIX5RRLbHC
	BvXcROYkAV+YJnrLez24FjX9b3h45Rh9NAyZOmoLxWRFcDbNN+rGpyaOWobPlhrqQSaDLr1EVGj
	6zOzlp4zx7vZ1x24Vvjuy/DqE=
X-Received: by 2002:a05:6402:4402:b0:6b5:8625:d327 with SMTP id
 4fb4d7f45d1cf-6b7564bb8b0mr778506a12.8.1794264624107; Mon, 09 Nov 2026
 14:50:24 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com> <20261105-alpha-profileme-v7-1-c474e892abb0@gmail.com>
In-Reply-To: <20261105-alpha-profileme-v7-1-c474e892abb0@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 9 Nov 2026 23:50:12 +0100
X-Gm-Features: AclHuK8v5aBtIg32jclnjWJP3N3adwWeqdsURZmH27b0rZGwuLLEb1hb4knbBBY
Message-ID: <CA+=Fv5S8m3m6+UNJ-B-rT6AiQqkTnw0zLajJcGEcnFrAg7Z3wQ@mail.gmail.com>
Subject: Re: [PATCH v7 01/14] alpha/perf: do not update an event that has no
 counter in alpha_pmu_del()
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Fri, Nov 6, 2026 at 5:30=E2=80=AFAM Matt Turner <mattst88@gmail.com> wro=
te:
>
> alpha_pmu_add() puts a new event on the list with current_idx set to
> PMC_NO_INDEX, and alpha_pmu_enable() assigns the counter later, through
> maybe_change_configuration(). Alpha has no group transaction callbacks,
> so the core schedules a group with the PMU disabled for the whole
> group. When a sibling does not fit, for example because the counters
> are multiplexed between groups, group_sched_in() rolls back the events
> it already added by calling alpha_pmu_del() on them, before the PMU is
> enabled again.
>
> alpha_pmu_del() then passes idx =3D=3D -1 to alpha_perf_event_update(),
> which indexes pmc_count_shift[], pmc_count_mask[] and pmc_max_period[]
> at -1, and it clears bit -1 of idx_mask, an undefined shift. On the
> EV67 PMU the entries before each array happen to make the computed
> delta zero, so the event's count survives, but only by luck of the
> struct layout.
>
> The event was never on a counter, so there is no count to absorb and no
> counter to turn off. Only remove it from the list.
>
> Fixes: 979f867191f8 ("alpha: implement HW performance events on the EV67 =
and later CPUs")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/perf_event.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index a3eaab094ece..f77abeeb25b8 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -506,11 +506,17 @@ static void alpha_pmu_del(struct perf_event *event,=
 int flags)
>                                         cpuc->current_idx[j];
>                         }
>The guard looks correct: an event rolled back before counter
assignment must be removed without updating or disabling a counter.

Tested on my three-CPU EV67 AlphaServer ES40. A two-event group
multiplexed against a standalone event counted monotonically, with
scaled instruction counts agreeing within 1% on all three CPUs.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
The guard looks correct: an event rolled back before counter
assignment must be removed without updating or disabling a counter.

Tested on my three-CPU EV67 AlphaServer ES40. A two-event group
multiplexed against a standalone event counted monotonically, with
scaled instruction counts agreeing within 1% on all three CPUs.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
> -                       /* Absorb the final count and turn off the event.=
 */
> -                       alpha_perf_event_update(event, hwc, idx, 0);
> -                       perf_event_update_userpage(event);
> +                       /*
> +                        * Absorb the final count and turn off the event,
> +                        * unless a failed group schedule rolled it back
> +                        * before it was given a counter.
> +                        */
> +                       if (idx !=3D PMC_NO_INDEX) {
> +                               alpha_perf_event_update(event, hwc, idx, =
0);
> +                               perf_event_update_userpage(event);
>
> -                       cpuc->idx_mask &=3D ~(1UL<<idx);
> +                               cpuc->idx_mask &=3D ~(1UL<<idx);
> +                       }
>                         cpuc->n_events--;
>                         break;
>                 }
>
> --
> 2.55.0
>

I think my reply to this patch was accidental off-list, sending it again:

The guard looks correct: an event rolled back before counter
assignment must be removed without updating or disabling a counter.

Tested on my three-CPU EV67 AlphaServer ES40. A two-event group
multiplexed against a standalone event counted monotonically, with
scaled instruction counts agreeing within 1% on all three CPUs.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
