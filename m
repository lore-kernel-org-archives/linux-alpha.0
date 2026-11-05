Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793906357;
	b=YvkRUvm3rZWeRMV9UQOxHanQhMUr30T98afPUtfClWiVs78aAb+SpyGe8eY7Zdppl6ZL
	 sB3EZySAhYt3DBD+pBNxU/0DD5Ot7CcPaXBODGhh74L8pVuHg+S7GB5ZUmcpLkPYrdTsa
	 acdzAGqZEQvmZWnnvrw7Gk/6niEZq4X/NO+dB3zWSFdXsLD0fSGcv3lThVSiK+ps+rmWX
	 1WH4d513naShf41hLfo4CPwqT2qhPC5slGGGhK5ihY/Gb1h071JDmiloht+46sMAe0bsd
	 ywO7monRnPjHlLQY/v3IfON57aACE5zY0f2ik0/r54YFHWnN3ww6v94WW1t2myO/hEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cG7V2rhEsUQxV3zVZSyOJx5RVUSLk8uogNgNjx2JGMc=;
	b=cF/N2IZ6+Kf376CXrgPrdskwcxFCT0n0krMwwlU2C9JBXXSp9sRBztuMTfePI1QT/AHk
	 hbUvF5DYcP3knrrfpk9A5ymsgBk8zF3uEZtDnM6opBTnrhXhXcY/M7Apch4Uj2k8DuiA/
	 ESLZdV8Zef7t8C2FkinFaGS6bPTVgwcu4nVp/CMHbtvpD+LdpxgN8YTjbPHt7O2WIApjd
	 itlkW4puYr2uZgSJ2LvvCIAESYUDPE4FKnZ5cEAyaNWzjQ45pAiQLwV08jYRWhAvQkLgu
	 YMghm34Z4xx9KpUt7L+NmuqEDnFZLOE5077mloVjW1irU8BmdsB/gtRpFlkixcqTs0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AqeKTEdE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EBD606D803
	for <linux-alpha@vger.kernel.org>; Thu,  5 Nov 2026 19:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01EBD606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AqeKTEdE
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b579003f29so1776932a12.0
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2026 11:19:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793906355; cv=none;
        d=google.com; s=arc-20260327;
        b=f97GWlc6fN3p4crGQINn/VEje/mG9G9vxoNvOSAPkknAnWvVsJxnv6kJFCD5ugruVq
         nOsUPqVURiQsFNz2FKSVq/WHypW6XUn/aQBhK7DUeauRZo5dOnBEKkZl9KULFqPF+m6f
         ANdP1TxMl6m/wPVdxNMcGxGvX2HCcH/BjF5kLDC2cwJbEV0nGmLkxgsejbZJAp1Hwnh+
         zOQev9OatIQ1FnbZX8vhkUPH1OELh2f2rN64PEMF9PP3XCPRNWAsh6BYYkyDUD/CQiss
         XP54qg/cUTQeYCUzODtMSXcPXnsHl43yeiTCTxtKxUirM1TBlDjDjfxv73o0QO+uEVDo
         Y9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cG7V2rhEsUQxV3zVZSyOJx5RVUSLk8uogNgNjx2JGMc=;
        fh=wWqveptb31APLykqQ/l5o+Dm1DkeJZo3/YgxDIPR/QY=;
        b=KVaf9vJwrq3BI8r5sVcIfqcubtNxKViifttb5jURDWWRXO1lyg1k+b2OI+78oj9a5Z
         me4mppPyS0iZOyQTDW5pClp1tO/yFwRGa9LaZ+8+UiMCUK3ocvUiaSkXyop8GQXiSUyg
         OWMWA9M+i3fPynah6AbbBUEFbnxrqxbtns+8DTUk6/kt4PfxZcstmpjaohZoXXwxKwMf
         VCQ7pm/sEchD8OABHMY4BjSWhkcejG6HELwlUQpPdSPXzz1UP2+PQqV0z9zLrsPHby8f
         DhuFukLy/0ms/duIc4rU4QGwe7ncVjBKX/4zSAuQrdnZG5F0KukYtJOJ24zE1RmwKTvf
         b8qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793906355; x=1794511155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cG7V2rhEsUQxV3zVZSyOJx5RVUSLk8uogNgNjx2JGMc=;
        b=AqeKTEdEXcY//1zqQDx/I6G4FE6FmsYS9ZkxUsGGHKMiPyhqq8tqP14bCvsmSbQ6Zd
         ZTfvUidrolqTyx/iZiCWoWBqUKLR5Ccd1OTosoE6D1KmRM6ydrO8YWbRPp0yef4fSvuj
         TbTrYQDudKAaLxjihqm8uzR1IDJLdKX5D8XXiuHESRBt6kBGSbYmBx+NNY05qJv5LejS
         BuEVHcTghLyqpbuvKj84sXcfvU3OJL7s+yNlIU6fJRSCb6LmQ1kh7rrX9S+vwVTUKsr3
         FDFZxwrJsNjD3We8G9PldCkuKXueF6/hooY38JMzsF+CbGbd7i60mfP1HnDoMvNdaej0
         cknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793906355; x=1794511155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cG7V2rhEsUQxV3zVZSyOJx5RVUSLk8uogNgNjx2JGMc=;
        b=t7eSnEIiDxASbootiHjNyDZNMhCLfW884Vpg0VIGrE5ysFTlVSaRovrZj7O/9X3+Xn
         BAdAKvAaD80Hlrof1AOQK51LufYMcfUV2Th+jPOrmP2LnNllTy93U1D+3HqY+U4+cw6u
         0q5ATGMFiO5i1XC0TwfglY2tc2MfQXK0JRSSkX7hKssvDyNSipRAckJxOsE3ntSa0Zlu
         7PcVrUEXyCB6JBDRNbsd5wzEyAUEYifK1s6pQnPBggrsPfFzqmZg2g1Kq/8YzhGlTZIA
         jsVKhrQdHRkcfpRIdrRsgRevvS1W5L6v0WmalqM93cqnJSE2/OWW4oBoBue97ekJ9wyj
         LMHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUdAPZucIzIAr0ufjiy3s1yyXOVwm0xgonFeqU6NBB66TiK1s1mv1lf4Sp4zwz6fkb33c9eXVNp5lMgA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/qoGQprdQHWuN5JTfv2C/bxge6Ej2ofy8cxM4Gw6TTASPIs4EU
	27OzjcmWTaSKnlpAdxfBtjtmSWBW4SDKbqmsuidSRa6LnxPTl5ZLVO+2ntNBwwlu4SWrpr40maM
	gQkgOk5TsayO3poIR5PX0a847DwjvPgV1JVVaLVIvDA==
