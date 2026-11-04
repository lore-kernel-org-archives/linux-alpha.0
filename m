Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793829479;
	b=f8wyAUXSaO/3H1c2H425MR3PdqX694RC2/zD9E7tqiAcfdWSm9u9gMLkpxSUavHOzAUH
	 NKEfKgHKXeDs8wR3V5fPqagbf0iFkYf+zw+KkQHbyFdA/Z8hUJdSBqypNMIsTn2C58OZT
	 6O243QloR4nhfSckUev4HHIy/1dVVTD0n+k8jHUQkCyGmWb2h13TdIqYqdlY3waviv5q+
	 o+kB9mC2k+G/ebCbf6tClgd5PPQ3B4nZuhWfOSbsYanSayTGmxCQu4jXZ16UFlB7HQfWx
	 yNCN+A6kaxgktNSrEQ9xGUnY/yXMLvChgyKhKveEBVZwK1Jzp6yFIWrG4vXsa6C4SLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PamDMZo0O9xU4PZszgrGvGLRUq8jvjhji6pEpPeMtgE=;
	b=YTOLa4K58OOFXVlWYh0beOH0M2iGDnAWsk+mPU/itCFanudQPxZ35gdfhM4Y3JZGI2Fl
	 arZM1V4PdR0B8iCK+YdKNKNFsNP3WvxQwqFiKbVaropKGG6PbHRf5JLy+TVz7ZWmeSdJI
	 MGACZqjTGuids7yGAIESeMU9+Gr59CWNRg8glcYKeip7suiyua361VZW5VOdhqDKak/C1
	 cnw2IHr59K13qEu3KzgGwe9ZQCtIwUy4kS4bp4ij0paaAwDu9MOyYlQ5o8yaF42rOO/AT
	 9ud1pTZBmQM9niM24zx1gRIEfddkDZORK4NNsnsN0XWLebBM6BuzHyLIAAtRF+7acWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhdYCtrT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1683F6082BEC
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 21:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1683F6082BEC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhdYCtrT
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso1769350a12.3
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 13:57:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793829476; cv=none;
        d=google.com; s=arc-20260327;
        b=OuwftjfOrDE32wPkoyaq1kM8gWgH3sifK4cxbLfDvEFZAgj5fDe4wxAYHK4HviQmAZ
         yFI+qvUWPQLlxMI44eRtzicLdN/3Qsqt2MlHvXnRoZT+mCdtHkpN191tfrRSm2/2+O0+
         pE8YIozHOkSa8RjydhCu/a1M4xCg08mqjfHs4ES80PtFtQjjLBLO9Hm3HpTwTukcLo9q
         HpNmjbkvjZJnTpc3+xP95Fr88DZcaqCyMt3r0DcSnRohynzlJhYlq+FzFLvUjaN3T1qg
         /TkVFG4u5K7s2chs9Oajmgd9YSBrwJzyP2CKvMeYpAjHI/gScBHk5ZqWcrgnpJmK8pHF
         +DgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PamDMZo0O9xU4PZszgrGvGLRUq8jvjhji6pEpPeMtgE=;
        fh=jwOWAjtfQwFKuoi8rR5HRyGSDz5GD0sNGzRs8Z5jdsM=;
        b=J1MvUNOiQ5/+Xn/F358YTSb867T7d6dvkgiG4mWSn+w+j1MtdMA12gyjk7ayj9AxoO
         B3hUYKv0FL96Sag5q30+/AdO7B1RgEGEeYO4lwzkSxJ2ChZAUqdY1nqVY4ixNXosenNI
         4b01fZ+h4QEEdSefZmIz0kX8iLCj3sFr2xfBS/Aamwmg5ZxlcIPvozA72u/lmuMECCPn
         7oKsaLvp8qteeb3/LA7t8rZKDEbpParl55PpUGGHoUT0ca7zdjB/2DibP/CnHvAnzKwc
         KEVrFQXW8LLuKMclIVqo3mvxR07RSq9vhxFU8Pbhf9b/qxaYqp2xo16L+8g3XVdT35uk
         0Pwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829476; x=1794434276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PamDMZo0O9xU4PZszgrGvGLRUq8jvjhji6pEpPeMtgE=;
        b=QhdYCtrTEbinDQGvgtWvtuycI0FU/ja+pRksOOU1Hy4YtAiFHJ0CRBZZsDz/EUsQd6
         SAm5PlKGFzKg1+2CnsXu5T+ChCaUd+8pMnY7K7+q4XWhR3P7WgJ+1UlSRs/eybbfdYl7
         cEJAXXLkiLhnwzqDwYwfvd9cdc6WZ+x10b7nLFPFrYjc3+EW27mgrgl6PooTtLa5fSOi
         rVk6mm5seVniTGZ7SWqcFn/7gudqO1UwBNP12oHhIIi6iS7IQFxNIp9pfVMsa0rSKlLS
         XKTfJ/wzA+JAGw7QTJnqjOsPJ4vMBxaFfs9Qexkqqm0FTr3Abn8q+fWDuD02lT4XM3vU
         ODRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829476; x=1794434276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PamDMZo0O9xU4PZszgrGvGLRUq8jvjhji6pEpPeMtgE=;
        b=xul87/upBfyte+1dWPE3LFI3Dkg2jIB3Mj5hnWY7F9sJRs2REMlBS6DhxeoyWmFzWE
         +PFu9PbMBoveLb1rgXBnJZY9oVY3qamMf1j+mtwUCaUzOur/0LPoRcNlF8NWiO+eI0Fm
         FmazTVBqsIAZUBj2tZK1Z4wfuSNwt6+EeYSR5EO1ERXpYpZgYKHgHKgRCbot2OmgbKJ6
         u+jWzmfKy+MnrhuWmc45Atdd1ROneuPM7EDkBUYX9IW7CmsiSLdGMNJhhVx/UhrDJUb8
         RDoZXigLDRlCs0mnVJXBaQ0n5XkoV9sy3SrkwYNoIuoOHFOKxHITQUOIicRYCWYvMIR/
         hplA==
