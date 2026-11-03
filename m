Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738271;
	b=PBXlzXzhGqz4jnIIuJovtVO6DaFVkP3de3e13fuaTtamNuPxndOdTtceKdk9ieoSoxjD
	 jccNqdP2bg5GDde5rmOLEMNdvgRKhI53+lArD7jcqsF0vhWsQoUdorDrrz4IBE1BAhW0L
	 xvJUyAQN9YZhljmSFn9sTEEkhjaC/Pd0nfh5ykm5dJ6v8ApXyhXO3o+SH+j92dM8yHOge
	 +9Usz/kKjCpFHrkpfKx1M1+Wif9mxqSXObXAkCTtBkNyODfIN2G+fI5dtmbSYIAuk8Imo
	 7378TJKU8gL1zcs7i2yqSIpX/NewAwvkhzjWGvRGL6qoOLV9Oe0fZ4EdxHg/DeLZPIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=wZLeVliNW7D6BpM87n+ICnl1zhz5KhRdmkp/bLx5ZOY=;
	b=PUEZxYFunjl1zqZtqAghiRVgI/sQP25F9r3nERoe76gi+P9c/zyUPD3YRdA6vuGwrXlR
	 78uS3us2pBrjxiCeZMJyyoG1XhmL6sv265JBISd7ZSonuXNMwXY+MM47GvkSalvBt9U5e
	 cVKzbbHGAzJTeQ24YkReULaxlRzgs4okCKAJmREr/DCT1pVGzqVXlf5Mj6A/jZZ+7SqF3
	 SljDDLsgZmnbrT0S2deYhDFfMNqSqSr14lMTAF0ssWdIEHf55shNwCqaHj+XNmGZ+Q3t7
	 3nJGvyaGkH/p2ftqWk/a4l0D8+9nXzlkBjwjdw77DiZUvIK/b4kN/UQJMAon0P/ejKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mRwU9WQS;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBDC606D814
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 20:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BBDC606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mRwU9WQS
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b056d58f2aso13687b3.2
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 12:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738269; x=1794343069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZLeVliNW7D6BpM87n+ICnl1zhz5KhRdmkp/bLx5ZOY=;
        b=mRwU9WQSRELqCEaFV/SrbmctDthXBuFNV+f3ePhFS9zTNk9KnoileTzqOQpoyIJnPX
         vNWAejfcDqw834tsrhW61URFG7QF8ToA++lNQtw+gUMF0t4oFJ5aNHtjJrhPKL6grO+t
         tvA1exdvY46MrArF+VPdq/k9n6I6ymx6pRCkZgmD4oZkxixUSlCoFI2QTidMeNsgPr8q
         blqBAzwUOiQXv5jSl2kKRXZO9DcL2saDgOFF933PWsVvZSwjofOU7tQKXeaSdMEfbvT/
         QwfYUnlIDmueTyJLmb66nO6j2rVCGueVq85Y80yQ4urG5cGH5f2yTR9K7+X3NaiwwcTe
         0hDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738269; x=1794343069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZLeVliNW7D6BpM87n+ICnl1zhz5KhRdmkp/bLx5ZOY=;
        b=JQ1gnXz9SenmPYGvnWOaDXi8CmfX5lkig3bSf+BQhBE+HyM9bEYE91L7xoe3PcWEHt
         gV2uFFPrkAfQ2Oa0Cqa3G1XIn/Kasune4pYTTo+SOJpzSps354QpMNFf58CNGgDkyyXW
         tAPAPmtwkai1aAfqPZVoWUHc/NVdDWBnFGR4/ZB3zKK/GizorxdSzNV1pLRO4evoxlZM
         SS73TFIV6y/S2JmSp1OljvRohRYJmlZdUjmxVY/dCCRlexfTldLBFmFaMohzCgWWGbD2
         FCwtNbIBYHe0guYolcDGXDeNG/AMvuQdUIfNYmXWFHbZV6CfTLXgy8clrLJEXOahLK2j
         dOaw==
X-Gm-Message-State: APuU4Z9bjXqoXwcINq3VQ7sx15YLnslJAeR5o0gOnYi4z5sUn8i4l0ve
	1hE9RTkLma9HwwT0xPJVdNKlSkisZlRbqbS1D7CSjy5j+IuEcYKTsVhGTBKpGA==
