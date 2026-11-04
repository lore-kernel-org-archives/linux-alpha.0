Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818439;
	b=uVfMnXTbZEW54LfOVmMlzo6iJCpgKhFFkB5x4KmAc2mAVbudsfUpxXR1PBmibMo4AioW
	 AJ5OGx+CNJOwUG/IiBXWQ0TH4bIJiQB4xXFaSpkjz/e8zx2eT6/oXVmUU1Xj/onOEjFOy
	 zFb9JndMc3xot7dJ4ckVDlHUYYAtelJH5fnLNZQy48s4+FLndXqQ3cWQEBHfoukd+uHWa
	 qc+Ki/45GEdHWNrb/iGYuFfoRbnkzqV1/mWdlOZWNSiuyssyDwuel7GSWzgBBcevWjak1
	 5AEJ6NS60jhzX+bKdBAFrFZt58yWhnM5KzaQeDVh9BjnnHokbn9T71YnAg/pIhAt4Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=MW25hjDMN9fnl42Jgp9cMMEDFOlPXuWurbBc7DgYrdY=;
	b=I16C6gmuXpmuJS8nAR3Wr7Gh4EYXjyUYVL8AL/3v7KJQvwJLHz37hdXLCK/JBr5a/7fs
	 TfZOpTDm+P2K6AnVMmaddYNpWabeBNZaMIE3zgdS/BxtmfIHZGKHPNNcUx+n/fIwsf/a7
	 IwKJHQiBtMfDGTj3Xq3x1YOVp3/ZEXs8CHlpg9wfLiBr6MM6Nzz+PTSS9A/+j+eS9nXr4
	 Ljd8IRf0vvstzd5QpL9jrPshCJBUraLcO9w8fMsDPLhCWmW35lTOt6vzDPS7HOXaU3MUn
	 YYE+qbPtAqgROPrfsb2IpuUK1Nnj5yi7tDQnK3BPt3cdXoAIGPKAd5Y3VstQpZhTFOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygO6a+B5;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B63606D82D
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 18:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B63606D82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygO6a+B5
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0d126f631so11586127b3.2
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 10:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818438; x=1794423238; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MW25hjDMN9fnl42Jgp9cMMEDFOlPXuWurbBc7DgYrdY=;
        b=ygO6a+B5rv6ddJNrX1cdMEwGNrWTj7H6ceQS2/xXOBM9XJoCUp5m+OcgzbUzn4leVF
         WyLIygXkFMxs2pgG1y+a0EaSTqSfsbjw+YIetz7PdcsTGWLwHuInr9DpZPsTlEBjIH3B
         R2lVkkcSptzriK3Iw14QyfW2wLTp9AckPLZhEDOyBDJtkJfEExWsaFcgydbOwFwlSvYb
         yhBEgRGu1TZOCaCocH1YcriJd+C4GZYOp9gE4naazA4LU95eXiSE+lWEONn0JIpGEdb5
         aRTV4yWpzjOASQJpSC27jvxfOaEddPoIMH3arUzPtY/nOK1SlA7OuBfhlYls+23Btfdt
         sKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818438; x=1794423238;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MW25hjDMN9fnl42Jgp9cMMEDFOlPXuWurbBc7DgYrdY=;
        b=R/RdLqWi/3h59AIt4BWKODh8/2ft9Ljp0kZRlIQGJPCzl6iCTcmKDHCJ+qpCtFCzRZ
         neb4GA9HUo8UfqIQid6dsbPUhSFglnvb0Saeht7bzEUm10vO6FKEQry+oSHZ4OnL98sw
         BkSKdr5CIfkv/MkLBHVqLOmoYTp+iqkZVW38gAeBJYd5C9aMR9R4oOSe0pqsO9OAgkH8
         edCXb7tqybUFU5buwzCQtg2b3KJYQFvfjXRfR9GHq7dwo6Chse4kqWmS+TejupeOuCdI
         U+Ct5GlJoNqOsgxxR/fwMldjzKZ7MPLWpl6rQmaI/CQuV+CBycPaxmweS/KfRKg9nZHI
         bO0g==