X-Forwarded-Encrypted: i=1; AKwUvBwn6Up/8rPUWI0/jlGpdnQcVGbasdtqnMPnAAlsE6DuR5QcPwBwrr/NdsZOKieo8DLEHZhRvl08TvlBpQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/6i3G2JleuMxn3d7VtX9O2N1H+Aao49liwgctSuCWxtf+RMoJL
	PhS/UomhApVD1ar85NzjgvAQYcgfGTuy4uIjNuC0xriAMgTviis4n4TnxlDSbZR6eulGMpSs2Ac
	jc4b/tW7JaWZhVokswUgNqvoQRzw8sdc=
X-Gm-Gg: AYBFou1DWbxbC+d7pZVdKHj+heM33YroKEgBZFOVV7cgJq196jgkshbHMq36yIyl6kr
	lo3bJh4DNckIr//CPNNUhsr7EjIK5s1QtX8ttc/+0xJsrakZNBmm6CK2H20mDItlWhbjOiehGf6
	YRBXGVhkf9WPlXn4t7Ew1UgHJNoebHIcyqlaAQcZqmLSVys++gMv5QWws4tHPyeIswP75Sn74cC
	AxOmWyqgGY6GTUp+oj9ynK3hKk/ujASsvAOaTJwiRWIdMS56UUZmWyQMSboZ2T5WkHkFgFDACPS
	WA6MWtE+rlkxpCqz/DTAKcei4I6M0vsp/NH6tXOElqooHEETfTSR8fNTd+A7/Yjsm2+p+ntjfpx
	HGJxE21sMVwo86zXwBiO6ZnP1Np1NL/whVDDtKTmDpWTu4k+C282lhAbJ976/4u2l7ekFmWylvQ
	07thuyr2jB7XTY6aXIKkdKIQU=
X-Received: by 2002:a17:907:97c7:b0:c2b:f3d5:2090 with SMTP id
 a640c23a62f3a-c4ca7a672e6mr1577035066b.27.1793829476013; Wed, 04 Nov 2026
 13:57:56 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com> <20261104-alpha-profileme-v6-6-63362e9290a3@gmail.com>