X-Gm-Gg: AYBFou0h4qAO34GBZy/zH67oMvqWE6gVCBboqSdYjnmwLeDcYR4hFwSS08VsHLRpuAs
	J5LoYfqT9BR1GB8s+452/KtSnFYhqaPlr6cE2dBIMwaKju9Z3oPwXh8X4YjCPJXCS7/rkduSPjy
	5CYsaJawCqyyyrXYsdezGqBy6beigoipNe76mdL6crvtIQt3YvzN0/+izf6zHXThgGJebLQ9JVT
	KGyOcmRkOhNsP7pqNSP6ihwvrfyiQNp88yfH4OTCC9cpdmlVsiSy5+eKy48VWjRLl2whtf+GL9Y
	SGjcWMgK1l+rS1IyzwPnXsIGaQX8pcF5N3o35JgiOPO3toedJcn1yIcfmui5pn6pJ8ONayPwRiw
	0rARLeazGk4kqSjtSW4WzngD3YhnUD9MaTmFvoGNadhKdLiCqs41NA7HlqfMHuR4CXPxrWRg7OI
	mL0aqzQLXJn8IYZbWmpsdzKg==
X-Received: by 2002:a05:6402:5d1:b0:6af:a64f:bd44 with SMTP id
 4fb4d7f45d1cf-6b597839e29mr152589a12.45.1793906355206; Thu, 05 Nov 2026
 11:19:15 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com>
