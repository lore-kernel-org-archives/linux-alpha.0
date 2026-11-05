Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793905846;
	b=mWI0JeZY3n1ghcxnimt6VImrA5xapyCS+Q9ukh6OdjtKPmtdzOeZqbd3h68xk8ys1TGs
	 o//YgIyWrVKbd9ZuthABXcLKvDf8PiL9Kf4hwMFNesWn0Tfvc27GNL02OR9pWz1NUnK46
	 xe0K84KOCO/noykfrAxl2gS4Bxzi0ANNkNd+NiPKUuxH4+Bu5t2g7J4BJhPa6qxzm1dK5
	 N9rS6DRjzP6MQdfRmiIJNPKoiGmDyoq/0rhB688lLrto9kcCmo5qmk9CKN+qp+/4O7KpW
	 +4/phKkjomaf0raElLRAsNWIGiooQZMhrUlNfYmQlNorydtJwsXCz5RZ0uGCiRCKsVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+AM8lcqsy+CxgzlQagVQC8tY9g7kqqsxFRFS2BKb6pM=;
	b=VEXq0fN4II1zCeSw/XIKXO9jMtzSsq+NOJlIEDBbxJ8dih4+H0zvwrcU6L7cyVF81b9r
	 1choZhMspqNk18kdnkZHkU14i92DZRU1LG6NaL6KKXjCwgdtO/ePfFdb8M0NFu7/Y5ZrR
	 jluNS/NgZKnQgdym3+alXiZiqN5S4NULl6dnqrL1+8gGC2UONEPaGuMhZlWS/aiDBXBZ9
	 MOpylyE+j1oiV4SBOnC51hHZ3B6T+9ZKbXDV5/Fl+/YbOwPoMDe+fw37QOHKsgpvBZJNr
	 WEm2n12nAxEI5283DvhxU2vyg2it3a+CYJnjFV1AxhV7VJb0UxnY4ZYQAbdPvsytdMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KKce5+QX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12444606A32D
	for <linux-alpha@vger.kernel.org>; Thu,  5 Nov 2026 19:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12444606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KKce5+QX
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so890880a12.0
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2026 11:10:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793905844; cv=none;
        d=google.com; s=arc-20260327;
        b=njlGnkaXG4DSE0YLBE+KkDixvpqcteMNtD/JguGNDBGm80Fk5JzHTyZKXb56MtQxig
         hg6/OWVRJH+qQfVLUmg9pt6swRPof3Bu8Pq8FTPnxXbr6JV2zaR8a72FFWTVdwEltk7O
         Q8QtjTj/WPEX92MvE3tg+1dnnvkQH7t3pPRbtq0OFcKQ92vBLl7qzcWikrDzMl9mT3UD
         lta58CFBRSUOpNfaNnpA4o3Zhy5GtkU/VpD6YALijElXKxWhMRgfSAPg5X9RXNgmO0nX
         MyIBNmPAFiluTNgnV7/rd3+Gsse85iqBpL242AhaLRVhv/8D8PaFrK/J0OAc23p0SZUM
         jjCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+AM8lcqsy+CxgzlQagVQC8tY9g7kqqsxFRFS2BKb6pM=;
        fh=sItJESet2TyYAMJJkJLV/MSwE1DAZGD7Y1o8yAe9ud4=;
        b=K+XzISMoJFLMynG3hHZQhg3fVNlfF2IQlpaKkUi4flPGjqXg9okqqK92F2+fs0bSKb
         W9SvSYa4n4Wn66kw1rcdrC5F8bIX0qUMaiKks5rEtZcyY2xVoBy9S66S6aW3nh5BzFby
         8xqIs6DXD7A1BnsfGsqEO3FOL8WnZFVGdndlptg6X7Au6iSmAHUsclpW0FQW5GCcvZSD
         a3W+2cBsQYRbYeTm7Kg0WBSjaj4fLwgwTQ3pWPB3OHBxJppZ8ylwm19ye1IPE/QXxZru
         H3398bbWOFWU6aIvuoBZ8SFwEJZTBITVM2ZicS5eYLvRn7M1ECxuWimQKuLUEG5e/o1j
         6jiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793905844; x=1794510644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+AM8lcqsy+CxgzlQagVQC8tY9g7kqqsxFRFS2BKb6pM=;
        b=KKce5+QXwWV53MZswELq0HZDzvaKXn87EMbyDcqdDb26jZW6Bpc6ff16G7VxMNtgeC
         oytKJ2fJ30+slKtIpLUNaVNRVK8XuY3EfTEfM2UCDqKztHTu2iBZ2hxkgtSOjmjZH+91
         MdbBs/+gOs/udGy0Xm9x9lJXwWS3P5U4ccoPGqLuH9XEsz5oviSw/O9lq/gWG/dL/xyL
         9rtg3+2lcwTf3A5kW40X0bP/E8mXXlbfYA5p2txNhYHTvxGj+fShbNkgGeTRRt3Qq1Ht
         FstQni5jjx7BkZheD6YOATmjdg7XxaJYD9TU2LfkSBOyLrwDJzAcUl1IcurEXwZsvVAt
         Touw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793905844; x=1794510644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+AM8lcqsy+CxgzlQagVQC8tY9g7kqqsxFRFS2BKb6pM=;
        b=wtJ1ATVqadDiZW7xC7iuP35Dio3OTnQnx17dxiplZtIAPHZJkc+TUZODHxNK2r4MtJ
         pZ5aw/oV8Rx0M0IoYno9o68m9qSOopG9XqLm7sVrv4scwMAwbZuvdN5neaNNOOn3hIgf
         tZqEqqMzyosZy4ttgX37v/qT1EqBtfTshMcnvjqqR+6f1MRxfj7Oks2L12O7sNtclUoB
         JxTQGyB6hiNQuEC89Yshz/TNY46fPUObWl1LmwoApsff4V+hdgEnQl+4pnUiE873t8oX
         XwHA+yzKITVltmKDq00G36kj6SXZzHMmfj89VA1X1WfV5UlIm2ecajrotRNyk/vHVeld
         kEag==
