Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793459932;
	b=qKtMqjiSe6q4sahTQzlVmi8iqjuc3+96o7EtLTdVTATerUAsIAfc1f1JbmbmUMUQn9f0
	 1yJrgc64VCL+/vYDPwW2s1sbRFAP/PoolTceJJGkyRbqJWxqY3YgwdJW3BbYGDEmDaDCi
	 RNd6A9eMAFWnzq/11+KJouKtNH10pa37xtsCnRaMnfh7/jnyCsWHipLTTe2BrRCIhb2uY
	 cebGYYwvUZi4yUwhSlyIpNmr9+JizMLvHLQtXOCP4f2pi9lqQ9OgNcviIxCnrura+Z0qZ
	 xnulCO8KZetGUbOKfutNHTfOv2BwuDB/w3+tRYJMIbA19YIJznje01wO/gvGTmQVBMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793459932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pWROUaQbGzutORUjoHU2j5EievY+f7Xwsbb9sewJ+VE=;
	b=3S2lNmEolfVlj+xs6Z79YLi/7X/XSOAbQsLbMK9kvyHe88EH1quFJQKyKt/VoYNDlzY2
	 dq4VcklFvibXPwxD+p0saAkQBdJTPcvEs//as/hVFV/+ORV9UStfi99oMMtgfRAnfJENn
	 QeaKRIB4nzw+6x91tiavadxUq8MtJG7yJZuM9uzpjRJpkMOeoYK8LcRYHBlWkUFllCFZm
	 Vm33uCq1YZI3epFd26TndxE2kfqk8zne3qx7Ju57OAD4gw80DKU+ddiw6f9JRKOGQ8Zt1
	 n1gR5x2LGM+Xz/7bkkA6A9xceUt3y9DDCFw84zvCOepHZBvyiMtLXzWVXAPHLKpmdbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRC70ElT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC55606A31D
	for <linux-alpha@vger.kernel.org>; Sat, 31 Oct 2026 15:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC55606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRC70ElT
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b488586facso2037967a12.2
        for <linux-alpha@vger.kernel.org>; Sat, 31 Oct 2026 08:18:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793459931; cv=none;
        d=google.com; s=arc-20260327;
        b=gTl+gvDpqtWf5mb08AYwUXOfbO5SSpF+NxEJDqLNolzG/AstafHibBttY2GcVWsvZ6
         KqV6xvLtEefUnCB10p0T0nYdKT8JMLnHW4DpekOc34vNNKgtwh3zWwaitbtyTT6szg8O
         NJxLjEGKNNOLufVDPbOotAT1IDEPm02/Hm4hXmyfG0aqK81Mi/o364pHppXGzOv37Iq1
         8FjCrKhuJovyPCPR9lU3Su2zGkGD7fee+BCZG/uE7z6iFyio/hCAtrZORv3GBavaXPzR
         zmwbZdTSBhqcYztZVaftu7avyWH495EACgNPWR7oKiN7taWcAj9FpvV7BwTIf2QSxNfF
         vRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pWROUaQbGzutORUjoHU2j5EievY+f7Xwsbb9sewJ+VE=;
        fh=MVXSq+qQF42+nnWQ+ctT7GLNeN06btnbKS9Shq2olzQ=;
        b=XieG9FomqonbIdfiNlwCG/fau8OhvsbMvQ+KNz+f6LwMBTL4T7FteDtoeY67ySdL4o
         t5m8SnvHkk1NexSORYjjcsuD6T28EuIRwS1i2lE5mPYpmHfMrJ9a7MUDuJ85WLpHTjwr
         UPlk1irXJC0vUESP6wU4DdWDISu/54g6Bfowle10Fhes3nomHmnk28p/UoQ1LfnYoOUq
         IcEEN2Hkj93+zXAjN66I55UYHo5c6sYEnyzmN7CV4VGSV/LBPSViaLXOpBKdAXhebBWE
         Vt0SA0OEmThUaf6H8p7EIRIntesZhWr34BS/vVVilpBR+z2j637vewJHibp5/xZtqHJ1
         lXMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793459931; x=1794064731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pWROUaQbGzutORUjoHU2j5EievY+f7Xwsbb9sewJ+VE=;
        b=jRC70ElTjpZC4Vg1gVotImxyxtgyoZo7aRDc6o2t5nSg7r6QLeG8hrjb68LTY8c2p5
         q1wiBjkSw+VolE4LuiszzBip9EitT9gwcWiSv/klhcYKzL+XEA/l8+Mq1K1bp2hwU7a3
         jPPpC2o9NDLj9FMw/ZpwckA56sROEr8lo3UeNvgucN+InNzR3dtxrlwgmYhN+fHXRh1g
         d/6usaK76WvnxqQGGUYobWBDTlwYQbhLPTpvrqozTTyaZb6ifGS12KojgI4KEgCQoddM
         4A2RRBOoRyI541uPo6G1XP6z1GBnkq+oGLwH4FnfhUJu9C9RrC0p8if91GlwfOklu9Qk
         6XbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793459931; x=1794064731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWROUaQbGzutORUjoHU2j5EievY+f7Xwsbb9sewJ+VE=;
        b=n8Tu5CgnFc4vl4jgGL+8MgWp5sG5uyErH2WywKuKJ4w50pXB21gthI0WMCm1wgvOUo
         N6XwZasLIq3KQVpOB/vspaqI7oT1aniojwb3y8TnF9BWSFDTQ9sXC+kqi6tiJ3fzpeP6
         Y7tJwRpvXqyfFfD+2ybGz9WxcFVZaFlvm9PB7bFnMjEZDruyY6z94vh/Kxyf1Ju0+ycg
         CzR5a13m94XDDPVD5/iG4gmwQWvT8kVW6qGTIAzFp4WHoY1u20ob0Q4WoNkOpCIqQRAr
         wGq1NWO1W+z8s1nNCm2u83jHA1QzvwjoYp9FFLrf3qLAEXjt3yqM0n0KKI0jsliiz8sj
         hGkA==
