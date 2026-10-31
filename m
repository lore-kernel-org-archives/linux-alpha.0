Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793459871;
	b=gRgCYU3aoqNtPHW9LK9CBpYlUdrenBRRZpPn03ElmDBo8EEKnKi7znB6vlbpfjUvyR2I
	 R9/uM9KJ3th2aZ0K8oDAjRpubJ/v4KBsJAnuBiI7EVZ/kv2po2F70f6NwAu62u5I6+t0L
	 qwf1cAyrwhmK/dAlPzqaqK036ijKTrS2UFsNwinO38miD5LkCJPMd9CKsa6IBtSmei5sr
	 w2iM6xz1ZDVUucIqHgvyfPLjBmoJWZofpOqSxdWn9iZ93t6T5cuvzxzskU4KCua5psF60
	 z46okUQSMjx/RzjC213OLNs/1Tr7YpJj68ahyl0N88p6edVeFhdNjlS1BwIgv9xj7EQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793459871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ivGTWu4BzmKjaoJGyQkGLOIrnm8Ff1i6dz13M+a0Bvo=;
	b=QKxWUP9p3INTk/lID1apj15U1MOeBE8iK0EjNyuGLPPSgQgOK75xdL5lBvum5luJjEa+
	 0FZoVfBsI7dWTcwXPM37GsGSBlJOHLbyF59cmpDjNsDK3qguAmRYMF5mdAbe+L3y9d/qv
	 sp4s0jFdq+N4JHvK18KlXlPdpYCAHSxLM2kwM9oPvt0GriqB6k147kbBTKfTKrqEjPoKU
	 Do2/gcDIsn9CwTjJFmxnQFEYynwZzQRnlqFEa8zPZgHsyhaMKMbnphYIkNeyvfu8mlj0o
	 r3KVVTDT3WCzBjToxHYXDgdw7n5nbBShz3RthlYaMveyQElgzNTmDxU97ORHMYEm8tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnxYB9xZ;
	arc=fail smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E13606A31C
	for <linux-alpha@vger.kernel.org>; Sat, 31 Oct 2026 15:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E13606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnxYB9xZ
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so2487256a12.2
        for <linux-alpha@vger.kernel.org>; Sat, 31 Oct 2026 08:17:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793459869; cv=none;
        d=google.com; s=arc-20260327;
        b=s0/hcArS4KD9d65UTDfOBErAm+ZlPQzIxyiQqIi6HTAluhsFIDEeK0j8sgRG6NbBrr
         cnfmPF0LDLA/g9VmzaZBXa9ytr13tQ20JmEAdSXB8C9xcQScw2+tlf0wYkgTYtPzHvfd
         i1dArBAVp4PtwZtg9N11zQNBHoGqV2It8py1KpABEEMI4RerwhTsBI49gA5V3/xzR5Dj
         R3BuhM1RFDV4+/fPX74PBnugtHNkPRFoO2PKG89ubwA0CqFCvGM6vbTkQr67Z/qz8WIA
         cp8K86q4RQbsWIM+B6BRjKU8pDVM4Z+a5DkMgeG82nYPL3qgkosL8so4/qPfLJvtqEGc
         Yuyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ivGTWu4BzmKjaoJGyQkGLOIrnm8Ff1i6dz13M+a0Bvo=;
        fh=nK6gZhsjK0GG6SmC2l9T0VCjtyWXeldiEMqm8Aq+TLg=;
        b=stsHVe+BYRd3IqKd4Mdf7/tcSO+LB238PxO2D6jaMYhOyj1NbnP4TyjeRsOXbL2FlJ
         bdkb1F+FpfMWfK7qLYbTVyYVwOtt5xKKtq5VnLpYVKOxFsw6FjXx/CrCJzs4NaEWLU0a
         Y3fkutO8+YhbYEFK1QfHDCRmjwvXdjktTXRIo0fjvUwAV7BqAn9+HQBKyqZFw5+PVCpY
         v2tAgeiOzaGkazK+oBoKjVmkkfk0RXH2ytk7MKYZMAYQKvV40usCqkD++Bah3Y10n/2p
         r1cj8y3/P/+V+e5ew1w63KOcNqfalujJjLnIEJf18WOqqcnmMQobSu+/jbg2QNx/OLEU
         gA5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793459869; x=1794064669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ivGTWu4BzmKjaoJGyQkGLOIrnm8Ff1i6dz13M+a0Bvo=;
        b=cnxYB9xZtAZ/OPPwfPVy5DokNx7+PqeN31PtirnlApVGJaEXexayGOu0+0FqSxaPKs
         w0itJlM5mY1lcgTnVCd7ocx6fDlGoQ475odcb2GEYqYPmIuVk9z6IXbp0j5RPKO0ZpZa
         2WWnGyWG0FEtUYD/QThxLRdbZm01tJ5lWoZeC24odZpj0/Ly5Ikci+9HW5wZoqYg4Oiv
         bfEZj0RST1PQdKNzaqxziG3Hg5K6MPoPvfDm5/U5NUffHkoKwim355/cNr0GSdoGXIjL
         ORgPg1JZnOafvlligNzc7O75mFJPxq647A3arHncnSWr6gfmjpOrlc4iDpEipGEUYXgW
         eOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793459869; x=1794064669;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ivGTWu4BzmKjaoJGyQkGLOIrnm8Ff1i6dz13M+a0Bvo=;
        b=J0LLzfGev9GThf+euvLY9imKDNSr+g/oB29yzN+ZfU+U4c0WV7aW9zUMR2cyR+v451
         laRbZH693wQAjGytR6Ynf9ad0dGO/oYHqn0DdqnEsbTAaCiIkDezIDd+K3ZpsOC9DKdo
         kwutFfqgdvYEoTUydItJefR40a2XpAMAtF8EuqruuxxyJaEMh/L38WhsBvEJjqur2nSt
         6Pl5FL1KB2oc+FwNUv6iyk6TprZ/mMq8loAAhQhaY2aHPlBxeHo+V+5EaGQVpk0tcdMM
         sq7W93n5vKYCytcTYI8KzjUVXfPU2Zw0XpYpZJ8cfFEzYiPnIGo8AFkD+u648vr9MJ4t
         8f5g==
