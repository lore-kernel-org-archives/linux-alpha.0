Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210984;
	b=0nict/uajdLKk/n+8xndRJCoA3jXK5KoLwkclKKxlCzAsl7Kio5UjFJbccfzyysCiLd9
	 nxwbj5EDx4WyaotdpHP+BDZkSx/5ZECt1mwnJSQzM82XNLWwm4V1L7Mt0OoP9EU/D44mT
	 Ny7m17Jl8JfyQeNrIdxCp8qvMrvIcPKBmBuCQSugBNxTGBlblwPoqB0Wi2s7/nnTc0UfV
	 RQ9y6vx+b/TVC6u+GSLetF1kIpxEsRY3G7ScVXDNfcQL9VFzK5Z/ZRaGV7xR9UcK4p2d7
	 IYbOJvYKUN+z+GloqMnND6y8ztYP/jnwVJurOQhQ8ikOHvrWMr8jwlWkIcOvBQF0efw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=rMVi8SFFXKSrqwlRKxY/pjy3d5De/eMP8nsJ1YLQvSk=;
	b=ZXA309CDDPVMVUS9Ci1wP4qb4QGRIUiGpWRSfdWQ8h2zlqUQezv3F1zyChyCCdQ1LLr7
	 geV8a+neoiAjAhfAyY1fEBhMqTdCCIDBfL/Q3FHkp64fAw/akb+5Nt+UnlHATLAOB+o0t
	 tKh7JCYJulAFLqBH/NnAHt1iqKuBb9oJEpf/7KOfwHohWFSbdE/NiODY1Ysxs83hN1Rt8
	 HDhL9IEXv3tkhB0hVIVfg0MnAY1YWnpZOg+xx0KoIFzUSVcwurhpknqj5f7qxvljTxN4d
	 /oCIPGlzxRp//WocZP99sVy7GebSVJWisDhSqJDXfr9vxBYB9dH93Zs+NtHHsxVdsjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jt6MdRhj;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B28D60A260E
	for <linux-alpha@vger.kernel.org>; Wed, 28 Oct 2026 18:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B28D60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jt6MdRhj
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8ab37e44643so9672167b3.0
        for <linux-alpha@vger.kernel.org>; Wed, 28 Oct 2026 11:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793210982; x=1793815782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMVi8SFFXKSrqwlRKxY/pjy3d5De/eMP8nsJ1YLQvSk=;
        b=Jt6MdRhjjDNiJqqa/Pc6TAGqThhSZzxewKrkW+b1dDL7CvX7lyeFXtXjLfsO6PTlBv
         Rch8BPG+BoazMiqpT3TNNYmVzKS0g6+QVD8AoawuTQYh3Cov/2Fdkfy+H4NB4w2EGp4y
         9jqyccHm8s2MSUQsv3WzHCVACOCb4d2MEOCR2zoQRzsFR++F/i8Dh3wPN290uwxtJ21Q
         OZIo5IwBC6G0AvHNQgzQ+PP5oLz6nza3wVZujefGSkYXrr2M+EwTEyAbBruCq4kehB9K
         5SeUcH1XDw6J3gRv3oYHiv+dMkJI50cSsjk07dZuv9pRGO98QlmAhZ8lrcLxCGYZ+A1b
         d41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793210982; x=1793815782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rMVi8SFFXKSrqwlRKxY/pjy3d5De/eMP8nsJ1YLQvSk=;
        b=goYrPVIn82ULea5Tt+GtWCYOjNXp6dN+4f8JzWJ+4Gss0sHRU/8IQSfOZsUjr1r5sP
         OApfDol0mxgIcSZFLfz9UnrCS5O/b4FJ9nW1SAT/LoNZLtmtZqLEJJD6EU+h8jElWjBU
         6BMkA52u4YDvY8WeJQmIL3ETwvJR/lNm27eocQh9aF41EjKNrXO0T+u6+4p125u62OnG
         QSXf5x6AGEGB5SXCzehzHjiUc2XOfidw+VtJfTc0C9Ii3W6iFITdSHDYDkxoLOuKwP21
         OAQsPTYx+1gRrG+JH3KLGrtLZRaVQQZq9c6AHVkUxUG+/8bdxZckE4UxpbGmR8EnrO7W
         x76w==
X-Gm-Message-State: AFq9FYJew1YszXEPkv0c97u8dnKMKa1TEl7m9rPb5TPM+1sb5I1NYJ4R
	OKIeExNggx80v2hSyWpoE3h4ZVUF2vTl4921Pl9F4nS2wwaYa9ubAnxi
X-Gm-Gg: AYBFou3NVWU2//xJ50NR76H/ZuDojqTetMY+drCH/tK+TjkvOYG8c0Jb1bXahrD38Bl
	yh8ABXN/SHFWTLcVPMcNVgzBxw4UHHMWgrelhADK6v8PYXspLlp/uZLA/G4U8Eg8EVR1oXJxiAZ
	TLL47Nk9NnDM1zya5u86aS2MrVdCXhEzg8rNb1XrIcbICsK031gX081YgsaH5G4YokcDr0Nlnvp
	LwwJQp8Dh2lYiHHnj/Cx+X4iVFbCptFnhp01ecxdfBxEJbWBC6mqVzh1J3VByostHdCGqhWzJ6h
	5NOpmo5M8ZHuSwNx9FsVvmjwpnT1k9tYOcKtnSPIDtN0QxxfxVeOZ8n4Xfs52bNB7RZrHx7LoLq
	l2VSKUmF+JAuKne+8UBUN2lt+yMbepv5D3efOp46noo2lm4W1ZtM8CzIVlHENVwYycJ1UOcTRNk
	un6YRqSidJmjmW6EZKMBqcqyyqjRfjGUNguL7o+t5/UfULB5WCD/jCwq96E65/PEKs+fS8RooON
	9gGixN9uxKWGltSMYX516EbPjZr5nUQ7SGmBr3DKF3h2xsuVF1qS+rkJmz8XELh2JROPDO7EPVT
	TAneUx1TpSckZplyST05APMbl7xcIT7NKDNGMB/3qmj868U3HUvBlAWk8km6A8mZB+ARCJL+/o5
	PcGaMIF10sqhA1EWGDTSDDm3wYbKVioIL