X-Forwarded-Encrypted: i=1; AKwUvBwFGXLG51L2Fi1DVpH3Unyzfzvr6VfvFqe5qHc0JqaGxlQkGgZcDgTZ7/AeC8ltymfwZXohIJAKqSV/fg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+MO+KcjzP94qqnv9rBL6tcoUIMHijtqvYnel9C5wtAqBcvobI9
	PJC4s27PWQMxU+cFjkg5o2RfKDXMRDRknOgf5d77T783VGH71u+dEpMg
X-Gm-Gg: AYBFou2dz3tmQcBzeiQuXV8CMhhBQPPFXe80PYRbwSvTQJLxMRlXheuf6dKZIQk6yWG
	TXxMq6GxsJN6rArIsbcwramoKb0OiyAuOvZeuqO/X+tefb3tKUh3vQ3rIW25IL7jtb6WkFeWG+d
	xAYyFZTxsFvYW+czMN2NESHVsGC0bD03M6+JzjoxeVsj5+5QR+bMG7KWNHJBrMaWIeXj6Gitav9
	qgqeE07VckZlIxMqM1jrjDXbdcU39wn3M5TTk1Zi7cwySSsvRiFyX1gtrwq+L1ci7yUcM30fOF1
	DaNexGn9uc9SQElLofpTID6dw1EQGu97uvYvn7junR+L5OiXqBsMOlwBv1A1L1MtcI9mGKM/93j
	iSL3jwqtAbgrfTk88Uy6vOYBnZLBEpcR6FJJij6SYCiLPPD2iB8ZMeflOAKk8xILeoW1/QlwW/4
	n4wxl+tRm7WLt+619nj48UzYXPCUUpaMDMiQhnFHfeKIuQ8+rE36wG8TlNeTdP0+82bn5KpKLKP
	d+h6cEFX1+WLotW0Y2iubIrUyXAZ1R2DspTMxn/XBVVqa2M4AvKt3+0fykk2ixQPghX75vWSCaL
	uKcl4BUg18s2OA/VhCqvg3VOhM8Jnpo1Qyd4vcXbE5vfYA7HM2Sj79STwdsnB8ahVAS8joFWAcP
	WREE72OQbEQ==
X-Received: by 2002:a05:690c:f05:b0:8b0:9e27:fcd0 with SMTP id 00721157ae682-8b2b66c4171mr120311327b3.21.1793818437748;
        Wed, 04 Nov 2026 10:53:57 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309b9f50csm24364847b3.38.2026.11.04.10.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:53:57 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v4 0/3] perf alpha: Decode ProfileMe samples
Date: Wed, 04 Nov 2026 13:53:55 -0500
Message-Id: <20261104-perf-alpha-profileme-v4-0-1771ea02950e@gmail.com>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOTQ6CMBAF4KuQrq2ZTgmCK+9hXJQyhRr+0iLRE
 O5uwYXEhLh8mZnvzcQ8OUuenaOJORqtt10bQnyImK5UWxK3RcgMARMBmPKenOGq7ivFe9cZW1N
 DPIUwy7KcJEoWTntHxj5X9nr7ZP/I76SHxVo2KuuHzr3W3lEse38qRsGBmzjRIpNpASAuZaNsf
 dRdw5aKETeIhB0EA5JpQgM5UIL4i8gvEl7ZQWRA4twkJIpCnaTcIvM8vwFL/6wuVAEAAA==
X-Change-ID: 20261028-perf-alpha-profileme-8010299be323
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4163; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=mwri5c3a60UO9UOwmoXQFRAV5LNNQJzOrWjLaoTcg4E=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe17s4z+N4sOaUzbn2ZQ/cRSQ8XdIsV4bMNdms1ZiWd
 TSuOZml4yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK7pEmFk2F0nFFCxut
 H/RXVl+NMnmw3eHBdWTn3BqLHL99U5z6a75owMGywOb8kukUj4aH+xTIXVlN3jxIS957Y6rTURY
 rdj8rnPAAA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha kernel series "alpha/perf: add ProfileMe sampling" adds
