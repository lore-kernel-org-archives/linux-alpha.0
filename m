Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818450;
	b=O5VjgXtYELOGtpI/oY2/VLCiLGcd3PWq6xYjnR8QkxzrYUJZZ263v1Jspm5A6l9C2u3j
	 qqSoXtK7sv1DOZNNEZwPJOz/liP3FqhlsBIMr9BnJr4mEXGDoNISVuBdNgJPObZNmyuXh
	 +4woMTyPLt8gougbRX/+hDceXgZ8VQKlvfHHELh7nWR9cn0nIadkylsRQmJOltP8kloM8
	 trfrsvH3+Ju1jAS+f4oicVGkpbNlsc8TFqhDeYCc3tAunt9h6XRfw1wGGOJczL8YZ8dO/
	 cX4kWKIjAje2mlsSFjaXixVvFM478OI5KYjmnfRyAw6b3Czsm0Yx5tc3nPn9anF0TBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=r4BO+0EzPkh7K0U5uHSGQe2VU6WFhDSfKkeqTxLg22Y=;
	b=jfnnFTbjpnFIjVowNhcs8TmOCuOwKP8U9bxB+3Vr58B6pkOdNbA4iSJbf5prdkoqBOVK
	 oHnrbCQHtPGTaW/JCUzT4qiwCV+PsmFBxyuzgmS6JlNzaad1k7g3deOhAjgQPvJhd6Qqn
	 S6kJ2nKwncG09+62EoeyI2aqrR5VrR3k/4bRN6Om0hPdRJ3NXJghhUPh+L6R6umYaKiu9
	 JvAuoiDokRnI/V3EwRCONRwLadeLLgt23mJBL3WSot9wQsSM9ONkdTeQ26K1NHpUIqa23
	 SWoGdbnnKvmCsXZGo6x/IGw1y+5aN93eEf4z4TpNRLa3sRaWXCRPdYiYOiMSGAzBerA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IWGnd6t+;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ADD606EEB2
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 18:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0ADD606EEB2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IWGnd6t+
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-679965fb848so1288776d50.1
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 10:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818449; x=1794423249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r4BO+0EzPkh7K0U5uHSGQe2VU6WFhDSfKkeqTxLg22Y=;
        b=IWGnd6t+iVhKyiAppghWZB1VuHD30eaGbuQPbXJOkbk15QAGMBwP9SZHqMp1vZxGjC
         Wk5PT6B+LiukOdMmyxSldUrMdQGRdIkv3hAni6T1l7JlXbsKeNA5kxZoWrugjADm7HMr
         RbfNwe3DhLlcSQpmVXH1vQwyVPzUMdfsaL45wg7MzQGFjFnhCk14b26SzKSLQT4VfuXS
         qZ2OOWq8FftKY18EBb/yWmb/1LqaiFyumzF/Z7f10WoVhz6wKKiTVQBkc7gqw3+oeRdQ
         5JUc66hC8lxtMejCAs85GQGUeb1fJK15M0RXAyc0+nJyaBjWKXHPSDg9oCQ0g3B4hS68
         Jh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818449; x=1794423249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4BO+0EzPkh7K0U5uHSGQe2VU6WFhDSfKkeqTxLg22Y=;
        b=WZAp4TLWoazwMVZApYz5dX3aY9KRJueNDR7tnRDZP8o/lOL4NJUtDkEHSaT0w2EV/u
         2Jvl7mbfazndaoBpdHpoB5l6HvUHH4jSoV6NBgonbd4vl5gJKafmHpjnC3zYh588r81P
         yfDFfPO3LyIpDVr2Pz/3gxoKmy3sNkf5f7kOKmKE7I9u7PtREQCynVWNzQofTOYTd7gB
         +jRHG4bBSwWiIbqys69unF8JAUnjNfOoFQrV8vIcOtVYDY1YY0Cv7ab0k6lNizCArQbK
         qm7Z3FgC3Zpf4a51TY4/P8r73KCQbBC4XeVcsqGVbiFwGZt7v/3N4elUrU7FbZVMPwhF
         SiyA==