In-Reply-To: <20261104-alpha-profileme-v6-6-63362e9290a3@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 4 Nov 2026 22:57:44 +0100
X-Gm-Features: AclHuK_DAZPfd7l6L42rF6j0BHhuQAMHtKzpzL_sQ02lvX6AVTm53TzIcDa3SBc
Message-ID: <CA+=Fv5Qx_SZTP0JQsVyUUeAeSBce5kuyqKCTvRpQeLUoJjBjZw@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] alpha/perf: implement ProfileMe sampling
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
> The 21264 (EV67 and later) and 21364 have two performance counting modes,
> and the driver only uses Aggregate mode. Its samples report the PC at
> which the counter interrupt was taken, which lands a variable number of
> instructions after the one that overflowed the counter. On an EV7 a
> 16-instruction user loop shows up at only 4 PCs, anywhere from 15
> instructions before to 12 after the real one.
>
> In ProfileMe mode, the instruction that overflows PCTR0 opens a window
> during which PCTR1 counts, and when it closes PALcode delivers the
> interrupt with that instruction's PC latched in PMPC.
>
> Select ProfileMe with the new profileme config bit or with precise_ip,
> since PMPC has no skid. PCTR_CTL[SL0] selects the mode for both
> counters, so a ProfileMe event is scheduled alone and perf core
> multiplexes it with other hardware events. precise_ip 3 is refused, as
> AMD IBS also does: a sample whose PMPC is a PALmode address keeps the
> interrupted PC, so zero skid cannot be promised. perf record falls back
> to 2 when it asks for the most precise level.
>
> The event type chooses the SL1 setting, which decides what PCTR0 samples
> on and what PCTR1 counts in the window:
>
>   event          PCTR0         PCTR1
>   instructions   instructions  cycles
>   bcache-misses  instructions  Bcache misses
>   cycles         cycles        inum retire delay
>   mbox-replay    cycles        Mbox replay traps
>
> Every interrupt rearms both counters, since PCTR0 stops when the window
> closes. The instruction count is corrected by the overcount I_STAT
> reports. The sample is attributed to PMPC. The interrupt can be taken
> in a different mode than the profiled instruction: in an unaligned
> access test on EV7 that was true of three quarters of the samples. When
> the modes match, the PC is set in the interrupt's frame for the overflow
> call and restored afterwards, so perf's mode, register and stack
> sampling all see the same frame. When they differ the registers are not
> available: a kernel instruction whose interrupt is taken after the
> return to user mode has no kernel state left, and a user instruction's
> frame may not be built yet, as the interrupt is often taken on the first
> instruction of the entry code. Those samples use a per-CPU frame holding
> only the PC, and a user instruction's sample reports no registers or
> user stack. PALmode PMPCs are physical addresses, so those samples keep
> the interrupted PC.
>
> PCTR0 is left stopped just past overflow at the end of every window,
> which the EV67 PALcode restrictions 32 and 38 warn about: a disabled
> counter near overflow keeps signaling it and blocks all other
> interrupts, and a disabled counter only clears its overflow state when
> written twice. So the counters are written twice when rearmed, and are
> moved away from overflow when a ProfileMe event is stopped or removed
> or a stray interrupt arrives for one that is gone. Without this,
> sampling every 10000 instructions wedged an EV7 in 7 of 16 runs, with
> no console output, until the service processor reset it. With it, 66
> runs passed.
>
> A ProfileMe event lives at index 0, so every interrupt taken while one
> is scheduled goes to it, including one from an Aggregate event on PCTR1
> that was pending when perf multiplexed the ProfileMe event in. That
> interrupt, and one pending from before a ProfileMe event was stopped or
> switched to the other mode, finds PCTR0 short of overflow, and is
> ignored as the previous patch does for Aggregate events.
>
> Three behaviors differ from Aggregate mode. perf record's default event
> is cycles:P, so it now records a ProfileMe profile. In ProfileMe mode
> PCTR0 counts valid fetched instructions rather than retired ones, so the
> instructions count includes the wrong path, squashed NOPs, and both
> halves of each CMOV: on an EV7 loop with a randomly mispredicted branch
> it is about twice the Aggregate count. And instructions killed on a
> wrong path are sampled at their own PC, as ProfileMe defines them.
>
> Suggested-by: Magnus Lindholm <linmag7@gmail.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/wrperfmon.h |  12 ++
>  arch/alpha/kernel/perf_event.c     | 290 +++++++++++++++++++++++++++++++=
++++--
>  2 files changed, 290 insertions(+), 12 deletions(-)
>
> diff --git a/arch/alpha/include/asm/wrperfmon.h b/arch/alpha/include/asm/=
wrperfmon.h
> index 1fa9bc813263..7fbbfd74926a 100644
> --- a/arch/alpha/include/asm/wrperfmon.h
> +++ b/arch/alpha/include/asm/wrperfmon.h
> @@ -92,5 +92,17 @@
>  #define EV67_PCTR_CYCLES_UNDEF (1UL<<2)
>  #define EV67_PCTR_INSTR_BCACHEMISS (2UL<<2)
>  #define EV67_PCTR_CYCLES_MBOX (3UL<<2)
> +/* In ProfileMe mode, SL1 =3D 1 makes PCTR1 count the inum retire delay.=
 */