X-Received: by 2002:a05:690c:112:b0:8b0:a8f8:a12c with SMTP id 00721157ae682-8b1b5ec1c0fmr16444777b3.100.1793210982414;
        Wed, 28 Oct 2026 11:09:42 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a79f38dfesm2194096d50.1.2026.10.28.11.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:09:40 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 28 Oct 2026 14:09:34 -0400
Subject: [PATCH 5/5] alpha/perf: optionally randomize the ProfileMe
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
Message-Id: <20261028-alpha-profileme-v1-5-d44b52bf2500@gmail.com>
References: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com>
In-Reply-To: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4163; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=jVEkKBuejbJrCzLTdVIES+d7ed19TpFwYvlWuMBFngE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIeWUXd/+9ptnj6EvHPbNEJ2Wdf5nMEvDk5KXKZdsLut
 KdXhOsFOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYaHjZGhv/dnIYNe0
 ROil57H17ZF3tMMedmzcOlon1mp7fvLudtWsXw3zmFM+7uc9eA/4v1DGV/qooUnr36cDFX67rbx
 TxObM083AA=
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
already records the value actually written to the counter.

The jitter comes from a per-CPU prandom state rather than
get_random_u32_below(), which takes the batched entropy local lock and
triggers an invalid wait context report from lockdep in the PMI.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 06c9afeb7c05..da8262c74d04 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -16,6 +16,7 @@
 #include <linux/kdebug.h>
 #include <linux/mutex.h>
 #include <linux/init.h>
+#include <linux/prandom.h>
 
 #include <asm/hwrpb.h>
 #include <linux/atomic.h>
@@ -33,9 +34,11 @@
 /* Layout of attr.config for PERF_TYPE_RAW events; see format/ in sysfs. */
 #define ALPHA_PERF_CONFIG_EVENT		0xffULL
 #define ALPHA_PERF_CONFIG_PROFILEME	BIT_ULL(8)
+#define ALPHA_PERF_CONFIG_RANDOMIZE	BIT_ULL(9)
 
 /* hw_perf_event.flags */
 #define ALPHA_PERF_FLAG_PROFILEME	0x1
+#define ALPHA_PERF_FLAG_RANDOMIZE	0x2
 
 /* For tracking PMCs and the hw events they monitor on each CPU. */
 struct cpu_hw_events {
@@ -59,6 +62,9 @@ struct cpu_hw_events {
 };
 DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events);
 
+/* For randomizing sample intervals from the PMI, where locks are not allowed. */
+static DEFINE_PER_CPU(struct rnd_state, alpha_perf_rnd);
+
 
 
 /*
@@ -246,10 +252,12 @@ static int ev67_raw_event_valid(u64 config)
 
 PMU_FORMAT_ATTR(event, "config:0-7");
 PMU_FORMAT_ATTR(profileme, "config:8");
+PMU_FORMAT_ATTR(randomize, "config:9");
 
 static struct attribute *ev67_format_attrs[] = {
 	&format_attr_event.attr,
 	&format_attr_profileme.attr,
+	&format_attr_randomize.attr,
 	NULL,
 };
 
@@ -360,6 +368,20 @@ static int alpha_perf_event_set_period(struct perf_event *event,
 		ret = 1;
 	}
 
+	/*
+	 * Vary each new interval by up to 1/16 of the period either way, so
+	 * the samples cannot phase-lock with a loop whose length divides the
+	 * period. The count stays exact because prev_count records the value
+	 * actually written.
+	 */
+	if (ret && (hwc->flags & ALPHA_PERF_FLAG_RANDOMIZE) && period >= 8) {
+		long jitter = period / 8;
+		u32 r = prandom_u32_state(this_cpu_ptr(&alpha_perf_rnd));
+
+		left += (long)((u64)r * jitter >> 32) - jitter / 2;
+		local64_set(&hwc->period_left, left);
+	}
+
 	/*
 	 * Hardware restrictions require that the counters must not be
 	 * written with values that are too close to the maximum period.
@@ -715,7 +737,8 @@ static int __hw_perf_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 	} else if (attr->type == PERF_TYPE_RAW) {
 		if (attr->config & ~(ALPHA_PERF_CONFIG_EVENT |
-				     ALPHA_PERF_CONFIG_PROFILEME))
+				     ALPHA_PERF_CONFIG_PROFILEME |
+				     ALPHA_PERF_CONFIG_RANDOMIZE))
 			return -EINVAL;
 		ev = attr->config & ALPHA_PERF_CONFIG_EVENT;
 		if (!alpha_pmu->raw_event_valid(ev))
@@ -740,6 +763,14 @@ static int __hw_perf_event_init(struct perf_event *event)
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