X-Gm-Gg: AYBFou35BpNqvHGsXgQc4Le0bYf9AJzvgMU7wjb584KDvchlnT75cyAN2wp5Yd9MppW
	iHRBdfeENlB8I1vOpkMA1OCG3QMiOE6ijEim3J7nK1u3EEe0baJNtQpZCbzJetcQWoChhF5upN0
	gwBBfLrelztJJvDOEcx5uIYoaHeVCNMoWxdSg4pdOUv4EvjuzJVzLPjNQhJr1uVam8iy/ahjsrH
	sbdhjEeG/qZ6ciW+NWfiT1EolYJc7kkTKdzIrS7A/V6oNmLHrNptTxIkkHwlpbiCqmOgtYOAZTt
	OjPGWqGD5BJO+Fd+LFmNHxrc/D54URQj4PAUTKoiO9wRPLBuurLEpyiglAVCmx5PSZXJUtpPaQv
	Ljl9qT952Vf71QgYtB4+1CFmesNczoLvRIUMz1NxSmSfXlut/pWDabiOZjVUSOuiydPM0vB/Kuw
	Kad2tZrZYDg2vt37wXHSMPAZ3UwgXbBu0uTauNSjoovU/9rIyFwzUFruoo+6xF5DwX+aPnPhR9s
	JQh4QuwcYEUTjyJu8UihJQLcUvQxZss8kjKZIlV8/VcLrmW696pBu7CHj12WM5MMCZdX/ug+RMO
	WIBf43BOV9YLDhzVosBfFYWxTeXwcndYam1Nk1iAQUiyOodvQMsj8fEzfEGvwXup0ChEK1PFBK/
	lyrdjb+icYQ==
X-Received: by 2002:a05:690c:c50e:b0:8b1:6e9d:5e1 with SMTP id 00721157ae682-8b2b642edd9mr91737367b3.0.1793738269149;
        Tue, 03 Nov 2026 12:37:49 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3099a9ca3sm4640997b3.34.2026.11.03.12.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:37:48 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 03 Nov 2026 15:37:40 -0500
Subject: [PATCH v5 07/11] alpha/perf: optionally randomize the ProfileMe
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
Message-Id: <20261103-alpha-profileme-v5-7-bbe3937fbf3a@gmail.com>
References: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
In-Reply-To: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4513; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=42uBeouCK5ron4H08GeyCIDlpkQRgdZKsP4QOBSLtzc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJeufF9ecCvanZMMdNs/mHBmyVXRb9tKXsY/ubq4dt34
 wKXTemN7vjIwiDGxTBTTJElbr0iy6y2HUt9Tkv/gpnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DIEMHaN4iJweg0ZmcXFpapFuWkGRQ15+SWJJZn5esV5+QWpeQXqBXlpmWklGRn5RcSrQCL281BJ
 TV0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0tzBi5OAZhrtE8zMpzU0fOc+d
 JTJ8OMw5pvScKH5M0bPExD8xZm6lwUS16VvIKRYXPUL4bbpSyZnTkKeaF5n7J0kwx5573fb/hL9
 fXsa9EFDAA=
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
index 54f90fdeecdf..6c74f67ad341 100644
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
@@ -34,9 +37,11 @@
 /* Layout of attr.config for PERF_TYPE_RAW events; see format/ in sysfs. */
 #define ALPHA_PERF_CONFIG_EVENT		0xffULL
 #define ALPHA_PERF_CONFIG_PROFILEME	BIT_ULL(8)
+#define ALPHA_PERF_CONFIG_RANDOMIZE	BIT_ULL(9)
 
 /* hw_perf_event.flags */
 #define ALPHA_PERF_FLAG_PROFILEME	0x1
+#define ALPHA_PERF_FLAG_RANDOMIZE	0x2
 
 /* For tracking PMCs and the hw events they monitor on each CPU. */
 struct cpu_hw_events {
@@ -60,6 +65,9 @@ struct cpu_hw_events {
 };
 DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events);
 
+/* For randomizing sample intervals from the PMI, where locks are not allowed. */
+static DEFINE_PER_CPU(struct rnd_state, alpha_perf_rnd);
+
 
 
 /*
@@ -247,10 +255,12 @@ static int ev67_raw_event_valid(u64 config)
 
 PMU_FORMAT_ATTR(event, "config:0-7");
 PMU_FORMAT_ATTR(profileme, "config:8");
+PMU_FORMAT_ATTR(randomize, "config:9");
 
 static struct attribute *ev67_format_attrs[] = {
 	&format_attr_event.attr,
 	&format_attr_profileme.attr,
+	&format_attr_randomize.attr,
 	NULL,
 };
 
@@ -385,6 +395,22 @@ static int alpha_perf_event_set_period(struct perf_event *event,
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
@@ -751,7 +777,8 @@ static int __hw_perf_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 	} else if (attr->type == PERF_TYPE_RAW) {
 		if (attr->config & ~(ALPHA_PERF_CONFIG_EVENT |
-				     ALPHA_PERF_CONFIG_PROFILEME))
+				     ALPHA_PERF_CONFIG_PROFILEME |
+				     ALPHA_PERF_CONFIG_RANDOMIZE))
 			return -EINVAL;
 		ev = attr->config & ALPHA_PERF_CONFIG_EVENT;
 		if (!alpha_pmu->raw_event_valid(ev))
@@ -779,6 +806,14 @@ static int __hw_perf_event_init(struct perf_event *event)
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

