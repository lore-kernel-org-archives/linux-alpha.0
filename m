Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793749370;
	b=4VUevCY8i51NANV/crwo1LMECDiX/LpFGHVLwrziQQKBE/IHD++z8841IG537N3aA322
	 mk2AiIvVEkq5emPkCYRJnnvk1PCQww8I+cFt0XDWB8KCdEZ+hMbxT2DMCmSqoMSO5X/n2
	 +615g0oSxe543CcyBSIuUmETa2BWs6S/dDiaTFXL8of2qWBjFOvEBDB43BjkzUSjbkUOk
	 M0tiH/FCTyvhzEtwqu/IRDdu4/iJ0wc3KOaV8K8ba/DgUhKIwhyxrAiwUCLoWPMmHFUzZ
	 PYxc7pP4Q3S/gdt/WrnyppFzF01Wn9jTcytEh6pG3jsWY8YmbTwjiM+pAFwK0+HdOdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tVhG/sZRJzj5+F0QRzdXIaWdFtIw+6NJHQcWFAxaXbw=;
	b=IgsSnOQCwzqQ4aqY/2QzkjmYzZP7B7q1k/42gixea7BLmE2jAPm/ZPhSDSZ2SlpsTEHY
	 3uThIZh0oqhSIaqCtDz2nQA5FZ9NnminIS3BbSjvU6vUkjvabSIZQnbzrroAHDAdTMKHQ
	 bgqd3ulL+pRRBJt5m+8P+o5LVv9OBMtwDGaEDJPfWoyYbVMshAZ+UyfdNjrzmwknAANnx
	 hWC1jHzT2NKz6j3TGOzGIrYF26k+66cNVPty0wtmZPxi5r0+8HaLUBtH90CmJuknoLck5
	 vHogYckfdyAZgptysSh+DWX1n81T0vtwSATUtyyYkMZqS4qrjLyH/Y2xBjluc+wuOSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jLKajVPJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A14F606A333
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 23:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A14F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jLKajVPJ
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5383c97c8cfso55251cf.1
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 15:42:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793749368; cv=none;
        d=google.com; s=arc-20260327;
        b=VSW1afl3XbVQ6IOiUprUvAWvFqgPxSHfQ9svkNzeilExiHmjpM7d73u4rLYdNUntX+
         LBRBDG1CXzyPHB4gFpYyT6LPy4GpBTbpeKJzXtW8aaGkgIMZ3BCc2RbA/GxQVxyZvDXN
         Xz8hIPEkEmDX1GH/pn3VH92pDoOoLYVbkvFWZdEDd3cRyFKYce4nOF/XU2YTUwpREbzA
         fGB/hpAAAY5gRYOZvsHLsscNijajhf1DBrRR+jmoO7OWNK89f2VYQ61aLVGvAs48q3CB
         YsdNZnpGA5pOUSwv7gR/4ehTKp9Hlyn8MFJLk28lBxGxKvlQQGJk26xvy/pS7zWeufOg
         t73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tVhG/sZRJzj5+F0QRzdXIaWdFtIw+6NJHQcWFAxaXbw=;
        fh=pWtU5MrMIr7hADr5GL69wAUUtEPNWFIQGOUixQYdugw=;
        b=XNPy9BmfqlWjSC9+it4W85JPtMRI4veNWpyern2i7xvnJr683u7CBuwfKt1JgE8yr4
         frCGjwPyYr/FFijclENRCDjWfaiS5no2fFgUHqslZbDW2+IcbxDSkdOld0ABTA0es8qh
         jT4KleoS4Tlae4OJOnZtq30TaqQFVfe9LXyCy2CYPGhpuulJCZCLL7DMbkL+wKeQDdMU
         BjZyHLMBPmGzOzLjOi9V/XPkmbiuc6eKN4dlmCWGznz60S+uZ8eldTC730t2lBbtDmji
         8JteXT1kHL7JYJR5dvEYdfQYTnV5/2mtwYmc/b+pCChVhXgQHa4Muxl1vxDIwPXz+AS7
         4bew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749368; x=1794354168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tVhG/sZRJzj5+F0QRzdXIaWdFtIw+6NJHQcWFAxaXbw=;
        b=jLKajVPJxTlUibMrLSmOOnJQnogwWmXDLofPHyK/Em63e/94/He9WR+08cwrIuGOTr
         AGQRSrYtz6sRSQ7P1pYedxCIrxP5exQUyWoNh9j2o9DIXQo4/gYUrV0G3izQh3imnMB7
         Zqm9sc0oR2QI7vd9o9Qy8ZUO00lN0NnncFbKrMMQn5+NXTWoIcvi+VLIdbuPLPTBbQWO
         rLaCvhHIFU/ilYCbbtAX8kw9BovRCAXZlaQlSaWLV89Wbti5Nruf82yPZd+OCk3lXqvh
         aglnrQUKO2lWgpKLQzmbJwrniHlnpoZhiy/f9SmzJMsaiFH2Qd34R7zWvWz0YczEx4au
         A9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749368; x=1794354168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVhG/sZRJzj5+F0QRzdXIaWdFtIw+6NJHQcWFAxaXbw=;
        b=nZ4a/MsUbqTe3gBolUicA9zYy00ck0+a7Vg9ZY/n3dpZZLUy+2LjUvFNcs/M4Tlqs+
         9VWGcZLQY4tv3+44KYS1bYWC8TQHNiAUicXhvoE1Ew4ZeaQVNyo81ysykUIa9RBnlZ61
         fPj5Mi67hqKNRbzVCdO6W10xzUHKDn3rwkePmkSvILMGb2PlwhylmKK8NmbxiBOU3z4G
         grvESUGIATUf297KFb8L8OoivC/pnCjFO6WWGu9wxmI/LhxZQYN+psYLY5FLop/Mz7gz
         t2DGcGzLTLukLzESbpuYOnZSeAVX1R53DqkywAElJVTUKLOJ8gHUpEz1kbSrW/NUegMe
         TyBw==
