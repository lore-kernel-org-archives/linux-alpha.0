Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818165;
	b=T7MlCFsQ0VnN484Laf/EnOsl0v1uX1FoyQkQGaLPN+NpzphB8rxjg1IlNQoehiQcv1XZ
	 tkJsc50/+Vdw+yvzXGi7BS2a2GhUT3ItEd6CkwOG3C12ki780JOdAni4cauT64X6DqHJo
	 rmxyMxLZaTNtPi0CZ1S6l/jSnR8hv+6Rk4HPilRS2uVPlgDK9yQd+1sHz60ss1eQPyILq
	 +77wdCSVr6pPHQzOdz+16KW29iHHhsYFabhuoJL4CI2Gw0tRPXmWqXMJF8DifWB+SwmWf
	 ruPGzUBf0CcOxjOGSU/QTHSLcAmTPMs0lFDK3XOEyT4WwV+0xpfe/SQpVL7dvphiB7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+Ya59UqLW1N2XBocnpzwyAhuaNt0oLlGvrT35OgJt5Y=;
	b=Z8bzaLQIgdJnCRkEhODADup+exeo2lcCc098t6V8cRkHKd5OZlnXKvS4AJfHQkS/ZRuB
	 C+CmQqFHW6PXPBOvLiZzqmY+H/ikqPOFgrZWWSShTIdiAT7LM1psp6jLZeWr1ozm3L8El
	 kCZ1M0G780sWYnyfntMgSx6jZVlg3cnFNPx5EmrE5vI8dJnsK9kJrnZcsMOQmoKXDwYaF
	 SO2Isq/oYgZoFqMAdlauQxXUqyIu5tnqfr18FJLWGSZD2LDDmDnmEF/Vhugxn68Err3h1
	 0TA364cdQFYVDEwS70jythaZcy2J5kL/Shc8gtpced3t/Vl9w7n5qD3CojJ3K4FGpcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oNCKeMIU;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553B4606EEB0
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 18:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 553B4606EEB0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oNCKeMIU
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b3299aed39so592947b3.1
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 10:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818163; x=1794422963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Ya59UqLW1N2XBocnpzwyAhuaNt0oLlGvrT35OgJt5Y=;
        b=oNCKeMIUtoxjxZ9vhnh1yvnrYvdqvtn/OtPAmHUEiduT5cRH0MD1W016cgbOOPOncm
         gzEioZb4YmSdI1jiTdkTueM7r9+/jch7RiPjkAsCD8EqUmxeRKp+QhO1THiMxjoxA98P
         6detylq2S1f+xATedqvEovF5pnb3za59Q4VQAAPNWbA1Rj8dm1B+tLrx3QHNFy7Kcvaq
         9mA3j4iE21ttaXx52m8RjAfpTsf+GGTW3H2RaSILsTAjZIHkHoiNqm8jfqx4B49K64bw
         /Vzb9aWqfQhRKq4pAoWO5gldGCIUCWiUv26cXz7GitRNBcB8rMX7u1uKV6VEybdd9AVT
         TEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818163; x=1794422963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Ya59UqLW1N2XBocnpzwyAhuaNt0oLlGvrT35OgJt5Y=;
        b=wU+ti2rsDH8Hya/Rpjw9G2mOmTA3IvCYRJ3JK+ZzIvZ1ZOJnS73Pdb15R1cyZkmnfd
         DW4QRMM/gy8ayo2BXzJy0s49M8qicFKazfQLCm6B4WauWINKJnUg69b0+CHjw9t1yAYn
         8j9yGxkDm3Khp6DhRlMiqE6RDzV0DscMsCi9yhDGgunbwwjpnQa+JeZqzZgWRv0VjB3h
         BkZoa+SfiWBl2FiIwUvS6Z7ZY5uBMt32w7encdHrg3UQo00ndxV96UB4e66UgNai6s7T
         0M5FmeUcTIxu35apmxqLtiEq5LxT5Fdp7eNmvrzbB/VQHn16vG9gPpV05cFtkfHj9qTP
         EcbA==
X-Gm-Message-State: APuU4Z9KeErtTmnw0pxjtGDfZoOePDZCk9mscW/j6Zbde1sLmw+gwOwM
	vZXxcrZLYQWpmvX+zhhYxsrCbQy+EXu+02l1Pp5kj/Z11GHG6rEik7ff
