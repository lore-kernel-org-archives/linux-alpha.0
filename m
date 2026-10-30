Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333053;
	b=1z46jidWBChqHyqz43VbIidPNzrVX/Hz2Za9+SiI5odgWimXxfo+Epzhv4qp1hhCHjVQ
	 5y5Z/bVbfKwTSDIJcbMcD+sbBN7CrmOxNKFuob5+oaojtHZhIl7R+aBS09QkwH6EZ/4B8
	 YD/97pFCIPfUWTO1rmHZNNABDOhvgUu4X1zQH/GW1Ah8Wf1GBptBt0vP1NV4RXltBssLr
	 1MWwE6dFVAqrvqBntp92Mek2zhD+7ZuWt3m+MVYvTl+eafWj5yg1ukW+xvY9DhtBO7XYZ
	 bRD/2nvOcLJ8t8TNpo1f/NsKEuI9DlUnp4BGAKVXV5ZY9gc6W3OMg3wIfcQrAvthGag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=lNqmpGtTgW9fUJol2Sbmf3JaAFwyCUvKXpRbTU4nX5o=;
	b=e5pXpq2mvWH5YrZ/TeUD9QOTNcHM/2JRt6Ft7iRupRs8K+n1b1tDmQ54aqLnNkXNiiMF
	 9Ar+qkRPxN+HKIbJuxWwmJ/59Vp4lAdXAymrQ+DvyAM2jnczeoh9YTSGoSlspZ29BO0+x
	 ZTZS64z7AIK9awAhpplosBcAiMoUKLswGXjgnhBV11ZdR+bgGyIY8leT5LMVevuQbzSt9
	 Xu8gy26ldemEylnXz+VfHvirSUJ61i6rYfF+k1HMP4EJ+GZBuwuPy271oalp4eQZZE5+D
	 66LR9Zyi+yrhY3LWornTknHT3KDgtWUF1kH2XuflvdOzfzv537F3Utm1xrVQxBg5lHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o3pKE8Mk;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19500606A325
	for <linux-alpha@vger.kernel.org>; Fri, 30 Oct 2026 04:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19500606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o3pKE8Mk
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-677bc4704cbso232729d50.0
        for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2026 21:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333051; x=1793937851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNqmpGtTgW9fUJol2Sbmf3JaAFwyCUvKXpRbTU4nX5o=;
        b=o3pKE8Mk5lLoXMN8tyFjew+zoik7KSYUndCtzpeYTexQYSJ2fBZ4mQhkpISh+08wMH
         hzSrOYsCv53Q6E/c7K44HuYsOr0EQ8DidRsIXP1GZWdc/5kDCc3lQG8VAFAxpeR9S60Q
         P69+G9xmVFaMzAfT3+bm0GL4RmWgKcC0vLbSie9S1yukd6vqeOuFq+JF1oIEvq38nZp3
         JLhHNf1NKIxif1aiFVOlUYGKxU61Sj2JeHcqVxkljzfjGCiGeIODJ/gsuMH93khorrfD
         gw5iJ+WXdaK9LlcL8O7geZeJGIMr5gc8NJ5FGYacWxyyuqnX7oxDGnn2zuCuD+msuyo0
         m2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333051; x=1793937851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lNqmpGtTgW9fUJol2Sbmf3JaAFwyCUvKXpRbTU4nX5o=;
        b=rrnl4QzgCT+I5rA5HW1goZknWlgZBdNUPXEln7ELInVsqtJhkYrvSZlyMsLBujw4qb
         0kMDjYh9Lr7EpLKWwSC7w8jAZIAYhNW6BZNYBPmQNJBCBgKBVTJ3k6v0F1p3r4Mogz87
         4zEUISWyY5WrYejk675/UuAF4zbycEr07K69ywzp2h5btZvrwWHiNB64/PZITzguU5ua
         +MMiaFAcf/5yt+JaB+AtmVplhwBe0WvGPdgQlplKQ++YxXklGbK5pgkwO2b7DdpOeDyg
         phq8cw7Uau9+OcrpYIaYmEYF0bcFf/axC701JBsqYxbj/QEeZCCsAg5kitZ7mqiBDc8T
         N79Q==
X-Gm-Message-State: AFq9FYJuD59jPIyHlYSxS0M7o35U2Xb1KIGOHH6H7drVihwK8ISsh9e0
	BSa18GBCswEI3/4yRdoAeqYJh6Tbu2o1lisG3rqrYOScyQbjqnZYB6xH
X-Gm-Gg: AYBFou0IeIIrM9ShjTm+vm0TyuykWhrP1e6Gx8v9in6yyOjL1LF4+OA9LxIjCYGJ/Uc
	PlcW4qBT7seETXqTMqGKmIPqIkdQoxcdjCSUJ3mLjFHQCuxWkUzDknzFN22sxazq1YEp7TwyZl4
	NX4IbUcdDOEe5SRFyPw8HLRm0DEby7mvQpqYuVZkK37yKXY7lnT1pqqDadt/ZzxMcflblQTTeK2
	d9n3zK/2sFnOyA0NlQLxXTQJ4MjoGTrLKt8OBFIpM5ESmHxN4HaWmHOrti4+V6nQdLaie8G2nuN
	KVkxfSp3C77avZOmI01b8+CsBk4FI47+WR8lAS+MdxuX6TKjtKzsdEVJA1cGqXv+SyRSvZv2xMA
	cLZlW5gE8mkHfPC2EdMJAUhMiRyjT4Q1DByHoERcpKLEim2jVV9x/GczXeXAi+0P28l2HlCHLfD
	WYTws7fmQhFOhBJ5bi7LB7SPIXay+fowxwJiN/jtylJR9kV7CFQ0bgW01gs71UcaBUG1I9KnYxj
	kazEjPNE3UNFVriJKU90VsRFBaf4ww71KPGz4pqTrqv665/XlLPk6WTF4pFouT7CB9xKpy6+Q1V
	h9e5BK0z1VY+QocIVSJeLcghSEiPbUwDeAoqbYkSExdDiLxoxNvfSv95uwojCqHyCgA1qk20KiU
	jMVPxg/ZwZg75NrmEKQJZGChNYxH2ulE=
