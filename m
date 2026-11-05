Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793906312;
	b=Xgpt7dEW7Hsue+VkutJ/77h9xm6XqJCG2LO+K10uoLT7QwG8w2zwtofeSRFKBzfXIXwN
	 2M54LXGrFIioFhL6yGTPLn7MebxzA5zerXTMxygFeMgz4aXFVw1LK0qZZl2Hw2jsWkVLU
	 tHtbxfh5vEWmXgEJIKyuP0OvGgaoxGPddphNTUcQ6yzriSJqw8LCaOaDRjap7ZjDuXS5k
	 UxUU+X5IXLxdvl0R8qFmZjB5zhP7pDhTNmU1kkxz6MhNv/STVw1totMmWrTQRlFAYaGO8
	 znCRKo17UrAdvcyROFq/8XJCW73hpYXuPXhh7/7nRAPbuO3bkkcxUVbc20eozClvv7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8ul0rjJXaoWeOZXo5MyeFSNXQ8Y5r/rKYGo2ypC12Mo=;
	b=zw9QfVK9r8ebGp/o7gL60BZqDmeyUUuTNkR7ODVt7NVvEW69noAuys6xCxRCONwD7ixE
	 gEjGQSnd/y4LD/M8KTV+ktY4+hJ0JUalfquT8OrSOeSaHbvdQSYIUweUIoMSuanshNi2m
	 GRwGKkQlJXjh3dsluKXpMKg8pl8hmBZ+AL3QWqkYYtFGaAL8BIF6qJRZa0EU64q4XRkTT
	 eZPBncPT1LcO1/9gEUAPHjGr8s+lccO31Co3gZFYnRDafNnmZF/R318F7Xo1IxEwcUF//
	 QHV25FAWTCwiH6CSGodC3wBrsLRGhWnZWiheMhxkSg13XFKjAfEjrWQAXT43FjbgxQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mX4sNr6Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EA1606A32C
	for <linux-alpha@vger.kernel.org>; Thu,  5 Nov 2026 19:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53EA1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mX4sNr6Z
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b4b7dee316so1345547a12.0
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2026 11:18:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793906311; cv=none;
        d=google.com; s=arc-20260327;
        b=oGpUq2J7B04W1+5xmywI/MEcJoDcOSEJ3BEylLI0he74u132ZcRHivx0YHxL3uWaup
         LciyFw3mj1zzs6r+OqFrrCQZoytQtKKTm5SorMyfbiPoFGgJzI+TIAT7SAc0zC46fMKk
         +P0/AUN/6437xhYR35cVdMGP/8wNcinaocrcbpcC0aK9oGw/lNKZ6RLA7M2mWlRCNDhq
         LJruSa4+7rof3g+6rNtYzIJVSmMqPf8i1A3jAylBJG54phcoJhxLjn56wyOcSpJyf4A2
         M3V/BeWgU8fvHwdWfHr92cSBwXAMbWuB+fZ6WxsALBQBJhdOT6wmmGfj2AwAGJOytddx
         Pwpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8ul0rjJXaoWeOZXo5MyeFSNXQ8Y5r/rKYGo2ypC12Mo=;
        fh=mSWt+8ISOLxy2No5kHWOXEOiEfMh0GK6JRcL0/R8EVE=;
        b=QUmnqpT0r1dflywAJLClu1QwVeOcKj6k1AemIfyx1eeQTXq3No2bFIoeTB4Z2wfn9S
         NddnFGTDWV7Ui6LcbmOhnpfQSb/p1FGPA9AjjStnribhr6Gv+fXn1vboGcKDsKNgx9ZQ
         VDibrmiK+IWoqp1yu4IrerWzeSWXJ9mpGrF/l4NjD9qsod5SN3lbfnGt4m5hdH2SIaaG
         /LeS0f5+vvZJ8YUwZcaeqGk7RUYdlQ2v/PN8XQwD5SUmatb8Z0m3I8TbtWXNH2envdrF
         1jTHk35WF49rynZxGrFyvt75oj663oStDH24Ad/nlTXhyl2bJTvClgJLH15ENVRiXsPb
         9/Tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793906311; x=1794511111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ul0rjJXaoWeOZXo5MyeFSNXQ8Y5r/rKYGo2ypC12Mo=;
        b=mX4sNr6Zkw9XI2yPtlzXIuJu74w6sORU67ccRBFHdANMCFmWqqLC57E5pyPsKb7T/+
         uuzA09tFEdgwV7FnmM9l64n7BEq4wguoY0cuDSedCwv9N10rd4nCz3F993e6jQEOHLRf
         c2fEq07kueO+WL1xxtGbWoGHOPdxNhmWvMozF26p/+7H6oidkaZIhXrrAmfW5oFNeL6i
         tnQREi+ksIH0h+fbQzceeBDfOwr/X0CxDfTojVdzPkUGaX+7jfuChVR1u6HrIgg1izT7
         fi4KDrGulEJSmerkA7P/raIOOQ0g3v/59DVa8zp6mkXwnIcEhwa//eykqLpiytZugINd
         Mrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793906311; x=1794511111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ul0rjJXaoWeOZXo5MyeFSNXQ8Y5r/rKYGo2ypC12Mo=;
        b=iguUJqz/ftr7uAUzdSFRqsgk0a2zpnl3QnGezeG3O04eomHLT3vLeGArIuEmxyfxnW
         Rhm8KvtLeFxiFguZ4+nstIcOWk6SqtNZG5qFRONR+9kH1nmfy1vgaSJzA5binGx7yr+6
         4vlkdlf2Oy6dcdoZbkzuJ23bDBww5Z9EfGPakpRgAoe/TX82kzpmMtDd2LBj8rGknhSf
         zLkrKZWs794lDdnRXbBxvLTeJaL1u1FvhLtWUHSZJDYvPMiq2Hma+8Rh7rZcl+q2LxJR
         i8ffSqmA3rca2eRSJYrSMIJB2LnaYNBtY7SUYwr4b++efPH7bSFUAGm7oIA/H5BXwhJR
         IScQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhdSIsFB1YJIVp+QQLNH9ommeV5Z7X6CY4euodVXFllQNlIAU0kq2KUFdX2EbpidxcbdSShWl6FP3J8g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZFlmRvaxseGssq2DXEVA0eakpCUJLZqWXVxw8ImrfPGBzRIBL
	Zgo9NajoGtTKMoqLHPLON4fxLnsCw86ak8JpfDfvIdLi3OXQtf86w4QME4PWCo9M6FPp4dl1ZpP
	UmuS3p0lfmfiHAEZrDRBHdgyeyWMGaec=