In-Reply-To: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 5 Nov 2026 20:19:03 +0100
X-Gm-Features: AclHuK-U4kiWGxu3Smm8yI9vCCbQ3yDI8vr1zFcV6ipxQuXCdx9gJ9sMEFJqqeY
Message-ID: <CA+=Fv5QL=6ZccSCJRSLBB=WxqLe1qR2GPAFs3r_v-njatJ_k4g@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] alpha/perf: add ProfileMe sampling
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
> The 21264 from EV67 on, and the 21364, have a second performance counter
> mode, ProfileMe, alongside the Aggregate mode that the driver uses today.
> An Aggregate mode sample reports the PC where the overflow interrupt was
> taken. On an EV7 that is anywhere from 15 instructions before to 12
> after the one that overflowed the counter, which makes perf annotate
> output close to useless. In ProfileMe mode the CPU picks one fetched
> instruction, follows it down the pipeline, and reports its PC along with
> what happened to it: whether it retired, whether it trapped and why,
> whether it was a mispredicted branch, stalled before map, or was killed
> on a wrong path, and what PCTR1 counted while it was in flight.
>
> Patch 1 fixes a constant passed to the wrong PALcode call, with no
> functional change. Patch 2 adds the sysfs format and event attributes
> the perf tool needs to name raw events. Patch 3 fixes counts lost when
> an event is stopped before its first start, and patch 4 stops reporting
> user registers that the entry code has not saved yet. Patch 5 ignores
> counter interrupts that were pending when the counter was rewritten,
> and stops counting an overflow twice when a read races its interrupt.
> Patch 6 adds ProfileMe sampling, selected with precise_ip or a new
> profileme config bit, so cycles:p and perf record's default event use
> it. Patch 7 attaches the status registers to each sample as
> PERF_SAMPLE_RAW data, and patch 8 adds an option to randomize the
> sampling interval so that it cannot lock onto a loop. Patches 9 and 10
> report what PCTR1 counted as the sample weight and the data source of
> memory accesses, DTB hits and misses. Patch 11 adds filters that keep
> only retired, mispredicted or trapping instructions, and patch 12 makes
> precise events sample only retired ones. Patch 13 lets ProfileMe events
> exclude user or kernel samples, so that perf record works without root
> at the default perf_event_paranoid.
>
> A separate series for perf-tools-next adds a decoder for the raw data
> to perf report -D and perf script -D, and a script that sums the status
> by symbol or by instruction, in the style of DCPI, and a perf mem event.
>
> The two modes cannot run at the same time, because PCTR_CTL[SL0] sets
> the mode for both counters. A ProfileMe event is scheduled alone, and
> perf multiplexes it with any other hardware events. perf stat does not
> ask for precise events, so it keeps using Aggregate mode.
>
> To try it:
>
>   perf record -e cycles:p -- ./workload
>   perf annotate
>
> I tested this on an AlphaServer ES47 (EV7). Samples from a
> 16-instruction loop land on all 16 instructions rather than on 4 PCs.
> DTB misses and unaligned traps are attributed to the faulting load. A
> branch on random data shows up as mispredicted in 21% of its samples,
> and in 0% with sorted data. A 12 minute perf record -a while building
> git took 4.45 million samples with no warnings. Sampling every 10000
> instructions, which used to wedge the CPU, ran 66 times without a hang.
> With precise_ip, killed instructions went from 67% of the samples of a
> mispredicting loop to none. On two CPUs, this version survived 62 runs
> that mix sampling, filters, context switches and multiplexing, with no
> warnings. As a normal user, perf record took 8763 samples, none of them
> in the kernel.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> Changes in v6:
> - New patch 5: ignore an overflow interrupt for a counter that has not
>   overflowed since it was written, and do not count an overflow twice
>   when a read races its interrupt. Counters are now written at most
>   half their range below overflow, so the two can be told apart.
>   Suggested by Ian Rogers, after Sashiko found that a PCTR1 interrupt
>   pending when a ProfileMe event was scheduled in was taken as a
>   window close.
> - Patch 6: drop the stopped event check and the caveat about stale
>   interrupts, which patch 5 now covers.
> - Patch 10: also report a memory access that retired without a DTB
>   miss trap as a DTB hit, a load into $31 or $f31 as a prefetch, and
>   leave out the ldq_u UNOP. Thanks to Ian Rogers.
> - Patch 1Tested user-only and kernel-only recordings on all three CPUs of=
 my
ES40. I checked both the raw PMPC and the reported sample mode.

