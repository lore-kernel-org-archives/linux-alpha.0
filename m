Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210981;
	b=voVb4U4JQ0JD2ODKzbHcrBe4WXL1bfyquJ/I54S0O5OeEPWxDf8vB2eBp+Sc/SvdZWka
	 qLRL4SIsABb/h75SxnJjSqPyrQ/tvVgAv9M5tiPQVC/v2CJCXlO9RnAm6EaFKyo7K21O5
	 fVeDbUdHDxVvvhatE0jhmVDWr0kvxhd71NadKCep9IatLnZsFHmL0fCto0uy5u0uUjwW2
	 VJZ0aW1UEagOwbl4DHPBGEPyEDKM/uWMMAns5kudtZmPJKw0ZUApevm/BK+O7nKhKsEFP
	 mTFdY8uls3BHSNxyz4zLw5V8xWvRmvhzylEEeUFEwi9kkVfU3MytHiQlHAVJbOpyTRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=eTiF3ZOoRMevJy8G0lJueb0eugxecJaxzWbg0xO9GVE=;
	b=OAVupCjEDDe3Q2z+wBiI1jfTkapDqdkm4G90rpNBlheT6gwzagNLnBBFeH7+jt4TBthA
	 IxUPxzhNy89jivT4R1UOJiHVs+fgDU7Db3GHgnVSShDvqkajC8mi8ISuRFMeY3AYhdMnF
	 T/C/OdxtTYdsziIcTrJY8tPiIpytq7Be8BrExPe9Y9tPpXDFR/4Y1PgapVGtaw09mQjkY
	 /1Go9XodZg8pS8G3POnSzMcUQptRgKzhtAzEZxrDtwfpO1OIhg4CiFkX80Up1TXymbT7r
	 vpVFa286pIRg1biUejPU1D6/7mwQnMe4cXCpYEfm5OwzVqsfred4A/2PjE3PYIOzESA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Orlf0dtM;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB4060A2617
	for <linux-alpha@vger.kernel.org>; Wed, 28 Oct 2026 18:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB4060A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Orlf0dtM
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ad98c3fb15so11936437b3.2
        for <linux-alpha@vger.kernel.org>; Wed, 28 Oct 2026 11:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793210980; x=1793815780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTiF3ZOoRMevJy8G0lJueb0eugxecJaxzWbg0xO9GVE=;
        b=Orlf0dtM4pljxRPetv8jQkRempsnLqe68HnzyZJezG0yP+8EUTyK7QFRV2WOCRzc6U
         0AEPYGYbGvqBPQVegNI7Cg2ciiLmH+06QuxFzHSsxv6ypNxk+TTpTWkAOglZnje5cpOl
         IiZc8yAnQk+cb61rweM5LkMz7MOyLkgRg/+iIzWUI4dy2+qqe3nT5rL6t4B821OfFL3T
         N3FZUHCFgsF02OVrBLWdfs+Uo7d7Nqn6QMMmsTcqMFbWbhiaop2oVd/RvxbliI5Esndw
         nA3yA0aSBpjxJhFv1DuoLUrW+8fX+X3cfmFOcl3hBagh7aHjcGaO+1udTQmqa9qLWVJO
         dw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793210980; x=1793815780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTiF3ZOoRMevJy8G0lJueb0eugxecJaxzWbg0xO9GVE=;
        b=AkTnwlZgyeeNylMUIVOkwiNYc7f/b5ugZsplw58xlYOOB9l8yA8duMUvOKVWD8J0DD
         9s6tuF1EGW4VaPTWdoKc1MvJr9rm5fSN56OKJQe9thkLlWuzF512k9UTGsnpPX0L1rHE
         7kBUUrnp5KYrX2tBH/FClnNlVEkqMDQqq7tJ/Q1k3uMiyTY1eWsB2SI52iBlxQI6vf6U
         gIUGjv0JTDJkIfV6CU3qcKojdGeQLJHHgaVvzbjmFsoPTuCRbS9HoCWN70OWz4Kpn+LG
         96JxMhMpeF3a8spj0QzI455+TAltwb+gx4O6FkXF1fDQ0Ngc1AyZIB+8kK5FRUU1S49v
         e/MA==
X-Gm-Message-State: AFq9FYKf9mAPw9sDw5jP+v4Y3+mmUHqcwwXZBFBoPPJtOPaDl8PwuN+6
	K63XkypeBSYWylJt44+T46faHNLl0Xca5mUmHiT2Ci3bdNW/CNJABBJP