X-Forwarded-Encrypted: i=1; AKwUvBzxJlDe25rEbEy2v9KOh9BJeqA6XxTf6mFgcrwQGB2SrS8FGdxoA7wTHj6XiQUK+JNHqcQfZJGJKEfjBg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9lyy632WnX9l/OX3IrKJgfAyZNtql7XRahM1YdRmrSp6P+LqCp
	nIIn++XhnZ8CdUJ6S04mACPqIlgEucM1eR0j20j079hCG0os5MPpUBtDhqSM5JBcHRCST5kw8qK
	gVGKPgSAFMjChPtnSUQtnvXbcUJDGC0g=
X-Gm-Gg: AYBFou0TAeA1tKLCCqET2tMrvRslsGDzjWthAtSLgtjvZbXD1aGBjbdPcK/JAmn+P95
	OJnWq4TAgOvIFSPkU3ep43vB/Zh55Yz8HgJ5nXKFip+4fMvQCJ77qsO14dE4qxF29+IzJ7aIt+/
	83R9pCaopwCxn4llnnNaOqghkbRWh5g23RVnQPzp5u1YmnaE1J0LRHBMPCouow8TzgGfkqssGXo
	lfjbZSYe4oTFHqYDc1Y6vvsaAubXy5gCawK3y9wMJf8JzheZjTzJTTipLO8FWreNob6ecD6WuHN
	HqKasOU7E/hImVXPAGYJbzTufuz3YWIEF7/vB6IYQwuo/8VbL371uzEScNjscTmVfAbXl0Mk+OI
	GgOy71HSQdW15LmaNz4o3UHNts0X5GDRI5oCTwT9nC8tnz0xGLdbGH8fKhlFxm2T0DqM/wUT3EY
	ot0H8WTliB4ioNgB4b5UC3Bgc=
X-Received: by 2002:a05:6402:1ed5:b0:6b5:7037:eacf with SMTP id
 4fb4d7f45d1cf-6b59783040dmr129797a12.42.1793905844112; Thu, 05 Nov 2026
 11:10:44 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com> <20261104-alpha-profileme-v6-11-63362e9290a3@gmail.com>
