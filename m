Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794765714;
	b=L0gvb2WPp4ZbHvXEnZoRwI1sBUGsx8QCe1I922CJDew5WkFHxWryyQ5TGgFRnsH1yQ8c
	 EHsz9TWkvn+2OARR7aifww5l2VDQSfzbn9vTrd6FttuiiptfVjWIlcwLS55c+Z8Gu5tKL
	 OssN6CO9sUNK85INnKHwTDKpJqvYQaxmcBNxVS9rnmkCQN1Mda3JN+it99FPCEjJDQtHa
	 oq81j2OEN6UuqDF/kknUwOPDNaPQXv0wK/MKa5S3m2Q4qdMbWQhYwnI7mChB3FPF55UuQ
	 jwcVdfhm8F0bVuhMe8jvyFDeJnOizNaYXVYvushhEgj6kUfhPgKXtlo0DMVcBJfvYbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IpjoFAQdvouRdlXBjzoC7wJxtan+tyigmF2bs4+iRJA=;
	b=oSSh0JuA0pc/Aaop5/v5iw5mlehMHca8TDgJ8dIWInTeqMXlv3JTrwQ66+47N4ztEzSX
	 iuqoxeObT8LSRCUt847bpOsDyjFNSBp1RRTYUor2jT5oj8UXwJq1rwKIuwEa7si0n3fv4
	 Qkj5ftL3LbHHCYWbnZxLbTzpeXM/j3tDfhuFzYrlneknDrUn5yPDaixt+UyBaX3sBRn1G
	 C+7AXwuhpq0GCXTp0afr0/q7FWlyFLaErWsYE+CEcUKIyjhJKR2e+EfNHfASKqOEyNmF4
	 lgaKZK9HhxIc+CPkmPVgKGG/jU1e40V1fFJReA0cghuSw72xiU6AqPsh2dBKZEToKlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K2N0szBN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0193606A883
	for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 18:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0193606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K2N0szBN
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-533202fe429so196201cf.0
        for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 10:01:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765713; cv=none;
        d=google.com; s=arc-20260327;
        b=C2By2Su7d4qU1F66pVzJPLXAM4f/VbNd9iSY97mAWc4ftXsKCxMvtBroFlMX+M9nOH
         21j28nOWdGRa+8DNK7kx4DDfcgb7MlH6xFx5O1bEy/X3hdU6TXe5jlDsPMKge9DRBGU/
         VaLV/zYLMsfGesSxpP4ZhZu9TAwFxKQlwuzHzfNGjNZJNpi54yf9RoXXLRwuZHXzLg1x
         ZKGAOsBMa3BJ2tmfH4fpt3Jxj0A/Mj0YdeL11wiFMf1XCb933tNnQgfT2DRmFLEUQJop
         8nTvYNh094try5EgwH9W2AxJHOjxDi04SqSwgpcRWeFiLNzAzOc19BLJk0Jb7TymN07v
         Gt7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IpjoFAQdvouRdlXBjzoC7wJxtan+tyigmF2bs4+iRJA=;
        fh=DUFZgOxQ2rYfw2Hzpzu92ZhJlV52SNju9kcyweXFWDU=;
        b=TWdX1BtArjdO2hLV85y1zLddpt7d/rrE+yYLexqwnw0Kl1i3888wa4/sZvxnw90xgv
         JWXjBkoiPD7yuJq1z7WMU3JzndyXfMEr54ZDX7ix+ye81NWuQDEmtqbod+gE+Pt1Rsow
         6etJ5i0wpaSf9HCyDNZ+FaMds15TvyI+LEErGnU7Uty7ZWCBacD4Jr4SfVXioYd7Tlpi
         XPGmxCbNfm8P5zqNBCR4OoX91O7XXsSA1J6VEOoHAK3+KgulNjxTbtjQUXtCaS4NPEQH
         6up6PtCKSfnRlvf7P7OW9iWqSch1IWElXFZxdsrRGcRn/aGzzV1XjWJKu4MfDYzkDAqY
         tKyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794765713; x=1795370513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IpjoFAQdvouRdlXBjzoC7wJxtan+tyigmF2bs4+iRJA=;
        b=K2N0szBN0htujZJY2xcdSVCeodB/sxXcIekTdKe6NSQMdOdI/+DrBlzwwO48oF47Nr
         mzro7zTSxxFhl2VdmqoEitMI3MpiJ/S3JpV5LsAJ5hePXdkOFCS6Tl4X1QM0tBUGhn+N
         ipXe0sVo6M33EwKvfVxnTGB50STTISKH8Lb3C870OIkFdtx4va2Rcx7oejtLkBj4cHEZ
         aBVCMy6u7vVD7o9qRA1BeQXol7JdQ0iHSYA8WBSZFU/TBe+lpe7nnnOI/3kj4DptVqhb
         KdFLB+fh6iVCUA+hQInBzowRIfounjlqQDafTWaCVlJC+KgFqtG9Byr/kSS26XXdbikI
         4oTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765713; x=1795370513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IpjoFAQdvouRdlXBjzoC7wJxtan+tyigmF2bs4+iRJA=;
        b=mHrpI8s4uyhBXsLafSmCZQfij78N1dlUhZbT0anUw4jkTelRe2p0qjPANkuRC1yaAJ
         ZwES584zabgGJAV7S8E59LPczKO/XpfKSilgYofOpdSZ+nDCGe4Q3saUrj0ytZgjVrs1
         say1OpL241kyVb+DNGp/1coycg6gKuiPI9oD1mkAx5lO8ijqwMlrnLX9bGsxf620Vmsm
         /itlemdo7Zpljj3ai+Tgr2IspJ4ySkzUPhKBVq9E5OWvQicDjv2Q04MrK/acyH07rCsj
         5AeR+W837zAdnvGa8oCRYaujNcnWT6T2V/ogr2g5/BtdHUPq6nqBo2lHlVlZ3c2rzlis
         laAQ==
