Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333348;
	b=GK9CzdKFq8ZUeuqpNp4wobFcl9hFWZzvABnxAx5pE8U6GS5F2ik/pcLgx2JTXXc6NIWT
	 Y7UjWDX9DfMX6ZxZMFN1AP7LUubsRoeTpY+Bq1tn9KSrvuXLgIbVnMrEqXaU91q9l4lyP
	 9d/rU7i86JeFlblnYCF6kPTomoo4D/uMIeMpO0kf0kHMqj/xH0wxpTddVtZfrzB36uWaX
	 k8xa0f0DMlRQklAl2ChL4twgdACPTuqa5D5VnjvJ5ylQSsbBR6ZtqI5P2oby8SeENv8HT
	 kX1p11ObUvy8k8jCh6q3DftiPaoLF95GomlHdw2KvWCluHyKU2dbWUAT1365/5mk8hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=yobxBA4ll0HEhS/5inEgsz9+PSriHvXzK8XBT5D2J/E=;
	b=ErWT8Jexas+BjNjKEV1xk74fd1pVv9Jt0v15pfLIywrZQ6BTZTNMAG1EeP8CoHHZHpbH
	 pcHU3Jyy2APV6HtLkwhhvRjoV6tFqTYEVvZ33mbj3x6vlTwXvwbD/tMqP6D6VX/Zk8fiv
	 b40hZAbGajdHdKubiqgC1QtDA7em9N5ArE+Gsh0d51dfp3JoLCnuku1mpBTVrLI53EaOh
	 MAdaMNcKA7OucnZc0akc6cA42ieX8m9pj1i13POr7OaNokMB0LYXeFIpLNBfzS681BZIy
	 Tdq+EVKcTLFz+IhwzhbYWwuU4rE0S6gu7um7XqLDhWTKvA91Wuds/DsJjgAnHTVsujw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LhO5h1+T;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBFC606A32A
	for <linux-alpha@vger.kernel.org>; Fri, 30 Oct 2026 04:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BBFC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LhO5h1+T
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6798eb0d13fso223665d50.0
        for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2026 21:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333347; x=1793938147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yobxBA4ll0HEhS/5inEgsz9+PSriHvXzK8XBT5D2J/E=;
        b=LhO5h1+Tar8LhjLYCaIn/gnz/8VkONGWDm2Sh2nfhcSSwFGmXpxf8ny2dawhsA/MRT
         APqR2qgfscHoXayCAH8sDe+7PlCpUyWAjY0+EEJN0WUw1TEy4csiVkk7pmXMK7FsqmuO
         ROCgdImtdsZhYirn6X8KGbGGao8OmxBLx/vfC6joLOu2wltmjslhv5kt62P+eonvkzkN
         +nBRparC862JJVvQ9t0oC26/1U8PVeYWj7k0KDwcDnLH+wFBW79WcyQ98CxRk47S3lro
         Sz3gZ3INPiFDvkDcd1jgR6nvCeHTyX1Vg5pcEhC1yDLoK3nwduCUcCwEm/BY5UrTtWHc
         eErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333347; x=1793938147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yobxBA4ll0HEhS/5inEgsz9+PSriHvXzK8XBT5D2J/E=;
        b=xTekYy2CA6+KBJMQoSc9ju0Iq/Wj2X4/3CUkA/f93svw6Ddvs5qVjCtJ8+y3kW8UVM
         x/mfkfJeeCm1eWK37LwX8ySClsnfQ/5CbSVyP3StRGhLeeBPfBnYQy6IC5eb3pjM+UyJ
         tgLfs5lQFXwEmCnR7CKrfgySHGUR0wl5BjMTo0XFG6Zno9NJhRRjd+JU9mFOQ6Lp4c22
         XP8aego78lHmqH8hvLcP5vCpbOkMpixq99uq0unL4uc7C15khFcCJw+IEOIu2drvvX14
         /7OWcL8d8uNX0o+fq8ydAfhCV4EhNt9B8fZu6RIUxj2iQfvCTEBCIRfDq4HU4rnaqnNZ
         oFPw==
X-Gm-Message-State: AFq9FYJu6tiuT8K+VZGHPLqc0c2Aj+zCEd2bdCu4PpTfVnuJ3faLq/Am
	w8s09NsODXUyZtQ6ZONmpuNuzhUhgVrAbLl2ysev0U5jkmeNCK48RFGj