X-Gm-Gg: AYBFou28FMkFYTLoNvnsKZygvEYRy6UdSTP9o5h2bGShtzPv5wT/SU+5mFhqsK5RXGx
	zChTLpm1XU9U8xK0TTtsaCj/jvUbET2BiVHEaRXcB+MRoY16IRk+VZm1wNkbdMHHWxdNJHOinoD
	ii2tPqG9JvUrIxY5o/5qA26y7F4BAiXIb8nl1GXCZoR1pIlLzzsgWkUnbnvh1yU/cT6eRrXuiNF
	ZRCOkvswLK+twDyNWTJ2XbL3D4KxZ4EmZs5G6/ItmOwBc4ymBOVMeLFBgMlhZXB04HaIPkuBuA+
	JEVHr8JdLwGAx/wLvVx5m34K2ZX+zBqsYbEsl8ZI75dBqGJmo1K/rrKi5iUTUuyEU4t+nEqBH/F
	yP/dLdrnOluBJngI34HpdrELha1KDjOXpHzPS3zoKzDFUvwBuNMsHtd0F455g6dGvEpaNrq0PX8
	regNLYsL14LYkuT3NKYMqgOP+wsLLqPZdK2rZK5UNoO5SmgclgDcoCf+fAO8YM7SbN/DPQlm1ND
	qEKIGffeZdxqRDIriHbT3EVrhMnp1bRoMQ4/DVojQQKa8HO32Vd2Ek+VRx05gi4If8P8nSbF2Ha
	0hgSdb95HxsEyV78sb2vNCYgu5nMEepRgwftbItOnUHlQNp2m/S3R6tmUcI7s1rjeaZJ9P1ffcR
	rNQmdH2yxjA==
X-Received: by 2002:a05:690c:e208:10b0:8ab:41a5:63c with SMTP id 00721157ae682-8b2b67d34ddmr65674667b3.108.1793818163145;
        Wed, 04 Nov 2026 10:49:23 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3098d3ceasm24583747b3.13.2026.11.04.10.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:21 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 04 Nov 2026 13:49:14 -0500
Subject: [PATCH v6 07/13] alpha/perf: attach ProfileMe status as
 PERF_SAMPLE_RAW data
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
Message-Id: <20261104-alpha-profileme-v6-7-63362e9290a3@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4974; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=qmbzn99f7hvBec8oHqSTvUdApChcA3f3gX2hU3l4K04=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe16l+f5bBb8PN4GGseM/uksOp+Q9mzPB+EyJ/6v763
 8cm6P7R7fjIwiDGxTBTTJElbr0iy6y2HUt9Tkv/gpnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DIEMHaN4iJweg0ZmcXFpapFuWkGRQ15+SWJJZn5esV5+QWpeQXqBXlpmWklGRn5RcSrQCL281BJ
 TV0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0tzBi5OAZhroucy/M9meXCf97
 vSQcZfJipMz8tyHC63TWGQYPjY5ZMieItfSYbhf6B6Rcu2bOWPa1Ue1jw+cPZNWE+kzroO/rUrH
 90MYHQU5AAA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

A ProfileMe sample's PC alone does not say what happened to the profiled
instruction. I_STAT and PCTR_CTL do: whether it trapped and why, was
mispredicted, stalled, or was killed on a wrong path, and what PCTR1
counted during the window.

With PERF_SAMPLE_RAW, attach PMPC, I_STAT and PCTR_CTL to each ProfileMe
sample in a versioned struct alpha_profileme_sample. PMPC is included
because a PALmode PMPC is not the sample's IP. Killed instructions can be
told apart by PM_KILLED_BM and VAL. The 64-bit fields are packed after
the 32-bit version, since the payload follows the 32-bit raw size in the
sample record: they are then 8-byte aligned in the record, which needs
no padding.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/perf_event.h      |  2 ++
 arch/alpha/include/uapi/asm/perf_event.h | 31 +++++++++++++++++++++++++++++++
 arch/alpha/kernel/perf_event.c           | 22 +++++++++++++++++++---
 3 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/perf_event.h b/arch/alpha/include/asm/perf_event.h