With perf_event_paranoid=3D2, an unprivileged process also recorded
203 user-only samples. Every sample had a user PMPC matching its IP.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>2: say in the commit
message that the kept samples carry the
>   full period, so the sample rate in frequency mode falls by the
>   killed fraction. Thanks to Ian Rogers.
> - New patch 13: honor exclude_user and exclude_kernel for ProfileMe
>   events by dropping samples, so perf record works without root.
>   Suggested by Ian Rogers.
> - Link to v5: https://patch.msgid.link/20261103-alpha-profileme-v5-0-bbe3=
937fbf3a@gmail.com
>
> Changes in v5:
> - Patch 5: refuse precise_ip 3, as a sample with a PALmode PMPC keeps
>   the interrupted PC. Thanks to Magnus Lindholm.
> - New patches 8 to 11, from Ian Rogers' suggestions: the sample weight,
>   the data source of DTB misses, config1 filters, and retired-only
>   precise samples. The last changes what a default perf record shows.
> - Link to v4: https://patch.msgid.link/20261102-alpha-profileme-v4-0-61e0=
0f5e1da8@gmail.com
>
> Changes in v4:
> - Patch 4: move __entry_save_end past the r16-r18 stores in entSys,
>   as PAL_callsys does not save them and interrupts are still enabled
>   there.
> - Patch 5: report the user registers when the profiled instruction is
>   in the entry code but the interrupt was taken after it, since
>   perf_get_regs_user() sees the PMPC rather than the interrupted PC.
> - Link to v3: https://patch.msgid.link/20261101-alpha-profileme-v3-0-92d5=
11b5a044@gmail.com
>
> Changes in v3:
> - New patch 3: clear PERF_HES_UPTODATE when an event starts counting,
>   so that a stop before the first start does not lose the count.
> - New patch 4: report no user registers for a sample taken in the entry
>   code, where the frame at task_pt_regs() is not complete. An interrupt
>   nested on one taken there is still not caught.
> - Patch 5: a user instruction whose interrupt is taken in the kernel now
>   reports its PC with no registers or user stack, as the frame at
>   task_pt_regs() may not be built yet. Thanks to Magnus Lindholm for
>   finding this and for the fix.
> - Patch 5: also move the counter away from overflow when a ProfileMe
>   event is removed, or stopped without PERF_EF_UPDATE, as
>   alpha_pmu_del() does not go through alpha_pmu_stop().
> - Patch 5: ignore an interrupt that was pending when the event was
>   stopped. Document that rewriting a counter does not cancel one.
> - Link to v2: https://patch.msgid.link/20261030-alpha-profileme-v2-0-c702=
f1c65272@gmail.com
>
> Changes in v2:
> - Patch 1: explain why bit 0 clear means all processes, although the
>   Architecture Reference Manual says otherwise.
> - Patch 3: fix a CPU wedge during high-rate ProfileMe sampling. The
>   ProfileMe counters are now written twice, and a stopped counter is
>   moved away from overflow, as EV67 HRM PALcode restrictions 32 and 38
>   require.
> - Patch 3: set the profiled PC in place in the trap frame of the
>   instruction's mode instead of in a pt_regs copy on the stack, so
>   sampled registers and stack values are those of the right frame.
>   A kernel instruction whose interrupt is taken in user mode gets a
>   per-CPU frame holding only its PC, so the user frame is not changed.
> - Patch 4: drop the reserved field and pack the 64-bit fields of
>   struct aTested user-only and kernel-only recordings on all three CPUs o=
f my
ES40. I checked both the raw PMPC and the reported sample mode.

With perf_event_paranoid=3D2, an unprivileged process also recorded
203 user-only samples. Every sample had a user PMPC matching its IP.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>lpha_profileme_sample,
so they are 8-byte aligned in the
>   sample record and the record needs no padding. This changes the raw
>   data layout.
> - Patch 5: compute the jitter with mul_u64_u32_shr() and saturate the
>   sum, so that large periods cannot overflow.
> - Link to v1: https://patch.msgid.link/20261028-alpha-profileme-v1-0-d44b=
52bf2500@gmail.com
>
> ---
> Matt Turner (13):
>       alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the logging options cal=
l
>       alpha/perf: add sysfs format and event attributes
>       alpha/perf: clear PERF_HES_UPTODATE when an event starts counting
>       alpha/perf: do not report user registers from the entry code
>       alpha/perf: ignore overflow interrupts the counter does not account=
 for
>       alpha/perf: implement ProfileMe sampling
>       alpha/perf: attach ProfileMe status as PERF_SAMPLE_RAW data
>       alpha/perf: optionally randomize the ProfileMe sampling interval
>       alpha/perf: report the ProfileMe window count as the sample weight
>       alpha/perf: report the data source of ProfileMe memory accesses
>       alpha/perf: add ProfileMe sample filters
>       alpha/perf: sample only retired instructions for precise events
>       alpha/perf: honor exclude_user and exclude_kernel for ProfileMe eve=
nts
>
>  arch/alpha/include/asm/perf_event.h      |   2 +
>  arch/alpha/include/asm/ptrace.h          |  12 +
>  arch/alpha/include/asm/wrperfmon.h       |  36 ++
>  arch/alpha/include/uapi/asm/perf_event.h |  31 ++
>  arch/alpha/kernel/entry.S                |   9 +
>  arch/alpha/kernel/perf_event.c           | 660 +++++++++++++++++++++++++=
+++++-
>  arch/alpha/kernel/perf_regs.c            |  13 +
>  7 files changed, 742 insertions(+), 21 deletions(-)
> ---
> base-commit: 330517c63aa9b48227b6ab45f01003effac77ae4
> change-id: 20261024-alpha-profileme-6e98a977cb54
>
> Best regards,
> --
> Matt Turner <mattst88@gmail.com>
>

Great work, thanks for doing this!

Magnus
