Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793818430;
	b=bc0tf+2++rJ/BdpkqdJDJh9t8hSv+TL7NLA3abP5AQzB0v/FLuZzBjzbQFZMegyZTkGJ
	 1Wf3YmhpM8WJwq6G+RdYTRDg47SASfucl7dYgfpkbLlwtXTkYtvuQilIHPODO0HM+huOn
	 f4ZfuYErnK8yTtZ7nxaQ0px2Rm6M2uMVvdHbTfwGSc+14EnNN3wgx1oVxndR9usvzwYaJ
	 idRt0tdsLbROenBxVnEiuFS3NfWWxUvD36I+ujG2PjvIfbJS5v/TnG8LCScQFyGqKiA6i
	 VM4SOnxRcHpq1QL0DuDNyhIVh2C3y2w65UeRo4NWEL9dB3Ne1Swby5SuBJZy+s+ZDkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VSLZirYLfXxCX6vmTSLPB0q93v507OlVixWklmCxkMQ=;
	b=fTh1O/ugW3s0/PteXryqpr9pUsrYOwIwBiMHlxqxnmNb7aiPjkLvwKr/kVXdhYljcPLh
	 1VwTTX3uCHJZvvuWYLiA7pO80avExb6z+6jdsn9TAm3O+HOLbVdK5rCP04iYQXGHiGaLS
	 JEQHxbE5fYa825LI97dJ6I5IjMNV9/omEXYgky9C4r66NdDcvlMbKwBo9vz5OcjpmDSGF
	 lX1AF5ZFnXVv2mReoLq5pBmMlKf0N0n9ZTbyxFCfCbB1HSssmQCLx4eTGSGe9qQLpo4PE
	 pCLq4nzhbTk0ElMHJcON8Tlr+GnyNz8M0TfDvkSnvi4vP0cztTgMsvs+kQf8OBb3+BQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMbT5d5A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C712606D80B
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 18:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C712606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMbT5d5A
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso696549e87.0
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 10:53:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793818428; cv=none;
        d=google.com; s=arc-20260327;
        b=k1Agw47Ga9OUEpOQoqoc5YtNKkVYFualveqirBDCVGOhF+ymuoCUJ/F/gH7p6Nnf2b
         XLX6ES5xrYQxtQwttt7wahbBq33rEXzDLs4h/K8bJ29c4C/UpwjlW6ipuYpJeI9/JYX4
         qW5BD4GnSdKYNT2++1uqc11dT3QZiRqQezEGpX2QqetLYChiJLLnF6uVl6Qobs7GpsU0
         yhbttGKeMyMxkFQdNcte4eUW6fjIqftdd1vxj35g6sS5ACNiULaAToN8mPbCOMEb1JHg
         Sxm3qIi+DmTMQaKbefXNjeVKVWx1af3W3WvsecxwANYvnjxRaBZO9xeNsrc6m6vFKrdq
         BzgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VSLZirYLfXxCX6vmTSLPB0q93v507OlVixWklmCxkMQ=;
        fh=mZvbjyBbZx4Gn8LPMESWC3vzvTyFtOKbE8UiJMX9qP4=;
        b=l4/Pqto+axbratp5VT0uVg/y2Gd3lxNTD6psx/pevX7Vn5t0vjeQNXrPQXVg9ShmTe
         rqISswlUG+Z6JeAxZ6/zuymGUJa9XdokqZ12NUF+H1PHpTKHunXMromx+EuWcZTeA3lV
         1HMiVLZ0UNgdprwD2erzx+f9uzUPjGaNt8MsrRI4yZmjClWPdML9v28dDPeJEUCUyR8/
         UbHEYMqkxik5n2yXJLakGx2NESP2K7XVRMiLVswz+DXrIaSuR7FSs4/4PrUsD3G9Dd+B
         eTmqYVC5wUx5ZsEZ70FxN5MogEPR4r9mGkO3yB3hOlr6Oojtx40TxKMgR37+ElSA8ECP
         qTNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818428; x=1794423228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VSLZirYLfXxCX6vmTSLPB0q93v507OlVixWklmCxkMQ=;
        b=PMbT5d5AfA3PKJ81m+UKPVsHKXN0tvmPHqP3xOpY/M+JwQrno2/TrDH+YOK4f8QGUu
         6GKbUP+P9YY0vfpxdMSD0aEQTFcQsNQcE/KpLy7ut2Q9u1OYhv+c2xKLDSupF7wPccWj
         AzqWg6XpW85jy6tzDERjz4YOnRQP0jzH1JxOm9A+CtfKQZXRe8i+tg5mCcAOEeytu6c7
         MdAMtJi+ZZJcog3NDVz8tNIgWM4LPsqd4y18rE/s3/iE/XkuulpjAgE33g1kQoXMRwQD
         TqpdyOPLDh474Hh0Vb6gkzsYoHRPu/dG1/u68hm1nEHM2Bl3hYSOVbl/XlH5q41T2quV
         r8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818428; x=1794423228;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSLZirYLfXxCX6vmTSLPB0q93v507OlVixWklmCxkMQ=;
        b=ffb7j5OhRX7RNh+xVkDAP8Mx4uOhd1C2m5Em+Unty/ETDchPrIfb3qlGHgPGhE1oVY
         2h1mtdC7Zx4fdW8CNPWLkw6hUqxQuYl6uK+Y9xfr3BwiLYIpcGzaj1bmxcqWFtijdVyn
         skuJanmgw3BaNhdpZz6PQNZIm0O4np13vr2C/DHmaiIo4vyRwep911BVGJ3IWBtXz34e
         hnJgJipt58NCYVQvEYP6LKALk7bDMi9DYXCU3m8ZMgpC5ohosIkVGd4Y+SrDf/fFurDB
         2Bme0JXhm2vMXdoyzmsaepkbS8JDZb2fjWQiIN97CcxPXiJ2m5PZ0wtWkDGhMEJc3cIx
         y4Cw==