> +#define EV67_PCTR_CYCLES_RETIRE_DELAY (1UL<<2)
> +/* Set in both SL settings where PCTR0 counts cycles. */
> +#define EV67_PCTR_PCTR0_CYCLES (1UL<<2)
> +
> +/* ProfileMe status, from the EV67/EV68 Hardware Reference Manuals. */
> +#define EV67_I_STAT_OVR_SHIFT 30
> +#define EV67_I_STAT_OVR_MASK 0x7UL
> +
> +/* PMPC bits 63:2 hold the profiled PC. Bit 0 set means a PALmode addres=
s. */
> +#define EV67_PMPC_PAL (1UL<<0)
> +#define EV67_PMPC_PC_MASK (~3UL)
>
>  #endif
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index dd7fc4ac1396..7208d09a32d1 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -16,6 +16,7 @@
>  #include <linux/kdebug.h>
>  #include <linux/mutex.h>
>  #include <linux/init.h>
> +#include <linux/sched/task_stack.h>
>
>  #include <asm/hwrpb.h>
>  #include <linux/atomic.h>
> @@ -30,8 +31,13 @@
>  #define MAX_HWEVENTS 3
>  #define PMC_NO_INDEX -1
>
> +/* Layout of attr.config for PERF_TYPE_RAW events; see format/ in sysfs.=
 */
