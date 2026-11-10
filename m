Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794339077;
	b=CH0tv6/aBr75i5FYYhNF8T+oRs+LQdm9cjnaUCio1iGwtK7T5LCJEl5oeKAFuG9Q4OzB
	 Pf4xQA0Q3z43siz584coyRDPLPrpHFbWJMMsatPidBrNVDt0xY/M9JQ7BMSKrWsDwA4KI
	 sJwYXNvjKFeu4G+DDr3ONMZybRwu6UTS7yNoUKA2cipH7TQ5AldZWzS1Lwg/w9IyugO/i
	 25MLAjfKN9m3/B7STYub1UXqmRP6Uiwueh1FVfLJ8xVMkS2/LouRpDHdEtA4njfH8OVen
	 wlxC6iKNaT85FpoRVSVPPIQwjxL/jnCJhDEACPzZbAy9/l2IWrctPuzsGtRzPWNhYnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7PpHUnf1QWGzREEK74qSoQAh95FpMu5Wm8BOh1zkZj8=;
	b=lwmQa82fed6qu69G4kN9csV5O/qNJPskVyEIeEbuTsehExCIAEuo6PnjP07REPHvJS8k
	 /3HnA+CA2tiWWZB8tmVMuMuItEZwMsrBA/r/6dVrWpWweptWeLtEyghMNroVPN48rMqkE
	 gGPfOFsrenWnaitXM1+/RDUtOIZpm3EX49cgpkRNPy+tXK/3OXnaV2Tx6H52rwWNVsA3g
	 FysUk5qnrX4jmJobRYDgeP/IvQANuRFC3RTthUh3mIqmjTojoL3NtLKBW302zwkcv1Ztk
	 GTNlmbUuDowjXVVRhsf7RDmeOyWxaW+Gpv83MuBq5MdngIqp552jmcvX8rqXVx068hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygA55dIo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F7D606A323
	for <linux-alpha@vger.kernel.org>; Tue, 10 Nov 2026 19:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35F7D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygA55dIo
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b70192ebceso4296749a12.0
        for <linux-alpha@vger.kernel.org>; Tue, 10 Nov 2026 11:31:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794339075; cv=none;
        d=google.com; s=arc-20260327;
        b=e6dWaaVUKM+IrtBnxyhfrd/hjBJUWkRqpCfAKduCbd5OiV7qPxSE6NBY97q730OBwx
         ayhAU87/7zPyUtdV2DiW1tK9pWkgSl3wwZlymJR2ZCawExRYmM10d5zPm2rXGfU3Vy0B
         AD9WO3855J13MPHOh2IX4jFf1aqivwK8l6n5ZTxXl3+eWQWPIhS9RtSz7Qc6dAfB70pz
         qYFXMNC8q1pub4+ezJv959c2MnyRIWTMVNCq2eXhEqe8vX6zOFmIGUX8/8sIwSrR8U7I
         GfQCgC1aY2WzsZ2lCqhyEPhTIqnhyooLmFxdPJKbHiPGrwAihTjsObRYZs3g7oBqKwpN
         xaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7PpHUnf1QWGzREEK74qSoQAh95FpMu5Wm8BOh1zkZj8=;
        fh=klEDwPZxfp4AGvJKthoy3O3pUZLKxwmLdEqxGguJ0jM=;
        b=ASMpJJxJtne2SD+Lai4UXzcG3kQo49KXDt/sTj+tHKnOaC9nJ+6rqGpg8rP0P+uYqW
         GyEKGBX0dyuVVQxizVf5WLMRZDwVySdu9681uFsvqt7n126otmFa6O/3i1C3aBIdhTd2
         3+mpd6c2TQD+oin0rX5fq8NmRv5XBCT3iIB/TrEYEkCAt3aUncnO4vuYd6sGXlxCx7dj
         pWas5FevGQBj+fEikSqyKNrFX/AFGrbSoklhcSM5t8AWK+2J+7hK/fSWZY+t2z2FWhZd
         4bjtwxYkF5f9yYeQ+28XXKBSWkenXXL3vmVuzL9o1aCPkkiHxixtATRaAwhQG9at9vIr
         6vAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339075; x=1794943875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7PpHUnf1QWGzREEK74qSoQAh95FpMu5Wm8BOh1zkZj8=;
        b=ygA55dIoz/6O4MxSokjKAYOAnTAUBuad/texw+fVpfWZq/9MB7Z84VndkLK8QIAqXU
         9MBui/Yo5n2BSvO3OClQ6fhIsD8wQ7G3jWmz6cdywYdqMY1bm/I+0AndVvZf7rva6T00
         ysgfJC+APM3chckN/eEMKFJeSEdUxCjJWXXwyhPziZxsdO3qDUVPxF/wKrF4y1Kdhw43
         yPO6PQEBCd6Svdh22LukN+Cha+0U985V65ONfS/l0syMDRV+/0W0TJb7C/oAoj1J9mXp
         p0bq1nVovvt7QUX+14kIP+gM0Pn6A6fLGHCfdd0Lm3JxE/gOBbzMx9hcD2gLU9bTGC0R
         M6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339075; x=1794943875;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PpHUnf1QWGzREEK74qSoQAh95FpMu5Wm8BOh1zkZj8=;
        b=oj0oSU8C3RrQx7upZHG05rX4+1vELLp7v4n8kiD46USwkkICslk/uu4ie4/zMov3Xx
         5O/PnxFt7M6uVR0FXvglMMH6YnKjZt+UUL8oCwUkBAxftEm6sznKJLSQv9MS1SfN/CDH
         ve18GqYCJ9LCwfTd5sCXY/G/hhYXfCPg2bJliW/Q6bZDmG+4bYESPEAFm3UeIscvFrhK
         Nz4C/ZBFtKZoI8V8EHOQo9SLgNZpfU3/JbbNSoQ3A7kQ19fldlKP2/WUI4t4rIWe3JmL
         kve9oSnhXnk43Lp2OM6ifTSjUwmqq8AVHPorIylQj7VpplWrUQlPE1JxxoLTR+KgN7qH
         +ZWQ==
