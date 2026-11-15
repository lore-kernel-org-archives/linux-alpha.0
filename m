Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794739658;
	b=j0egj6XD60atwsGbrKDa59ZkPdl3MpgSEtrb2PV7TnQYMoJuvly/GqBr+sCO1ADxwfeo
	 opSVqEIF6QE8u+7z2IobtMxxdhWZwnjYTLtyKAVbDribAP2OG+OllRUAZU2oKI9aVxEXE
	 6yvc/6DdvbEjl3EZ1HVLcHOlgcfhk57uHsZD3WEvLOaYOcoZBI0SfUA1OJJnP4Atr5FeU
	 kjYwZOLSYTHoQkYDIESlyuz66yjGy5TGt8ReE7FpeVeLWWLq/x4hgEJAXphDdexY5Irzb
	 TFoPSfofUA97HogJSOXB4kGW8JqoP3eS1RU2U9GaLQbIWj2SXHxQOH70mFShvJ4eHzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7hNKkJJ70oe8gF6M+CzP6oDsWzOHjvQZU/Y9Gmdl08c=;
	b=wZ32RfsRjP2w6+eS5YQKk/4OO3/wn21RsR+M2aOXQwVCURYH7tsHqICJro1JQ7SsAaM2
	 F3txw0lWotyV1qxbTKegODS+egQH8mONIMyzy/zd8vYnGa7ieBU6WHMa4yZ5HFz/r/Bsk
	 wBz6bqslDDrdTXjXp4/QKtnZLOU3NjN2pkgMgFvdxCYV1T59avOZYFmkraA2i7JCnmPGL
	 +VOGVQPI61KB5XlrXEbQ+chOm4yQdLQ2YdfRC2dCF9ZlLL3fo5QMYpzDsRUARoHl5U9Dk
	 iehrbWYxSHSLoLdbw6Ywi4ERvh074vZh8QDubJLEwcrzW8GhNt/7D0vPUvfrHtQlsXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0yaroapg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89A2606A31A
	for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 10:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D89A2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0yaroapg
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so3900447a12.0
        for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 02:47:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794739656; cv=none;
        d=google.com; s=arc-20260327;
        b=L2b6f5QczdSwVcttANjrJbXxF+bORJ7Y6qSlBvsx8ZL0wfGVri8Qw9YQ/t1FxHEO2L
         X1M8p47iT3y/cqpDpN1JYnrOHSQTOExCIKC71xg2f6ztT2WeGmdC2RjvDES6wpZRbbgQ
         eRk8rpky6FM+o6rvHXNBq7x5PhINsdnoGf1Q9V/VSN+3CLgxDpalIwLj1tyXVhBQHKmp
         0FuGnIx5piydlfbmRGg5SQ1REY8/RTLkFGH+GV+1vLVCN5mWpp7hJhpd+7WWHMoSLhLO
         liLbNgBDqWTBn4xniLHLdthAaGzXyK9eDJ0VPrgYeBfAojle+IqKeAgkABOK/FQsoifU
         iAvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7hNKkJJ70oe8gF6M+CzP6oDsWzOHjvQZU/Y9Gmdl08c=;
        fh=joWYHOZmqerRb8gySQpvHUbsFbKr/y/26F06WA03PMI=;
        b=ZphCFEM1twa5DkIcjH4TQC497Zc17Vv7JaPfEOIGEgeDpdh7lh9LIib9Gwch9u5CfH
         7GgPC9nokpdm4ehPPONPe4WHFAqIjwumYIcLhIlh7eA5sGWaHgOTwe6tbdIINPwcwMk8
         glcCOzianz7TwRCSiIHnfku0D2i2bcXwqOG1riugFgCD3hGjpFPRexU3vns3mnC+iy9q
         pcqHNoKIhvvhxaznpd1e/BfOBsbswLVgZCuVqXRrPcRcmbs1E5Nz2PcUsMYzVs2DkKD4
         dGiVEKoIzgwe+xDan3RS1OW2WdO6KyBRes0PqNoOIwOakm2eAcifGJJM000/SbWLlEdm
         wUIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794739656; x=1795344456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7hNKkJJ70oe8gF6M+CzP6oDsWzOHjvQZU/Y9Gmdl08c=;
        b=0yaroapgliwOF0oOHtWneHn+AdMq1iwYFupBALuhtU3xq7N0C0+ZXMXQBOyAD3GGj3
         ADZtTTRBEDnocmSTov3Wwyi37rGwqCr+HLlstUHOgnypSOW+E+KmursMGa63W6Tnkeb0
         2HJa350marYhNYgiyC9Mhal5zMx0fYTLVN9pK5TFrnev2h3xNhv6Kq+AKp1FWzQW/iu3
         waXFyfO6tsZdUYlhT01bX8S3mtvCYQubF6Z2TTIJiS+atpCFkVXvqr1oc41709tBLZ4F
         jY+ntJosrKvGTfIAPqlra6oMeZ6Tr1ifs4X6fhNMK39u2/RNTfI/rAysCKqQrMoUqKDA
         Y6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739656; x=1795344456;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hNKkJJ70oe8gF6M+CzP6oDsWzOHjvQZU/Y9Gmdl08c=;
        b=lUm+H9tfKkIgY9F5g7CQKJ8o0GOJXIHhkb7xOiNkvqZIUvw4asyeZFvouw1wIEmTp+
         fRCeHoBdE6vk6Pe0QmoY68S8M4t3MBGCitX89da5kijZF+Hrk2tzUZPIwH+EZoTH91hS
         WQwQ4HgiTjVEhbWauog9DZtJtRRSFslWpPB8KX1Qd4WVghoXIyU5OWl0k1LMysvr4jBP
         6OPT7oRRxdh7C0WHR5HmeYTO0RFUCG9EGQYZdSOPb1/PbMgeWe8/XQlGGSmIIY9s44C8
         Q1nhqwMXNBW+a/fxqaWI4MrZqiA2iLi4vCeHia/Wb8kGb6NrnWqbNcKCHZb4ZVtu6cZG
         cI4Q==