X-Gm-Gg: AYBFou3Mj81P94ETBIISthIk7fIIwdVpSzHJC5Zcdhya+6f4WJo0nnsBTAXnxrL3LC0
	0E0TQUczNb+uvQ+qFyMdOovb5RTHMNViBm0UB+JHp9nNMGFMDr6Ezg2rDdXANlQkYrnCCNeCSkx
	8E54YaEMrRDrzPz4ycBPDyHyg54VI3eBCamP1sg8faVhppzb4Z1EMxoSfeDI9Pvv5kDv/52gwhp
	kItWVqcd5qkCerWgHVTZmvAUNptLqKFI9Y8jJ02XtQzXT7ATeDpx+SZfmAgCiLSxS7l9O5BIgBK
	ZITRP8Be1MIoKmdOKlEeyJCVmBSCqnwo5AbHAjCL10aAEGk37E0EnF5pRhc7D7sX+m6hgcVXfJs
	hldTHUVRSqPvdtHioDgv9klmnPUor366legaRuRsotmDsW3JTyWkuwhUTosZrb53Ywk+hlvr3oG
	eXlpV+1n7rUsxZY2RCnXgHolo=
X-Received: by 2002:a05:6402:2809:b0:6b5:8247:7bd2 with SMTP id
 4fb4d7f45d1cf-6b59752e5ecmr192245a12.3.1793906310496; Thu, 05 Nov 2026
 11:18:30 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com> <20261104-alpha-profileme-v6-13-63362e9290a3@gmail.com>