X-Forwarded-Encrypted: i=1; AKwUvBwSFTd36HNUys85+cURbR4Bz18m9CwBzhNrhdDn2Gu9Zq8SJDD5iMGsukE60FupQdgAEoE6hL1NiuLFBg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8lKBnoAyQZYVIaPzyefhN8BovFD7uzE12Lctyxuz5p3QEXlzaG
	EdLK0dlG9EGRtLHB6Fmp+yfaM3C1/EpJtdBT2wwwbUzo4G7V8bCqJtHKuV9/4CDaN30uBziY7DT
	uSFUx6FsuCmWS82K1vPmIaIgUhSonQrJ4retSMu4N
X-Gm-Gg: AYBFou055s5WHkKd9aQxVKwqf/nCRAC2tcIVel2wHOAHkP3++x5cQrCXIhWEGvlu1xN
	BberOYTU/vgaTe5ykkM3WR+XQ7CP/uZMuQ4o7VCbeERbVYfpcynrVPlOy84pdD3TlYI2ZTX4z+P
	16dtgwlLXYQMSRRq1edJmIFx6I7jopLHsK77wImUwX/BeE33LlWf1J5mkmBOSF7FOk6bX2bC2+B
	lFnm2N5+jsd2Rq8Z71KRi7PR8VKnHiVnIerTEukrwROkvbKePizJSJWSzz+ISwPvPnhha6aIb6d
	XFN9DY5eIkUrOD9NwHfNYR7QdM+4+0phlXUVW2ZilapCEC9IMGiZuMywjY6xP+/Evr+uXKVr8hG
	w4u5+lqu3zQOOosM6U4l1NmJt3/LiFYKb4DpRtMEBh9EvYYNvbV5JO7cBlQkShBppJw==
X-Received: by 2002:a05:622a:5147:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-54b4e3bcd20mr3992271cf.14.1793749367603; Tue, 03 Nov 2026
 15:42:47 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
In-Reply-To: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 3 Nov 2026 15:42:35 -0800
X-Gm-Features: AclHuK9AeMJQ6PQbnb88LSGf5YQwNSco0QNq-rGESckdvYzO-GY3i0-tmFuIHKI
Message-ID: <CAP-5=fVtMnaoF1JbVFJuiRqPx-2izJafs=+ov6eF_PYFE9Xrxg@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] alpha/perf: add ProfileMe sampling
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 12:37=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
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
> user registers that the entry code has not saved yet. Patch 5 adds
> ProfileMe sampling, selected with precise_ip or a new profileme config
> bit, so cycles:p and perf record's default event use it. Patch 6
> attaches the status registers to each sample as PERF_SAMPLE_RAW data,
> and patch 7 adds an option to randomize the sampling interval so that it
> cannot lock onto a loop. Patches 8 and 9 report what PCTR1 counted as
> the sample weight and the data source of DTB misses. Patch 10 adds
> filters that keep only retired, mispredicted or trapping instructions,
> and patch 11 makes precise events sample only retired ones.
>
> A separate series for perf-tools-next adds a decoder for the raw data
> to perf report -D and perf script -D, and a script that sums the status
> by symbol or by instruction, in the style of DCPI.
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
> warnings.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Hi Matt,

Thanks for v5, and for turning the suggestions around so quickly with
measurements to back each one up. Patch 8 looks good to me; a few
comments on the rest (appologies, I'm using Gemini to help me be
cleverer than I am):