X-Forwarded-Encrypted: i=1; AL+hErFakWtvkAtfBwJN7xEteavD4oBm6WKXfePlKdYcDY8b/wNYH/M5Yu6kHEIynBCIU8IiSer9uv0zOdoG9g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+uqD14TEf4ttyiNxr0BJHIoecEYUtK+ePeLzCuLtxDehof00JX
	bIKuP8fc8IaCfbcIzz+wu/rjz7qDxW74z2iRNH1k1MjXmYUZPGpcaZDcsWvVpCbBFq+CYm4LGlX
	LHoR8lwmQLSdbbXLqQqw9RTLbzcODq3fsagrnpsGo
X-Gm-Gg: AYBFou1s74u+mbc3qziTjq1c2FigXYWl+khsNYP7RCWogpxIcEZGp4cwywUL6d+zzka
	BIHfYdCJF9yTKyIDI3glLh/J+tWkAgixJ4mOrJJYflluvbE/g2GCGZn2HLDTU3HPohwtZJ69xvY
	o5irf6EVNd2Rk4Mo9ggofvIXYCmEX3Pedb0cLIpD/DSb29247iLLMcrEySo42V4TSk1xTNm7dn2
	6MDpahZrYZFEFIwwRKldEh4z2NX1b6/1vxKMqlViuQ5xMtFotjZEc1ffjqZI1sLMjcoPoB2U2rL
	okDd8u62N+kZgM15dtd/qZD1e3fzgunSaEGxFEbCUX/gXc7q4J/4dHveIPbj9wLh8LWhA9C4ObN
	OotokDCoZ7dMapBtWrsA1CtGUviuM8jo5gz4j
X-Received: by 2002:a05:622a:4d9a:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-55c69c30437mr24722481cf.14.1794765711631; Sun, 15 Nov 2026
 10:01:51 -0800 (PST)
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
 <CA+=Fv5RBKVAdGgq=BGPmLXpczcB3qvQcSw8aat7nB2ePXcG4yg@mail.gmail.com>
 <avQKb-vBxTvMn1yF@z2> <CA+=Fv5SA6so5VjPzjj1tCNKxwOk=5ejj0YhEG483u_-RY+7NoQ@mail.gmail.com>