X-Forwarded-Encrypted: i=1; AKwUvBwBasEKeOzk0iOEu0/7NH3PnLBE8j5et0A/wLqKG5Nrq5ILeFTFZLrpJfxBMjnV8BTORJgBUB4IKtW1iw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/fil0roToQAeBM1OKakx9KIkkkR98SWqD4Eb6Y2tJq0we2Y1NC
	xbVKQ+kVmX4U67Y6bJwqU+/59chABrFrvD7IqOAyy27y9XpXlbL544p7
X-Gm-Gg: AYBFou3yMKy29KFjjBlVTJJq0AMVYSImU0NtvB4pOyZ1vwr+XmwIZ90ZBjALzURxYKw
	UzATIlWt0PsTbG46zzCmKlWhIooPesuEgfGt06xlT8sLZzS0W5VcjuohIt42zERpn1Rsaf1vLj6
	nEFGes4XsN7P6KLR6IH0+HN4TBKiCI5oedQs7rn1yxESkW3MD2JAyu25gUCb9IijVw2rWYNBzmT
	yRWGMV7tPDWCrb88OVLLq6Cgavw/NHjIfx4GkF7FJAfRo3F7s5yQbSItS1X+5nfq3Jd703QKIjV
	4hsG9udjcT25csZuUfOxhDv1CNxPYGJ2sh5Pp7o86uCF86wCumRNsFJwUvU/vfRXcoYaY8kLSMz
	fxtzbyUyBQnqmm3pCkjCsXHm3pZXadUZMWQN+A2S7KyDmIj/ZUMp4m8MNOtQrjmKuIlxVDszDi4
	D5kdk4T5p2AqoVBgOi4AbFCCfY+VuS8lk+2JrHgRxRJvFH6/38MFK545ccxgM/xWHhpMzXVDMzT
	kIYiIGdTiAI727kfvV2ip8lAbJM72OOf+GcGFuAt5fMj/bFRFYd3d634b6D2IEFQxpLoJR+A5UT
	7wLQVRfpIFiwSbqbuSkkdlmymiojD+gkIzD4G98YwRU+L3JyuuiZv9B+ixV9aYaCtMqPZK5DHYR
	iO77KFOsoDw==
X-Received: by 2002:a05:690c:386:b0:8a9:d5f2:f5a6 with SMTP id 00721157ae682-8b2b675505dmr89556097b3.67.1793818448812;
        Wed, 04 Nov 2026 10:54:08 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309b9f50csm24367767b3.38.2026.11.04.10.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:54:07 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 04 Nov 2026 13:53:58 -0500
Subject: [PATCH v4 3/3] perf alpha: Add perf mem support
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
Message-Id: <20261104-perf-alpha-profileme-v4-3-1771ea02950e@gmail.com>
References: <20261104-perf-alpha-profileme-v4-0-1771ea02950e@gmail.com>
In-Reply-To: <20261104-perf-alpha-profileme-v4-0-1771ea02950e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3965; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=0IeeS9SsfB54T5WtkW3dlFw63jBXywse/saigUal3p0=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe17sI+KTmH2NK6FLpMLM9q9LsdfxenIdd/6flNZzVl
 if50+M7PrIwiHExzBRTZIlbr8gyq23HUp/T0r9g5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 IEPHKB4ip8egkVlcXJpapJtWUOSQl1+SWJKZn1esl1+QmleQXqCXlplWkpGRX1ScCjRCLy+1xNT
 V0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0pyBi1MA5pofqQz/c1geBdp8vX
 yjJ6XVfMe+23zubQve5zYnrzyl927NxiM8jAz/C6fyLrxZrL1aK3Tzg4k5u6+9/VwcdGRldrDLQ
 hatRRJ1TAA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha kernel series "alpha/perf: add ProfileMe sampling" reports the
data source of ProfileMe samples of loads and stores: whether they hit or
missed the DTB, and whether they were loads, stores or prefetches.

Give the Alpha core PMU a mem-ldst event, cpu/cycles,profileme/, as AMD
does with IBS Op. cycles:p is not used, as precise events sample only
retired instructions, and a load or store that misses the DTB is aborted
and refetched. The profileme format bit only exists on the EV67 and
later, which have ProfileMe.

