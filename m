Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794264708;
	b=DPlNjXWKxzOSbWkvqT7KFRlYFgRgPCh1AEcDEqma47DNGp2OhpZjDkdnFwMCrhD2wcyB
	 Qou+EOCFWdnql/DA6dF4Do39Dk5813tWST6mijVPP6z6C1QUsSiGLDgn5oB2NNcquQGFt
	 YY3h/XyFzNj/+/VTLlRQREj4h4tr+oZlr4N8JH9TB1ynOenUQrtMEwK/+WscWl0nF1FHn
	 hpUskMrxmFQGAhlDic55FAwgffKZNzkE9B2jdzmsV5oD9JFpV6td9W4rCSonR6Z9g2wWZ
	 drBxy7Gcwyd2+qdInLu7ZbcaHqbwExUNBlfRGWRdLN8gj/XBt912zIl8qKvMR+dMlHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OWSNwvalNOHXKLMMlHTD1wk9mqbGrJX4DU8R8+H5KVc=;
	b=iPy5reE+F8xhP1IP5F03Ob6EUIvR0U0ksa4PyWerl/9Lfcga28w81LCCW8mEjtfXV4NV
	 PERPphNoOT1IXPH/SIXredBY++v38oqZpqAUcGYgVuzr9GTjYAl9WQ6WqxH/1ntZslw/A
	 XTZs7BG1Ogdms0ER1MFGhSGlpBv1q8Z0laXNTM6GkXKUiZnk3+/DrvKXyvmsoILnn4BKx
	 wPVpYFYxgEi2yAyMXdBIpHcu+zjiB0U5Grhfd4MvMkg1EilDFRuBq5A+ciXQQC6pD0kWl
	 ihN8yOLDTRkuO/7wlAOgDDneYppTfNefCkH0G1crRGLoVtBl0TXrRiCbZQvDnl6QjFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMsltQH3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BDD606A33F
	for <linux-alpha@vger.kernel.org>; Mon,  9 Nov 2026 22:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12BDD606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMsltQH3
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b57182c4c6so1923576a12.2
        for <linux-alpha@vger.kernel.org>; Mon, 09 Nov 2026 14:51:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794264706; cv=none;
        d=google.com; s=arc-20260327;
        b=MMEMH3/2vR1EWof6aQBoD3/DzJKcyhDn1M+DxSaa/pmLCYXpNrrme3xg9wEvrYwdLb
         /tnpZtz/LPslluetpaMHV0JE1ArzFw7fbMMqbVjQXyEf5gaWLSW/AOTVI8aq4lbAp2zR
         rkdRKmW4RxoMBKggM4uQoJ4G3u4odhHc6LSjrQBCeGO53+v50FcJg4wU/i6SM6huWLBg
         bEbLvRAV7Wr/Vh+fKsCB2EBOUo/eGTBdMe+qoIv5kNBt3AI6KRxrzSni7w4NmqKE0Drv
         KqAexg0mdV5HRFcKaJZygsAtFFYwpl75Sbd1yq5I+385Y5PuaGWtcsCrcuzX52fjMiS2
         xxVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OWSNwvalNOHXKLMMlHTD1wk9mqbGrJX4DU8R8+H5KVc=;
        fh=6EzKdBQEt0eoVkdkYusPTR7M3J0NbFHeqOa4fcwjtis=;
        b=J7HNe18IBUvziskKhqv3CxJLqKtpDnBeruRAL0uZFBoFmy7dBn2WT6p4Rw7GfUhVhm
         bk7S8Tw2lw1ZdSmI+93LBUY1sd/akgpXrQqpEKc0JrL1rKNrWbSv0R6B3qumhr1ySOWC
         DOTx43eKkntBocmfRRjsKTqxT0Kw8exf8SespaUdVAAJ7khNgaerqUXC/byzN5ZG7lV7
         wBF0aJiGnTTMWGhUXYZpmuyi2cljxobwEunPkDoAJlDnT3zEh/Zqsdgbntzai2icQiSv
         RDVE3HAfjzG+BKTXfWcGyfaX0bZSo9ON8NkYNxsKrTsnWqBqpJZvFjU+GB8/jRCZLE1y
         TGAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794264706; x=1794869506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OWSNwvalNOHXKLMMlHTD1wk9mqbGrJX4DU8R8+H5KVc=;
        b=jMsltQH3itmZCStdzYi0bmXp+Fj1HXIvg7IvfS1CHMum1xbCF/JIbeRe8ClWsuG8pL
         8bElUFjLLmljoLjmxUaVo6ArEzjXsmg6zkTFEz5YFUt+WK049Tk+xtG1de5yRvGpZdXD
         1jDZoUop4xewT+X9GMkZCkPwED/UWggx/VQJyuitisqxmD986RL02C+Pw+Sqc+I3M2wN
         jmElfjsff/itjcLTxX45lJcsvtMZ++ymKuNQIyHcbjXsOI9AJINYpvWkYgFlataTZQim
         TttPbO2LLXOMFArK2iWa/Hpw5ElDINtPk3gzF7jDDibv+nhLFXzndIIX5gGsOtjl1AUI
         /eyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264706; x=1794869506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWSNwvalNOHXKLMMlHTD1wk9mqbGrJX4DU8R8+H5KVc=;
        b=JEej9OSsbKqqL057Ni1dKnk5d2/q8Rc9ylIdSVvr7w3Czpcewjkl8OCKymIjB0FZ/C
         xc9htzTdubwRgHgXqVEmuim8mb5vTbclXsw2Eef28bgkt9oYCFtH/YgeEAEaR3WH1GdB
         /vWqL74m4taZVU9LGF6+RZSDFN5qpmT0WGoQ0wy8S1ClMcTuCxQVRaGQ/Gnb65M3abv7
         r4aJH4FkaAqv4xbF2boXO9ln4xCaJOi/STeGDFH85BC6mSZ67ruLpnmDo9eHeFGlej0d
         OCVNdMdsBiKHloAxQQ482NsHsmn6m+1XC7/Y+vZ30IqGa12UPBcaGylJPcWoXMIXcUrn
         BLng==