In-Reply-To: <CA+=Fv5SA6so5VjPzjj1tCNKxwOk=5ejj0YhEG483u_-RY+7NoQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 15 Nov 2026 10:01:40 -0800
X-Gm-Features: AclHuK-kcTOLPOTUA9hzFX_1_ZcS6vTo6b5Nqcec6CO684apf7lqlfr30UJRR34
Message-ID: <CAP-5=fUqDU4qcjHH4=t3NQpjS0m-nsHEw0YkXY9FVTchO0+M-Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] perf alpha: Decode ProfileMe samples
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Matt Turner <mattst88@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 2:47=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> Hi,
>
> On Wed, Nov 11, 2026 at 7:25=E2=80=AFAM Namhyung Kim <namhyung@kernel.org=
> wrote:
> >
> > Hello,
> >
> > On Tue, Nov 10, 2026 at 08:31:02PM +0100, Magnus Lindholm wrote:
> > > Hi all,
> > >
> > > On Wed, Nov 4, 2026 at 7:53=E2=80=AFPM Matt Turner <mattst88@gmail.co=
m> wrote:
> > > >
> > > > The Alpha kernel series "alpha/perf: add ProfileMe sampling" adds
> > > > ProfileMe sampling to the Alpha cpu PMU. Each ProfileMe sample carr=
ies
> > > > the profiled instruction's PMPC and its I_STAT and PCTR_CTL status =
as
> > > > PERF_SAMPLE_RAW data, which says whether the instruction retired,
> > > > whether it trapped and why, whether it was a mispredicted branch,
> > > > stalled before map, or was killed on a wrong path, and what PCTR1
> > > > counted while it was in flight:
> > > >
> > > >   https://lore.kernel.org/r/20261104-alpha-profileme-v6-0-63362e929=
0a3@gmail.com
> > > >
> > > > This series is the perf tool side. Patch 1 decodes the raw data in =
perf
> > > > report -D and perf script -D, as is done for AMD IBS. It copies the=
 new
> > > > uapi header from the kernel series into tools/arch, so it should wa=
it
> > > > until that header is merged. Patch 2 adds a script that sums the st=
atus
> > > > by symbol or by instruction, in the style of DCPI. Patch 3 gives pe=
rf
> > > > mem a ProfileMe event, as the kernel series reports the DTB hits an=
d
> > > > misses of loads and stores in the data source.
> > > >
> > > > To try it, with the kernel series applied:
> > > >
> > > >   perf record -R -e cpu/instructions,profileme/ -- ./workload
> > > >   tools/perf/python/alpha-profileme.py --pc
> > > >
> > > > I tested this on an AlphaServer ES47 (EV7). Sampling a loop whose
> > > > branch tests random data reports that branch mispredicted in 21% of=
 its
> > > > samples, and 0% with sorted data. As a normal user, perf mem record=
 on
