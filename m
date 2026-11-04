Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818166;
	b=WWgH16U+DYgBqvM9lgYiWYAV9zrAsJX7HvU2Oz3JnSK+Z9Pqz53CCI1y3bbDJ9ditTpl
	 gK++yVQ7i/oUO6AtbgtmJ6tzB+8gDk/ywATQ5bWumeIZAj1/MUzXgFdWNO28T2RWMhfb7
	 G2NKe2CBdvVaynObxNkxczepu0fHM1z9xg9S4mzjWa/i2DLsJpDtR+EaNuzI6zvixH6Hp
	 LS5DSyF+1KBGFR2ufHrpzvVSrc4vZffZE8U6j6+9gqb2NDA5cc6MnmN8djBvGca/km2G3
	 0ajz89tOM/ZNDODGMnFIfMI9RGxsh/Bg2nI72zHH5h8E4GC5vzkJdLzLbyhvUDP9Qjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=fvw5ZdrqgxDo4yVygHiDipEAagbaXxnFCBvwsXPac48=;
	b=cYfX15Y0yyFenM+hzFjbkIAQnJrC8goLltzSp2ToMwih6i8siGdFrL6FON/+HTVAsVhY
	 T1U+KSMEfQhikAtDmbDbbMZ6Sxj+2k1Fz99u5DrTZ1qlCkO/QfmdiSBbnw9OZ0okwjoLj
	 NJPBKeLkjDAXW9XY8gkbYkUog7j83OLDxTeBb9nb2Yl3ahAXt48ZDPbUC1yXZLuFnUFIi
	 zrrYWq60A+ZLn5gaJjhmwh1df0rjT4KN2W6VaHtrWw8e20etjpWzVhbyvaqDY32ibB9ZA
	 QxCZLP72gYtjiQly6AAYeQBxKHRj30ThqK8wIhcxBSfIyRe8Ng39DaFFH/GAHdWnf5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6rJMl1w;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C541B6082BD1
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 18:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C541B6082BD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6rJMl1w
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b300713befso10364637b3.1
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 10:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818165; x=1794422965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvw5ZdrqgxDo4yVygHiDipEAagbaXxnFCBvwsXPac48=;
        b=W6rJMl1wONpkfeZVJgHEnrjv4w3FGvtpZ0L6AWjC6pdQiiredCx02/GAkYnbcjdB29
         hUdBUgN3FZ4D0jXT5I/S8NiZ9vRelSkTaT3AqD/F3U1Py3lkkQ+CVF8EZ/1rBoHuBfCv
         22r9ypbb05xhGYQSu2WBydYJO6eyjh77nG3eRA3jMFAu6vcLfS3YoG8byigAq0lKvzbu
         gIa6llmHKd/RjP1Lo/FleATyLbPP5WBFzDo1u43udtNu24TZ1rW5xGapGph+jqqe1TQX
         EFWIz93mmWrZvRRCj62T7LsRsWxp0zONUj3l7fRmMcl5u6vTghh5jJITCLUlzU5pggrM
         2IiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818165; x=1794422965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvw5ZdrqgxDo4yVygHiDipEAagbaXxnFCBvwsXPac48=;
        b=BsN7wjmtwa0dsFH/4czWei3pCPpbAIx4zz8ro0dFHWlU7XGOqMp8AHan72j2YSxPBT
         7XvViJiX/aOo1upl9VwClSz0qHaJdsqEFWBX0Lje9fSl9aUGUX7WtsRJIdKP9vTfUxzE
         Ybexq+exe6LsDkLsga7CiFKlEuwM4zXln1BNBu0XmxMhYirZn0k6pFK+T2DSNciG0oq8
         f85/CMOsOVefmMXHxA9NhcwDZGXk5owZ3XuVl81CDPZ2LulERS1wg0idRhNEaQMtAeqE
         gjQinIZhXQ+DIXM7t2zH3lM2TzuY7Um4rh+XmekGPNeoi80ev/rFzj4avBXWidWH2d5R
         fHIw==