index 72536566014a..f498c1d47c07 100644
--- a/arch/alpha/include/asm/perf_event.h
+++ b/arch/alpha/include/asm/perf_event.h
@@ -1,6 +1,8 @@
 #ifndef __ASM_ALPHA_PERF_EVENT_H
 #define __ASM_ALPHA_PERF_EVENT_H
 
+#include <uapi/asm/perf_event.h>
+
 /*
  * Software events have no trap frame, so perf_fetch_caller_regs() fills
  * in a zeroed pt_regs. A zero ps already means kernel mode; only pc is
diff --git a/arch/alpha/include/uapi/asm/perf_event.h b/arch/alpha/include/uapi/asm/perf_event.h
new file mode 100644
index 000000000000..aa0eff5a917c
--- /dev/null
+++ b/arch/alpha/include/uapi/asm/perf_event.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_ASM_ALPHA_PERF_EVENT_H
+#define _UAPI_ASM_ALPHA_PERF_EVENT_H
+
+#include <linux/types.h>
+
+/*
+ * PERF_SAMPLE_RAW payload of a ProfileMe sample from the cpu PMU.
+ *
+ * pmpc, i_stat and pctr_ctl are the values of the PMPC, I_STAT and
+ * PCTR_CTL registers when the ProfileMe window closed. i_stat holds only
+ * bits 40:30 and pctr_ctl only bits 47:0. See the EV67/EV68 Hardware
+ * Reference Manuals for the field layout.
+ *
+ * In the sample record the payload follows the 32-bit PERF_SAMPLE_RAW
+ * size, so it starts 4 bytes past an 8-byte boundary. The 64-bit fields
+ * are packed after the 32-bit version so that they are 8-byte aligned in
+ * the record and no padding follows the payload.
+ *
+ * Fields may be added to the end in later versions.
+ */
+#define ALPHA_PROFILEME_SAMPLE_VERSION	1
+
+struct alpha_profileme_sample {
+	__u32 version;
+	__u64 pmpc __attribute__((packed));
+	__u64 i_stat __attribute__((packed));
+	__u64 pctr_ctl __attribute__((packed));
+};
+
+#endif /* _UAPI_ASM_ALPHA_PERF_EVENT_H */
diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 7208d09a32d1..f6546d648133 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -1029,11 +1029,14 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 				       struct hw_perf_event *hwc,
 				       struct pt_regs *regs, long ovf)
 {
+	struct alpha_profileme_sample pm;
+	struct perf_raw_record raw;
 	struct perf_sample_data data;
 	struct pt_regs *pm_regs;
 	bool pc_only = false;
-	unsigned long i_stat, pmpc, ovr, pc, saved_pc, saved_ps;
+	unsigned long pctr_ctl, i_stat, pmpc, ovr, pc, saved_pc, saved_ps;
 
+	pctr_ctl = wrperfmon(PERFMON_CMD_READ, 0);
 	i_stat = wrperfmon(PERFMON_CMD_I_STAT, 0);
 	pmpc = wrperfmon(PERFMON_CMD_PMPC, 0);
 
@@ -1070,8 +1073,8 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 	 * happens for ITB miss, Istream access violation and interrupt
 	 * redirects, and for instructions inside PALcode. Keep the
 	 * interrupted PC, which for redirects is the instruction that
-	 * trapped. Do the same for a user PMPC in a kernel thread, which has
-	 * no user frame.
+	 * trapped, and report the real PMPC in the raw data. Do the same
+	 * for a user PMPC in a kernel thread, which has no user frame.
 	 */
 	pm_regs = regs;
 	pc = pmpc & EV67_PMPC_PC_MASK;
@@ -1106,6 +1109,19 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 	else if (in_entry_save_code(pc) && is_user_task(current))
 		alpha_profileme_set_regs_user(event, &data);
 
+	pm.version = ALPHA_PROFILEME_SAMPLE_VERSION;
+	pm.pmpc = pmpc;
+	pm.i_stat = i_stat;
+	/* PALcode sign-extends bit 47 of PCTR_CTL. */
+	pm.pctr_ctl = pctr_ctl & GENMASK(47, 0);
+	raw = (struct perf_raw_record) {
+		.frag = {
+			.size = sizeof(pm),
+			.data = &pm,
+		},
+	};
+	perf_sample_save_raw_data(&data, event, &raw);
+
 	if (!alpha_perf_event_set_period(event, hwc, 0))
 		return;
 

-- 
2.55.0