> +#define ALPHA_PERF_CONFIG_EVENT                0xffULL
> +#define ALPHA_PERF_CONFIG_PROFILEME    BIT_ULL(8)
> +
>  /* hw_perf_event.flags */
>  #define ALPHA_PERF_FLAG_WRAPPED                0x1
> +#define ALPHA_PERF_FLAG_PROFILEME      0x2
>
>  /* For tracking PMCs and the hw events they monitor on each CPU. */
>  struct cpu_hw_events {
> @@ -148,6 +154,19 @@ static const struct ev67_mapping_t ev67_mapping[] =
=3D {
>  };
>
>
> +/*
> + * In ProfileMe mode PCTR0 selects the profiled instruction and PCTR1 co=
unts
> + * during its window. PCTR0 counts instructions or cycles, and each choi=
ce
> + * pairs with two PCTR1 inputs, so each event type picks one SL1 setting=
.
> + * Indexed by enum ev67_pmc_event_type.
> + */
> +static const unsigned long ev67_profileme_sl1[] =3D {
> +       [EV67_CYCLES]           =3D EV67_PCTR_CYCLES_RETIRE_DELAY, /* PCT=
R1: retire delay */
> +       [EV67_INSTRUCTIONS]     =3D EV67_PCTR_INSTR_CYCLES,       /* PCTR=
1: cycles */
> +       [EV67_BCACHEMISS]       =3D EV67_PCTR_INSTR_BCACHEMISS,   /* PCTR=
1: Bcache misses */
> +       [EV67_MBOXREPLAY]       =3D EV67_PCTR_CYCLES_MBOX,        /* PCTR=
1: Mbox replays */
> +};
> +
>  /*
>   * Check that a group of events can be simultaneously scheduled on to th=
e
>   * EV67 PMU.  Also allocate counter indices and config.
> @@ -155,9 +174,21 @@ static const struct ev67_mapping_t ev67_mapping[] =
=3D {
>  static int ev67_check_constraints(struct perf_event **event,
>                                 unsigned long *evtype, int n_ev)
>  {
> -       int idx0;
> +       int idx0, j;
>         unsigned long config;
>
> +       /* A ProfileMe event uses both counters, so it must be alone. */
> +       for (j =3D 0; j < n_ev; j++) {
> +               if (!(event[j]->hw.flags & ALPHA_PERF_FLAG_PROFILEME))
> +                       continue;
> +               if (n_ev !=3D 1)
> +                       return -1;
> +               event[0]->hw.idx =3D 0;
> +               event[0]->hw.config_base =3D EV67_PCTR_MODE_PROFILEME |
> +                                          ev67_profileme_sl1[evtype[0]];
> +               return 0;
> +       }
> +
>         idx0 =3D ev67_mapping[evtype[0]-1].idx;
>         config =3D ev67_mapping[evtype[0]-1].config;
>         if (n_ev =3D=3D 1)
> @@ -216,9 +247,11 @@ static int ev67_raw_event_valid(u64 config)
>
>
>  PMU_FORMAT_ATTR(event, "config:0-7");
> +PMU_FORMAT_ATTR(profileme, "config:8");
>
>  static struct attribute *ev67_format_attrs[] =3D {
>         &format_attr_event.attr,
> +       &format_attr_profileme.attr,
>         NULL,
>  };
>
> @@ -279,6 +312,31 @@ static inline void alpha_write_pmc(int idx, unsigned=
 long val)
>         wrperfmon(PERFMON_CMD_WRITE, val);
>  }
>
> +/* Write PCTR0 and clear PCTR1 in one call, as ProfileMe mode requires. =
*/
> +static inline void alpha_write_pmc_profileme(unsigned long val)
> +{
> +       val &=3D alpha_pmu->pmc_count_mask[0];
> +       val <<=3D alpha_pmu->pmc_count_shift[0];
> +       val |=3D EV67_PCTR_0 | EV67_PCTR_1;
> +       /*
> +        * PCTR0 stops when a ProfileMe window closes, and a stopped coun=
ter
> +        * only clears its overflow state when written twice (EV67 HRM, P=
ALcode
> +        * restriction 38). A counter left signaling overflow blocks all
> +        * other interrupts (restriction 32).
> +        */
> +       wrperfmon(PERFMON_CMD_WRITE, val);
> +       wrperfmon(PERFMON_CMD_WRITE, val);
> +}
> +
> +/* The counters an event occupies, for PERFMON_CMD_ENABLE and DISABLE. *=
/
> +static inline unsigned long alpha_event_idx_mask(struct hw_perf_event *h=
wc,
> +                                                int idx)
> +{
> +       if (hwc->flags & ALPHA_PERF_FLAG_PROFILEME)
> +               return EV67_PCTR_0 | EV67_PCTR_1;
> +       return 1UL<<idx;
> +}
> +
>  static inline unsigned long alpha_read_pmc(int idx)
>  {
>         unsigned long val;
> @@ -289,6 +347,26 @@ static inline unsigned long alpha_read_pmc(int idx)
>         return val;
>  }
>
> +/*
> + * Move a stopped ProfileMe counter away from overflow. See
> + * alpha_write_pmc_profileme() for why. The caller has read the count, s=
o
> + * prev_count can be rebased on the value written.
> + *
> + * A pending PMI stays pending, but alpha_perf_event_ovf() ignores it, a=
s
> + * the counter is left no nearer zero than alpha_perf_event_set_period()
> + * would leave it.
> + */
> +static void alpha_perf_event_park(struct hw_perf_event *hwc)
> +{
> +       long left =3D local64_read(&hwc->period_left);
> +
> +       left =3D clamp(left, alpha_pmu->pmc_left[0],
> +                    (long)(alpha_pmu->pmc_max_period[0] >> 1));
> +       local64_set(&hwc->prev_count, (unsigned long)(-left));
> +       hwc->flags &=3D ~ALPHA_PERF_FLAG_WRAPPED;
> +       alpha_write_pmc_profileme((unsigned long)(-left));
> +}
> +
>  /* Set a new period to sample over */
>  static int alpha_perf_event_set_period(struct perf_event *event,
>                                 struct hw_perf_event *hwc, int idx)
> @@ -329,7 +407,10 @@ static int alpha_perf_event_set_period(struct perf_e=
vent *event,
>         local64_set(&hwc->prev_count, (unsigned long)(-left));
>         hwc->flags &=3D ~ALPHA_PERF_FLAG_WRAPPED;
>
> -       alpha_write_pmc(idx, (unsigned long)(-left));
> +       if (hwc->flags & ALPHA_PERF_FLAG_PROFILEME)
> +               alpha_write_pmc_profileme((unsigned long)(-left));
> +       else
> +               alpha_write_pmc(idx, (unsigned long)(-left));
>
>         perf_event_update_userpage(event);
>
> @@ -470,7 +551,8 @@ static void maybe_change_configuration(struct cpu_hw_=
events *cpuc)
>                 if (!(hwc->state & PERF_HES_STOPPED)) {
>                         /* The counter is live, so hwc->prev_count will g=
o stale. */
>                         hwc->state &=3D ~PERF_HES_UPTODATE;
> -                       cpuc->idx_mask |=3D (1<<cpuc->current_idx[j]);
> +                       cpuc->idx_mask |=3D alpha_event_idx_mask(hwc,
> +                                                       cpuc->current_idx=
[j]);
>                 }
>         }
>         cpuc->config =3D cpuc->event[0]->hw.config_base;
> @@ -562,7 +644,10 @@ static void alpha_pmu_del(struct perf_event *event, =
int flags)
>                         alpha_perf_event_update(event, hwc, idx, 0);
>                         perf_event_update_userpage(event);
>
> -                       cpuc->idx_mask &=3D ~(1UL<<idx);
> +                       if (hwc->flags & ALPHA_PERF_FLAG_PROFILEME)
> +                               alpha_perf_event_park(hwc);
> +
> +                       cpuc->idx_mask &=3D ~alpha_event_idx_mask(hwc, id=
x);
>                         cpuc->n_events--;
>                         break;
>                 }
> @@ -587,17 +672,22 @@ static void alpha_pmu_stop(struct perf_event *event=
, int flags)
>         struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
>
>         if (!(hwc->state & PERF_HES_STOPPED)) {
> -               cpuc->idx_mask &=3D ~(1UL<<hwc->idx);
> +               cpuc->idx_mask &=3D ~alpha_event_idx_mask(hwc, hwc->idx);
>                 hwc->state |=3D PERF_HES_STOPPED;
>         }
>
> -       if ((flags & PERF_EF_UPDATE) && !(hwc->state & PERF_HES_UPTODATE)=
) {
> +       /* Parking a ProfileMe event overwrites the counter, so read it f=
irst. */
> +       if (((flags & PERF_EF_UPDATE) || (hwc->flags & ALPHA_PERF_FLAG_PR=
OFILEME)) &&
> +           !(hwc->state & PERF_HES_UPTODATE)) {
>                 alpha_perf_event_update(event, hwc, hwc->idx, 0);
>                 hwc->state |=3D PERF_HES_UPTODATE;
>         }
>
>         if (cpuc->enabled)
> -               wrperfmon(PERFMON_CMD_DISABLE, (1UL<<hwc->idx));
> +               wrperfmon(PERFMON_CMD_DISABLE, alpha_event_idx_mask(hwc, =
hwc->idx));
> +
> +       if (hwc->flags & ALPHA_PERF_FLAG_PROFILEME)
> +               alpha_perf_event_park(hwc);
>  }
>
>
> @@ -616,9 +706,9 @@ static void alpha_pmu_start(struct perf_event *event,=
 int flags)