X-Gm-Gg: AYBFou2jZraxEgYwvPzonnhh4KSoFIR4uogS7YVlKFpic8RqenHy//ie1eRxj4Mel4g
	0OO5b9ls651kz3v8X/NVEAwXe1vgvN4ItXX2Y78g5nbWVHa3EUJ/vRkkF5Hl5eO8Gt35JIvZxbr
	l4t9VUKgZ0r0UfgPvStIXYRDCEpCzERNbKkylVVEfHpUoWneqhySr7s9om93OCsQgRMDPwHJa6g
	XJjDuVnJ76kcyG+j/oYsUds5cc5UbFTqgGjAeT/nyFHzqKMFRCI3+WckjkeSAUj4fy6kPEo8BFl
	8I3CFB5JiEWwo50SZMuqS24ewRLtqvlA9H2fdtaStJeQaQtXE2728uWHWUwxkGOS8az16lWCM7u
	5GupB0u3QSHeHl5wUVyNZk812GvNZvGj+dZOTgP9jgp3v2HaYyhFYC6ILTHMaoR+xDrfnrjEsKN
	R4WisjbaB2zum7dVreO8xlgkorf0MHYbNHrkk8gv9e2/xnQaoJTs1yNmnD3TB0fRf/QwahmgArM
	TWnJKpuyM6n2BOulomiZ+ljUvOKK7FmFzPbNq+tqgLkhgriEUzWLORPKoSrfURNBC+9gLeaocsZ
	7QPC/brOnKrbxOYsQO7yQqnzu46cmdfh0KzWCmdEoeOPRGQ2WxqsGXVcT5OWWGI7+o52aX3cqNm
	yOkj45meRrA==
X-Received: by 2002:a05:690c:a:b0:8b0:702f:2a69 with SMTP id 00721157ae682-8b1b5cb6a1dmr28674397b3.39.1793210980244;
        Wed, 28 Oct 2026 11:09:40 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e597080sm32648127b3.21.2026.10.28.11.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:09:39 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 28 Oct 2026 14:09:33 -0400
Subject: [PATCH 4/5] alpha/perf: attach ProfileMe status as PERF_SAMPLE_RAW
 data
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
Message-Id: <20261028-alpha-profileme-v1-4-d44b52bf2500@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4143; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=7lfzYXP8HFajbcWjdtNJAnU6E+tudpSNerQEXfAgV4w=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIeWUXJls1vZWrqeD9f6zXnqkMb2t4s5HNIZUp6cuUgw
 1S1Rf6mHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHMNnwnD/2xnr7t+q0
 QmNa7T93GWWsD2oovfJdpiv3jcAe2Fa4+8W8Twv2bZzGl262YpXeUpyD757/fFc6dWioRNa9PU+
 7lbRPw3OycA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

A ProfileMe sample's PC alone does not say what happened to the profiled
instruction. I_STAT and PCTR_CTL do: whether it trapped and why, was
mispredicted, stalled, or was killed on a wrong path, and what PCTR1
counted during the window.

With PERF_SAMPLE_RAW, attach PMPC, I_STAT and PCTR_CTL to each ProfileMe
sample in a versioned struct alpha_profileme_sample. PMPC is included
because a PALmode PMPC is not the sample's IP. Killed instructions can be
told apart by PM_KILLED_BM and VAL.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/perf_event.h      |  2 ++
 arch/alpha/include/uapi/asm/perf_event.h | 27 +++++++++++++++++++++++++++
 arch/alpha/kernel/perf_event.c           | 21 +++++++++++++++++++--
 3 files changed, 48 insertions(+), 2 deletions(-)

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
index 000000000000..0cb7d6f3cb15
--- /dev/null
+++ b/arch/alpha/include/uapi/asm/perf_event.h
@@ -0,0 +1,27 @@
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
+ * Fields may be added to the end in later versions.
+ */
+#define ALPHA_PROFILEME_SAMPLE_VERSION	1
+
+struct alpha_profileme_sample {
+	__u32 version;
+	__u32 reserved;
+	__u64 pmpc;
+	__u64 i_stat;
+	__u64 pctr_ctl;
+};
+
+#endif /* _UAPI_ASM_ALPHA_PERF_EVENT_H */
diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 24c96feda942..06c9afeb7c05 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -915,10 +915,13 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 				       struct hw_perf_event *hwc,
 				       struct pt_regs *regs)
 {
+	struct alpha_profileme_sample pm;
+	struct perf_raw_record raw;
 	struct perf_sample_data data;
 	struct pt_regs pm_regs;
-	unsigned long i_stat, pmpc, ovr;
+	unsigned long pctr_ctl, i_stat, pmpc, ovr;
 
+	pctr_ctl = wrperfmon(PERFMON_CMD_READ, 0);
 	i_stat = wrperfmon(PERFMON_CMD_I_STAT, 0);
 	pmpc = wrperfmon(PERFMON_CMD_PMPC, 0);
 
@@ -941,7 +944,7 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 	 * perf cannot resolve. That happens for ITB miss, Istream access
 	 * violation and interrupt redirects, and for instructions inside
 	 * PALcode. Keep the interrupted PC, which for redirects is the
-	 * instruction that trapped.
+	 * instruction that trapped, and report the real PMPC in the raw data.
 	 */
 	pm_regs = *regs;
 	if (!(pmpc & EV67_PMPC_PAL)) {
@@ -955,6 +958,20 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 
 	perf_sample_data_init(&data, 0, hwc->last_period);
 
+	pm.version = ALPHA_PROFILEME_SAMPLE_VERSION;
+	pm.reserved = 0;
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
 	if (alpha_perf_event_set_period(event, hwc, 0))
 		perf_event_overflow(event, &data, &pm_regs);
 }

-- 
2.55.0

