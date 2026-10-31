Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793465732;
	b=wWU8xuw2mfEq0pFhlVIXIxN2a1X8XacVuR/YDUGKmYQB+qSoPV58z7W48IJGnvR3Ibb+
	 l4c1Vm7fqS49HsUHjr/rJ5AG3WvQ8dyOEblX2PQBzdZyKZ1OS2zZnmGUo+HAEBs/CbhdE
	 8WB9s33Nx5oXyop/hop8QVxVQAUhoOfgtaVMYXm1Bpv2lUPisUkV0e1x7RXfPC/p+ARlb
	 NG1ybyH6Bx9cIkLLb59DNEbsCLimWL6jwygUTEOpRStCHhN93nZJiyF+Z18jdUhoiujN8
	 KkY3Lb4Tal7iAE0hZeSIIpkSUB2dfH+1wBqU5A/FaG1X4dhSelr4fqVt/ES5pG/Enjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K3AF4yhejw1zi/AA2enCSIBecmS/SX7iKrYz1efJHMs=;
	b=qBE/aXzjuMVitkHiitAjU1UUmkC8Q/rhHSIRZhe40g3lYWZOBHw0fV+mRcaC+wqENTU6
	 Fbok4/4aqurMMaoy53i39MdL85K4/4JpOsHe9T39wJFQPWk1U+HN/8T75gSM6nkw9igkZ
	 /DFFSyJHA44t4wC0VH+3/El4C9kuv79p+3fsdGoMdTV0lMwqu8kCBjAl85NzRZoL/97ZL
	 ijm+hhwcKogjijLCYFKOl3wF6BkoPOThJK2KoCwwC4XgYLaJCxFB+Rotuttdr7cAHUj7v
	 DXcMKSEVgWQu2YezlvQcXNxQJ7IVf5Zq4HUI3E8JG58COdqTixZm4+QQam8aUnUnErw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iKfmBFaO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC49606A31A
	for <linux-alpha@vger.kernel.org>; Sat, 31 Oct 2026 16:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC49606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iKfmBFaO
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4301e334ceso131763966b.1
        for <linux-alpha@vger.kernel.org>; Sat, 31 Oct 2026 09:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793465730; cv=none;
        d=google.com; s=arc-20260327;
        b=gaBQjcDZ/NA7EmENdPxWr3XOfHhMfs8HNrBXQrG2BgSQBEeDFts8dc2/8VDla7gT+K
         PYf+2mxKLF+s26ERdkz1k4sPW6h1pZxe8C4tfOInJNaHIKMg1utJyUREHXZ7QmRgbWl8
         thNxD3/St/kN15cbdQmffS5NeJwRdRtm9iulDMcL8vLBKrWmkK/tbCkxVIJ58oXdqAyG
         cTKhpaNCxh57e696mmkprSvnujfK/0nJ31EznLDChtndC6SkzZt/xOU9RJBL9CZmiOvr
         eizfYzve7TtA+uxoT65pRd6Qd3s2uWXV/y1ALPlDMz0zGYRGemgEd2HqG2PyfCR1Ii1r
         8I/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K3AF4yhejw1zi/AA2enCSIBecmS/SX7iKrYz1efJHMs=;
        fh=kzmCu+yy5WVuodHLzgoVL1rLqtrCS9IggIRQf3AA1iI=;
        b=QrcdlciKWf/HlalMsBy/YRfdkNTmz30mMCU1vuAWX+ZUC6iqB/kQPNr2PGv2OihxYr
         3aH1YRDGGfWPXUfitdYCaf1Ia5k/2GKE1QzGtIrQ4zJuf3iGn0LJNyhpzPw94jeR+6Za
         9ZBmNG9iHuakuCcMNAHN01CH5EG4rlTpqazFZWZkxWWSpR+FnNxRuQ2Civ7P8dEgvXqw
         bynlz2OpEH0HT29pMdRyXkEuUhyYj0KMtOoBpeBi7mHQiEnbe0tTSFyepLgKx9TBUJ+u
         fGv06jfhDxfNvRd9VAgMvFlV4PrQ8u0MCP9WN9OqN7S9cPYzyN5dc1L76IOFB3U5cujo
         G9MQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793465730; x=1794070530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K3AF4yhejw1zi/AA2enCSIBecmS/SX7iKrYz1efJHMs=;
        b=iKfmBFaO1qcZGGI4H7JNSxj7oj8c5/6s7Vax8sgKFZjJlHrMQS1enaClD4f3FDXMnt
         dtwvj9gSO3p2T7lAjAT/31qSboEVvGvkl5P6aGoAa6ES+/bCPlB/77KHVyrC7nccZBDz
         lxTIzCVgqCCNLLpatpcal7M+Z9bgteex6lf55JqgMVK4xPaejgccN+E+wUb99IUY6GeX
         TXPXGvrBcrtIpBwXpxFRXwCy7Fgysrsvl9n7xPyeLMPeaHhRYq/xFOshB5l2pheVevu9
         d9GDq25zA6BNagVZ5BT6/GrphzSqigB0XH4grQrtryxT3UW0JBpAMW1E2LDmy/lQfcb/
         lOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793465730; x=1794070530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3AF4yhejw1zi/AA2enCSIBecmS/SX7iKrYz1efJHMs=;
        b=PosStHvYVZiRNAv1gLUe7GKbJYfOE5VWPIA8BssfxS0nNwPVlh97mX4jb9mjs3vxEJ
         h44K3lvxR7IFBUWvL4e5Qhah+x3w+MmCVvQFzA0kQo31OLGskuq6OXYowQgqzioe3A23
         VMZNf1/Q11m74A1/lg0ZGi96ldR5uWbsAObT6rTNVigppLGfH9jfmb/JrzaM6JdWjNIJ
         gkwhp35XT+x5gSrFJRnjpJ/S6RRGTIYnkjzDiRh25cxuppWC3/aRCWbMtY4wijCaj8TT
         ZdBgVwB1kY1vWFHAcxJr4TYdR5NSdSThNNKGtpDLKQaA5a9qcuzxUyoTYmbr4WtZdGwZ
         XU2A==