X-Forwarded-Encrypted: i=1; AL+hErE+K0twaLO4iQLjooPEnIY9G6hqd4nAUTJ5GOwfI96yX5x8bH4CdX0wXtJgL0usuvFU7G7+fcSuiQFz5w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+uZer8sMJBC94erRKira+ZKOyHonvnBJ4Fuj9+kzmeKD3IChWZ
	fuKnCvpkWTqCqQwy0a9IzFF4mpMf4bYofjRleqk7SS9To9xYwdFz0/X1YHsGpJJvJDcYpezEI06
	M24djQ92X0jXLTfrSB0qiQv38bnDOT9rzYhTVBUw=
X-Gm-Gg: AYBFou3m8YFwxx89kw58db9mOGCMWaOJbqun7mz5eE2jsMWmE4xye1PXx7n13g+sgX9
	nt7BXLdSalC+Yr0Vest+j3B8bfwJ/powUI6HKU/AgqMpIWh4QYFhUxUCIw4r0QOz1kQ+6PhhCZ8
	HrAoSEzDIMUnU6IKufBr2qLkRPqBRTxzHRLCOZcbcneym3xmzBi3ti+zj3fLR9c+L/y340qyMnv
	rKxEpHNaho4bAWcyaSNl6dk/E4p28VO6leAysNpqZOwOT7/sZNr0y7aB3gHSB/goDyQLx8Qmzv2
	78EvT4GCGX7oVDFEM9WJ3JX1TKsCAY1sDw2SRLD4jzMMZ8r2VtNjMkl2vprWxrO4wbc/8WoyqDz
	dwly6MIv5azIKESvLnLtC0ZkUenL9F2mxaqoE8MU6HrtNKsMZn1j2Q25WkRWlxKQEzebNQvb+84
	D+P9pctAxOuE+Ohxh7I5bra1ldJNKDloU2VAJJQCc/uTvi
