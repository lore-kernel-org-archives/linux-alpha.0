Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339105;
	b=hQy5DvXmfICx7PyMeNxHgytiloinoTpB2Y2PDSNvpvrdsoXG1+dsfutNafSTkvz1kImF
	 5I8a0xMsD2qwK6YcoYCtslRzYaV8kygWR8n/CPZ871MCcs20L/0MygWPruTza+eD1hiPp
	 59rzPUY55qm1g5bB0XwOylvKLmLaDGUu6ObYr7c/yomK82md+ZgtS4iKAWCe/78LbwL1A
	 r5eGQB03QQJd1WZzfhCGG4gTPZ1/2ElKUW0Q1w36t9vmqrWFUSTnAocWmPjULBseCOybo
	 VP2cM9mZoJFZB1V5WJTZwvMA+eYVSd7T+SBkh9xzz+U097ricQzenyOSti34+W3NakQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=39IsulrmdJQpmcMRRFD042SD33tJZE10yGbFFT1TgRg=;
	b=Mp2hc4Fgg0gFv7AmhgPJ2iRDl9uuNGSWHO3vx3aaZcYpp1d1i0F+GRpkP3OfFmxhe0mC
	 cAoyOJv5ghhY8z4PnIsSIhw+e30FDaSxXxiSdFSaLBs+q37ewDBhuLnEy76gA8gOUnJnH
	 KPRsezp8NwUBNg2vXtPK9kD9OrcLwWlg1B7U44fi+jEn4KkjValSvX5HITOBrekdeFmej
	 GGHG/IV5vaNXdZ4HsolODDSxLLoJiGO+V4whC1dk1N1AYX/qJPUbOQlMm+q/vgUpRSgbA
	 gMz8t5JumCrCQ7ltojh+dwN9r+KrRYyyq76VG9U7zLuXcrv8qMy8EwRT2wCkgWbkWag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mq7ZoJ/T";
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A7C606A331
	for <linux-alpha@vger.kernel.org>; Tue, 10 Nov 2026 19:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2A7C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mq7ZoJ/T
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso375955666b.2
        for <linux-alpha@vger.kernel.org>; Tue, 10 Nov 2026 11:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339103; x=1794943903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=39IsulrmdJQpmcMRRFD042SD33tJZE10yGbFFT1TgRg=;
        b=mq7ZoJ/TFrgTWoYAZajjjeJqSKYHCq1KAIde8jRGDyR6sW2imzRntMmoh7A0osyaXa
         bizwxHT6utUg05sprCpgXuK2OBGy4svUiZ7hjdNvm+lixXrKmRwQlDdk7rNRWfHCmhAX
         Bx3wLtaWgUIysbcrLKgZ8XbKic8e2YhN11mZMScvSWjvOVoBjCf3+QL7yIw0EtiRQeE3
         t4UPIdMtd7fA7jMtsHC33b08NQL2VuEJTFm7wshFS/1MBMddA6VL0I1ukF2+kRbu2Mwc
         SvKHjn/l2U3BgmVQGkooZQOuaPkOQTemcD+pZGMxyrjbJ6TZIQcTtAHzjN/fU28wmGom
         GlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339103; x=1794943903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=39IsulrmdJQpmcMRRFD042SD33tJZE10yGbFFT1TgRg=;
        b=iUBZm1mag6RRvAINi7ZKvSMPxrWY6jNiUzRur+jha+iDAADT4OCKIRSGs6B6bmZZrR
         bRoDVKv08xlsjLkrtaFBzwhjwzCkxQqKthKQAeybB0l5HXObWIlzyydVznBVNOhmV6Gl
         L30dKo61MTTVqWdu5ok8LcwzGZdKS0POCF8QVmYElu7Kgu74O9RY6F0eEs/jhxiHzmpg
         fhBJO8rwHhBmrUvJD3c0/ZMMea7Dkx68GpqtcsI7+0JsG9OIYNbxIkI5fiSy8A15cW6C
         7EPwEJy5D0PO1ujKamTG1lEHxia+ZrPJ6XK0cl6ZA78oFeDCtWD+mnG3qBGv4ss2xTkC
         pNFA==
X-Forwarded-Encrypted: i=1; AL+hErF9/Rtk5i+8NUz+9vT4LjE7A6Mo2V4oi41wywuqXGqkQpwQxnPc4lMUFbkJ1ODw2Q3zLrzVNn+u4xF0WQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kE2fH2K105yg/QdnDMwpO2BZd/N8Usi/Tr7o/8X5blv9Rr4eS
	Z4R7kcqJXux77qqOKDlMJ2uc7q1FjHx7SXlqKIZfmyLR6jwG5YEyMzFt
