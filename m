Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561304;
	b=kd2C77cJSseBQoVU9TJ6b76yoEBD1LaQYEmWPfXlFvul+oKp4XnKgwopAaaMPn8w/oFv
	 +8QxpjCrWOuX9DR4i19x4d2Rpo7r5nT5nR7CBAba2MJKG7DEQ6AkOwBV7Rxy8Gj5FA7rM
	 tCa+bN6P5uaMtAn3w8op3J6RSwrC3XvGgVltxgBS88e1e3bnFUExmm7RlTsjLxqBKphr8
	 XJLSHlRHEf6BX8raqZ5+ck/E5AIjqDoIcTWY6iq1Zu3Gvo94PUHhNvCZOyhjSj4e3lAG9
	 E2e1dFfio6NoHdH2d3WDqprwDD7BYoZu5MWZOLu2oFyrAt0xk+BzJXHbOPBDWkjO7lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=4VWlDyarhGLs59ZmxOAL3pCox4wN1k2aQWsJ1VbQoyY=;
	b=p2rMMFfbjoqttwnlMLpodths2xl9t6FcJne7fzhCmQ21pwmMBdbV+PWLNQDry6Y3jd+b
	 0lWxZllSsnunrBop8GBAJFFQbGUBY/HnZEEHvShzOoW4zdyOAcekb6Xc6xFjRgRov8Oel
	 3vC9KgyLDs/YrZRNQg1jFXUaOgIsoQ/DRf97KIwEP0gFQbyk87WTpQujEuhtl1w10QVIl
	 GAgR1Emmc0pYqjboUXK2TuLFW9Pdm7m6OfsfkhvEK6WuwTJZHVu6xwLYo5omKTbo8G6IU
	 +wtmPVZIu6HtVBcX6NJJrIhV6RxyF/wEkeip4s9lvrK3INGtOiW0H4M0MsnF++asTAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2kisjCd;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AE960A2625
	for <linux-alpha@vger.kernel.org>; Sun,  1 Nov 2026 19:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5AE960A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2kisjCd
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ab38a051aaso21907207b3.3
        for <linux-alpha@vger.kernel.org>; Sun, 01 Nov 2026 11:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561303; x=1794166103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4VWlDyarhGLs59ZmxOAL3pCox4wN1k2aQWsJ1VbQoyY=;
        b=S2kisjCdmPZ5bwqVbfQcLsUDTCaG3of2QvgAz2fQy00csrpt96ES9g8VW1DI/+P/XD
         1VxsxqI2E/no3LfUiMzQa9ol5B45jD3xv6yhW3o3dIqPmqEQS6wDcBCa2rpKwvegQDNv
         kB9b6UKhAdnZuuHRX46fHTpInntvYuJAykStCZWn+y/WP2ngtfSPPf2EMN/UfcJUKqFR
         eenkhEH/H1ohvyUbNh+6sDN3jbJdZxS8CNGUyRmKhZS24OEQ6MtzwZ7qMpkra01WMNsW
         muhvSyJFvX2Vn2yroRhn2AZIcGi3HFHDFZrXwB4T3foL/7Vv4Njx+7kCTbc3SfVdmVpZ
         CL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561303; x=1794166103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VWlDyarhGLs59ZmxOAL3pCox4wN1k2aQWsJ1VbQoyY=;
        b=gMecEoACWQsHs81x83xZoRjDOray7+VYFZOaxK/L5qtI28j7rslXcFZy9/5EBxuEv3
         8DD6PrflzsAunrtMCHSMmos42CVAI5OfcEMQLsI6dBrwk7SRuErh/HKEbj8Ppd8Y/jBq
         H2fwIhLBocjWEVGvu4EtMNnkyIOx9jPjmgzr8alu08RbwNurvI6Ukrw2DTe+xNUSL+nL
         DgBGztVUTcF75c9ARG3wq7KIOTjOZ08MS6HJPw6xd3t0dAX1Z+GPclejlKOXkyzHWGlU
         Orv+9AfV0GVVFcjB1AzSWT3Tl5qiSNCfBLlsZuR3QXYepp8lPhsXQuoxRBfbvGscvtyi
         oFSw==
