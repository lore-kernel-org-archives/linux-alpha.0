Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794766058;
	b=Cf1222kZc2DM7nv2iVm34eDxMS2GQ64vdW/s72UKmveLT+ZYZmpudeJD2cNX9/oqZLBi
	 nTIsBXDd8B1s4pVZu5LfzPf2BC4Y7zlA+5ymmYl0P9/8g7rcizYA1EeCUxHKEduhfnynX
	 0Nsul3qcBuqPwFTCfXvhiWjnSqgZafp7AQH/CMeqPCQGFX5yhYosZYQMZE2UXMNvTTGWc
	 r3SSKCS6wXTD/3hH7d+11u9RezGqyvpDffUCT4mGY7LlOAIuP270jTUDap1B5X3GhfRwG
	 XNOm+OvR/3g1wRZbSzcgbNFq4foE3DdAP8ghf5h6lBGArDu/zvlwACT9mGPdyCKksmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794766058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u7QicanKXrY2xsRWJ0fWGMzqxkgBfx3GeNDw0g+HWqA=;
	b=i2GxMeK4cE7SaMIm8ddjbvzCePcbdqI8cvm/gKCA4c8/WGYUK66Re9Pkc5J2741u+wRA
	 dYqjeE9grAJsCt8ERdTUkVwuOgNRlfWgUniM33m3s0gSH9maADFW/NKjXM+qswI1/AV4w
	 XOS5rNtDMHjBn/rAxgp+6kOiNbGeXXDM0UOKDvxZ3+Yb4888c0OVyxqOhgpDcN+xWZjuP
	 D+2NWVjYOLJnJQ2c1VdsfMj4+Gl3xySPBKGhiI4xr9usMONmOVnnkdcJsfVJQfgYFpy1d
	 TimJSQCduAPBPlV6WNPG4P80jSgVKjmH7ANQEwWCgxOuTo8qU6zAs1QxiSHLE+SrNpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ec8bZ1KT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219A1606A31D
	for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 18:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 219A1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ec8bZ1KT
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-54492d8a988so189251cf.0
        for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 10:07:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794766056; cv=none;
        d=google.com; s=arc-20260327;
        b=rG7x01yGdhIp5G7bDOgrxp1zDfGZovh24bGkxnsuSXho9WSVNtBkBR1EJguHcY7UxX
         7PmdlSMYrfKIhdnjx4Hn6TGr5yINYk8zcXTqjIucSaFbg7OHfj+5EPm4Y+eF2NncY4m4
         tAUbTI0ItUg/skL2m4/S7vkC/qM3e5K4L9jz0vjWU8cOe/2/50gfOuX8VblDKqy4v+pd
         8tIAZT8EgODodvpBzl0Nhlfho0wgpZucZx4pi0xJdZcuefC9ESVWo5NzCa5zLJu+GpEX
         HgQStUoGesbN4kofF9cNo7TfFz6Y9C9/+M8IPPBLaBayCqRLVc1Bk7XCneOR2ofKe1x6
         GF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u7QicanKXrY2xsRWJ0fWGMzqxkgBfx3GeNDw0g+HWqA=;
        fh=F7bOjtzuRMsedE0nXwzp3Ro0c/ZNv1x5nCvt/+I8lcg=;
        b=VNFwPuoN/YQT0AJdhZBdZUYjERKAB/urCiZQQdApkc/lD8yMfYS/GaRrwvRwRPtras
         EjQb0xjfny+brbj9ghIVqCX3lvwjTwYiXu07nSYQjP8REuTxxX2q5nH71hbPCf6VSfHC
         ajBAtrS8DaaVoENDkjzmppVD62PqertYY6fAlPqDY+UHfyTyXiBrCA18pBqHhkZpg52F
         qOuQCZuiknh+eZXKUeh8/9McjQuwgDsD5U5XqbatKHYgYLyo3bfjAh4VaT3F1Fzb7IGv
         WqhUQ9ZdceRVNCsnu9ICF4Cgwdb4saxDRsWBW17gxiGtp4eAx51bh4XYpVW+Z+0+vnTT
         TvBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794766056; x=1795370856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u7QicanKXrY2xsRWJ0fWGMzqxkgBfx3GeNDw0g+HWqA=;
        b=ec8bZ1KTqxlw+uJd/sieq8Cp5zUA1fW8jj2Sx+RG7DnEzPtQN2KKWeCe7EV/Kj3UXt
         WueXWHJ/L72qj/bSKs+MDatjYwMdXGbWmWQRlm2eeh+aHJsTRszA1SCVKAqSWFZ8FM5h
         ENmDy9j8q2hWJNZx/t50j6m4JI2ZzgnnHfmnengB+2DhV/3SEqFzdVpd1Rghk7q16vlA
         XNojtRkaRP6dN3BaZPVYgeqAKwDFAUE73bwUZcwRnlyrssvHo/TDuoz5p4dSQ6f3WDBm
         GJT/ZfunKCIsymu8oF0wDQwo2Um+ZtjAViAIdG0zb+yE5p0R8+gzjX+2jA/afqEX3yXl
         552Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794766056; x=1795370856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7QicanKXrY2xsRWJ0fWGMzqxkgBfx3GeNDw0g+HWqA=;
        b=lZvVLMGueMeNOqqrz5mrC+mtkPYDdGsVgZH0+0Icv9FhJP98awMAhFvb+9wXEI74cp
         ehoR+y2/V0aPD0plwV81537ntgJMJ0M8VtofxDlr41Az8nSt24yahTezBMkfCdY9QcuU
         z+UpPPGXHkquotIuH8NdJlF1VeO1PijplNy6LCe+/76jxFvfNYRGu7nKQMcEQ1fgAVlw
         kIyE5XvanoXiSW2BUGtD8ZnZQ9bh4vPnqoiBdvR6avs5vUbdVKycezgoaX4DbumdF7A2
         NcHJXW2xrcb2hdS5W+Wds92GAyDO41IRc+qQgr9qrnctRzajsFhMhXN73TJx2ze9o2TA
         C6Zg==