X-Forwarded-Encrypted: i=1; AKwUvBy2rk/pbUt+98U17dqkOzjkErNYbpzOrm9TufobQpa1NbEPU0tImKtRsuaJZImGr+lVknAAYiLbF7yV0g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIvGqZ9+zOiaTY2sMJjwW30eNYhlbcKEEfDBtmpq0PDsTNR8Ioe
	gNIQbidIOakkx+rteJyBD7e6W7H6GYAx5L/PKGGbtmotPTh9cJZVT3/FPilCy1EdlrRdWTryvKT
	Gs1nAAb0fvlYgXwxxREeIZCXmqJkZk3A=
X-Gm-Gg: AYBFou0Z1UaXJUSSWcvnbp3qtD8DG1u3eWE3p76+x7dz+tL2mmv5wxJJUYljLioyrkD
	fYnaZzYWQ/onLhJpybdR9Gm3HwJWRaXEGcRLkgJIbIR2VuRSov6uTDny3WHTdQOeg0SyD7dNxCH
	+PxI1hQR6GJyf/Xp9i9jgj6V0g57DIydkh5bJloLtBUVRf9G9cz0yPvCf2oVt1DEe8RFY2MoNZV
	NdTj+Zszloe2V0oHenk8gtviwXf1ZNOEbWXgmVAvFcr7t9zu73WyfAn9NVh7VwEj+YK0xDLty4V
	pp9SB/Shcwn9TlTELqXqrbCgOFlAhfDGYuSPXP+WOeN0XluAWcbgXKilfMmgw2lCY+7nB9x83Id
	fzDmTnctuG5UcYKvlMfccN6TixW8+Zc5ZZ7qsczp7zB2wc+WZYLuOGS9FE88Orp9Yh1LkjUxmrO
	4Qc0Ys+sZUrn4rnSr9vhHoXkvLgyHxrN2A5ghnGxEwbnem
X-Received: by 2002:a05:6402:2031:b0:6af:9a96:5324 with SMTP id
 4fb4d7f45d1cf-6b4d5edb541mr2916962a12.33.1793459868935; Sat, 31 Oct 2026
 08:17:48 -0700 (PDT)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com> <20261030-alpha-profileme-v2-1-c702f1c65272@gmail.com>
In-Reply-To: <20261030-alpha-profileme-v2-1-c702f1c65272@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 31 Oct 2026 16:17:37 +0100
X-Gm-Features: AclHuK_R4D8NWUtYc6iQtFezNeMcTpVIFAfFVK5FGtcztQRPo5Tx6TLf5qBIjwA
Message-ID: <CA+=Fv5Sqkh=N+ezg1K4WTvfkVgfDgdFUR0Af7FJWFZUx6sLwtw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the
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

On Fri, Oct 30, 2026 at 5:04=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> alpha_pmu_enable() passes EV67_PCTR_MODE_AGGREGATE to
> PERFMON_CMD_LOGGING_OPTIONS. That constant is the counting mode bit for
> PCTR_CTL, which belongs in the PERFMON_CMD_DESIRED_EVENTS argument. The
> logging options call takes a flag in bit 0 where 0 means "count all
> processes". It works only because EV67_PCTR_MODE_AGGREGATE happens to be
> 0.
>
> Table E-18 of the Alpha Architecture Reference Manual gives bit 0 the
> opposite sense, but the PALcode in the ES40 and ES47 firmware agrees
> with the above: it sets I_CTL[SPCE], which enables counting for all
> processes, unless bit 0 is set. Linux never sets the PME bit in the
> PCB, so if 0 meant "selected processes only", nothing would be counted.
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

Thanks for the update, tested as part of the v2 series on my
AlphaServer ES40. Looks good!

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