X-Gm-Message-State: APuU4Z80EPXY+pMejYNufk3NddA5yUn+pPG5HUuYsx9Xrjj/+hHSMrOo
	OppHPwOx4BKLPw/VrX3y/EWYsPJZYIj2QLjlJzr/UArSlen0x3NRQnU2
X-Gm-Gg: AYBFou3BHo7ib14pnfHl+ji2ADt08a45gJsnCLLANAmcG9Epiqpnbg6ni/3QTxzNssO
	n7dxQPyFuQqpXXIHaMPVYpcHX1sVTevz6+6A36L5DaH9IFbi0h/3u+n8hlBYvgdhXH5YBcTFlve
	t19V88HTgSF5FcAB6orkZNnEAMGc/o/lVlrhW5wmV0+GZRbjMMLi5ciPxc5MX/u+6R9wAPEy4Q4
	+fT6iHbDlZK9a8i5Cl85xYMK0/JrbcLxUnxQk/157QBfWYlgC1UP+g0CKmMm2Sc+l1j5bDJJsvH
	ZLJc/G6qgL/c3K8OJW+3dR43h4KuZd0p9qdHwv0bpMYcZV9HQtrzHiNvJKLttEqO3VHgFJeQoD+
	GZS7C4pNhvO5ewc2+x807Nss5QeERPUI3m4jMla2Eh6ljwRdyGIk/7+p+8fGH3CtizD7dBeQV7Y
	4D+unzR23C2HtJcFMsOxPBO6qiVwo06yx8VB/ZTtol6+Q3S73AnTMv9eBPXFuaHAES13bD8JuLF
	MFIJtyUFS9KL/MLViaq0VJWS6nG7rxiX/kaG5CGF9yfZnTt0Ec/B4eHXd0bnLPyamqsCL/8l1Xl
	AOjTBVex9cmLv/aiguAYlQ0edhj9zA86I+kuzR0P61eyddMIwcNDQbfPWL/nsHdM7pcx2TVZpbj
	2SmRVjuOkfw==
X-Received: by 2002:a05:690c:c513:b0:8b0:a857:654f with SMTP id 00721157ae682-8b2b67b73cemr51969817b3.63.1793561302558;
        Sun, 01 Nov 2026 11:28:22 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7125371sm39969497b3.11.2026.11.01.11.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:28:21 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 01 Nov 2026 14:28:10 -0500
Subject: [PATCH v3 7/7] alpha/perf: optionally randomize the ProfileMe
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
Message-Id: <20261101-alpha-profileme-v3-7-92d511b5a044@gmail.com>
References: <20261101-alpha-profileme-v3-0-92d511b5a044@gmail.com>
In-Reply-To: <20261101-alpha-profileme-v3-0-92d511b5a044@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Oleg Nesterov <oleg@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>, 
 Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@elte.hu>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4503; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=L90ZL0BUtYXerAHuGfkXQ/FfilBgYa9DEbvkOqQGpVc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKeTzp6Nsr/TVdmxomMa/Zhbo8CJsioC+99MetI3pnAH
 zm2pkZtHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHPNbWeG/76q1WU/Ih
 JfM/zbmmPJ5Cb8KXSDcqG2147DN559P+FT/4Xhf9T/DXr2ur6nEtU4eEO1DS4X6TQtUZF4z5P66
 quYVIY/MwA=
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
index a816a18036b7..037182b4f8c4 100644
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
 
@@ -384,6 +394,22 @@ static int alpha_perf_event_set_period(struct perf_event *event,
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
@@ -750,7 +776,8 @@ static int __hw_perf_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 	} else if (attr->type == PERF_TYPE_RAW) {
 		if (attr->config & ~(ALPHA_PERF_CONFIG_EVENT |
-				     ALPHA_PERF_CONFIG_PROFILEME))
+				     ALPHA_PERF_CONFIG_PROFILEME |
+				     ALPHA_PERF_CONFIG_RANDOMIZE))
 			return -EINVAL;
 		ev = attr->config & ALPHA_PERF_CONFIG_EVENT;
 		if (!alpha_pmu->raw_event_valid(ev))
@@ -775,6 +802,14 @@ static int __hw_perf_event_init(struct perf_event *event)
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