X-Received: by 2002:a53:c849:0:b0:679:aa23:415e with SMTP id 956f58d0204a3-67ba502ce45mr538074d50.87.1793333051349;
        Thu, 29 Oct 2026 21:04:11 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67ba7514e84sm310708d50.16.2026.10.29.21.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:04:10 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 30 Oct 2026 00:04:03 -0400
Subject: [PATCH v2 5/5] alpha/perf: optionally randomize the ProfileMe
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
Message-Id: <20261030-alpha-profileme-v2-5-c702f1c65272@gmail.com>
References: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com>
In-Reply-To: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4423; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=k1TKL1tsmpw+6SouF+Nkc9CqghjK65hgxaoQW1zZB34=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKeiOv3sUVzTfoceWLxFj7mw8c2O780YnxbnHfx1vLXP
 4/nnJizueMjC4MYF8NMMUWWuPWKLLPadiz1OS39C2YOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MwQydIziIXJ6DBqZxcWlqUW6aQVFDnn5JYklmfl5xXr5Bal5BekFemmZaSUZGflFxalAI/TyUkt
 MXR3djAwNTCwdLcycLBxNTZydnQyd3BwdnV2djCzNTQycLR1NXC3NGbg4BWCuWb+XkWF904sfLH
 98r1VPTV5zSPmC4P3SJ+I5utVVFw7p8Xbf36PC8D+zsLjPOlX49y2DXTsE9A+cObD+TtXxO1ebV
 24pPX8zcxsHAA==
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
already records the value actually written to the counter. The jitter
is computed with mul_u64_u32_shr() and the sum saturates, so that a
period beyond 32 bits cannot overflow.

The jitter comes from a per-CPU prandom state rather than
get_random_u32_below(), which takes the batched entropy local lock and
triggers an invalid wait context report from lockdep in the PMI.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index c9d4b13817bc..c553cbd6c7a3 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -16,6 +16,9 @@
 #include <linux/kdebug.h>
 #include <linux/mutex.h>
 #include <linux/init.h>
+#include <linux/math64.h>
+#include <linux/overflow.h>
+#include <linux/prandom.h>
 
 #include <asm/hwrpb.h>
 #include <linux/atomic.h>
@@ -33,9 +36,11 @@
 /* Layout of attr.config for PERF_TYPE_RAW events; see format/ in sysfs. */
 #define ALPHA_PERF_CONFIG_EVENT		0xffULL
 #define ALPHA_PERF_CONFIG_PROFILEME	BIT_ULL(8)
+#define ALPHA_PERF_CONFIG_RANDOMIZE	BIT_ULL(9)
 
 /* hw_perf_event.flags */
 #define ALPHA_PERF_FLAG_PROFILEME	0x1
+#define ALPHA_PERF_FLAG_RANDOMIZE	0x2
 
 /* For tracking PMCs and the hw events they monitor on each CPU. */
 struct cpu_hw_events {
@@ -59,6 +64,9 @@ struct cpu_hw_events {
 };
 DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events);
 
+/* For randomizing sample intervals from the PMI, where locks are not allowed. */
+static DEFINE_PER_CPU(struct rnd_state, alpha_perf_rnd);
+
 
 
 /*
@@ -246,10 +254,12 @@ static int ev67_raw_event_valid(u64 config)
 
 PMU_FORMAT_ATTR(event, "config:0-7");
 PMU_FORMAT_ATTR(profileme, "config:8");
+PMU_FORMAT_ATTR(randomize, "config:9");
 
 static struct attribute *ev67_format_attrs[] = {
 	&format_attr_event.attr,
 	&format_attr_profileme.attr,
+	&format_attr_randomize.attr,
 	NULL,
 };
 
@@ -367,6 +377,22 @@ static int alpha_perf_event_set_period(struct perf_event *event,
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
@@ -738,7 +764,8 @@ static int __hw_perf_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 	} else if (attr->type == PERF_TYPE_RAW) {
 		if (attr->config & ~(ALPHA_PERF_CONFIG_EVENT |
-				     ALPHA_PERF_CONFIG_PROFILEME))
+				     ALPHA_PERF_CONFIG_PROFILEME |
+				     ALPHA_PERF_CONFIG_RANDOMIZE))
 			return -EINVAL;
 		ev = attr->config & ALPHA_PERF_CONFIG_EVENT;
 		if (!alpha_pmu->raw_event_valid(ev))
@@ -763,6 +790,14 @@ static int __hw_perf_event_init(struct perf_event *event)
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