Patch 5: I think Sashiko's report is right. With idx forced to 0 in
ProfileMe mode, a PCTR1 overflow still pending when an Aggregate event
is multiplexed out gets taken as a window close: it adds a bogus 2^20
to the count and emits a sample from a stale PMPC, possibly another
task's. That's the mirror image of the false sample the commit message
documents for the other direction.

In both cases the interrupt arrives for a counter that hasn't wrapped
since it was last written, whereas after a real overflow or window
close the counter sits just past zero. Could the handler drop an
interrupt when the counter hasn't wrapped relative to prev_count? It
would need some headroom: a counting event's period is 2^20 - 1, so
its counter starts at 1, and a real overflow, which leaves it just
past zero, would look unwrapped too. Capping left at half the counter
range, as armpmu_event_set_period() does, keeps the two cases apart.
That would fix both directions, and the caveat could come out of the
commit message.

Patch 9: Now that patch 11 drops DTB miss samples from cycles:p, it
may be worth giving retired loads and stores a data source too. As
PALcode fills the TB, an access that retired without a DTB miss trap
must have hit, so mem_dtlb =3D PERF_MEM_TLB_L1 | PERF_MEM_TLB_HIT. The
memory sort keys would then show DTB hits and misses side by side for
cpu/cycles,profileme/. LDA/LDAH and the ldq_u UNOP would need leaving
out, as they don't access memory.

Loads into $31/$f31 need care either way. As the comment in
do_page_fault() says, as of EV6 they're prefetches, which never fault
(or are suppressed by the PALcode). If a prefetch that misses the DTB
is dropped without a trap, they'd need leaving out of the hits too. If
it does trap, patch 9 reports it as a LOAD, where PERF_MEM_OP_PFETCH
would be more accurate. Running your one-word-per-page test with loads
into $31 would show which.

Patch 11: Kept samples still carry the full period, so with -F the
sample rate, and perf report's approximate event count, fall by the
killed fraction: to about a third on your mispredict loop. That seems
the right trade-off, and it's what IBS's swfilt does with the samples
it discards, but it may deserve a sentence in the commit message.

For the next spin of the tools series, alpha-profileme.py wants the
same PM_KILLED_BM check before it trusts TRP and MIS. Its example also
records instructions:p, which after patch 11 has no killed samples, so
the killed% and invalid% columns would always read 0;
cpu/instructions,profileme/ keeps them.

Two possible follow-ups, neither of which needs to hold up this
series. perf mem has no Alpha events yet; cpu/cycles,trapped/p would
be a natural default, or cpu/cycles,profileme/ if retired accesses get
a data source. And as the driver already works out the profiled
instruction's mode for the trap frame swap, ProfileMe events could
honor exclude_user and exclude_kernel by dropping samples, as IBS's
swfilt does, with PALmode counting as kernel. PERF_PMU_CAP_NO_EXCLUDE
is PMU wide, so event_init would then reject the exclude bits itself
for Aggregate events. That would let unprivileged users run perf
record at the default perf_event_paranoid of 2, where the tool sets
exclude_kernel for them.

Thanks,
Ian




> ---
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
> ---
> Matt Turner (11):
>       alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the logging options cal=
l
>       alpha/perf: add sysfs format and event attributes
>       alpha/perf: clear PERF_HES_UPTODATE when an event starts counting
>       alpha/perf: do not report user registers from the entry code
>       alpha/perf: implement ProfileMe sampling
>       alpha/perf: attach ProfileMe status as PERF_SAMPLE_RAW data
>       alpha/perf: optionally randomize the ProfileMe sampling interval
>       alpha/perf: report the ProfileMe window count as the sample weight
>       alpha/perf: report the data source of ProfileMe DTB misses
>       alpha/perf: add ProfileMe sample filters
>       alpha/perf: sample only retired instructions for precise events
>
>  arch/alpha/include/asm/perf_event.h      |   2 +
>  arch/alpha/include/asm/ptrace.h          |  12 +
>  arch/alpha/include/asm/wrperfmon.h       |  36 +++
>  arch/alpha/include/uapi/asm/perf_event.h |  31 ++
>  arch/alpha/kernel/entry.S                |   9 +
>  arch/alpha/kernel/perf_event.c           | 535 +++++++++++++++++++++++++=
+++++-
>  arch/alpha/kernel/perf_regs.c            |  13 +
>  7 files changed, 625 insertions(+), 13 deletions(-)
> ---
> base-commit: 330517c63aa9b48227b6ab45f01003effac77ae4
> change-id: 20261024-alpha-profileme-6e98a977cb54
>
> Best regards,
> --
> Matt Turner <mattst88@gmail.com>
>
