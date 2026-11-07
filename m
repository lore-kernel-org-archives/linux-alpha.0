Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794043200;
	b=EgUOHRW+xKYEJsM7CRymsytxAzYhFAVFt2OA6T1GUHrZ8gK8JGSj9h+T18naBabs8AZ6
	 poODV2ydYDG13lZR69Lgb8UIFi2ebE8rSAMqWZCzn9caKiqUVdBJL2HhxYKXiTuD+0D2V
	 QEfeTbbltD5rpBzjP569UTeD6c5EY222RNnDw5CZGo3/iWF6hqq9lxGXOKCfCCl3rq2zu
	 PonOxtsDuh7xBDWoFpd3jYVWaDBSnVstSxC+i4CD7ujyAJTwPl7ghdAbFnohaKYsBt9TO
	 9AMlKYHGYikGIpKqXpprHOiuv3gZe3FmuOCknWKv2aYbilxBGBs/khMkyKMtOTdJ5Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794043200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qNorqVzMtOJQNgkxj+V5JXWSTJIpc86ccOUkJXX2g3M=;
	b=mPOlnC8SH3p1wdwGN4EkZPcTVA41Ki3T1aCARnhtCk/OemVqCOAYsOFxb6e4d9JgXTqH
	 D5a+GUikh8lyrzOmPBLR6vDfvl1rCaYjK3bzGMhqGgy6RWSxULso97+JCHShahW0kCoo0
	 1wbGLMbrdqh1MBYv94l81JEz2zMDz/QdRqApwNnUNxCdXiHR9wbc/thJwdkkxaEhtkL0b
	 MXkI78pqJ3Zdu4ZN+K4IW45TlLEJnd4OEy7VlTqjbVlE4+GZRxTAmpu/yoYldGyQAr25G
	 AbQgQd9GnoNJRQUFsmOmTuFNucViHGw9Sk3x6qvuBssuIaoHssfs8+/OXeAKYkT7ZCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOttPRcq;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C3E606A32F
	for <linux-alpha@vger.kernel.org>; Sat,  7 Nov 2026 09:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39C3E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOttPRcq
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso215367866b.1
        for <linux-alpha@vger.kernel.org>; Sat, 07 Nov 2026 01:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794043199; x=1794647999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNorqVzMtOJQNgkxj+V5JXWSTJIpc86ccOUkJXX2g3M=;
        b=BOttPRcqgG+uZ0c1NZVMcEkJcW1JBATm1iUsZXY1cNHKw4awRWDBfFfwiWoaQEjWSp
         UwRL3Ci0zb4a/nyLBsQnHMHkdJQPqyMg6rYE/GraEnvlkmyU+KvGMaMAdhBdflZ7JDi6
         Xnl+Dy2hD7bOw0D4DOdEh7zb7dcgXgbEVN5WpJM1KtBXvGKJ4il9XbmOR4eb6zHqbima
         7Frh6KmDI2DT/AeMhD7Pd6lc5twnabWf3Qxouxey718ovDVBfcaAFUOr8LDrDDFu8SG4
         g7fob+Y1QR+lTTmG4nD2Kgg0HhL0buO1J0Cw0QTfGyEjk1YWonsivVkTKfAdVgS0t/eV
         XyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794043199; x=1794647999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNorqVzMtOJQNgkxj+V5JXWSTJIpc86ccOUkJXX2g3M=;
        b=cU0IIpUF3yFaRUELDzL0S2MH+OV/0S32ncnFxU8MkUnzAn6LYSmAa3CQY15UQ3rm55
         AnyS/ovus4hU8M4dDKiCJwKRwi59IE8rhrvnimnkIm8BLTVH1mAeC+2Lqy2qsNKsgHoB
         OiGhTlCnUzS1jQET4X59KgVfSzEmveB3M+1IQXyfkN3o4SqtsqSph06E8hOzad2iexEi
         3FV+1ddeOdYwMbLpK+j+Bw739153gHjj26aU7P+BzRl+x0StfU4/yeQwVt/j2n8P6GNA
         +UYOnE3MuAZSEV2cFrKKuw9baM4WOpHKz2n/BuPcMKGfgln7iea8/5DN7IUrsyAHT03B
         LXQQ==
X-Forwarded-Encrypted: i=1; AKwUvByBWS1cW70w63b7IMbatoiwODJ/jEir1tdN/jKoOmeOHySlmB9ChC4UnRj9N9XkJSZK+0OG4im4kxrJFQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z89IBo/dnJvt7FfrP5cCYVVhO3QrlbzWWHfh1cSkwi12Do6QnJ0
	tkx+5ueJPtQCpCEBi+RhGgAGW2Wui3EMNrzrcwIhDrGVHsNvNxjg8Kgk
