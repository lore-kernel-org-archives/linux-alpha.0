Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793674932;
	b=Ayi/R1XiFuah/TwViunH6CUvijnkreOCw3PaoRgxSvnWK8RaFKCtu1kGzBFWxgLN+fXT
	 54idlf1VA0Gekpcpt9kLLXMMXLc6RgBfGomPbXfVl/Ta1VSM2awvsDC4vqsA0JQ6iD5np
	 /3kFC9BiquvbTRDJD6O1ULNcGYC4ahU+bqkR7S/B8UF3XX8vBfemZqmaLyLNllQmet7V9
	 bwyVq3dFAcgLAV947rFjZWAsZkrlov7hgZjSfCZQWf2IvQfFeQ5HZrsAO0NMP1h9+NiWe
	 38SYhbUrFKF44oOB29CflatWJZTG9x2vf1gCFhxGopdrOEYJMvhDFsH3bHpqRoPBDJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=myKgjFBDD2DKirV0mWrF+HqpWC1AEvk77vZyHSXbo9c=;
	b=m3WeisHqM9K7DHyIULTW6p7okv1t7rxmWsS5OmURpCR/vpgQ1fgNm5GMS9loel82rq8q
	 uJ/ygBNJgqATJ+zjjpTWb+xoFfINxaF0DgLwUtYPaontdUb+79yih/5GNfKJts99oem3U
	 B4c/YQeNKZtgb1WqSBW3B9JYYK7hk/kR+QC/8/B2skv0ucu8Wajh+tKDLGl3+rxXRiJUV
	 RmdvPuKx/Qo0mSuToia9O9gNbO7rW1Ys9gIe0i4B5dLANdZ8Kc1zQirh1i1hZpYBZW9zX
	 PCqC/T+hGgQSNexv5hdXjhUd+jdeIGV83p0/k7HQ49yOPjFMRaHoy6xc2FU7R/q3tDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YXtnP/d8";
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C25606D813
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 03:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C25606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXtnP/d8
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b09e07e149so30076647b3.1
        for <linux-alpha@vger.kernel.org>; Mon, 02 Nov 2026 19:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674931; x=1794279731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=myKgjFBDD2DKirV0mWrF+HqpWC1AEvk77vZyHSXbo9c=;
        b=YXtnP/d86q14d/iPJri+IhNx2P1L96OUY2/I/JOL5UlDSEKDFg6Yj4ssmQ0UgHq0kn
         dD7SSNp12EtqhF0niBj7H5Ai3QdFCmzrLawlRp5MOvytorknaya4IebCGYdq/lUN4uUo
         tj45GGSu2Z08DcONEAXhkwTjxrlWkl6x9vBRTfbH9Lu/3kMQ7rHaUOpTL3xtjq5ypqKD
         LYc58j1jStIfllDy7JIxaFntolFATb2G+5ikTdw5S/K1o7DM3A/PNVAJw2O99jC2Iaa6
         IEqWSiP3/Vt9Xp15CqnPEcb2djU4NJAPT+fVmC/gcs1XKduDYsARWx8mJzPB3TJHLVF4
         Aytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674931; x=1794279731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myKgjFBDD2DKirV0mWrF+HqpWC1AEvk77vZyHSXbo9c=;
        b=TzO+ubKHOexYMi9a7BikKgNAAlwuLIMsyRZdacVtYc+62LGshlY/wA5fetOyHQD0IH
         RrXoH2Tc06I65QPrU+7gHz+yAaIruX+6o/mAIfX+xzyvEM0TuqikXIMkDtsEU+qq7WHK
         l28lidFpIZUiWE5V3LqLCpXxtlAbCZGWZBD4ro9QaZ0mgOGW1qtaJgVThjCELpy35Yvz
         SdGgMKKzK9BEgIYU6JgvR0myDsM/iKZ6TBz/CNLwQERTQm4URwbpL8WAtl/gkqoBxktA
         YiiptwpDkfbumbiBTkwafkbu4J5gDbtAGRCib/6h/IrvY2hgPrYvr3mcNnfLR+QYruTr
         QHxA==
X-Gm-Message-State: APuU4Z8cDY/HIvd3kXSaGebXF/oj5J30YUoVyXAwd7RuhlS/+Sf4dL43
	JwVqi7X4gOOolNFvDGo/N5g9UDf3UxBpscJ1NB7KZrgGnFYu/WSRrLNl
X-Gm-Gg: AYBFou0MCfhiTh+rEb3Z30kCC0pdA7RoR3irXP1CMSKWBXX47q1GHyQ9PHdDmFO/QS8
	tXIx6axwlG7u7WuxVpqH1+GIggBjo/451iqAUpXoaULqE5OywFHo1zAfz58/qwvOtLd6IdsT6zW
	bE9hGSmuD/A3jF3v4V3Lo8/PVV7fuS/ejsU/C0KM9ap9Lh8rhICmNvqhetQqp+xMiZBEwp4jU8m
	Sg/zGO50HcxfRLgWY3OUR/4Dtxv/ulrbGDI874SieOPW//b14JjJ8LAz1S6wspecOgtJESt6pMT
	BYAnL0JH6rA0sRVadzhPRxtx59+WR96TSxgk1qZBbxpKdFpIwDS1j1rjXIE5mRYwnY5LisYy/Bc
	rilhkowSK9kyrQehvyHGOMSiSOxlN6Pyvxar8SktWqEfIpMpxszD61xDkFjKclgRSqPEbKZABsx
	F8s5LYIB53HAbxY7haxmVGimzyifu0P8U/qzfKo6rXEOWjkz/d0o1KQERWgBONV8eajM22lj+XF
	eOtH9mpz8aTpun1G8nU7FnPerJHmDPEnATbuj9eeOOJAc/2e7nlyfBBLpd6pFRSNaUcASvmiVjz
	szMe25VEB/iFjEopjJuT2yh3eWtc5hh9bR+7tIhG5n6SCK+MrbxxwOh8yI4LmLTTkaf5RbxA/YA
	Rr+KeSFd921DCRTnKAPDYkJ+6gg6o5HE=
X-Received: by 2002:a05:690c:f15:b0:8b0:ea4e:ecb1 with SMTP id 00721157ae682-8b2b678e5ccmr68847087b3.86.1793674930716;
        Mon, 02 Nov 2026 19:02:10 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf2b96a6sm6475377d50.12.2026.11.02.19.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:02:09 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 02 Nov 2026 22:02:01 -0500
Subject: [PATCH v4 6/7] alpha/perf: attach ProfileMe status as
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
Message-Id: <20261102-alpha-profileme-v4-6-61e00f5e1da8@gmail.com>
References: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com>
In-Reply-To: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4962; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=5NFJ1lFerIJO/yu7TqCglFw+N0D49Hyz85jS7IyduTU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe+i1513BT6sHlNV6a4isuVnFfSXu3doKZlVVpi4tc6
 zVnW9WLHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHPN+XyG/04eVWd/rv
 dliHvttvlLpnD+cZvg/OXzWFbOtz9W5CIv957hn53S+qnTy1+sq3iu69SmWhRYtdsl87Pwu44/M
 s0zPeUU2AE=
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
index 29577a493e55..862824ed6a68 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -988,11 +988,14 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 				       struct hw_perf_event *hwc,
 				       struct pt_regs *regs)
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
 
@@ -1029,8 +1032,8 @@ static void alpha_perf_event_profileme(struct perf_event *event,
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
@@ -1065,6 +1068,19 @@ static void alpha_perf_event_profileme(struct perf_event *event,
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