X-Gm-Message-State: APuU4Z97IjgTCxiopHrsKx2slOcWGpWfXNkP+IpmzEwTu4FyeAbxwOOR
	lpZRZE9FSnlqwFt6kebeX7QMUkzBno0s3IIyd3esFOuYTe+ecItgweRy
X-Gm-Gg: AYBFou05T7ftcYplDCyQPiXgbvoBTvhvVdvvHtF6/GKp7Qx2unCzqSau3oSi82yFbcA
	xRbNi6SM7k/Ap/38v/TvQikJkvlYSQBSkc/+hU0YcEYO/UhF4YQQNEldYQrQ8FsGJJMrkUUCtDX
	8Nlr7Mn0PLv/zYzMJONKZeGuq+NnJZLCaM2vHu/TLu4cx2sftXjdWcISQGrIZQbNboFzCiaK8l8
	kw5u84Q+2SumK77jyo3E2xM/gPC3SNRgbZNLF4Be/crLmw0CTA3Ic/kih7eLlhzTfkshLmEYIvX
	tavHi1t+l383X2NScmv9m37KbMUzCsibVM/JhHcitirmLbTlzb5B9AFASUgzri638e56cWrApmq
	AG6a5VZITWJECkSVUzmQyCZJL39BnMS+8MrjgFmY4bT0TSGOm5S+0xOPs7jbsnSAd6mbhft7SNT
	ptdmj5ZLy9OzYZUAUL47Lrfzt5dTNRatoz708bBREUJ3e6I6yjwOql6HCsyoNUAjRDPNtNEGYjF
	I5BA+DpRd05TlYicQn2Kt3X0qqnRY+8XiP0KcbUxEaF3Oozi06EkjacbikruqJrZGdyM8IaapFn
	q/zj5wQKum2+M3HwYa4CZE5gh+/uy49S5CcbnKco4RVeAul8ygL5uWbZbYCjkUUb4Kc8wrbd6c7
	A7Q19QF/i2g==
X-Received: by 2002:a05:690c:6e85:b0:88c:b863:e405 with SMTP id 00721157ae682-8b2b6736435mr117440307b3.38.1793818164467;
        Wed, 04 Nov 2026 10:49:24 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3098c313esm24659757b3.15.2026.11.04.10.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:23 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 04 Nov 2026 13:49:15 -0500
Subject: [PATCH v6 08/13] alpha/perf: optionally randomize the ProfileMe
 sampling interval
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
Message-Id: <20261104-alpha-profileme-v6-8-63362e9290a3@gmail.com>
References: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com>
In-Reply-To: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4553; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=hYabNeE9UaniE1qqxPyCXnHv93dIZeS95X4LQtRwjn8=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe16nKXd+h18h46nj/1efiPM25mSemye/9tu7MU6tGD
 4F3Zby1HR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHONewzD/1Dnb7VtZ1
 ftvi77/urcrpWzva9m1kYw3P76PGrvwgkPNLwZGX44rnJPnpHw99RqGaFplz9IpJWpvCqL/fOOQ
 /2KqHz7ZmYA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

A fixed sampling interval can phase-lock with a loop whose length divides
it, so that the same few instructions are profiled over and over while
the rest of the loop is never seen. DCPI avoided this by randomizing the
interval.

Add a randomize config bit that varies each interval by up to 1/16 of
the period in either direction. Only ProfileMe events accept it, since
Aggregate mode samples already land a variable distance from the
instruction that overflowed. Counts are unaffected, because prev_count
already records the value written to the counter. The jitter
is computed with mul_u64_u32_shr() and the sum saturates, so that a
period beyond 32 bits cannot overflow.

The jitter comes from a per-CPU prandom state rather than
get_random_u32_below(), which takes the batched entropy local lock and
triggers an invalid wait context report from lockdep in the PMI.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index f6546d648133..b33677cc23ca 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -16,6 +16,9 @@
 #include <linux/kdebug.h>
 #include <linux/mutex.h>
 #include <linux/init.h>