> > > > a loop that loads one word from each page reports the load's DTB hi=
ts
> > > > and misses.
> > > >
> > > > Signed-off-by: Matt Turner <mattst88@gmail.com>
> > > > ---
> > > > Changes in v4:
> > > > - Patches 1 and 2: ignore TRP, and MIS and the trap type with it, f=
or
> > > >   an instruction killed before it was mapped, as the kernel series
> > > >   does. Thanks to Ian Rogers.
> > > > - Patch 2: record cpu/instructions,profileme/ in the example, as a
> > > >   precise event now samples only retired instructions, which leaves
> > > >   the killed% and invalid% columns at 0. Thanks to Ian Rogers.
> > > > - New patch 3: add a perf mem event for Alpha, cpu/cycles,profileme=
/.
> > > >   Suggested by Ian Rogers.
> > > > - Link to v3: https://patch.msgid.link/20261102-perf-alpha-profilem=
e-v3-0-4bf6e1dda733@gmail.com
> > > >
> > > > Changes in v3:
> > > > - Patch 1: silence -Wpacked around the uapi header, which breaks th=
e
> > > >   build where __u64 is 4-byte aligned, such as sh4.
> > > > - Patch 2: only read raw data from cpu PMU events, as a tracepoint'=
s
> > > >   payload can pass for ProfileMe status. Thanks to Magnus Lindholm.
> > > > - Patch 2: print a table for each thing PCTR1 can count, so that mi=
xing
> > > >   events no longer averages unrelated values. Thanks to Magnus Lind=
holm.
> > > > - Link to v2: https://patch.msgid.link/20261030-perf-alpha-profilem=
e-v2-0-9ce2f0b0e622@gmail.com
> > > >
> > > > Changes in v2:
> > > > - Patch 1: copy the raw data out of the sample and convert it from
> > > >   little endian, so that it decodes on strict-alignment and big-end=
ian
> > > >   hosts.
> > > > - Patches 1 and 2: follow the new 28-byte struct alpha_profileme_sa=
mple
> > > >   from kernel v2.
> > > > - Link to v1: https://patch.msgid.link/20261028-perf-alpha-profilem=
e-v1-0-f46c1938d001@gmail.com
> > > >
> > > > ---
> > > > Matt Turner (3):
> > > >       perf alpha: Decode ProfileMe raw samples
> > > >       perf python: Add alpha-profileme.py
> > > >       perf alpha: Add perf mem support
> > > >
> > > >  tools/arch/alpha/include/uapi/asm/perf_event.h |  31 +++++
> > > >  tools/perf/Documentation/perf-mem.txt          |   3 +
> > > >  tools/perf/arch/alpha/Build                    |   2 +-
> > > >  tools/perf/arch/alpha/util/Build               |   2 +
> > > >  tools/perf/arch/alpha/util/mem-events.c        |  17 +++
> > > >  tools/perf/arch/alpha/util/mem-events.h        |   7 +
> > > >  tools/perf/arch/alpha/util/pmu.c               |  11 ++
> > > >  tools/perf/check-headers.sh                    |   1 +
> > > >  tools/perf/python/alpha-profileme.py           | 178 +++++++++++++=
++++++++++++
> > > >  tools/perf/util/Build                          |   1 +
> > > >  tools/perf/util/alpha-sample-raw.c             | 156 +++++++++++++=
+++++++++
> > > >  tools/perf/util/sample-raw.c                   |   2 +
> > > >  tools/perf/util/sample-raw.h                   |   2 +
> > > >  13 files changed, 412 insertions(+), 1 deletion(-)
> > > > ---
> > > > base-commit: 4626d370ae89b8af4d46a45372b269f926ec662d
> > > > change-id: 20261028-perf-alpha-profileme-8010299be323
> > > >
> > > > Best regards,
> > > > --
> > > > Matt Turner <mattst88@gmail.com>
> > > >
> > >
> > > My plan is to take this series through the Alpha tree alongside the
> > > kernel ProfileMe support. Does that work for the perf maintainers?
> > > An Acked-by would be appreciated.
> >
> > Should be ok as it hardly touches the common code.
> >
> > Acked-by: Namhyung Kim <namhyung@kernel.org>
> >
> > Ian, does it look ok to you?
> >
>
> Thanks for the ack. Taking this through the Alpha tree will keep
> the tools support together with the kernel changes it depends on.
> I'll add your Acked-by when applying the series to my for-next,
> pending any further comments from Ian.

Hi,

The v4 tools series looks very clean and addresses all the previous
points (masking TRP/MIS when killed, updated script examples, and the
perf mem arch support). Taking this through the Alpha tree alongside
the kernel series makes complete sense to me. I have some refactoring
patches sent out, but the alpha changes are small enough I don't
expect collisions.

For the series:
Acked-by: Ian Rogers <irogers@google.com>
Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> Thanks,
> Magnus
>
> > Thanks,
> > Namhyung
> >