In-Reply-To: <20261104-alpha-profileme-v6-13-63362e9290a3@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 5 Nov 2026 20:18:18 +0100
X-Gm-Features: AclHuK9rqLSlmxxFUHUNKij2bInqq2qoTL5wATrmtOQUvBJn0UfhkLxA_3fmAGs
Message-ID: <CA+=Fv5Qi9R=+0fkPsKrJBRThYfdUQdH3hvQ6+0oW-1UjeNm8_w@mail.gmail.com>
Subject: Re: [PATCH v6 13/13] alpha/perf: honor exclude_user and
 exclude_kernel for ProfileMe events
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
> The PMU sets PERF_PMU_CAP_NO_EXCLUDE, as the counters count in every
> mode. perf record then fails for unprivileged users: at the default
> perf_event_paranoid of 2, the tool sets exclude_kernel for them.
>
> A ProfileMe sample says which mode the profiled instruction ran in, so
> the excluded samples can be dropped, as AMD IBS does with swfilt. Do
> that for ProfileMe events, counting PALmode as kernel, and ignore
> exclude_hv, as there is no hypervisor. A sample that falls back to the
> interrupted PC is dropped if either its PC or the profiled instruction
> is in an excluded mode. Aggregate events cannot tell, so event_init
> now rejects their exclude bits itself, along with exclude_idle,
> exclude_guest and exclude_host for all events.
>
> The event count, and what PCTR1 counted during a window, still include
> the excluded modes, as they do for IBS.
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/perf_event.c | 47 ++++++++++++++++++++++++++++++++++--=
------
>  1 file changed, 38 insertions(+), 9 deletions(-)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index 7e34eac0ea47..c75d204076fa 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -832,6 +832,18 @@ static int __hw_perf_event_init(struct perf_event *e=
vent)
>                 return -EINVAL;
>         hwc->flags =3D profileme ? ALPHA_PERF_FLAG_PROFILEME : 0;
>
> +       /*
> +        * The counters count in every mode, but ProfileMe samples say wh=
ich
> +        * mode the profiled instruction ran in, so those that are exclud=
ed can
> +        * be dropped. PALmode counts as kernel, and exclude_hv is ignore=
d, as
> +        * there is no hypervisor.
> +        */
> +       if (attr->exclude_idle || attr->exclude_guest || attr->exclude_ho=
st)
> +               return -EINVAL;
> +       if (!profileme &&
> +           (attr->exclude_user || attr->exclude_kernel || attr->exclude_=
hv))
> +               return -EINVAL;
> +
>         if (attr->config1 & ~ALPHA_PERF_CONFIG1_FILTERS)
>                 return -EINVAL;
>         if (attr->config1 && !profileme)
> @@ -983,7 +995,6 @@ static struct pmu pmu =3D {
>         .stop           =3D alpha_pmu_stop,
>         .read           =3D alpha_pmu_read,
>         .attr_groups    =3D ev67_attr_groups,
> -       .capabilities   =3D PERF_PMU_CAP_NO_EXCLUDE,
>  };
>
>
> @@ -1140,6 +1151,24 @@ static u64 alpha_profileme_status(unsigned long i_=
stat,
>         return status;
>  }
>
> +/*
> + * Whether exclude_user or exclude_kernel rules out a sample of the prof=
iled
> + * instruction at pmpc, reported at pc. A PALmode PMPC counts as kernel.=
 The
> + * two differ only when the sample falls back to the interrupted PC, and
> + * such a sample is then dropped if either mode is excluded.
> + */
> +static bool alpha_profileme_excluded(struct perf_event *event,
> +                                    unsigned long pmpc, unsigned long pc=
)
> +{
> +       bool pm_user =3D !(pmpc & EV67_PMPC_PAL) &&
> +                      (pmpc & EV67_PMPC_PC_MASK) < TASK_SIZE;
> +       bool user =3D pc < TASK_SIZE;
> +
> +       if (event->attr.exclude_user && (pm_user || user))
> +               return true;
> +       return event->attr.exclude_kernel && !(pm_user && user);
> +}
> +
>  /* What the memory instruction at pc does, or PERF_MEM_OP_NA. */
>  static u64 alpha_profileme_mem_op(unsigned long pc)
>  {
> @@ -1250,14 +1279,6 @@ static void alpha_perf_event_profileme(struct perf=
_event *event,
>                 local64_add(ovr, &hwc->period_left);
>         }
>
> -       /* A dropped sample still counts, for throttling and frequency mo=
de. */
> -       if ((alpha_profileme_status(i_stat, pctr_ctl, pmpc) & hwc->config=
) !=3D
> -           hwc->config) {
> -               if (alpha_perf_event_set_period(event, hwc, 0))
> -                       perf_event_account_interrupt(event);
> -               return;
> -       }
> -
>         /*
>          * Attribute the sample to the profiled instruction rather than t=
o
>          * wherever the interrupt landed. perf takes the sample's mode,
> @@ -1303,6 +1324,14 @@ static void alpha_perf_event_profileme(struct perf=
_event *event,
>                 memset(pm_regs, 0, sizeof(*pm_regs));
>         }
>
> +       /* A dropped sample still counts, for throttling and frequency mo=
de. */
> +       if ((alpha_profileme_status(i_stat, pctr_ctl, pmpc) & hwc->config=
) !=3D
> +           hwc->config || alpha_profileme_excluded(event, pmpc, pc)) {
> +               if (alpha_perf_event_set_period(event, hwc, 0))
> +                       perf_event_account_interrupt(event);
> +               return;
> +       }
> +
>         perf_sample_data_init(&data, 0, hwc->last_period);
>         if (pc_only)
>                 alpha_profileme_drop_regs(event, &data, PERF_SAMPLE_REGS_=
USER |
>
> --
> 2.55.0
>

Tested user-only and kernel-only recordings on all three CPUs of my
ES40. I checked both the raw PMPC and the reported sample mode.

With perf_event_paranoid=3D2, an unprivileged process also recorded
203 user-only samples. Every sample had a user PMPC matching its IP.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