>
>         hwc->state =3D 0;
>
> -       cpuc->idx_mask |=3D 1UL<<hwc->idx;
> +       cpuc->idx_mask |=3D alpha_event_idx_mask(hwc, hwc->idx);
>         if (cpuc->enabled)
> -               wrperfmon(PERFMON_CMD_ENABLE, (1UL<<hwc->idx));
> +               wrperfmon(PERFMON_CMD_ENABLE, alpha_event_idx_mask(hwc, h=
wc->idx));
>  }
>
>
> @@ -658,6 +748,7 @@ static int __hw_perf_event_init(struct perf_event *ev=
ent)
>         struct perf_event *evts[MAX_HWEVENTS];
>         unsigned long evtypes[MAX_HWEVENTS];
>         int idx_rubbish_bin[MAX_HWEVENTS];
> +       bool profileme =3D false;
>         int ev;
>         int n;
>
> @@ -671,9 +762,13 @@ static int __hw_perf_event_init(struct perf_event *e=
vent)
>         } else if (attr->type =3D=3D PERF_TYPE_HW_CACHE) {
>                 return -EOPNOTSUPP;
>         } else if (attr->type =3D=3D PERF_TYPE_RAW) {
> -               if (!alpha_pmu->raw_event_valid(attr->config))
> +               if (attr->config & ~(ALPHA_PERF_CONFIG_EVENT |
> +                                    ALPHA_PERF_CONFIG_PROFILEME))
>                         return -EINVAL;
> -               ev =3D attr->config;
> +               ev =3D attr->config & ALPHA_PERF_CONFIG_EVENT;
> +               if (!alpha_pmu->raw_event_valid(ev))
> +                       return -EINVAL;
> +               profileme =3D attr->config & ALPHA_PERF_CONFIG_PROFILEME;
>         } else {
>                 return -EOPNOTSUPP;
>         }
> @@ -682,6 +777,20 @@ static int __hw_perf_event_init(struct perf_event *e=
vent)
>                 return ev;
>         }
>
> +       /*
> +        * ProfileMe samples report the exact PC of the profiled instruct=
ion,
> +        * so it also serves any request for precise samples. It only mak=
es
> +        * sense for sampling events. Level 3 promises no skid at all, bu=
t some
> +        * samples keep the interrupted PC; see alpha_perf_event_profilem=
e().
> +        */
> +       if (attr->precise_ip > 2)
> +               return -EOPNOTSUPP;
> +       if (attr->precise_ip)
> +               profileme =3D true;
> +       if (profileme && !is_sampling_event(event))
> +               return -EINVAL;
> +       hwc->flags =3D profileme ? ALPHA_PERF_FLAG_PROFILEME : 0;
> +
>         /*
>          * We place the event type in event_base here and leave calculati=
on
>          * of the codes to programme the PMU for alpha_pmu_enable() becau=
se
> @@ -872,6 +981,147 @@ static long alpha_perf_event_ovf(struct hw_perf_eve=
nt *hwc, int idx)
>  }
>
>
> +/*
> + * Frame holding only the PC, for a ProfileMe interrupt taken in a diffe=
rent
> + * mode than the profiled instruction. Being off the stack,
> + * perf_reg_value() reports no SP.
> + */
> +static DEFINE_PER_CPU(struct pt_regs, alpha_profileme_regs);
> +
> +/*
> + * Report the sample with none of the given PERF_SAMPLE_REGS_* registers=
.
> + * Having no user registers also means no user stack.
> + */
> +static void alpha_profileme_drop_regs(struct perf_event *event,
> +                                     struct perf_sample_data *data, u64 =
which)
> +{
> +       /* STACK_USER consults regs_user even without REGS_USER. */
> +       if (which & PERF_SAMPLE_REGS_USER)
> +               data->regs_user =3D (struct perf_regs){ .abi =3D PERF_SAM=
PLE_REGS_ABI_NONE };
> +       if (which & PERF_SAMPLE_REGS_INTR)
> +               data->regs_intr =3D (struct perf_regs){ .abi =3D PERF_SAM=
PLE_REGS_ABI_NONE };
> +       data->sample_flags |=3D which;
> +       /* Only the ABI word is written for each. */
> +       data->dyn_size +=3D hweight64(event->attr.sample_type & which) * =
sizeof(u64);
> +}
> +
> +/* Report the user registers from a frame known to be complete. */
> +static void alpha_profileme_set_regs_user(struct perf_event *event,
> +                                         struct perf_sample_data *data)
> +{
> +       data->regs_user.regs =3D task_pt_regs(current);
> +       data->regs_user.abi =3D perf_reg_abi(current);
> +       data->sample_flags |=3D PERF_SAMPLE_REGS_USER;
> +       /* STACK_USER consults regs_user even without REGS_USER. */
> +       if (event->attr.sample_type & PERF_SAMPLE_REGS_USER)
> +               data->dyn_size +=3D (1 + hweight64(event->attr.sample_reg=
s_user)) *
> +                                 sizeof(u64);
> +}
> +
> +/*
> + * Handle the close of a ProfileMe window on PCTR0.
> + *
> + * PCTR0 stops counting when the window closes and does not start again
> + * until PCTR_CTL is written, so the status must be read first and the
> + * counters then rearmed unconditionally.
> + */
> +static void alpha_perf_event_profileme(struct perf_event *event,
> +                                      struct hw_perf_event *hwc,
> +                                      struct pt_regs *regs, long ovf)
> +{
> +       struct perf_sample_data data;
> +       struct pt_regs *pm_regs;
> +       bool pc_only =3D false;
> +       unsigned long i_stat, pmpc, ovr, pc, saved_pc, saved_ps;
> +
> +       i_stat =3D wrperfmon(PERFMON_CMD_I_STAT, 0);
> +       pmpc =3D wrperfmon(PERFMON_CMD_PMPC, 0);
> +
> +       alpha_perf_event_update(event, hwc, 0, ovf);
> +
> +       /*
> +        * When PCTR0 counts instructions, up to 7 of them are counted af=
ter
> +        * the overflow but before the window opens. I_STAT reports how m=
any.
> +        */
> +       if (!(hwc->config_base & EV67_PCTR_PCTR0_CYCLES)) {
> +               ovr =3D (i_stat >> EV67_I_STAT_OVR_SHIFT) & EV67_I_STAT_O=
VR_MASK;
> +               local64_sub(ovr, &event->count);
> +               local64_add(ovr, &hwc->period_left);
> +       }
> +
> +       /*
> +        * Attribute the sample to the profiled instruction rather than t=
o
> +        * wherever the interrupt landed. perf takes the sample's mode,
> +        * registers and stack from regs, so:
> +        *
> +        * - Interrupt taken in the same mode: the PC is set in the
> +        *   interrupt's own frame, and restored afterwards.
> +        * - User instruction, interrupt taken in the kernel, typically
> +        *   because the instruction trapped: the frame at task_pt_regs()=
 may
> +        *   not be built yet. The interrupt is often taken on the first
> +        *   instruction of the entry code, and its own frame then overla=
ps
> +        *   that one. Report the PC alone, in a per-CPU frame.
> +        * - Kernel instruction, interrupt taken just after returning to =
user
> +        *   mode: the kernel state is gone, so a per-CPU frame that hold=
s only
> +        *   the PC. The user frame in regs is left alone, since perf sam=
ples
> +        *   the user registers from it.
> +        *
> +        * A PALmode PMPC is a physical address that perf cannot resolve.=
 That
> +        * happens for ITB miss, Istream access violation and interrupt
> +        * redirects, and for instructions inside PALcode. Keep the
> +        * interrupted PC, which for redirects is the instruction that
> +        * trapped. Do the same for a user PMPC in a kernel thread, which=
 has
> +        * no user frame.
> +        */
> +       pm_regs =3D regs;
> +       pc =3D pmpc & EV67_PMPC_PC_MASK;
> +       if (pmpc & EV67_PMPC_PAL) {
> +               pc =3D regs->pc;
> +       } else if (pc < TASK_SIZE && !user_mode(regs)) {
> +               if (is_user_task(current)) {
> +                       pc_only =3D true;
> +                       pm_regs =3D this_cpu_ptr(&alpha_profileme_regs);
> +                       memset(pm_regs, 0, sizeof(*pm_regs));
> +                       /* PS bit 3 is the mode bit that user_mode() test=
s. */
> +                       pm_regs->ps =3D 8;
> +               } else {
> +                       pc =3D regs->pc;
> +               }
> +       } else if (pc >=3D TASK_SIZE && user_mode(regs)) {
> +               pm_regs =3D this_cpu_ptr(&alpha_profileme_regs);
> +               memset(pm_regs, 0, sizeof(*pm_regs));
> +       }
> +
> +       perf_sample_data_init(&data, 0, hwc->last_period);
> +       if (pc_only)
> +               alpha_profileme_drop_regs(event, &data, PERF_SAMPLE_REGS_=
USER |
> +                                                       PERF_SAMPLE_REGS_=
INTR);
> +       /*
> +        * perf_get_regs_user() has the same check, but it will find the =
PMPC
> +        * in regs->pc rather than where the interrupt was taken. Decide =
here
> +        * from the interrupted PC, for either answer that would differ.
> +        */
> +       else if (!user_mode(regs) && in_entry_save_code(regs->pc))
> +               alpha_profileme_drop_regs(event, &data, PERF_SAMPLE_REGS_=
USER);
> +       else if (in_entry_save_code(pc) && is_user_task(current))
> +               alpha_profileme_set_regs_user(event, &data);
> +
> +       if (!alpha_perf_event_set_period(event, hwc, 0))
> +               return;
> +
> +       saved_pc =3D pm_regs->pc;
> +       saved_ps =3D pm_regs->ps;
> +       pm_regs->pc =3D pc;
> +       /* PS bit 3 is the mode bit that user_mode() tests. */
> +       if (pc >=3D TASK_SIZE)
> +               pm_regs->ps &=3D ~8UL;
> +
> +       perf_event_overflow(event, &data, pm_regs);
> +
> +       pm_regs->pc =3D saved_pc;
> +       pm_regs->ps =3D saved_ps;
> +}
> +
>  /*
>   * Performance Monitoring Interrupt Service Routine called when a PMC
>   * overflows.  The PMC that overflowed is passed in la_ptr.
> @@ -907,6 +1157,10 @@ static void alpha_perf_event_irq_handler(unsigned l=
ong la_ptr,
>
>         idx =3D la_ptr;
>
> +       /* A ProfileMe event owns both counters but lives at index 0. */
> +       if (cpuc->config & EV67_PCTR_MODE_PROFILEME)
> +               idx =3D 0;
> +
>         for (j =3D 0; j < cpuc->n_events; j++) {
>                 if (cpuc->current_idx[j] =3D=3D idx)
>                         break;
> @@ -914,6 +1168,8 @@ static void alpha_perf_event_irq_handler(unsigned lo=
ng la_ptr,
>
>         if (unlikely(j =3D=3D cpuc->n_events)) {
>                 /* This can occur if the event is disabled right on a PMC=
 overflow. */
> +               if (cpuc->config & EV67_PCTR_MODE_PROFILEME)
> +                       alpha_write_pmc_profileme(-alpha_pmu->pmc_max_per=
iod[0]);
>                 wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
>                 return;
>         }
> @@ -931,7 +1187,17 @@ static void alpha_perf_event_irq_handler(unsigned l=
ong la_ptr,
>         hwc =3D &event->hw;
>         ovf =3D alpha_perf_event_ovf(hwc, idx);
>         if (ovf < 0) {
> -               /* The interrupt was pending when the counter was written=
. */
> +               /*
> +                * The interrupt was pending when the counter was written=
, or
> +                * is from PCTR1 and was pending when a ProfileMe event w=
as
> +                * scheduled in.
> +                */
> +               wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
> +               return;
> +       }
> +
> +       if (hwc->flags & ALPHA_PERF_FLAG_PROFILEME) {
> +               alpha_perf_event_profileme(event, hwc, regs, ovf);
>                 wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
>                 return;
>         }
>
> --
> 2.55.0
>

Retested on my ES40. All 1131 samples from the unaligned-access loop
kept the correct user PMPC and omitted the unavailable registers.
The aligned control passed on all three CPUs. I also confirmed that
precise_ip=3D3 is rejected, which addresses my earlier question.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