X-Forwarded-Encrypted: i=1; AL+hErEHN3I26KvU1O6S69a3xqsvi0DvxqCVaJPdLmNlaD00jFnMAoXPhb1htQsch20bqKqcF/S0mISIvjH3hw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8k25jFAreaIJwMKrqCrO0wtDCX/PeQ0VenWXWojVZkBYHttTO0
	ecSPrpV2nG1VqLfqmi5MZtxSyOcf8u6sIbMe9u10UIUJE4GJZyzpFWxPUHQad7XLHGZXnOAAYMJ
	CEIiaYqRwWk1mZIdIMT2bJhj7vbp0bKMOLvmg4rHCHA==
X-Gm-Gg: AYBFou3ARuIETld0ck3AmlavsAIb59syDktB5r6dUroY7bD9xjM/Vi25eAmNRwqgIwO
	X+/Xh9tfSaAMalGX4Uld8jTnbV0gs4NlWGqSXCqbnQBhkMsIGbA3kSOvs2jjoVKVuFPZGmoF6lT
	XavTopGQ3BMqjxLPzdZZx6jAf1btxhnxEkzLxJnvrf/Bv08H5XJomZ8YXv2gfOFs/FDNNxGpJhJ
	Ecd75wXJArn5cOd9rNr9TmOL5irq7Bkjf3KKx1l28zEBesR5SOx7c50tS8yPyzjbf4aenXkqv+S
	R5wprjaZuJTmPwZX/BGavmCuc2WIsx4r1nQtKG6lQoGnThNTiUn46pLJfVcHpmIHuwsWd2FER5t
	ei2nizapMJiQzkXs75oFWl9CDlMI4+UQFlPfKK0P7+WzbiLgXYyj/GpPsYLwgcxvcjjtVN+16rx
	ExwuHlmm57x5pfh70I+8BnHWAG
X-Received: by 2002:a05:6402:a509:10b0:6b4:73e6:dc9d with SMTP id
 4fb4d7f45d1cf-6b756b06c8cmr547355a12.41.1794264706391; Mon, 09 Nov 2026
 14:51:46 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-perf-alpha-profileme-v4-0-1771ea02950e@gmail.com> <20261104-perf-alpha-profileme-v4-3-1771ea02950e@gmail.com>
In-Reply-To: <20261104-perf-alpha-profileme-v4-3-1771ea02950e@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 9 Nov 2026 23:51:33 +0100
X-Gm-Features: AclHuK9poCE4l8PjGg9oSBI1_steTspM-yIVwxrchfEiyhq-TId8jv-1nN60SLw
Message-ID: <CA+=Fv5QKsbMqiUnKpMkVV8wB+3gP-CcxmzKAK11nfLpjeQjVoQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] perf alpha: Add perf mem support
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

Hi Matt,