+#include <linux/math64.h>
+#include <linux/overflow.h>
+#include <linux/prandom.h>
 #include <linux/sched/task_stack.h>
 
 #include <asm/hwrpb.h>
@@ -34,10 +37,12 @@
 /* Layout of attr.config for PERF_TYPE_RAW events; see format/ in sysfs. */
 #define ALPHA_PERF_CONFIG_EVENT		0xffULL
 #define ALPHA_PERF_CONFIG_PROFILEME	BIT_ULL(8)
+#define ALPHA_PERF_CONFIG_RANDOMIZE	BIT_ULL(9)
 
 /* hw_perf_event.flags */
 #define ALPHA_PERF_FLAG_WRAPPED		0x1
 #define ALPHA_PERF_FLAG_PROFILEME	0x2
+#define ALPHA_PERF_FLAG_RANDOMIZE	0x4
 
 /* For tracking PMCs and the hw events they monitor on each CPU. */
 struct cpu_hw_events {
@@ -61,6 +66,9 @@ struct cpu_hw_events {
 };
 DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events);
 
+/* For randomizing sample intervals from the PMI, where locks are not allowed. */
+static DEFINE_PER_CPU(struct rnd_state, alpha_perf_rnd);
+
 
 
 /*
@@ -248,10 +256,12 @@ static int ev67_raw_event_valid(u64 config)
 
 PMU_FORMAT_ATTR(event, "config:0-7");
 PMU_FORMAT_ATTR(profileme, "config:8");
+PMU_FORMAT_ATTR(randomize, "config:9");
 
 static struct attribute *ev67_format_attrs[] = {
 	&format_attr_event.attr,
 	&format_attr_profileme.attr,
+	&format_attr_randomize.attr,
 	NULL,
 };
 
@@ -389,6 +399,22 @@ static int alpha_perf_event_set_period(struct perf_event *event,
 		ret = 1;
 	}
 
+	/*
+	 * Vary each new interval by up to 1/16 of the period either way, so
+	 * the samples cannot phase-lock with a loop whose length divides the
+	 * period. The count stays exact because prev_count records the value
+	 * written.
+	 */
+	if (ret && (hwc->flags & ALPHA_PERF_FLAG_RANDOMIZE) && period >= 8) {
+		long jitter = period / 8;
+		u32 r = prandom_u32_state(this_cpu_ptr(&alpha_perf_rnd));
+		long offset = mul_u64_u32_shr(jitter, r, 32) - jitter / 2;
+
+		if (check_add_overflow(left, offset, &left))
+			left = LONG_MAX;
+		local64_set(&hwc->period_left, left);
+	}
+
 	/*
 	 * Hardware restrictions require that the counters must not be
 	 * written with values that are too close to the maximum period.
@@ -763,7 +789,8 @@ static int __hw_perf_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 	} else if (attr->type == PERF_TYPE_RAW) {
 		if (attr->config & ~(ALPHA_PERF_CONFIG_EVENT |
-				     ALPHA_PERF_CONFIG_PROFILEME))
+				     ALPHA_PERF_CONFIG_PROFILEME |
+				     ALPHA_PERF_CONFIG_RANDOMIZE))
 			return -EINVAL;
 		ev = attr->config & ALPHA_PERF_CONFIG_EVENT;
 		if (!alpha_pmu->raw_event_valid(ev))
@@ -791,6 +818,14 @@ static int __hw_perf_event_init(struct perf_event *event)
 		return -EINVAL;
 	hwc->flags = profileme ? ALPHA_PERF_FLAG_PROFILEME : 0;
 
+	if (attr->type == PERF_TYPE_RAW &&
+	    (attr->config & ALPHA_PERF_CONFIG_RANDOMIZE)) {
+		if (!profileme)
+			return -EINVAL;
+		prandom_init_once(&alpha_perf_rnd);
+		hwc->flags |= ALPHA_PERF_FLAG_RANDOMIZE;
+	}
+
 	/*
 	 * We place the event type in event_base here and leave calculation
 	 * of the codes to programme the PMU for alpha_pmu_enable() because

-- 
2.55.0