X-Gm-Gg: AYBFou1rTJsEoiiPwP3yYrHUzHFBu5xvggDnACRpT3nCi1+oRANRuU50816Fo4akD22
	N8nJ0OzRqqAX712dacHTdhow8tLdpJxTr/Cla43kYpj4oUMlZQrlok/5io+WEUv1cy/pTOvlueD
	MG1243QFzBiZuiqcGp6couQVUbRU78MjB5RQNxPtAEJKj2mt5zTQAtDyQn4WINy8dKk59BW99KL
	QAV+hGMenbVAP/469DSq/dfNc0xEBxK3BueaXlcJw/YziQ3RBOQtGeIg7IUYAbbFAn+Ww80yTaA
	n/dxLlBUL50DzklQpJAsLEIfyvbdErpTm8p1OTU1bcKtc2PehNXk4ig7xLRW5vQfpPkxKwHlGGI
	kVDZGF2lCnapSaG4kinvTxDq0fqd0PWucbwdip30KwpLfv8rw3cVY8zpFnwUpzlsV28I1APFb8r
	f9ngO/+viO2SOSrNPNNqPoZ/H+Vua1PZVTLBtkCVnv9LUMUz3vMaVZb83bsg+l8YWyOJdnJy6fc
	AEKJsHmnj0kPBRFimvrn+m9CT6RhKaz60B+LEE6rGQON/jCw8wEogJSm3pXz5x9WCwixU1C63lk
	0H8V8nH+kng+2/4blMYaQUfNnf93GtkB490Y3DTiS/+OlRD9xvoo0f/2UeAbsM1ZegmX1152WNp
	zTBWre+2nWAQ=
X-Received: by 2002:a05:690e:1c08:b0:679:3765:f036 with SMTP id 956f58d0204a3-67ba4f618camr725876d50.78.1793333346797;
        Thu, 29 Oct 2026 21:09:06 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b71a1c70sm3546547b3.42.2026.10.29.21.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:09:06 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 30 Oct 2026 00:09:03 -0400
Subject: [PATCH v2 1/2] perf alpha: Decode ProfileMe raw samples
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
Message-Id: <20261030-perf-alpha-profileme-v2-1-9ce2f0b0e622@gmail.com>
References: <20261030-perf-alpha-profileme-v2-0-9ce2f0b0e622@gmail.com>
In-Reply-To: <20261030-perf-alpha-profileme-v2-0-9ce2f0b0e622@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9596; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=hCXsYJCXpDtKSRCerp2gaiw96exrVu0ZrjuB+o/ZNdA=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKeSMRVqfoYL+B+sGl1+cXZyl5Ozc0OAn6uW0WsCxP0P
 Oe8UvnY8ZGFQYyLYaaYIkvcekWWWW07lvqclv4FM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 Ahk6RvEQOT0Gjczi4tLUIt20giKHvPySxJLM/LxivfyC1LyC9AK9tMy0koyM/KLiVKARenmpJaa
 ujm5GhgYmlo4WZk4WjqYmzs5Ohk5ujo7Ork5GluYmBs6WjiauluYMXJwCMNdUPmD4p5dcUpk46f
 G+gCaGuBm7zuz5H3O3b/8Tbi7LMzXrpooWCTMyLFkS9PaDZL+YwFTB+PUnpIKdfOauXbsset3r8
 zd1vLtbuAE=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha cpu PMU attaches struct alpha_profileme_sample to each
ProfileMe sample as PERF_SAMPLE_RAW data: the profiled instruction's
PMPC along with the I_STAT and PCTR_CTL status that says what happened
to it.

Decode it in perf report -D and perf script -D the way AMD IBS raw data
is decoded, naming the trap from TRAP_TYPE when TRP is set and from the
PALcode entry offset in PMPC for redirect traps, which TRAP_TYPE does
not report. The payload is copied out of the sample and converted from
little endian, so that it decodes on strict-alignment and big-endian
hosts too.

Copy the uapi header that defines the struct into tools/arch and add it
to check-headers.sh.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 tools/arch/alpha/include/uapi/asm/perf_event.h |  31 ++++++
 tools/perf/check-headers.sh                    |   1 +
 tools/perf/util/Build                          |   1 +
 tools/perf/util/alpha-sample-raw.c             | 145 +++++++++++++++++++++++++
 tools/perf/util/sample-raw.c                   |   2 +
 tools/perf/util/sample-raw.h                   |   2 +
 6 files changed, 182 insertions(+)

