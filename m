Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333050;
	b=Z5JeSGP2JShCVkfeiMJEnvPak/LQCtoOTgPTZcpY1yjwcQZYiZZCWVHnwBQRnns9MQbw
	 sQDDgR6muJRFXzGuev8mpUFck2hmoM3EnILKv95Fn6R9r4dehZ76RLz9jlvbhVjDiHSa1
	 7MFRVaz9Z4iaZtLVm5hPxEPMRI7QJfhwr1Da7x1x2dtk2KXMXbivnzN2WHY6P0s/YYttF
	 E40kV5bsWpOi0wnkhQyUrjt/TPuAbObW3vfLG7OskgXiNnLaYiPODJhxg1VYGLUlWDWtp
	 0CHp6rJYE02OWP+BoFiIvaHAvDAWIZuipKVOjwEkOQy6yL6FPyMFwYfxrYKYeTwA3Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=k8YQrYmaFnJ/bzLv9j3s7TLlYstk/zuxpU418CkuffM=;
	b=TQ6imBPCR7loDSCtMGxzxVymxF/sP8+Y3ynju3W3WF0uuDZ51IPsVhidAFmSVgmg1L6X
	 u6tdmnt0oENOWnNVkFovXFViFsWyZGdhEZxjPLSF7dtbpyR4FeCYvVEBjXT+uVGcyhjnH
	 jM4iOuG23LSiHdcq58DTCebsXA0RmWRUpGSctETx5AOlj5oHJ7VwLYya6c/zafraE3jMA
	 RkSio3kkLkYEEkl2EbWLaEdyR8RStSIJdOjvJDK48ij1lGX63ZDCFNzzW30G0yrhZVxG9
	 XVMJ2y18bqz1TZwEqplK0VdyIhEt5yN4zggiztyOLHOBXWmfH8k0y04B8pt4O4272Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IEjorO+3;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAEE606A33D
	for <linux-alpha@vger.kernel.org>; Fri, 30 Oct 2026 04:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FAEE606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IEjorO+3
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b09e07e149so2293607b3.1
        for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2026 21:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333049; x=1793937849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8YQrYmaFnJ/bzLv9j3s7TLlYstk/zuxpU418CkuffM=;
        b=IEjorO+3I04jCRUyvIACSf5cC1/XMmFdxw/lxIVFoZ5BwEYbvdoGAy7k8B/ZqTVMsK
         rxAYYXa8Jd5S1EXEBZUGymFXifFCpKePF/5j3GEGS3fSajemW7hrnzj2J6LPysGicZs1
         lywdjepBM1MikivSSy/nEAyI6NNla/d14FKGQjIEYGvt74p3Q6pjnm+wnokZlpsIjmDj
         NdMca9uf/A4CgEpFpg2XQZeDxK6wzytFt4ru4aGCuWqyRdvfzmsRXKGTjCYJZ7AwRuC8
         vqg9rBkGc6KzUPM8Pz6LzzUlo+RufI4tuuT100rCu0ighjkerKX59ZY1bXFAeV+bgijz
         pI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333049; x=1793937849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8YQrYmaFnJ/bzLv9j3s7TLlYstk/zuxpU418CkuffM=;
        b=flyC7E31R+7ynbAu8j73UMOEwr4R/YLZpZItRgWFxBPIUsKzs2u1DiFuV4j+iumnF4
         tyZuaa2VdI4XieTYQhyOOoLCn3SHQkpoJPwlvTy4igDeasbZPSG7XD2flXI7U+/JiW5/
         d5w2fWWGIBcc7KA33AKEb22VNCVYiICnoT2OtmMa3ztIRreEfGEsd5vYKnSfAarS8PYy
         hUIe5qeAtwI8osHNz+Ucn7EZ04ZpT5vUBYKyfOAH3wmd0+5tJqxc4LWRxwt/6lLQdS1y
         hIjYcfupzuGPa7/JL07o/venfsBBKRcxuS1gramTW2tKDcNeOx3A7dwJa/AmSkjR2T3W
         QkSQ==