X-Forwarded-Encrypted: i=1; AKwUvByipSO1kACCq2W6y4LTlO1MWJKQNrQN5vKC4uUIT2we4+xlTZb8DkKAdvZu773u8/7zacW8blc+RUpRyQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJlNzL/k2r5tmSGwNTFOHYZ+dVNW399CRzfu7fcn8SAnScthG3u
	99fwLNHwTtFER9Klid2dCMRWiMfa9ifDLD1mGMr4KDEnCFGLhrEykbFsQeRLVwECk1+AyyT/jEH
	pib5a6rKoNT6HQwNlnF5OShSOehSQUBY=
X-Gm-Gg: AYBFou05w1VCkIXqc+GOiTPAeu6yrFESqTVFK58NvuhraL8AXPBhPUVP/5VPRunKotJ
	AAqmHz///ohz4Y+/xZD5jmnB8XXWvDSvvUcgOk2aWOD3gwnwTFmXCdzZc7ukfYC586YjPrlVLVc
	ULUVP+0Ntd5Pzv7uQg/lbW+Kqyfq/dOvxXtOyJjVxYQEEl70ryLzVDVqpqJLwLWn6JFZ8nFxhXf
	ZNGLUNxmuChD1Ph+1sqaeEeeY5EugzQjcqjcArolHj0KjjMj/5E4wofIe+SHcUhlYS+T/BWK/Lh
	HrqpLGw4O8Z9yM8wzV8g2FAiT2NDBIPiUkOQ7EOgoqIgXfPdyoZZjUuXiogJiXSe7GZlkAlEjhy
	pFX0PdZKQhCc0CgznhCuRk2kquu5AwvRcDTCKEDswjNb2hrbyuENW8ekGnosCeIBTBo7r5YVvfL
	cjtM6LblkHHaPPz4CCDK8fbsU=
X-Received: by 2002:a17:907:d9f:b0:c40:b477:dfa0 with SMTP id
 a640c23a62f3a-c4ca7a46ab6mr449889766b.18.1793465729824; Sat, 31 Oct 2026
 09:55:29 -0700 (PDT)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com> <20261030-alpha-profileme-v2-4-c702f1c65272@gmail.com>