Suggested-by: Ian Rogers <irogers@google.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 tools/perf/Documentation/perf-mem.txt   |  3 +++
 tools/perf/arch/alpha/Build             |  2 +-
 tools/perf/arch/alpha/util/Build        |  2 ++
 tools/perf/arch/alpha/util/mem-events.c | 17 +++++++++++++++++
 tools/perf/arch/alpha/util/mem-events.h |  7 +++++++
 tools/perf/arch/alpha/util/pmu.c        | 11 +++++++++++
 6 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Documentation/perf-mem.txt b/tools/perf/Documentation/perf-mem.txt
index fe51c5e3333d..cb439940ce90 100644
--- a/tools/perf/Documentation/perf-mem.txt
+++ b/tools/perf/Documentation/perf-mem.txt
@@ -34,6 +34,9 @@ be sampled.
 
 On AMD this use IBS Op PMU to sample load-store operations.
 
+On Alpha this uses ProfileMe, on the EV67 and later, to sample all
+instructions. Loads and stores report whether they hit or missed the DTB.
+
 COMMON OPTIONS
 --------------
 -f::
diff --git a/tools/perf/arch/alpha/Build b/tools/perf/arch/alpha/Build
index 1bb8bf6d7fd4..e63eabc2c8f4 100644
--- a/tools/perf/arch/alpha/Build
+++ b/tools/perf/arch/alpha/Build
@@ -1 +1 @@
-# empty
+perf-util-y += util/
diff --git a/tools/perf/arch/alpha/util/Build b/tools/perf/arch/alpha/util/Build
new file mode 100644
index 000000000000..8d924b229470
--- /dev/null
+++ b/tools/perf/arch/alpha/util/Build
@@ -0,0 +1,2 @@
+perf-util-y += mem-events.o
+perf-util-y += pmu.o
diff --git a/tools/perf/arch/alpha/util/mem-events.c b/tools/perf/arch/alpha/util/mem-events.c
new file mode 100644
index 000000000000..d3cbca1993b4
--- /dev/null
+++ b/tools/perf/arch/alpha/util/mem-events.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "util/map_symbol.h"
+#include "util/mem-events.h"
+#include "mem-events.h"
+
+#define E(t, n, s, l, a) { .tag = t, .name = n, .event_name = s, .ldlat = l, .aux_event = a }
+
+/*
+ * ProfileMe samples loads and stores alike, and reports DTB hits and misses
+ * in the data source. A precise event would sample only retired
+ * instructions, which leaves out the DTB misses, so set the profileme bit.
+ */
+struct perf_mem_event perf_mem_events_alpha[PERF_MEM_EVENTS__MAX] = {
+	E(NULL,		NULL,			NULL,		false,	0),
+	E(NULL,		NULL,			NULL,		false,	0),
+	E("mem-ldst",	"%s/cycles,profileme/",	"cycles",	false,	0),
+};
diff --git a/tools/perf/arch/alpha/util/mem-events.h b/tools/perf/arch/alpha/util/mem-events.h
new file mode 100644
index 000000000000..311448cf1218
--- /dev/null
+++ b/tools/perf/arch/alpha/util/mem-events.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ALPHA_MEM_EVENTS_H
+#define _ALPHA_MEM_EVENTS_H
+
+extern struct perf_mem_event perf_mem_events_alpha[PERF_MEM_EVENTS__MAX];
+
+#endif /* _ALPHA_MEM_EVENTS_H */
diff --git a/tools/perf/arch/alpha/util/pmu.c b/tools/perf/arch/alpha/util/pmu.c
new file mode 100644
index 000000000000..d19dfc979b08
--- /dev/null
+++ b/tools/perf/arch/alpha/util/pmu.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "../../../util/pmu.h"
+#include "mem-events.h"
+
+void perf_pmu__arch_init(struct perf_pmu *pmu)
+{
+	/* ProfileMe is only on the EV67 and later. */
+	if (pmu->is_core && perf_pmu__has_format(pmu, "profileme"))
+		pmu->mem_events = perf_mem_events_alpha;
+}

-- 
2.55.0