X-Gm-Message-State: AFq9FYKIl5/VbGUHbKln8+8eVDXes/N3K8+aIz2LzlqQYC5gz2fD1yrK
	XiqPYQZLVQ+YDXhAiBpFKA1q/ExaNWGGUl8gOCVkMUoLJwZ81E3jDmwvfTJZrXrOYR0=
X-Gm-Gg: AYBFou0oGWQUG+h29za3fvn6IPZNPRPjddSEM9aWNkXjEy/IaM1sqN66CzVucpOs3Ip
	AO+U5r1pftbOWY+PunaV2WSpWbkLcfeaatJzCNFxZt2gaiyUmbsyGxNXlO24JJgrVYjJjWsMhHH
	jHL6MwNWNPCIRl1AqP7vHVQRO+3xXkO+EEsc12JvxK83hYbcrtHhsosXy6ihIcb9/Qw29xYdZ3V
	JldOVX3WqZdyTL2u5WgB2nNJknhdQIonuyjM0ggTxjdhuQwrrfjibAdshtBK0gdvS7j9aWLybx3
	tgZfZwc/BfVlzOTl7q4r5RBYvABQWFWeyNiNXvPf5zj652UsAn+lmuGB3idStM2F0zleVXbi6CN
	FXEhlAJq2HGeCBSAFAIdZct7OqExb+rrK6ioOlPAisDlKZYZNQo+JkKPW0yEOr4aMwx+LBbVZcb
	zPAVWnIJZJyktrQKHzVbYwOAu6ercL4lfSxw5rhAPq5GKwvUfCocamR5U3VhOT2CrLRiQtawLff
	LOaiM2CD/eCBmzKdN12CAepbmHN9OJyO8IDyCNQJ9mTxeH7POspxkRjmZaCy8csO0i4cwrGlNeO
	4gYdvmez6FJeoinahoniS/WmpBGamAjbotWBPsRAXPXIZvBWBpOKBHG+BwvAHs/yNiuFADjG6cM
	g16TVcCXk7w==
X-Received: by 2002:a05:690c:d94:b0:8b0:e619:7047 with SMTP id 00721157ae682-8b2b671ed55mr5656637b3.50.1793333049437;
        Thu, 29 Oct 2026 21:04:09 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7165ae6sm3471687b3.29.2026.10.29.21.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:04:08 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 30 Oct 2026 00:04:02 -0400
Subject: [PATCH v2 4/5] alpha/perf: attach ProfileMe status as
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
Message-Id: <20261030-alpha-profileme-v2-4-c702f1c65272@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4784; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=lF+dz+Xc1sLLtZ2TrZNGFNa69QyOYvxydhn2/MxKdd8=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKeiOvzchjcXXP52/5ZvnqGQmbXJW/Yxt6ws3yhe+2Qa
 TH/tE+LOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYamxaGPzzWD9XYd+
 /cKeH4fINg/Ip3Lv1MDs94Xu5g+nXu5vI707gZ/mncPy6oqqJlfqKkl/nn/4hLU5kzTJjlN71u8
 X2yQIq1gxMA
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
index c7f0ccf8ec80..c9d4b13817bc 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -944,10 +944,13 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 				       struct hw_perf_event *hwc,
 				       struct pt_regs *regs)
 {
+	struct alpha_profileme_sample pm;
+	struct perf_raw_record raw;
 	struct perf_sample_data data;
 	struct pt_regs *pm_regs;
-	unsigned long i_stat, pmpc, ovr, pc, saved_pc, saved_ps;
+	unsigned long pctr_ctl, i_stat, pmpc, ovr, pc, saved_pc, saved_ps;
 
+	pctr_ctl = wrperfmon(PERFMON_CMD_READ, 0);
 	i_stat = wrperfmon(PERFMON_CMD_I_STAT, 0);
 	pmpc = wrperfmon(PERFMON_CMD_PMPC, 0);
 
@@ -982,8 +985,8 @@ static void alpha_perf_event_profileme(struct perf_event *event,
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
@@ -1001,6 +1004,19 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 
 	perf_sample_data_init(&data, 0, hwc->last_period);
 
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