X-Gm-Gg: AYBFou3t/rAn0j+jIT2Fm+xZYoFbstqgvGTPORWtzxkm1+zAa2+Dodpr6tE1DjIurGI
	YjH0v1tBY1LCMyWF8pzTOjNF/tGnA0c8QT61NcAW7qC7qdws8BlIj4rSiNUnb7WX3C+MZ7VgxYW
	Bl/oLkM+v+jpac887SLbYVrT/azlCMmZO9FBNmWFpFofYWxIqUx2j1bmXNFu3OjjDym5D2Uz9uc
	3XHo1EsIQADFEiDQeAJGCtJBhl2VRycR4WouQcVG7bT4d0U/FkQ1aqEj5LeIQ3f/RLRdHcqlyhb
	n35vKlRy+zzPARKM1HI4VlVm+T+K/a2Gp1O69qwXjMPQvIzxCqdWC+OZlNLcv3ljMmE+lZ0UxVd
	xOmK4re7urgBrIHBT1/7ZsB5AP7rpwKfJAhSeWywgSeuzH5Xovr2iG6+kYD4BYmDo+cAN/3rjyv
	JgR6ILHuA5F0vazrByXrOLa6wH6gs9gNp5tragLJydG+Xm2uzk1I6NRiV/SrlvxScSOrj6QebvY
	O2iZVceSqkFs+xd2EUpLFIVsPvhMRWlXYl6gKevNS8cKE+9LiELHbcgf3ZCj577bNiRWbOyN+Lc
	6Q2rnfEhhZT3kn1+aAUZAwuOd+gnrdTZeAT1Vc0fHNG0T++KMfPNO+L68YlD1ZkY6jP2fGA=
X-Received: by 2002:a17:907:9446:b0:c3f:d912:ff8e with SMTP id a640c23a62f3a-c5066ae9baamr8161466b.16.1794339103208;
        Tue, 10 Nov 2026 11:31:43 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a66b9sm147465866b.9.2026.11.10.11.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:31:42 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v2 1/1] alpha/perf: Account for time spent handling PMU interrupts
Date: Tue, 10 Nov 2026 20:31:32 +0100
Message-ID: <20261110193134.1151112-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110193134.1151112-1-linmag7@gmail.com>
References: <20261110193134.1151112-1-linmag7@gmail.com>
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
Short sampling periods can leave the machine unresponsive with RCU
grace-period kthread starvation reports.

Measure handler time with RPCC and report it to perf_sample_event_took().
Precompute a multiplier and shift using the frequency selected by
time_init(), avoiding division in the interrupt handler. Alpha's
tick-based sched_clock() is too coarse for this measurement.
Wrap the existing handler so all return paths are accounted for, without
changing counter programming or event handling.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 35 ++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index a3eaab094ece..09033c2d1f66 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -16,8 +16,11 @@
 #include <linux/kdebug.h>
 #include <linux/mutex.h>
 #include <linux/init.h>
+#include <linux/math64.h>
+#include <linux/clocksource.h>
 
 #include <asm/hwrpb.h>
+#include <asm/timex.h>
 #include <linux/atomic.h>
 #include <asm/irq.h>
 #include <asm/irq_regs.h>
@@ -25,6 +28,10 @@
 #include <asm/wrperfmon.h>
 #include <asm/hw_irq.h>
 
+#include "proto.h"
+
+static u32 pmu_cycle_mult __ro_after_init;
+static u32 pmu_cycle_shift __ro_after_init;
 
 /* The maximum number of PMCs on any Alpha CPU whatsoever. */
 #define MAX_HWEVENTS 3
@@ -797,8 +804,8 @@ void perf_event_print_debug(void)
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
@@ -862,11 +869,28 @@ static void alpha_perf_event_irq_handler(unsigned long la_ptr,
 
 
 
+/* sched_clock() is tick-based on Alpha; measure a short same-CPU interval. */
+static void alpha_perf_event_irq_handler(unsigned long la_ptr,
+					 struct pt_regs *regs)
+{
+	cycles_t start = get_cycles();
+	cycles_t cycles;
+
+	alpha_perf_event_irq_inner(la_ptr, regs);
+	/* Unsigned subtraction handles a wrap of the low 32-bit counter. */
+	cycles = get_cycles() - start;
+	if (likely(pmu_cycle_mult))
+		perf_sample_event_took(mul_u64_u32_shr(cycles, pmu_cycle_mult,
+						       pmu_cycle_shift));
+}
+
 /*
  * Init call to initialise performance events at kernel startup.
  */
 static int __init init_hw_perf_events(void)
 {
+	unsigned long cycle_freq;
+
 	pr_info("Performance events: ");
 
 	if (!supported_cpu()) {
@@ -878,6 +902,13 @@ static int __init init_hw_perf_events(void)
 
 	/* Override performance counter IRQ vector */
 
+	/* Match the calibrated frequency selected by time_init(). */
+	cycle_freq = est_cycle_freq ? est_cycle_freq : hwrpb->cycle_freq;
+	if (cycle_freq && cycle_freq <= U32_MAX)
+		clocks_calc_mult_shift(&pmu_cycle_mult, &pmu_cycle_shift,
+				       cycle_freq, NSEC_PER_SEC, 1);
+	else
+		pr_warn("PMU interrupt duration accounting disabled: invalid cycle frequency\n");
 	perf_irq = alpha_perf_event_irq_handler;
 
 	/* And set up PMU specification */
-- 
2.43.0