X-Forwarded-Encrypted: i=1; AL+hErEuc7Kh26/eH0MmfMu/MSe8RufET7lazC0rJMb9z3VQO6S22F/UUb22HxF5r2CzVFDEk+vIQlr9mWx5EQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/CnqO9Yv52XZ2udbuzTpv2fg9JYGGDE1AankdWA+LSTsPIhsBS
	9fTavjk1qZoCNaepJmmta4wUYSOfEjVTLYp7ealSPRFvEEXZtn5UK/YvDbsiHaB3uQ0dZF5OYp1
	G3I2fwl8x0jEq+ZD3sbI/GMEttfqhpiFHEZJ+3cA/
X-Gm-Gg: AYBFou1tVB5ZonBjycUMUe1P4RPS/s5IGIlzD0fvvKmkoctv2FeSST3YEt6yTDuLdpX
	S0VybD3ZMDIUPD1tPpkxRQtkcjNjwTe8o+V3MOaN6BaWvxHLWCs7HqDKZYG6QQdy6J9VtFMDlo5
	yaSU88GR0Ikn52Fei9+6ZSSI0I8QYuNKeAJKyb8LmE+ONd8fhBwIe/ezkVIhXLPYoheEyqubYH+
	H3N+pmooDQ2Fdk5g6i/ET4vZT2mu6q0iyh+Cjon9oHlMXOlrSOX8tUav+Lbgz7MwMBq3v7alsBs
	E+40cSGM55RSDpqDH00y3aIsKkqn2/1UnCxOu3aGkBaY7EI09arnkVPKcofLJAuT+jCEs2GVZW9
	Gybs61/NPHIaowYo+fy8fLsvlee+EzAM1RhEy/q22B5pFxp6mFhwc/7ucmQ==
X-Received: by 2002:a05:622a:408a:b0:532:9220:a9ae with SMTP id
 d75a77b69052e-55c473ac0e3mr29115731cf.6.1794766055199; Sun, 15 Nov 2026
 10:07:35 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