X-Gm-Gg: AYBFou0g59VY/NcxjCqwszgAmGpxQnZ77mvIXRkqTLYzRzRIAg5RPmOQ/DRUd2MjJt1
	wmk2cSaClGwYiYDZvW5s6TjBbpWDMx/A/LTyVoQtX2zCZyvOVcHW7nUoQi5Rxi12j/j+CBEuJ9b
	cd5RLiv1yNNpIXRESE440Sbp5lCdG6UUTzZ5iC33lq8/OU5XqqurSaW1JBdbBQBsYRzLdMZk7ws
	QcTuzthgaKs9Bvocl+BJdf+EQurIz9AvzBYtc3I6Y+S3m3fI98ai1s5mN086zB1rCFIxfwYHocD
	sxX0yMu6J4JSkUxc7vLYsHzZepsoKo+22pM1m0Ww2BYAHtFjlH3Dq6xICvGKYnTzulqeonviLQb
	O+BjPlhkn5HclnmKzL5EFxmCxlF8rGbpUs8mQE7V1G78XW9PJCJoJ+Yj1hrRsEAkRE95EyDQQcw
	bBIu/Rp404B57B3D5IPm5y+edCD320KiTpf2jaARacf09I/YYlYxRTortV5lx9deG/NDuXFDdze
	CWtbtexHPdOBGcDnyOc9zGv4AQXXwavK6LK30bVPQoYj0cWYQKT98gBgGnMECv7HM9PdQ3vFkBe
	BNhavtgLjMe/JxYfDYE9i6nm4EWnLdi1rn3YtyAExRqFhnamPUszEtHePjWaFkWvCjdDYSjS7xD
	p+OAEDQoYLPqvgoNr
X-Received: by 2002:a17:907:3d94:b0:c2a:b1cc:158d with SMTP id a640c23a62f3a-c4d35554748mr386898566b.32.1794043198450;
        Sat, 07 Nov 2026 01:19:58 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356c776csm138824766b.70.2026.11.07.01.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:19:57 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 1/1] alpha/perf: Account for time spent handling PMU interrupts
Date: Sat,  7 Nov 2026 10:18:35 +0100
Message-ID: <547ee20a68b3f2d848d451c69ad023c0361f41ee.1794040317.git.linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794040317.git.linmag7@gmail.com>
References: <cover.1794040317.git.linmag7@gmail.com>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alpha does not report PMU interrupt duration to perf, preventing its
adaptive throttling from reducing an excessively costly sampling rate.

Measure handler time with RPCC and report it to perf_sample_event_took().
Convert cycles using the calibrated frequency selected by time_init();
Alpha's tick-based sched_clock() is too coarse for this measurement.
Wrap the existing handler so all return paths are accounted for, without
changing counter programming or event handling.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index a3eaab094ece..dd3bc70b71d7 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -16,8 +16,10 @@
 #include <linux/kdebug.h>
 #include <linux/mutex.h>
 #include <linux/init.h>
+#include <linux/math64.h>
 
 #include <asm/hwrpb.h>
+#include <asm/timex.h>
 #include <linux/atomic.h>
 #include <asm/irq.h>
 #include <asm/irq_regs.h>
@@ -26,6 +28,9 @@
 #include <asm/hw_irq.h>
 
 
+extern unsigned long est_cycle_freq;
+static unsigned long pmu_cycle_freq __read_mostly;
+
 /* The maximum number of PMCs on any Alpha CPU whatsoever. */
 #define MAX_HWEVENTS 3
 #define PMC_NO_INDEX -1
@@ -797,8 +802,8 @@ void perf_event_print_debug(void)
  * Performance Monitoring Interrupt Service Routine called when a PMC
  * overflows.  The PMC that overflowed is passed in la_ptr.
  */
-static void alpha_perf_event_irq_handler(unsigned long la_ptr,
-					struct pt_regs *regs)
+static void alpha_perf_event_irq_inner(unsigned long la_ptr,
+				       struct pt_regs *regs)
 {
 	struct cpu_hw_events *cpuc;
 	struct perf_sample_data data;
@@ -862,6 +867,21 @@ static void alpha_perf_event_irq_handler(unsigned long la_ptr,
 
 
 
+/* sched_clock() is tick-based on Alpha; measure a short same-CPU interval. */
+static void alpha_perf_event_irq_handler(unsigned long la_ptr,
+					 struct pt_regs *regs)
+{
+	u32 start = get_cycles();
+	u32 cycles;
+
+	alpha_perf_event_irq_inner(la_ptr, regs);
+	/* Unsigned subtraction handles a wrap of the low 32-bit counter. */
+	cycles = (u32)get_cycles() - start;
+	if (likely(pmu_cycle_freq))
+		perf_sample_event_took(div64_u64((u64)cycles * NSEC_PER_SEC,
+						 pmu_cycle_freq));
+}
+
 /*
  * Init call to initialise performance events at kernel startup.
  */
@@ -878,6 +898,8 @@ static int __init init_hw_perf_events(void)
 
 	/* Override performance counter IRQ vector */
 
+	/* Match the calibrated frequency selected by time_init(). */
+	pmu_cycle_freq = est_cycle_freq ? est_cycle_freq : hwrpb->cycle_freq;
 	perf_irq = alpha_perf_event_irq_handler;
 
 	/* And set up PMU specification */