X-Received: by 2002:a05:6402:5416:b0:6b1:b9b0:dcfd with SMTP id
 4fb4d7f45d1cf-6b77707dcb9mr271933a12.0.1794339074327; Tue, 10 Nov 2026
 11:31:14 -0800 (PST)
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
In-Reply-To: <20261104-perf-alpha-profileme-v4-0-1771ea02950e@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 10 Nov 2026 20:31:02 +0100
X-Gm-Features: AclHuK_7HNzlokPAsBoIv_7fPp-EVtZiMe-LJK6KHz7D9VmXnxbP6S1wnm1WwT0
Message-ID: <CA+=Fv5RBKVAdGgq=BGPmLXpczcB3qvQcSw8aat7nB2ePXcG4yg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] perf alpha: Decode ProfileMe samples
To: Matt Turner <mattst88@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, Nov 4, 2026 at 7:53=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The Alpha kernel series "alpha/perf: add ProfileMe sampling" adds
> ProfileMe sampling to the Alpha cpu PMU. Each ProfileMe sample carries
> the profiled instruction's PMPC and its I_STAT and PCTR_CTL status as
> PERF_SAMPLE_RAW data, which says whether the instruction retired,
> whether it trapped and why, whether it was a mispredicted branch,
> stalled before map, or was killed on a wrong path, and what PCTR1
> counted while it was in flight:
>
>   https://lore.kernel.org/r/20261104-alpha-profileme-v6-0-63362e9290a3@gm=
ail.com
>
> This series is the perf tool side. Patch 1 decodes the raw data in perf
> report -D and perf script -D, as is done for AMD IBS. It copies the new
> uapi header from the kernel series into tools/arch, so it should wait
> until that header is merged. Patch 2 adds a script that sums the status
> by symbol or by instruction, in the style of DCPI. Patch 3 gives perf
> mem a ProfileMe event, as the kernel series reports the DTB hits and
> misses of loads and stores in the data source.
>
> To try it, with the kernel series applied:
>
>   perf record -R -e cpu/instructions,profileme/ -- ./workload
>   tools/perf/python/alpha-profileme.py --pc
>
> I tested this on an AlphaServer ES47 (EV7). Sampling a loop whose
> branch tests random data reports that branch mispredicted in 21% of its
> samples, and 0% with sorted data. As a normal user, perf mem record on
> a loop that loads one word from each page reports the load's DTB hits
> and misses.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> Changes in v4:
> - Patches 1 and 2: ignore TRP, and MIS and the trap type with it, for
>   an instruction killed before it was mapped, as the kernel series
>   does. Thanks to Ian Rogers.
> - Patch 2: record cpu/instructions,profileme/ in the example, as a
>   precise event now samples only retired instructions, which leaves
>   the killed% and invalid% columns at 0. Thanks to Ian Rogers.
> - New patch 3: add a perf mem event for Alpha, cpu/cycles,profileme/.
>   Suggested by Ian Rogers.
> - Link to v3: https://patch.msgid.link/20261102-perf-alpha-profileme-v3-0=
-4bf6e1dda733@gmail.com
>
> Changes in v3:
> - Patch 1: silence -Wpacked around the uapi header, which breaks the
>   build where __u64 is 4-byte aligned, such as sh4.
> - Patch 2: only read raw data from cpu PMU events, as a tracepoint's
>   payload can pass for ProfileMe status. Thanks to Magnus Lindholm.
> - Patch 2: print a table for each thing PCTR1 can count, so that mixing
>   events no longer averages unrelated values. Thanks to Magnus Lindholm.
> - Link to v2: https://patch.msgid.link/20261030-perf-alpha-profileme-v2-0=
-9ce2f0b0e622@gmail.com
>
> Changes in v2:
> - Patch 1: copy the raw data out of the sample and convert it from
>   little endian, so that it decodes on strict-alignment and big-endian
>   hosts.
> - Patches 1 and 2: follow the new 28-byte struct alpha_profileme_sample
>   from kernel v2.
> - Link to v1: https://patch.msgid.link/20261028-perf-alpha-profileme-v1-0=
-f46c1938d001@gmail.com
>
> ---
> Matt Turner (3):
>       perf alpha: Decode ProfileMe raw samples
>       perf python: Add alpha-profileme.py
>       perf alpha: Add perf mem support
>
>  tools/arch/alpha/include/uapi/asm/perf_event.h |  31 +++++
>  tools/perf/Documentation/perf-mem.txt          |   3 +
>  tools/perf/arch/alpha/Build                    |   2 +-
>  tools/perf/arch/alpha/util/Build               |   2 +
>  tools/perf/arch/alpha/util/mem-events.c        |  17 +++
>  tools/perf/arch/alpha/util/mem-events.h        |   7 +
>  tools/perf/arch/alpha/util/pmu.c               |  11 ++
>  tools/perf/check-headers.sh                    |   1 +
>  tools/perf/python/alpha-profileme.py           | 178 +++++++++++++++++++=
++++++
>  tools/perf/util/Build                          |   1 +
>  tools/perf/util/alpha-sample-raw.c             | 156 +++++++++++++++++++=
+++
>  tools/perf/util/sample-raw.c                   |   2 +
>  tools/perf/util/sample-raw.h                   |   2 +
>  13 files changed, 412 insertions(+), 1 deletion(-)
> ---
> base-commit: 4626d370ae89b8af4d46a45372b269f926ec662d
> change-id: 20261028-perf-alpha-profileme-8010299be323
>
> Best regards,
> --
> Matt Turner <mattst88@gmail.com>
>

My plan is to take this series through the Alpha tree alongside the
kernel ProfileMe support. Does that work for the perf maintainers?
An Acked-by would be appreciated.

Thanks,
Magnus
