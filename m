Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939446;
	b=pco5vRjmTfv8nqdX+yhKlN0u8pWvCjEzAkMzz3Nxb9ppVdg84X29HfhI6rIO1mb9Rzt3
	 Xab2NhsTNG01BDb1ohW8fu3SielmCTQiLAzPH2aEDqXzSLs1yxK65VNj6EzFvTMBFBDC9
	 M6pRatWh90ySXPtT9gBB0A0yJCCqc+JUE6kfpi4zT8Nf/M9B+Fkb3LZ9CgjPGH2Y0aWZx
	 /m3TPFQL3ZUXPM/4pr2lfDGCCf2rOnNBjDeN6fOsue5JpG1KQUNMVI3yYk1k8LDhtXhW5
	 4ZY8CCJriYQ4PkgbJYcafSPyH57orDpE0bfNDx3p5iQiYPnlR0G9OcVsDalQgFv41ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=c2oZkhU1UtRePxLTEULMeXg0foD6KLwhdX3Efy2qXQM=;
	b=idVFyhITzC1WNu/wO0NsOchHtvobwB/VH0bpfxZQchRoMyhqU6hTyl3cioWP1lPftbWz
	 wfWHkU2N1AkvirS4kn6JIPkjrkNQVnsezU8FjgxBkzcuawxmb50SHVY3KQqJ8OwZKPh9e
	 6+8j9XFaXR7iwSSZF1GdTWVMFXkM3TqwFqvnTFxXAyro1d+Xq5wOax3u5yza0EK6XszzL
	 aUQugLfOAJ6Y+VCuBdXEcQGufwx+4IL6ajwmZtUlcKVg0jCpYwjHKvN6TLB9SaV6EZgh9
	 G7zxyeiUDugZAStBONWtwHzGNVC5bfkp5VILmQI+owdIbNXH4//esUw0oNVmI0CSO6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oCmX2GPp;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60501606A326
	for <linux-alpha@vger.kernel.org>; Fri,  6 Nov 2026 04:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60501606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oCmX2GPp
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b305e10ac7so1271607b3.0
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2026 20:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939445; x=1794544245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2oZkhU1UtRePxLTEULMeXg0foD6KLwhdX3Efy2qXQM=;
        b=oCmX2GPp5ULaqx5XfDlLC7SFsIl1sn39jSRz8QV2T01FEG37gdh55H4Gchly375t9I
         cwVaT5D3PhIiOxAbpml6lFRsK+fEq815qC27fo+cUmDz1os5nlgGL5AYb2eylgZbnvD3
         r5iGoJ86WI4vbv2UxpUksYVdzi4XOWRdPlAbsNR73PjdO6QemkW7S6rB7uuwD1zG+D1R
         +RolXNV/PzNz67d0wzkY2hTcIIOKK78dtySw+fVGCLBmLswi1wX1hwrogZ2Qvp/sDyKY
         mdPvXr3s7qr0TTZMRGNRNXje67NqohhvLjEgoPJ16rZ1chaVfyaUtBGwev9lvKzNd1kh
         OD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939445; x=1794544245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2oZkhU1UtRePxLTEULMeXg0foD6KLwhdX3Efy2qXQM=;
        b=CdF6qCfh+grZI/waJg0Kq6nvxs+s1PJmFWAw3AD8qqEQAsriJGM9c5sE/kSU5RZiI6
         b4iznq79INB7GMCha6MHqAlbvtHpkzVnFIB1/j8p7FTAL/BULodUgrIIZaIgZkoqeOVK
         RFFxoIRdF33HaIGI7WrQMS+yeomd7LlWUvmxWiby+6W1UkwnNKhPRyFFykFYFrdl7fSM
         PeZ9464Uqm9CIXeJvrFtDWBrO9qM6uQ0cq+BaSxZTyckjs8wl+HUk/pATvNjRICWf+4A
         6IUY1EJ4tPU88BHTFm/Mes2Rb2kwwjkZMsTe0dcPhkjKhiuUTo1N72k1qY0iRMLicqyH
         CDZw==
X-Gm-Message-State: APuU4Z84uhC++p7RUkBpb0iiWnLqx3JCC6g6yzfS0mesdKjF8zId4d/M
	lgaMf/Lc9Xd2INLH01cLjOXmMdnvrOymXwQq5uPp+tKq9QqEoY2Q0KDj