X-Forwarded-Encrypted: i=1; AKwUvBzUSTnQyO1Oj2L7EEhxZmQGrcAPHgcjN78ZCmStuu0Fhi4dJeuPoi5GDF69+THmnqS3wKRqCMTNd3pxxw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI+6lOGTvTBWb7i3c2BiENNPpat+3D54mA/xs0aj6+UE4V960p/
	Jt7bsvKuZt8pJlSiiwtkn65D4JyvhsHqaaxGqzdMukeDRGWwYpTjGUvGjT92PKcypwN0qIURnJg
	SAqiMWTqyhV+FgB70w1CEoTQH3JRyZZM=
X-Gm-Gg: AYBFou1wn7FFvCM5xWcmqA3g6JHVM8SmkAGEHI+VHduGQ3IYilhPqzxgq1xruRDNwv2
	raiGQWeMx2sYVghNFwpVBrI020H6u/8sfQRe1dvpOWP8V56xMHhXRkxGvlf2avgT/9TVBXQKTUH
	fcZNLmBDWSepb4qr7/w+YK6lT78tkULBZ9uHOY/TMHkbjwJds6hEaEmKdGV4/NTOnx3b5G5P+OF
	zPjCzAHGPm3Lt9eLAuHmvHotdbimCqRy7tNbUjpDE/CBYM1nPzGwX20HqS7nmI/BXVu7vVrrtHr
	QCGTmBkLbDG6JVfczUqE8Vkh2X0teB2ACF0TXQLSWgC48h0LbU12cx5pds3Ir6EET5M/Y6JSwU9
	LWubnlYIlGDuQoxtIL9ZvhR4VozmsT5pJPonKUjFdU0llhDu2GW6AxcC4RmlZvGyX23YW1bd69/
	TZTFbtgfk8l9jjryQjYd/OQmk=