X-Forwarded-Encrypted: i=1; AL+hErFBVDi14k+7a7r0n76mt49W9XrtWvfzaC/n2EQj6JLDU8W/PpROklh55zf9U4CbVb67ZMq9YTB3up0Irg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/c7XoFmTIuk7zkVrp8PlGbQl7vknFtawpir6gjq0UAJNGsh+mN
	rEOl0iygG7qwViUD7Nm2lNsAUhnJ3S2gVA4vGeFG00DfvpmoHm2mkhyJoKIAQAVlLfEmVCnjsI6
	nzEaxvLokjgZTi1WIaXQ9ql+Nocwbjx4=
X-Gm-Gg: AYBFou3zVEb6rePYtaqa0IPJTuSm/V5uUxvz/1+Ut1kGTgT1NZY0QsJyFodGBoAFHVj
	scE/Ia2EYhCsyOwk7aH9SN/8zmhIjgf3rU+mSX/+UqaDjOyJlFfsVcPNPaOBBIMyreh131HG7w+
	2/Be+Tj4Uoar9V2GmT14HL2xmBRELn8UZnxXCAKtzgaiCs7MfX7A/62GXyBlP9Cd7RXEySHb7w6
	NEp6HG46/hEgTNPZybSp9nWZydooyGBQCrPjAFh5UqC8QrJ+ZrtOJDvnCkL+M6Ei+osmh0aQO2i
	8FR4Ncxm7oV7oYYXqJuok+kuetk5Pts++vehYei1qrJoK1shMNGz9zik3pl75fxXVxmC3jM77qP
	PJAi/cTAoJle/a5QPzz91BDbXvyZA/TSP33Naua/fRZdtXSc6iZzpa+BdDF7/HGGQlccG/Bfw09
	0B5G423KXIdRWSbV+5Po/Y4YA=
X-Received: by 2002:a05:6402:13d6:b0:6b5:74dd:37ee with SMTP id
 4fb4d7f45d1cf-6b7c0d2d212mr5900328a12.44.1794739656036; Sun, 15 Nov 2026
 02:47:36 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-perf-alpha-profileme-v4-0-1771ea02950e@gmail.com>
 <CA+=Fv5RBKVAdGgq=BGPmLXpczcB3qvQcSw8aat7nB2ePXcG4yg@mail.gmail.com> <avQKb-vBxTvMn1yF@z2>
In-Reply-To: <avQKb-vBxTvMn1yF@z2>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 15 Nov 2026 11:47:24 +0100
X-Gm-Features: AclHuK9Mu_cJKLZOoV0Y-yZCRrVtpzl_e4de-VMWVu7r7OWJeMEUlQrpyeZtftw
Message-ID: <CA+=Fv5SA6so5VjPzjj1tCNKxwOk=5ejj0YhEG483u_-RY+7NoQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] perf alpha: Decode ProfileMe samples
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Matt Turner <mattst88@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 11, 2026 at 7:25=E2=80=AFAM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Hello,
>
> On Tue, Nov 10, 2026 at 08:31:02PM +0100, Magnus Lindholm wrote:
> > Hi all,
> >
> > On Wed, Nov 4, 2026 at 7:53=E2=80=AFPM Matt Turner <mattst88@gmail.com>=
 wrote:
> > >
> > > The Alpha kernel series "alpha/perf: add ProfileMe sampling" adds
> > > ProfileMe sampling to the Alpha cpu PMU. Each ProfileMe sample carrie=
s
> > > the profiled instruction's PMPC and its I_STAT and PCTR_CTL status as
> > > PERF_SAMPLE_RAW data, which says whether the instruction retired,
> > > whether it trapped and why, whether it was a mispredicted branch,
> > > stalled before map, or was killed on a wrong path, and what PCTR1
> > > counted while it was in flight:
> > >
> > >   https://lore.kernel.org/r/20261104-alpha-profileme-v6-0-63362e9290a=
3@gmail.com
> > >
> > > This series is the perf tool side. Patch 1 decodes the raw data in pe=
rf
> > > report -D and perf script -D, as is done for AMD IBS. It copies the n=
ew
> > > uapi header from the kernel series into tools/arch, so it should wait
> > > until that header is merged. Patch 2 adds a script that sums the stat=
us
> > > by symbol or by instruction, in the style of DCPI. Patch 3 gives perf
> > > mem a ProfileMe event, as the kernel series reports the DTB hits and
> > > misses of loads and stores in the data source.
> > >
> > > To try it, with the kernel series applied:
> > >
> > >   perf record -R -e cpu/instructions,profileme/ -- ./workload
> > >   tools/perf/python/alpha-profileme.py --pc
> > >
> > > I tested this on an AlphaServer ES47 (EV7). Sampling a loop whose
> > > branch tests random data reports that branch mispredicted in 21% of i=
ts
> > > samples, and 0% with sorted data. As a normal user, perf mem record o=
n
> > > a loop that loads one word from each page reports the load's DTB hits
> > > and misses.
> > >
> > > Signed-off-by: Matt Turner <mattst88@gmail.com>
> > > ---
> > > Changes in v4:
> > > - Patches 1 and 2: ignore TRP, and MIS and the trap type with it, for
> > >   an instruction killed before it was mapped, as the kernel series
> > >   does. Thanks to Ian Rogers.
> > > - Patch 2: record cpu/instructions,profileme/ in the example, as a
> > >   precise event now samples only retired instructions, which leaves
> > >   the killed% and invalid% columns at 0. Thanks to Ian Rogers.
> > > - New patch 3: add a perf mem event for Alpha, cpu/cycles,profileme/.
> > >   Suggested by Ian Rogers.
> > > - Link to v3: https://patch.msgid.link/20261102-perf-alpha-profileme-=
v3-0-4bf6e1dda733@gmail.com
> > >
> > > Changes in v3:
> > > - Patch 1: silence -Wpacked around the uapi header, which breaks the
> > >   build where __u64 is 4-byte aligned, such as sh4.
> > > - Patch 2: only read raw data from cpu PMU events, as a tracepoint's
> > >   payload can pass for ProfileMe status. Thanks to Magnus Lindholm.
> > > - Patch 2: print a table for each thing PCTR1 can count, so that mixi=
ng
> > >   events no longer averages unrelated values. Thanks to Magnus Lindho=
lm.
> > > - Link to v2: https://patch.msgid.link/20261030-perf-alpha-profileme-=
v2-0-9ce2f0b0e622@gmail.com
> > >
> > > Changes in v2:
> > > - Patch 1: copy the raw data out of the sample and convert it from
> > >   little endian, so that it decodes on strict-alignment and big-endia=
n
> > >   hosts.
> > > - Patches 1 and 2: follow the new 28-byte struct alpha_profileme_samp=
le
> > >   from kernel v2.
> > > - Link to v1: https://patch.msgid.link/20261028-perf-alpha-profileme-=
v1-0-f46c1938d001@gmail.com
> > >
> > > ---
> > > Matt Turner (3):
> > >       perf alpha: Decode ProfileMe raw samples
> > >       perf python: Add alpha-profileme.py
> > >       perf alpha: Add perf mem support
> > >
> > >  tools/arch/alpha/include/uapi/asm/perf_event.h |  31 +++++
> > >  tools/perf/Documentation/perf-mem.txt          |   3 +
> > >  tools/perf/arch/alpha/Build                    |   2 +-
> > >  tools/perf/arch/alpha/util/Build               |   2 +
> > >  tools/perf/arch/alpha/util/mem-events.c        |  17 +++
> > >  tools/perf/arch/alpha/util/mem-events.h        |   7 +
> > >  tools/perf/arch/alpha/util/pmu.c               |  11 ++
> > >  tools/perf/check-headers.sh                    |   1 +
> > >  tools/perf/python/alpha-profileme.py           | 178 +++++++++++++++=
++++++++++
> > >  tools/perf/util/Build                          |   1 +
> > >  tools/perf/util/alpha-sample-raw.c             | 156 +++++++++++++++=
+++++++
> > >  tools/perf/util/sample-raw.c                   |   2 +
> > >  tools/perf/util/sample-raw.h                   |   2 +
> > >  13 files changed, 412 insertions(+), 1 deletion(-)
> > > ---
> > > base-commit: 4626d370ae89b8af4d46a45372b269f926ec662d
> > > change-id: 20261028-perf-alpha-profileme-8010299be323
> > >
> > > Best regards,
> > > --
> > > Matt Turner <mattst88@gmail.com>
> > >
> >
> > My plan is to take this series through the Alpha tree alongside the
> > kernel ProfileMe support. Does that work for the perf maintainers?
> > An Acked-by would be appreciated.
>
> Should be ok as it hardly touches the common code.
>
> Acked-by: Namhyung Kim <namhyung@kernel.org>
>
> Ian, does it look ok to you?
>

Thanks for the ack. Taking this through the Alpha tree will keep
the tools support together with the kernel changes it depends on.
I'll add your Acked-by when applying the series to my for-next,
pending any further comments from Ian.

Thanks,
Magnus

> Thanks,
> Namhyung
>