X-Forwarded-Encrypted: i=1; AKwUvBwNyjQ0Q+Dlaj1o7UmRhZPEEhV/Rr7KZyQtXFQNA3tAY3S751ZIDjHA02Y7Y/qHL6e2lEnUEi38nB3FCQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+CovR9/s0zeUro9BBietdLzPW/yzd5UV+Vb8b5NQBQ/MuwbpbO
	Zvm88T9RdVReOPSIJgtv+LM4EWJU35NnGYS/SP84FVMyAVGPbz3+g3VB08qFrJLSHLXtqYEDU+C
	H+g8Qh6t0o4N36OY/vqU6jNxPgIYteQA=
X-Gm-Gg: AYBFou3JRU+AVlpO39jn35/klqMS21jBp4DjAk3DpYhuFmhbJuh+3dnykSDAyIaT04U
	U6jYuOJtX5U+eEYvO2Of3Di4XkjiLknKmwaLti8lEt6Wm3vTeusHaOOmC0HAyN2e/miFuUvdYb+
	Jdqi323SK+Q9RMqI+3/gQ7d7v0wr4/tickwgUdYM/Y4N0HPAyZRd9d7J6LkKiFbrRjJRf/VsBNJ
	yMyPmfJRjvmDgjbNazDU1qjtzutTwUNhKIfVKZwOr06pkEw5bW7+kepTEB2PRtG2c73RMU5gj0z
	+Aqj9l3qmxvOH96QedJaqh6lOV8MJPz0OREnNuSH7i6LjW9hAGEqEFRfZoBXACC28GYP4YQDU4b
	XaoqqoOIe3c1XpxZ9d2Zzws6HiyvWyn71g9fyoZS3c4tSvgkKc0vTYk6wizd3KuhtiI6Wq/W6G1
	oI3EB4HBQTiubFy7MdO7UBRD17rsHmb2eJe5Gg7a6BDW1tFtBgUEYY4VprXs0ldeEh0DyRUQyGj
	Q==
X-Received: by 2002:a05:6512:3a92:b0:5be:3c86:f24a with SMTP id
 2adb3069b0e04-5bfd957e37dmr6686063e87.53.1793818427812; Wed, 04 Nov 2026
 10:53:47 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com> <CAP-5=fVtMnaoF1JbVFJuiRqPx-2izJafs=+ov6eF_PYFE9Xrxg@mail.gmail.com>
In-Reply-To: <CAP-5=fVtMnaoF1JbVFJuiRqPx-2izJafs=+ov6eF_PYFE9Xrxg@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 4 Nov 2026 13:53:34 -0500
X-Gm-Features: AclHuK9pOKGbog0PgwGPnVhdNm68bt_g_FLIV6Q4IvNlgqwLLjl2Ikr-ET1-ZgE
Message-ID: <CAEdQ38GxScDOhw-4ev_cOyWcEiE2jtfyp2FEJEEomvcgExjL4w@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] alpha/perf: add ProfileMe sampling
To: Ian Rogers <irogers@google.com>
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