In-Reply-To: <20261030-alpha-profileme-v2-4-c702f1c65272@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 31 Oct 2026 17:55:18 +0100
X-Gm-Features: AclHuK9VG7SljAuL-qamMShABUtKfhaQI7d13gpXjDolIqZkv45p0cl55F8_LIQ
Message-ID: <CA+=Fv5QT6MwHYwXzX5ttrH=XWQHZV0xdjoe76YD9BjqjTwAMCQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] alpha/perf: attach ProfileMe status as
 PERF_SAMPLE_RAW data
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
> A ProfileMe sample's PC alone does not say what happened to the profiled
> instruction. I_STAT and PCTR_CTL do: whether it trapped and why, was
> mispredicted, stalled, or was killed on a wrong path, and what PCTR1
> counted during the window.
>
> With PERF_SAMPLE_RAW, attach PMPC, I_STAT and PCTR_CTL to each ProfileMe
> sample in a versioned struct alpha_profileme_sample. PMPC is included
> because a PALmode PMPC is not the sample's IP. Killed instructions can be
> told apart by PM_KILLED_BM and VAL. The 64-bit fields are packed after
> the 32-bit version, since the payload follows the 32-bit raw size in the
> sample record: they are then 8-byte aligned in the record, which needs
> no padding.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/perf_event.h      |  2 ++
>  arch/alpha/include/uapi/asm/perf_event.h | 31 ++++++++++++++++++++++++++=
+++++
>  arch/alpha/kernel/perf_event.c           | 22 +++++++++++++++++++---
>  3 files changed, 52 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/include/asm/perf_event.h b/arch/alpha/include/asm=
/perf_event.h
> index 72536566014a..f498c1d47c07 100644
> --- a/arch/alpha/include/asm/perf_event.h
> +++ b/arch/alpha/include/asm/perf_event.h
> @@ -1,6 +1,8 @@
>  #ifndef __ASM_ALPHA_PERF_EVENT_H
>  #define __ASM_ALPHA_PERF_EVENT_H
>
> +#include <uapi/asm/perf_event.h>
> +
>  /*
>   * Software events have no trap frame, so perf_fetch_caller_regs() fills
>   * in a zeroed pt_regs. A zero ps already means kernel mode; only pc is
> diff --git a/arch/alpha/include/uapi/asm/perf_event.h b/arch/alpha/includ=
e/uapi/asm/perf_event.h
> new file mode 100644
> index 000000000000..aa0eff5a917c
> --- /dev/null
> +++ b/arch/alpha/include/uapi/asm/perf_event.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef _UAPI_ASM_ALPHA_PERF_EVENT_H
> +#define _UAPI_ASM_ALPHA_PERF_EVENT_H
> +
> +#include <linux/types.h>
> +
> +/*
> + * PERF_SAMPLE_RAW payload of a ProfileMe sample from the cpu PMU.
> + *
> + * pmpc, i_stat and pctr_ctl are the values of the PMPC, I_STAT and
> + * PCTR_CTL registers when the ProfileMe window closed. i_stat holds onl=
y
> + * bits 40:30 and pctr_ctl only bits 47:0. See the EV67/EV68 Hardware
> + * Reference Manuals for the field layout.
> + *
> + * In the sample record the payload follows the 32-bit PERF_SAMPLE_RAW
> + * size, so it starts 4 bytes past an 8-byte boundary. The 64-bit fields
> + * are packed after the 32-bit version so that they are 8-byte aligned i=
n
> + * the record and no padding follows the payload.
> + *
> + * Fields may be added to the end in later versions.
> + */
> +#define ALPHA_PROFILEME_SAMPLE_VERSION 1
> +
> +struct alpha_profileme_sample {
> +       __u32 version;
> +       __u64 pmpc __attribute__((packed));
> +       __u64 i_stat __attribute__((packed));
> +       __u64 pctr_ctl __attribute__((packed));
> +};
> +
> +#endif /* _UAPI_ASM_ALPHA_PERF_EVENT_H */
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index c7f0ccf8ec80..c9d4b13817bc 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -944,10 +944,13 @@ static void alpha_perf_event_profileme(struct perf_=
event *event,
>                                        struct hw_perf_event *hwc,
>                                        struct pt_regs *regs)
>  {
> +       struct alpha_profileme_sample pm;
> +       struct perf_raw_record raw;
>         struct perf_sample_data data;
>         struct pt_regs *pm_regs;
> -       unsigned long i_stat, pmpc, ovr, pc, saved_pc, saved_ps;
> +       unsigned long pctr_ctl, i_stat, pmpc, ovr, pc, saved_pc, saved_ps=
;
>
> +       pctr_ctl =3D wrperfmon(PERFMON_CMD_READ, 0);
>         i_stat =3D wrperfmon(PERFMON_CMD_I_STAT, 0);
>         pmpc =3D wrperfmon(PERFMON_CMD_PMPC, 0);
>
> @@ -982,8 +985,8 @@ static void alpha_perf_event_profileme(struct perf_ev=
ent *event,
>          * happens for ITB miss, Istream access violation and interrupt
>          * redirects, and for instructions inside PALcode. Keep the
>          * interrupted PC, which for redirects is the instruction that
> -        * trapped. Do the same for a user PMPC in a kernel thread, which=
 has
> -        * no user frame.
> +        * trapped, and report the real PMPC in the raw data. Do the same
> +        * for a user PMPC in a kernel thread, which has no user frame.
>          */
>         pm_regs =3D regs;
>         pc =3D pmpc & EV67_PMPC_PC_MASK;
> @@ -1001,6 +1004,19 @@ static void alpha_perf_event_profileme(struct perf=
_event *event,
>
>         perf_sample_data_init(&data, 0, hwc->last_period);
>
> +       pm.version =3D ALPHA_PROFILEME_SAMPLE_VERSION;
> +       pm.pmpc =3D pmpc;
> +       pm.i_stat =3D i_stat;
> +       /* PALcode sign-extends bit 47 of PCTR_CTL. */
> +       pm.pctr_ctl =3D pctr_ctl & GENMASK(47, 0);
> +       raw =3D (struct perf_raw_record) {
> +               .frag =3D {
> +                       .size =3D sizeof(pm),
> +                       .data =3D &pm,
> +               },
> +       };
> +       perf_sample_save_raw_data(&data, event, &raw);
> +
>         if (!alpha_perf_event_set_period(event, hwc, 0))
>                 return;
>
>
> --
> 2.55.0
>

I checked the raw samples from all four ProfileMe modes on my ES40.
The selectors matched the configured events, and I saw the VAL, TAK,
killed and stalled bits set in the recordings.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