In-Reply-To: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 15 Nov 2026 10:07:22 -0800
X-Gm-Features: AclHuK8I2aJMnL-w4kk3icBRZF4Kavcx9MZm99nl2-dp0fTFJmi5uR4vKxLAUEw
Message-ID: <CAP-5=fWLH6hT-YR172HMHhnepEMmUCaqTLCD0kTMVLgdad0uxw@mail.gmail.com>
Subject: Re: [PATCH v7 00/14] alpha/perf: add ProfileMe sampling
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 8:30=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
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
> Patch 1 stops alpha_pmu_del() from indexing the counter arrays at -1
> for an event that a failed group schedule rolls back before it has a
> counter. Patch 2 fixes a constant passed to the wrong PALcode call, with
> no functional change. Patch 3 adds the sysfs format and event attributes
> the perf tool needs to name raw events. Patch 4 fixes counts lost when
> an event is stopped before its first start, and patch 5 stops reporting
> user registers that the entry code has not saved yet. Patch 6 ignores
> counter interrupts that were pending when the counter was rewritten,
> and stops counting an overflow twice when a read races its interrupt.
> Patch 7 adds ProfileMe sampling, selected with precise_ip or a new
> profileme config bit, so cycles:p and perf record's default event use
> it. Patch 8 attaches the status registers to each sample as
> PERF_SAMPLE_RAW data, and patch 9 adds an option to randomize the
> sampling interval so that it cannot lock onto a loop. Patches 10 and 11
> report what PCTR1 counted as the sample weight and the data source of
> memory accesses, DTB hits and misses. Patch 12 adds filters that keep
> only retired, mispredicted or trapping instructions, and patch 13 makes
> precise events sample only retired ones. Patch 14 lets ProfileMe events
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
> warnings. As a normal user, perf record took 8746 samples, none of them
> in the kernel. A two-event group multiplexed against a third event,
> which makes the core roll the group back through alpha_pmu_del(),
> counts the same instructions as one event counted alone.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Hi Matt,

Thanks for v7! This version addresses all the feedback thoroughly:
- The group rollback guard in patch 1 and patch 7 cleanly handles
  unassigned events during transaction rollbacks.
- The clamping in patch 9 ensures the randomized period remains positive.
- The data source, sample weight, config1 filters, precise retirement
  default, and exclude support in patches 10-14 provide great generic
  tooling integration.

For the series:
Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
> Changes in v7:
> - New patch 1: do not update or turn off counter -1 in alpha_pmu_del()
>   for an event that group_sched_in() rolls back before it has a
>   counter. Found by Sashiko.
> - Patch 7: park the ProfileMe counters only for an event that had them.
> - Patch 9: keep the randomized interval positive when the counter
>   overshot by nearly a whole period. Found by Sashiko.
> - Patches 2 to 14: picked up Reviewed-by and Tested-by from Magnus
>   Lindholm.
> - Link to v6: https://patch.msgid.link/20261104-alpha-profileme-v6-0-6336=
2e9290a3@gmail.com
>
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
> - Patch 12: say in the commit message that the kept samples carry the
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
>   struct alpha_profileme_sample, so they are 8-byte aligned in the
>   sample record and the record needs no padding. This changes the raw
>   data layout.
> - Patch 5: compute the jitter with mul_u64_u32_shr() and saturate the
>   sum, so that large periods cannot overflow.
> - Link to v1: https://patch.msgid.link/20261028-alpha-profileme-v1-0-d44b=
52bf2500@gmail.com
>
> To: Peter Zijlstra <peterz@infradead.org>
> To: Ingo Molnar <mingo@redhat.com>
> To: Arnaldo Carvalho de Melo <acme@kernel.org>
> To: Namhyung Kim <namhyung@kernel.org>
> To: Mark Rutland <mark.rutland@arm.com>
> To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> To: Jiri Olsa <jolsa@kernel.org>
> To: Ian Rogers <irogers@google.com>
> To: Adrian Hunter <adrian.hunter@intel.com>
> To: James Clark <james.clark@linaro.org>
> To: Richard Henderson <richard.henderson@linaro.org>
> To: Matt Turner <mattst88@gmail.com>
> To: Magnus Lindholm <linmag7@gmail.com>
> To: Michael Cree <mcree@orcon.net.nz>
> Cc: linux-perf-users@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-alpha@vger.kernel.org
>
> ---
> Matt Turner (14):
>       alpha/perf: do not update an event that has no counter in alpha_pmu=
_del()
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
>  arch/alpha/kernel/perf_event.c           | 675 +++++++++++++++++++++++++=
++++--
>  arch/alpha/kernel/perf_regs.c            |  13 +
>  7 files changed, 754 insertions(+), 24 deletions(-)
> ---
> base-commit: 330517c63aa9b48227b6ab45f01003effac77ae4
> change-id: 20261024-alpha-profileme-6e98a977cb54
>
> Best regards,
> --
> Matt Turner <mattst88@gmail.com>
>