In-Reply-To: <20261104-alpha-profileme-v6-11-63362e9290a3@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 5 Nov 2026 20:10:31 +0100
X-Gm-Features: AclHuK_UxhQhB1NzkasFpqvaIZPPz7RAAyZyknERGPMDjzr9Els24kIr9QOsaUQ
Message-ID: <CA+=Fv5RNbPkRZjdcWGO6U3LV5A=WifOGZYFiEf=M0QVx9b8M9w@mail.gmail.com>
Subject: Re: [PATCH v6 11/13] alpha/perf: add ProfileMe sample filters
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
> ProfileMe samples any fetched instruction, including those killed on a
> wrong path, and what happened to it is only in the PERF_SAMPLE_RAW data.
>
> Add three config1 bits that keep only the samples of instructions that:
>
>   retired     retired. VAL says so for an instruction that did not trap,
>               and the trap type for one that did.
>   mispredict  were mispredicted conditional branches.
>   trapped     trapped, mispredicts included, or caused an ITB miss,
>               Istream access violation or interrupt redirect.
>
> A sample must match every bit that is set, as with Arm SPE's
> event_filter. The driver drops the samples that do not, and they still
> count as interrupts for throttling and frequency mode.
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/wrperfmon.h | 10 +++++
>  arch/alpha/kernel/perf_event.c     | 83 ++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 93 insertions(+)
>
> diff --git a/arch/alpha/include/asm/wrperfmon.h b/arch/alpha/include/asm/=
wrperfmon.h
> index dc24c7cb45db..6526438e73ee 100644
> --- a/arch/alpha/include/asm/wrperfmon.h
> +++ b/arch/alpha/include/asm/wrperfmon.h
> @@ -106,9 +106,14 @@
>  #define EV67_I_STAT_MIS (1UL<<40)
>
>  /* I_STAT[TRAP_TYPE] values */
> +#define EV67_TRAP_REPLAY 0
>  #define EV67_TRAP_DTB_DOUBLE_3 2
>  #define EV67_TRAP_DTB_DOUBLE_4 3
> +#define EV67_TRAP_FEN 4
> +#define EV67_TRAP_UNALIGNED 5
>  #define EV67_TRAP_DTB_SINGLE 6
> +#define EV67_TRAP_DFAULT 7
> +#define EV67_TRAP_OPCDEC 8
>
>  #define EV67_PCTR_VAL (1UL<<1)
>  #define EV67_PCTR_PM_KILLED_BM (1UL<<26)
> @@ -116,5 +121,10 @@
>  /* PMPC bits 63:2 hold the profiled PC. Bit 0 set means a PALmode addres=
s. */
>  #define EV67_PMPC_PAL (1UL<<0)
>  #define EV67_PMPC_PC_MASK (~3UL)
> +/* PMPC[14:0] of the redirect traps, which do not set I_STAT[TRP] */
> +#define EV67_PMPC_PAL_OFFSET_MASK 0x7fffUL
> +#define EV67_PMPC_IACV 0x0481
> +#define EV67_PMPC_ITB_MISS 0x0581
> +#define EV67_PMPC_INTERRUPT 0x0681
>
>  #endif
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index 0723e1042145..32a8b5c98381 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -39,6 +39,13 @@
>  #define ALPHA_PERF_CONFIG_EVENT                0xffULL
>  #define ALPHA_PERF_CONFIG_PROFILEME    BIT_ULL(8)
>  #define ALPHA_PERF_CONFIG_RANDOMIZE    BIT_ULL(9)
> +/* attr.config1 of a ProfileMe event: keep only samples of these insns. =
*/
> +#define ALPHA_PERF_CONFIG1_RETIRED     BIT_ULL(0)
> +#define ALPHA_PERF_CONFIG1_MISPREDICT  BIT_ULL(1)
> +#define ALPHA_PERF_CONFIG1_TRAPPED     BIT_ULL(2)
> +#define ALPHA_PERF_CONFIG1_FILTERS     (ALPHA_PERF_CONFIG1_RETIRED | \
> +                                        ALPHA_PERF_CONFIG1_MISPREDICT | =
\
> +                                        ALPHA_PERF_CONFIG1_TRAPPED)
>
>  /* hw_perf_event.flags */
>  #define ALPHA_PERF_FLAG_WRAPPED                0x1
> @@ -258,11 +265,17 @@ static int ev67_raw_event_valid(u64 config)
>  PMU_FORMAT_ATTR(event, "config:0-7");
>  PMU_FORMAT_ATTR(profileme, "config:8");
>  PMU_FORMAT_ATTR(randomize, "config:9");
> +PMU_FORMAT_ATTR(retired, "config1:0");
> +PMU_FORMAT_ATTR(mispredict, "config1:1");
> +PMU_FORMAT_ATTR(trapped, "config1:2");
>
>  static struct attribute *ev67_format_attrs[] =3D {
>         &format_attr_event.attr,
>         &format_attr_profileme.attr,
>         &format_attr_randomize.attr,
> +       &format_attr_retired.attr,
> +       &format_attr_mispredict.attr,
> +       &format_attr_trapped.attr,
>         NULL,
>  };
>
> @@ -819,6 +832,12 @@ static int __hw_perf_event_init(struct perf_event *e=
vent)
>                 return -EINVAL;
>         hwc->flags =3D profileme ? ALPHA_PERF_FLAG_PROFILEME : 0;
>
> +       if (attr->config1 & ~ALPHA_PERF_CONFIG1_FILTERS)
> +               return -EINVAL;
> +       if (attr->config1 && !profileme)
> +               return -EINVAL;
> +       hwc->config =3D attr->config1;
> +
>         if (attr->type =3D=3D PERF_TYPE_RAW &&
>             (attr->config & ALPHA_PERF_CONFIG_RANDOMIZE)) {
>                 if (!profileme)
> @@ -1060,6 +1079,62 @@ static bool alpha_profileme_trp(unsigned long i_st=
at, unsigned long pctr_ctl)
>         return !(pctr_ctl & EV67_PCTR_PM_KILLED_BM) && (i_stat & EV67_I_S=
TAT_TRP);
>  }
>
> +/*
> + * VAL says whether an instruction that did not trap retired. For one th=
at
> + * did, the trap type decides: these faults abort it, to be replayed,
> + * refetched after a fill, or emulated. Other traps, mispredicts among
> + * them, are counted as retired.
> + */
> +static bool alpha_profileme_retired(unsigned long i_stat,
> +                                   unsigned long pctr_ctl)
> +{
> +       if (pctr_ctl & EV67_PCTR_PM_KILLED_BM)
> +               return false;
> +       if (!(i_stat & EV67_I_STAT_TRP))
> +               return pctr_ctl & EV67_PCTR_VAL;
> +       if (i_stat & EV67_I_STAT_MIS)
> +               return true;
> +
> +       switch ((i_stat >> EV67_I_STAT_TRAP_TYPE_SHIFT) &
> +               EV67_I_STAT_TRAP_TYPE_MASK) {
> +       case EV67_TRAP_REPLAY:
> +       case EV67_TRAP_DTB_DOUBLE_3:
> +       case EV67_TRAP_DTB_DOUBLE_4:
> +       case EV67_TRAP_FEN:
> +       case EV67_TRAP_UNALIGNED:
> +       case EV67_TRAP_DTB_SINGLE:
> +       case EV67_TRAP_DFAULT:
> +       case EV67_TRAP_OPCDEC:
> +               rTested on all three CPUs of my ES40. I checked the trapp=
ed and
mispredict recordings against the raw ProfileMe status. Every
sample matched the requested filter.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>eturn false;
> +       default:
> +               return true;
> +       }
> +}
> +
> +/* What the profiled instruction did, as config1 filter bits. */
> +static u64 alpha_profileme_status(unsigned long i_stat,
> +                                 unsigned long pctr_ctl, unsigned long p=
mpc)
> +{
> +       u64 status =3D 0;
> +
> +       if (alpha_profileme_retired(i_stat, pctr_ctl))
> +               status |=3D ALPHA_PERF_CONFIG1_RETIRED;
> +       if (alpha_profileme_trp(i_stat, pctr_ctl)) {
> +               status |=3D ALPHA_PERF_CONFIG1_TRAPPED;
> +               if (i_stat & EV67_I_STAT_MIS)
> +                       status |=3D ALPHA_PERF_CONFIG1_MISPREDICT;
> +       } else if (pmpc & EV67_PMPC_PAL) {
> +               switch (pmpc & EV67_PMPC_PAL_OFFSET_MASK) {
> +               case EV67_PMPC_IACV:
> +               case EV67_PMPC_ITB_MISS:
> +               case EV67_PMPC_INTERRUPT:
> +                       status |=3D ALPHA_PERF_CONFIG1_TRAPPED;
> +                       break;
> +               }
> +       }
> +       return status;
> +}
> +
>  /* What the memory instruction at pc does, or PERF_MEM_OP_NA. */
>  static u64 alpha_profileme_mem_op(unsigned long pc)
>  {
> @@ -1170,6 +1245,14 @@ static void alpha_perf_event_profileme(struct perf=
_event *event,
>                 local64_add(ovr, &hwc->period_left);
>         }
>
> +       /* A dropped sample still counts, for throttling and frequency mo=
de. */
> +       if ((alpha_profileme_status(i_stat, pctr_ctl, pmpc) & hwc->config=
) !=3D
> +           hwc->config) {
> +               if (alpha_perf_event_set_period(event, hwc, 0))
> +                       perf_event_account_interrupt(event);
> +               return;
> +       }
> +
>         /*
>          * Attribute the sample to the profiled instruction rather than t=
o
>          * wherever the interrupt landed. perf takes the sample's mode,
>
> --
> 2.55.0
>

Tested on all three CPUs of my ES40. I checked the trapped and
mispredict recordings against the raw ProfileMe status. Every
sample matched the requested filter.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