ProfileMe sampling to the Alpha cpu PMU. Each ProfileMe sample carries
the profiled instruction's PMPC and its I_STAT and PCTR_CTL status as
PERF_SAMPLE_RAW data, which says whether the instruction retired,
whether it trapped and why, whether it was a mispredicted branch,
stalled before map, or was killed on a wrong path, and what PCTR1
counted while it was in flight:

  https://lore.kernel.org/r/20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com

This series is the perf tool side. Patch 1 decodes the raw data in perf
report -D and perf script -D, as is done for AMD IBS. It copies the new
uapi header from the kernel series into tools/arch, so it should wait
until that header is merged. Patch 2 adds a script that sums the status
by symbol or by instruction, in the style of DCPI. Patch 3 gives perf
mem a ProfileMe event, as the kernel series reports the DTB hits and
misses of loads and stores in the data source.

To try it, with the kernel series applied:

  perf record -R -e cpu/instructions,profileme/ -- ./workload
  tools/perf/python/alpha-profileme.py --pc

I tested this on an AlphaServer ES47 (EV7). Sampling a loop whose
branch tests random data reports that branch mispredicted in 21% of its
samples, and 0% with sorted data. As a normal user, perf mem record on
a loop that loads one word from each page reports the load's DTB hits
and misses.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v4:
- Patches 1 and 2: ignore TRP, and MIS and the trap type with it, for
  an instruction killed before it was mapped, as the kernel series
  does. Thanks to Ian Rogers.
- Patch 2: record cpu/instructions,profileme/ in the example, as a
  precise event now samples only retired instructions, which leaves
  the killed% and invalid% columns at 0. Thanks to Ian Rogers.
- New patch 3: add a perf mem event for Alpha, cpu/cycles,profileme/.
  Suggested by Ian Rogers.
- Link to v3: https://patch.msgid.link/20261102-perf-alpha-profileme-v3-0-4bf6e1dda733@gmail.com

Changes in v3:
- Patch 1: silence -Wpacked around the uapi header, which breaks the
  build where __u64 is 4-byte aligned, such as sh4.
- Patch 2: only read raw data from cpu PMU events, as a tracepoint's
  payload can pass for ProfileMe status. Thanks to Magnus Lindholm.
- Patch 2: print a table for each thing PCTR1 can count, so that mixing
  events no longer averages unrelated values. Thanks to Magnus Lindholm.
- Link to v2: https://patch.msgid.link/20261030-perf-alpha-profileme-v2-0-9ce2f0b0e622@gmail.com

Changes in v2:
- Patch 1: copy the raw data out of the sample and convert it from
  little endian, so that it decodes on strict-alignment and big-endian
  hosts.
- Patches 1 and 2: follow the new 28-byte struct alpha_profileme_sample
  from kernel v2.
- Link to v1: https://patch.msgid.link/20261028-perf-alpha-profileme-v1-0-f46c1938d001@gmail.com

---
Matt Turner (3):
      perf alpha: Decode ProfileMe raw samples
      perf python: Add alpha-profileme.py
      perf alpha: Add perf mem support

 tools/arch/alpha/include/uapi/asm/perf_event.h |  31 +++++
 tools/perf/Documentation/perf-mem.txt          |   3 +
 tools/perf/arch/alpha/Build                    |   2 +-
 tools/perf/arch/alpha/util/Build               |   2 +
 tools/perf/arch/alpha/util/mem-events.c        |  17 +++
 tools/perf/arch/alpha/util/mem-events.h        |   7 +
 tools/perf/arch/alpha/util/pmu.c               |  11 ++
 tools/perf/check-headers.sh                    |   1 +
 tools/perf/python/alpha-profileme.py           | 178 +++++++++++++++++++++++++
 tools/perf/util/Build                          |   1 +
 tools/perf/util/alpha-sample-raw.c             | 156 ++++++++++++++++++++++
 tools/perf/util/sample-raw.c                   |   2 +
 tools/perf/util/sample-raw.h                   |   2 +
 13 files changed, 412 insertions(+), 1 deletion(-)
---
base-commit: 4626d370ae89b8af4d46a45372b269f926ec662d
change-id: 20261028-perf-alpha-profileme-8010299be323

Best regards,
--  
Matt Turner <mattst88@gmail.com>