X-Gm-Gg: AYBFou323+uvtVmZLJyYYvEA1Qb40uG89fQywBB8bXWhV2lX0Tm7gjvQ6mIgQwflX29
	lyDx1H7MLW+KC7bJUI/Z2EG0/nHhesVFACx59arqq9q5bwk9+qFwovLD8WuQQNfL/lGqHvpnlqM
	2ckE64OjJwOS19/Y6s9nSs6+SfUQrcmoJrVfRZIccLBeMP8r9EDIu8iZWS7vBBIg9htpb88DBXx
	W4Y6sXTxOhgEOkMzmt6FKSK9wuRXwfI7gS2lQCbn43IqpYtzzI/hPRZF4rCg8IqG/g2++vTklIB
	EKxcKQ+8qU0W8+G6dtfecmEuzPqiSZIcQ8qppNvYEdJbqIQZ8p8AFZ8YZ7Z9AgAgw8XwF7QpZqW
	AG/369OS53msdlmYTmyC39uosIBkL1VYVlAQLNv25jY81gPDOCVyxep7cz30AimdFAUes3+q6GE
	BnvqUyfgHozsI+PZL1FVDqqs3wxgN8NRoQs/HLSkBBOfhrcNo6xBTJCgaupsOrwH84RPjiqumnA
	PDdam2FGJF1Qa2OG+gtI6D2wDlPF5ICuGo42n6JkYv3WekH0ttSOGe72soRRAZW6FdST/nFa33N
	9N8Gl6QADThKqBXd3lYpEBj+/FaIUabwLGdaAOIxmWnddJ6CgcPz4b9xpCzznSNspjclmoYfpzo
	Mxv7q0qhoIg==
X-Received: by 2002:a05:690c:a045:b0:8b1:8594:c20f with SMTP id 00721157ae682-8b34192b3ddmr6885477b3.19.1793939445412;
        Thu, 05 Nov 2026 20:30:45 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f2d5dsm11450327b3.2.2026.11.05.20.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:30:43 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 05 Nov 2026 23:30:28 -0500
Subject: [PATCH v7 09/14] alpha/perf: optionally randomize the ProfileMe
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
Message-Id: <20261105-alpha-profileme-v7-9-c474e892abb0@gmail.com>
References: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
In-Reply-To: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Michael Cree <mcree@orcon.net.nz>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4763; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=gEY2zbxP47VNdVAqPBgHxG86mTKnmI99jCE+mWzHedA=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLeht+tLn7Ox9Lp1if/0Kh62zwXjoMb9+4taS6Pa9t4c
 JKZwMOijo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnm7hNGhrU7WC7vuf
 Zo11zmp/sv9fLc85IoZ2C4kbddYJ/Pg/RFlWcZ/tfuY2u/oHGy4v1+b8lqQ969afJnJBI1HW5rv
 lVyEZfz4wUA
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
already records the value written to the counter. The jitter is
computed with mul_u64_u32_shr() and the sum saturates, so that a period
beyond 32 bits cannot overflow.

The jitter comes from a per-CPU prandom state rather than
get_random_u32_below(), which takes the batched entropy local lock and
triggers an invalid wait context report from lockdep in the PMI.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 5f8f948a973f..b5f7112e822e 100644
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
@@ -37,10 +40,12 @@
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
@@ -64,6 +69,9 @@ struct cpu_hw_events {
 };
 DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events);
 
+/* For randomizing sample intervals from the PMI, where locks are not allowed. */
+static DEFINE_PER_CPU(struct rnd_state, alpha_perf_rnd);
+
 
 
 /*
@@ -251,10 +259,12 @@ static int ev67_raw_event_valid(u64 config)
 
 PMU_FORMAT_ATTR(event, "config:0-7");
 PMU_FORMAT_ATTR(profileme, "config:8");
+PMU_FORMAT_ATTR(randomize, "config:9");
 
 static struct attribute *ev67_format_attrs[] = {
 	&format_attr_event.attr,
 	&format_attr_profileme.attr,
+	&format_attr_randomize.attr,
 	NULL,
 };
 
@@ -392,6 +402,25 @@ static int alpha_perf_event_set_period(struct perf_event *event,
 		ret = 1;
 	}
 
+	/*
+	 * Vary each new interval by up to 1/16 of the period either way, so
+	 * the samples cannot phase-lock with a loop whose length divides the
+	 * period. The count stays exact because prev_count records the value
+	 * written. Keep the interval positive: a counter that overshot by
+	 * nearly a whole period may have less than the offset left, and a
+	 * reload would then skip a period without a sample.
+	 */
+	if (ret && (hwc->flags & ALPHA_PERF_FLAG_RANDOMIZE) && period >= 8) {
+		long jitter = period / 8;
+		u32 r = prandom_u32_state(this_cpu_ptr(&alpha_perf_rnd));
+		long offset = mul_u64_u32_shr(jitter, r, 32) - jitter / 2;
+
+		if (check_add_overflow(left, offset, &left))
+			left = LONG_MAX;
+		left = max(left, 1L);
+		local64_set(&hwc->period_left, left);
+	}
+
 	/*
 	 * Hardware restrictions require that the counters must not be
 	 * written with values that are too close to the maximum period.
@@ -772,7 +801,8 @@ static int __hw_perf_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 	} else if (attr->type == PERF_TYPE_RAW) {
 		if (attr->config & ~(ALPHA_PERF_CONFIG_EVENT |
-				     ALPHA_PERF_CONFIG_PROFILEME))
+				     ALPHA_PERF_CONFIG_PROFILEME |
+				     ALPHA_PERF_CONFIG_RANDOMIZE))
 			return -EINVAL;
 		ev = attr->config & ALPHA_PERF_CONFIG_EVENT;
 		if (!alpha_pmu->raw_event_valid(ev))
@@ -800,6 +830,14 @@ static int __hw_perf_event_init(struct perf_event *event)
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