X-Received: by 2002:aa7:d7da:0:b0:6b4:a136:8788 with SMTP id
 4fb4d7f45d1cf-6b4d438bba8mr2984206a12.7.1793459930510; Sat, 31 Oct 2026
 08:18:50 -0700 (PDT)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com> <20261030-alpha-profileme-v2-2-c702f1c65272@gmail.com>
In-Reply-To: <20261030-alpha-profileme-v2-2-c702f1c65272@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 31 Oct 2026 16:18:39 +0100
X-Gm-Features: AclHuK-fcn4Vq_6bW1E8x2uH1VVvD4ohFBO2dvy4BaT3WU-s5Ewn8vz03NCGQRw
Message-ID: <CA+=Fv5TZQ4O89gd9PU6HOaM6i+ZdpE=8jEN66o3_qSe4r2HCvg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] alpha/perf: add sysfs format and event attributes
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
> The Alpha PMU registers with no attribute groups, so the perf tool has no
> way to learn the raw config layout, and the PMU's own events can only be
> named as raw hex numbers.
>
> Describe the event field in format/event and export aliases for the four
> EV67 event types. mbox-replay has no generic hardware event, and can now
> be named as cpu/mbox-replay/.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/perf_event.c | 39 ++++++++++++++++++++++++++++++++++++=
+++
>  1 file changed, 39 insertions(+)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index 2d9383425357..70840c05d39b 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -212,6 +212,44 @@ static int ev67_raw_event_valid(u64 config)
>  };
>
>
> +PMU_FORMAT_ATTR(event, "config:0-7");
> +
> +static struct attribute *ev67_format_attrs[] =3D {
> +       &format_attr_event.attr,
> +       NULL,
> +};
> +
> +static const struct attribute_group ev67_format_group =3D {
> +       .name =3D "format",
> +       .attrs =3D ev67_format_attrs,
> +};
> +
> +/* Values must match enum ev67_pmc_event_type. */
> +PMU_EVENT_ATTR_STRING(cycles, ev67_event_cycles, "event=3D0x01");
> +PMU_EVENT_ATTR_STRING(instructions, ev67_event_instructions, "event=3D0x=
02");
> +PMU_EVENT_ATTR_STRING(bcache-misses, ev67_event_bcache_misses, "event=3D=
0x03");
> +PMU_EVENT_ATTR_STRING(mbox-replay, ev67_event_mbox_replay, "event=3D0x04=
");
> +
> +static struct attribute *ev67_event_attrs[] =3D {
> +       &ev67_event_cycles.attr.attr,
> +       &ev67_event_instructions.attr.attr,
> +       &ev67_event_bcache_misses.attr.attr,
> +       &ev67_event_mbox_replay.attr.attr,
> +       NULL,
> +};
> +
> +static const struct attribute_group ev67_events_group =3D {
> +       .name =3D "events",
> +       .attrs =3D ev67_event_attrs,
> +};
> +
> +static const struct attribute_group *ev67_attr_groups[] =3D {
> +       &ev67_format_group,
> +       &ev67_events_group,
> +       NULL,
> +};
> +
> +
>  static const struct alpha_pmu_t ev67_pmu =3D {
>         .event_map =3D ev67_perfmon_event_map,
>         .max_events =3D ARRAY_SIZE(ev67_perfmon_event_map),
> @@ -761,6 +799,7 @@ static struct pmu pmu =3D {
>         .start          =3D alpha_pmu_start,
>         .stop           =3D alpha_pmu_stop,
>         .read           =3D alpha_pmu_read,
> +       .attr_groups    =3D ev67_attr_groups,
>         .capabilities   =3D PERF_PMU_CAP_NO_EXCLUDE,
>  };
>
>
> --
> 2.55.0
>

Tested the PMU event/config interface on my AlphaServer ES40.
The four ProfileMe event selections recorded successfully, with
the expected selectors in the captured status.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