On Wed, Nov 4, 2026 at 7:54=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The Alpha kernel series "alpha/perf: add ProfileMe sampling" reports the
> data source of ProfileMe samples of loads and stores: whether they hit or
> missed the DTB, and whether they were loads, stores or prefetches.
>
> Give the Alpha core PMU a mem-ldst event, cpu/cycles,profileme/, as AMD
> does with IBS Op. cycles:p is not used, as precise events sample only
> retired instructions, and a load or store that misses the DTB is aborted
> and refetched. The profileme format bit only exists on the EV67 and
> later, which have ProfileMe.
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  tools/perf/Documentation/perf-mem.txt   |  3 +++
>  tools/perf/arch/alpha/Build             |  2 +-
>  tools/perf/arch/alpha/util/Build        |  2 ++
>  tools/perf/arch/alpha/util/mem-events.c | 17 +++++++++++++++++
>  tools/perf/arch/alpha/util/mem-events.h |  7 +++++++
>  tools/perf/arch/alpha/util/pmu.c        | 11 +++++++++++
>  6 files changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/Documentation/perf-mem.txt b/tools/perf/Documenta=
tion/perf-mem.txt
> index fe51c5e3333d..cb439940ce90 100644
> --- a/tools/perf/Documentation/perf-mem.txt
> +++ b/tools/perf/Documentation/perf-mem.txt
> @@ -34,6 +34,9 @@ be sampled.
>
>  On AMD this use IBS Op PMU to sample load-store operations.
>
> +On Alpha this uses ProfileMe, on the EV67 and later, to sample all
> +instructions. Loads and stores report whether they hit or missed the DTB=
.
> +
>  COMMON OPTIONS
>  --------------
>  -f::
> diff --git a/tools/perf/arch/alpha/Build b/tools/perf/arch/alpha/Build
> index 1bb8bf6d7fd4..e63eabc2c8f4 100644
> --- a/tools/perf/arch/alpha/Build
> +++ b/tools/perf/arch/alpha/Build
> @@ -1 +1 @@
> -# empty
> +perf-util-y +=3D util/
> diff --git a/tools/perf/arch/alpha/util/Build b/tools/perf/arch/alpha/uti=
l/Build
> new file mode 100644
> index 000000000000..8d924b229470
> --- /dev/null
> +++ b/tools/perf/arch/alpha/util/Build
> @@ -0,0 +1,2 @@
> +perf-util-y +=3D mem-events.o
> +perf-util-y +=3D pmu.o
> diff --git a/tools/perf/arch/alpha/util/mem-events.c b/tools/perf/arch/al=
pha/util/mem-events.c
> new file mode 100644
> index 000000000000..d3cbca1993b4
> --- /dev/null
> +++ b/tools/perf/arch/alpha/util/mem-events.c
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include "util/map_symbol.h"
> +#include "util/mem-events.h"
> +#include "mem-events.h"
> +
> +#define E(t, n, s, l, a) { .tag =3D t, .name =3D n, .event_name =3D s, .=
ldlat =3D l, .aux_event =3D a }
> +
> +/*
> + * ProfileMe samples loads and stores alike, and reports DTB hits and mi=
sses
> + * in the data source. A precise event would sample only retired
> + * instructions, which leaves out the DTB misses, so set the profileme b=
it.
> + */
> +struct perf_mem_event perf_mem_events_alpha[PERF_MEM_EVENTS__MAX] =3D {
> +       E(NULL,         NULL,                   NULL,           false,  0=
),
> +       E(NULL,         NULL,                   NULL,           false,  0=
),
> +       E("mem-ldst",   "%s/cycles,profileme/", "cycles",       false,  0=
),
> +};
> diff --git a/tools/perf/arch/alpha/util/mem-events.h b/tools/perf/arch/al=
pha/util/mem-events.h
> new file mode 100644
> index 000000000000..311448cf1218
> --- /dev/null
> +++ b/tools/perf/arch/alpha/util/mem-events.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ALPHA_MEM_EVENTS_H
> +#define _ALPHA_MEM_EVENTS_H
> +
> +extern struct perf_mem_event perf_mem_events_alpha[PERF_MEM_EVENTS__MAX]=
;
> +
> +#endif /* _ALPHA_MEM_EVENTS_H */
> diff --git a/tools/perf/arch/alpha/util/pmu.c b/tools/perf/arch/alpha/uti=
l/pmu.c
> new file mode 100644
> index 000000000000..d19dfc979b08
> --- /dev/null
> +++ b/tools/perf/arch/alpha/util/pmu.c
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include "../../../util/pmu.h"
> +#include "mem-events.h"
> +
> +void perf_pmu__arch_init(struct perf_pmu *pmu)
> +{
> +       /* ProfileMe is only on the EV67 and later. */
> +       if (pmu->is_core && perf_pmu__has_format(pmu, "profileme"))
> +               pmu->mem_events =3D perf_mem_events_alpha;
> +}
>
> --
> 2.55.0
>

Tested on my EV67 AlphaServer ES40 with the v6 kernel series.
perf mem record selected cpu/cycles,profileme/ by default, and
perf mem report showed 6452 L1 DTB hits and 81 L1 DTB misses
on a page-stride workload.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