diff --git a/tools/arch/alpha/include/uapi/asm/perf_event.h b/tools/arch/alpha/include/uapi/asm/perf_event.h
new file mode 100644
index 000000000000..aa0eff5a917c
--- /dev/null
+++ b/tools/arch/alpha/include/uapi/asm/perf_event.h
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
diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
index 531c0e0e84df..de66bb148754 100755
--- a/tools/perf/check-headers.sh
+++ b/tools/perf/check-headers.sh
@@ -36,6 +36,7 @@ declare -a FILES=(
   "arch/x86/include/asm/msr-index.h"
   "arch/x86/lib/x86-opcode-map.txt"
   "arch/x86/tools/gen-insn-attr-x86.awk"
+  "arch/alpha/include/uapi/asm/perf_event.h"
   "arch/arm/include/uapi/asm/perf_regs.h"
   "arch/arm64/include/uapi/asm/perf_regs.h"
   "arch/loongarch/include/uapi/asm/perf_regs.h"
diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 2c1f880c4c47..2ab63bbe4a05 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -77,6 +77,7 @@ perf-util-y += sample.o
 perf-util-y += sample-raw.o
 perf-util-y += s390-sample-raw.o
 perf-util-y += amd-sample-raw.o
+perf-util-y += alpha-sample-raw.o
 perf-util-y += ordered-events.o
 perf-util-y += namespaces.o
 perf-util-y += comm.o
diff --git a/tools/perf/util/alpha-sample-raw.c b/tools/perf/util/alpha-sample-raw.c
new file mode 100644
index 000000000000..b4e336d8fc8f
--- /dev/null
+++ b/tools/perf/util/alpha-sample-raw.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Alpha specific. Provide textual annotation for ProfileMe raw sample data.
+ */
+
+#include <stdio.h>
+#include <string.h>
+#include <linux/kernel.h>
+#include <linux/perf_event.h>
+
+#include "../../arch/alpha/include/uapi/asm/perf_event.h"
+
+#include "evlist.h"
+#include "evsel.h"
+#include "sample-raw.h"
+#include "util/sample.h"
+
+/* I_STAT */
+#define I_STAT_OVR(x)		(((x) >> 30) & 0x7)
+#define I_STAT_ICM(x)		(((x) >> 33) & 0x1)
+#define I_STAT_TRAP_TYPE(x)	(((x) >> 34) & 0xf)
+#define I_STAT_LSO(x)		(((x) >> 38) & 0x1)
+#define I_STAT_TRP(x)		(((x) >> 39) & 0x1)
+#define I_STAT_MIS(x)		(((x) >> 40) & 0x1)
+
+/* PCTR_CTL */
+#define PCTR_CTL_TAK(x)		((x) & 0x1)
+#define PCTR_CTL_VAL(x)		(((x) >> 1) & 0x1)
+#define PCTR_CTL_SL1(x)		(((x) >> 2) & 0x3)
+#define PCTR_CTL_SL0(x)		(((x) >> 4) & 0x1)
+#define PCTR_CTL_PCTR1(x)	(((x) >> 6) & 0xfffff)
+#define PCTR_CTL_KILLED(x)	(((x) >> 26) & 0x1)
+#define PCTR_CTL_STALLED(x)	(((x) >> 27) & 0x1)
+#define PCTR_CTL_PCTR0(x)	(((x) >> 28) & 0xfffff)
+
+/* PMPC */
+#define PMPC_PAL(x)		((x) & 0x1)
+#define PMPC_PAL_OFFSET(x)	((x) & 0x7fff)
+
+static const char * const trap_type_names[16] = {
+	[0]  = "replay",
+	[2]  = "DTB double miss (3 level)",
+	[3]  = "DTB double miss (4 level)",
+	[4]  = "FP disabled",
+	[5]  = "unaligned",
+	[6]  = "DTB single miss",
+	[7]  = "Dstream fault",
+	[8]  = "OPCDEC",
+	[10] = "machine check",
+	[12] = "arithmetic",
+	[14] = "MT_FPCR",
+	[15] = "reset",
+};
+
+/* What PCTR1 counts during the window, by SL1. */
+static const char * const pctr1_names[4] = {
+	"cycles",
+	"retire delay",
+	"bcache misses",
+	"mbox replays",
+};
+
+static const char *trap_name(__u64 i_stat, __u64 pmpc)
+{
+	const char *name;
+
+	/* Redirect traps leave TRAP_TYPE alone and are named by PMPC. */
+	if (PMPC_PAL(pmpc)) {
+		switch (PMPC_PAL_OFFSET(pmpc)) {
+		case 0x481:
+			return "Istream access violation";
+		case 0x581:
+			return "ITB miss";
+		case 0x681:
+			return "interrupt";
+		default:
+			break;
+		}
+	}
+	if (!I_STAT_TRP(i_stat) || I_STAT_MIS(i_stat))
+		return "none";
+	name = trap_type_names[I_STAT_TRAP_TYPE(i_stat)];
+	return name ? name : "other (see PMPC)";
+}
+
+/*
+ * Copy the payload out of the sample, since nothing guarantees its
+ * alignment in the buffer, and convert it from the little-endian byte
+ * order it was recorded in.
+ */
+static bool is_profileme_sample(struct evlist *evlist, union perf_event *event,
+				struct perf_sample *sample,
+				struct alpha_profileme_sample *pm)
+{
+	struct evsel *evsel;
+
+	if (sample->raw_size < sizeof(*pm))
+		return false;
+
+	evsel = evlist__event2evsel(evlist, event);
+	if (!evsel)
+		return false;
+	if (evsel->core.attr.type != PERF_TYPE_HARDWARE &&
+	    evsel->core.attr.type != PERF_TYPE_RAW)
+		return false;
+
+	memcpy(pm, sample->raw_data, sizeof(*pm));
+	pm->version = le32_to_cpu(pm->version);
+	pm->pmpc = le64_to_cpu(pm->pmpc);
+	pm->i_stat = le64_to_cpu(pm->i_stat);
+	pm->pctr_ctl = le64_to_cpu(pm->pctr_ctl);
+
+	return pm->version >= ALPHA_PROFILEME_SAMPLE_VERSION;
+}
+
+void evlist__alpha_sample_raw(struct evlist *evlist, union perf_event *event,
+			      struct perf_sample *sample)
+{
+	struct alpha_profileme_sample pm;
+	unsigned long long i_stat, ctl, pmpc;
+
+	if (event->header.type != PERF_RECORD_SAMPLE ||
+	    !is_profileme_sample(evlist, event, sample, &pm))
+		return;
+
+	i_stat = pm.i_stat;
+	ctl = pm.pctr_ctl;
+	pmpc = pm.pmpc;
+
+	printf("ProfileMe PMPC:\t%016llx %s trap %s%s\n",
+	       pmpc, PMPC_PAL(pmpc) ? "PAL" : (pmpc >> 63 ? "kernel" : "user"),
+	       trap_name(i_stat, pmpc),
+	       I_STAT_TRP(i_stat) && I_STAT_MIS(i_stat) ? " mispredicted" : "");
+	printf("ProfileMe I_STAT:\t%016llx TRP %d MIS %d LSO %d TrapType %d ICM %d OVR %d\n",
+	       i_stat, (int)I_STAT_TRP(i_stat), (int)I_STAT_MIS(i_stat),
+	       (int)I_STAT_LSO(i_stat), (int)I_STAT_TRAP_TYPE(i_stat),
+	       (int)I_STAT_ICM(i_stat), (int)I_STAT_OVR(i_stat));
+	printf("ProfileMe PCTR_CTL:\t%016llx VAL %d TAK %d Stalled %d Killed %d",
+	       ctl, (int)PCTR_CTL_VAL(ctl), (int)PCTR_CTL_TAK(ctl),
+	       (int)PCTR_CTL_STALLED(ctl), (int)PCTR_CTL_KILLED(ctl));
+	printf(" SL0 %d SL1 %d PCTR0 %d PCTR1 %d (%s)\n",
+	       (int)PCTR_CTL_SL0(ctl), (int)PCTR_CTL_SL1(ctl),
+	       (int)PCTR_CTL_PCTR0(ctl), (int)PCTR_CTL_PCTR1(ctl),
+	       pctr1_names[PCTR_CTL_SL1(ctl)]);
+}
diff --git a/tools/perf/util/sample-raw.c b/tools/perf/util/sample-raw.c
index f5ae9f468983..f765429a481d 100644
--- a/tools/perf/util/sample-raw.c
+++ b/tools/perf/util/sample-raw.c
@@ -19,6 +19,8 @@ void evlist__init_trace_event_sample_raw(struct evlist *evlist, struct perf_env
 
 	if (e_machine == EM_S390) {
 		evlist__set_trace_event_sample_raw(evlist, evlist__s390_sample_raw);
+	} else if (e_machine == EM_ALPHA) {
+		evlist__set_trace_event_sample_raw(evlist, evlist__alpha_sample_raw);
 	} else if (e_machine == EM_X86_64 || e_machine == EM_386) {
 		const char *cpuid = perf_env__cpuid(env);
 
diff --git a/tools/perf/util/sample-raw.h b/tools/perf/util/sample-raw.h
index c8d38c841c8c..8df0bd3d02aa 100644
--- a/tools/perf/util/sample-raw.h
+++ b/tools/perf/util/sample-raw.h
@@ -14,6 +14,8 @@ void evlist__s390_sample_raw(struct evlist *evlist, union perf_event *event,
 bool evlist__has_amd_ibs(struct evlist *evlist);
 void evlist__amd_sample_raw(struct evlist *evlist, union perf_event *event,
 			    struct perf_sample *sample);
+void evlist__alpha_sample_raw(struct evlist *evlist, union perf_event *event,
+			      struct perf_sample *sample);
 void evlist__init_trace_event_sample_raw(struct evlist *evlist, struct perf_env *env);
 
 #endif /* __SAMPLE_RAW_H */

-- 
2.55.0