On Tue, Nov 3, 2026 at 6:42=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
> Patch 5: I think Sashiko's report is right. With idx forced to 0 in
> ProfileMe mode, a PCTR1 overflow still pending when an Aggregate event
> is multiplexed out gets taken as a window close: it adds a bogus 2^20
> to the count and emits a sample from a stale PMPC, possibly another
> task's. That's the mirror image of the false sample the commit message
> documents for the other direction.
>
> In both cases the interrupt arrives for a counter that hasn't wrapped
> since it was last written, whereas after a real overflow or window
> close the counter sits just past zero. Could the handler drop an
> interrupt when the counter hasn't wrapped relative to prev_count? It
> would need some headroom: a counting event's period is 2^20 - 1, so
> its counter starts at 1, and a real overflow, which leaves it just
> past zero, would look unwrapped too. Capping left at half the counter
> range, as armpmu_event_set_period() does, keeps the two cases apart.
> That would fix both directions, and the caveat could come out of the
> commit message.

Agreed, and done in v6 as you describe. It's a separate patch ahead of
the ProfileMe one, since Aggregate mode has the same problem when an
event is reloaded or perf moves another event onto the counter. The
cost is that counting events now interrupt every 2^19 events instead
of every 2^20. The caveat is gone from the ProfileMe commit message.

> Patch 9: Now that patch 11 drops DTB miss samples from cycles:p, it
> may be worth giving retired loads and stores a data source too.

Done. Retired loads and stores without a DTB miss trap get
PERF_MEM_TLB_L1 | PERF_MEM_TLB_HIT. LDA and LDAH aren't memory
instructions, so they get nothing, and neither does the ldq_u UNOP.

> Loads into $31/$f31 need care either way. [...] Running your
> one-word-per-page test with loads into $31 would show which.

I ran it. On the EV7 a load into $31 that misses the DTB does take the
miss trap, so it shows up with TRP set like an ordinary load. Those are
now reported as PERF_MEM_OP_PFETCH, both misses and hits.

One thing the test showed that I didn't expect: an ordinary load's
samples split about 1:1 between DTB misses and hits. The miss trap
aborts the load, PALcode fills the DTB, and the refetched load hits and
gets sampled again. The commit message says so.

> Patch 11: Kept samples still carry the full period, so with -F the
> sample rate, and perf report's approximate event count, fall by the
> killed fraction: to about a third on your mispredict loop. That seems
> the right trade-off, and it's what IBS's swfilt does with the samples
> it discards, but it may deserve a sentence in the commit message.

Added.

> For the next spin of the tools series, alpha-profileme.py wants the
> same PM_KILLED_BM check before it trusts TRP and MIS. Its example also
> records instructions:p, which after patch 11 has no killed samples, so
> the killed% and invalid% columns would always read 0;
> cpu/instructions,profileme/ keeps them.

Both fixed in tools v4, in the script and in the perf report -D
decoder.

> Two possible follow-ups, neither of which needs to hold up this
> series. perf mem has no Alpha events yet; cpu/cycles,trapped/p would
> be a natural default, or cpu/cycles,profileme/ if retired accesses get
> a data source.

Since retired accesses now get one, tools v4 adds a mem-ldst event of
cpu/cycles,profileme/, set up only when the PMU has the profileme
format bit. cycles:p would lose the DTB misses, since it samples only
retired instructions. perf mem record and report work as a normal user
on the EV7, with the load showing both L1 hits and misses in the TLB
column.

> And as the driver already works out the profiled
> instruction's mode for the trap frame swap, ProfileMe events could
> honor exclude_user and exclude_kernel by dropping samples, as IBS's
> swfilt does, with PALmode counting as kernel.

Done as a new last patch in v6. PERF_PMU_CAP_NO_EXCLUDE is gone, and
event_init rejects the exclude bits for Aggregate events, plus
exclude_idle, exclude_guest and exclude_host for all events.
exclude_hv is ignored, as IBS does. A sample that falls back to the
interrupted PC (a PALmode PMPC, or a user PMPC in a kernel thread) is
dropped if either its PC or the profiled instruction is in an excluded
mode, so a user-only event never sees a kernel address. As with IBS,
the event count and the PCTR1 window count still include kernel time.

With perf_event_paranoid at 2, perf record as a normal user now works,
and on a workload with plenty of syscalls none of the samples were in
the kernel. As root, cycles:pu and cycles:pk split the samples cleanly,
and perf stat -e cycles:u still gets EINVAL.

I've sent v6 with these changes.
