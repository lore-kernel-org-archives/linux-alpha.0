Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211029;
	b=cP0oXLUZ+Syvi9MiI6KzN7v+AkQkYD88JpZdw8UeYuwuJAqRHcONUuRuDr+zOY/deUqr
	 9l1Kpg2T8Se97Cl2UrCOSAAlNIiZQoShQpdjchOVptYNIMizig4MmA+Ee4fboOVPAF2ST
	 7l3e9q3TrByef/V7VDn17ffTGC92HDLUtAGZfxvjmPC0pf1y+Co9xhre1avZnMF730FQ5
	 jWj7D6OeKjcRB9+3vwZvMwfDW7FZSoWCw7wf03Nl3Z+Rw6P0UxUuiFKcCkP9FSZY6YTYW
	 cdZ3DJmQlUcVqOV1dvXNhBdqWUCi+ZzGPvAxAVi5z3eb6ZvN+fFfkKnyDUBI/I8kvpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=DOwDccFEkaXVAmL5llnlgGIc02WBrf8+B8JacnpC5XI=;
	b=UeBw3YqvWB1k7NBlZ0zpBTbC5ziH+a00OHX+ep8VWEzgx0BInG9VXHpnKyKQYaObsnkg
	 JX23xYYKhW5hDJoA9S88ix8WVZyY1nEPrS6yq4KllG7RKzNSC9ABttziaowkTNzzojSKB
	 gOZSsn94YIyCJUvRWtl7wqAfovb1pTPkDBycohJRX/k9NBUdPs71hDQBDv0mvn/HnFBWX
	 cG705Gjdha6hb1RQXSJ6C3QjUEGIvtkA+PbQmzE2Mx+TyxFp8fZgvG8D8nT6pLOTRHkjI
	 MXR1xeRmiNAMbzC2J8U2hEpzqTTYXj4G7XVwTV+HL/LEM3tThJEeAaN7rZsBHrB7bIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AGmae8n+;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E1E606A337
	for <linux-alpha@vger.kernel.org>; Wed, 28 Oct 2026 18:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E1E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AGmae8n+
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67921b515a7so1339338d50.2
        for <linux-alpha@vger.kernel.org>; Wed, 28 Oct 2026 11:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793211027; x=1793815827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOwDccFEkaXVAmL5llnlgGIc02WBrf8+B8JacnpC5XI=;
        b=AGmae8n+uQHVa0E6gvbilT0/ays/0qJ5OZGhf7S82IcXWnpr9Q/CUMcroKHBBbPcJe
         SAAbrYF/ht5IIiC2OE7204pvQTv0xxGWc2TBfayLK+NQrVLnYGWNJJBcBN+YtVJBlPcM
         xDqEox4rjNeMpj1xOU/YnxjLxP4ykVT6zOzRlGDzmUdU00erRw0yBNs6ePQ29PbCTkzX
         d0pevwsvfKVDn4LdFiqHXXH8EZk1MbNWmp+b/JJfT7EYIDQcgmLBbvXPltbqJhazy/BD
         4BsI+mQJecKLCZPAN1T95krSpx3OO7Oeau/lhEBFShd+ytQm1JqNqSYC0Lv2TexVQMAk
         BYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211027; x=1793815827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOwDccFEkaXVAmL5llnlgGIc02WBrf8+B8JacnpC5XI=;
        b=EA894u7WYMAoYxXD8qJXecLz7Ivuu4Ox7MIWIa8IENFxjLHJtMn2vQ21WG8xtxMZCA
         zryjl1SEzJTIwfMyB2hV+RkBh1duhO5TUghjB/CXnH+H6O2Sm9hunR9VP0mKA2IVcQ0f
         bE0Rsuh63sSByewhrhejGeVfUG+6+EYvcF+zUICvyOjZ1f6IeJJgcpPmHaXbnySCd8lx
         DVBjsHexrKa52vBzH/KfYfdqHLR2C3YdvUoVBPKi7Z0E99SgM4tgDPm9cGdQoatyZHBd
         mU0ooQFqC/1uDLf/fBDXwofY3dPovc4m5NpcO//96f4PqD9kEV3yftfAy3yGeNU1cdmJ
         CnoQ==
X-Gm-Message-State: AFq9FYLrJbgAiD/QEObW7fvZpD5u848mTwatcMLGzYbFo8ZKjes4OqHb
	nlTYPhV/9x+a0d5f6l53L5z4iAGlzDlCUqJSYQmrAVY65i0R6pGrJkkX
X-Gm-Gg: AYBFou35fG1LMM+48vb8uI5E9iPdFES3NWL2FwiUZEibdkvryGfiEexfyGFSK65hCAf
	vEvB8bk65GiOd3G1Qaa+Y5gj74p86ANWKQhhP6TTENAkuzo8Vqu5JCQ4NRW4nD6jX6yBc7Awbrd
	EpTYNqo4ccNePr5dJ8YwEkNKfPlMjdTqn7sx75apvGTH2yFuHCiCkrS8DlQ01SQhY8YdmhvUu2+
	gmKy4zYsd56VsunGfW+PGlumfxmM9YUPotbWbDCV3WxupbG/RZ3a0JW50HTMcIn/lYP6k27PJjI
	5zGc8eEu744P7niprH3d6jBUEdLnnuIM2TLNHl11L1ALnNvDYaC/IV3TQ+YIr+WMvanyO24XcT3
	kM3FgSTAZSaVgVVBuXN2y9eVCTOdSFTPL8KbYHBhOoWSjFoZKn6SYp6sK5l76yh46oLtSG5xQV2
	n4zGqqs1ho0W7Qg9UFEgpuMBwxrcVi9Idzb+sHSxjhQxwmIRoj4qfIHmnT7Mz6UFI/V4mZ5xQIJ
	TXEELn480ClA59tfP+sHwF7clasnk0m+mYgc1SjjYpHVvXdwr9IkUQgOTbWpwJDAsQAunSZV3YW
	1Ctw8vO3yBYA0B4uFnlgzAKxiJ+rnYZpBpTquipdklznOqlA19DtiHmc4zguIuatL0fPRiJFBXx
	7yMjHhrjleiqF0OfwkttGNNiMwtfM/yw=
X-Received: by 2002:a05:690e:12c6:b0:679:c916:46f8 with SMTP id 956f58d0204a3-67a7bce5869mr2806600d50.64.1793211026988;
        Wed, 28 Oct 2026 11:10:26 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a15ac59sm2129608d50.17.2026.10.28.11.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:10:25 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 28 Oct 2026 14:10:24 -0400
Subject: [PATCH 1/2] perf alpha: Decode ProfileMe raw samples
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
Message-Id: <20261028-perf-alpha-profileme-v1-1-f46c1938d001@gmail.com>
References: <20261028-perf-alpha-profileme-v1-0-f46c1938d001@gmail.com>
In-Reply-To: <20261028-perf-alpha-profileme-v1-0-f46c1938d001@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8723; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=9sumTVGZwYIYJT9oLgWMsKhqt8ONjnDp1Ojn/pToUZM=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIeWfXbF3tPPp7R6OBztvfNzWLNT2c607P+/v3zqjj2o
 thmyTPrOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaa9YIM/yyD5Y+2xW
 jL3PCfd02k3i9ZSf23xq0V71evSX635Vbv8YWMDI3Xlx+bcm3P7H27Z1eXGG6bfs1hitkj2bMW2
 97ur3zlNZsPAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha cpu PMU attaches struct alpha_profileme_sample to each
ProfileMe sample as PERF_SAMPLE_RAW data: the profiled instruction's
PMPC along with the I_STAT and PCTR_CTL status that says what happened
to it.

Decode it in perf report -D and perf script -D the way AMD IBS raw data
is decoded, naming the trap from TRAP_TYPE when TRP is set and from the
PALcode entry offset in PMPC for redirect traps, which TRAP_TYPE does
not report.

Copy the uapi header that defines the struct into tools/arch and add it
to check-headers.sh.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 tools/arch/alpha/include/uapi/asm/perf_event.h |  27 +++++
 tools/perf/check-headers.sh                    |   1 +
 tools/perf/util/Build                          |   1 +
 tools/perf/util/alpha-sample-raw.c             | 133 +++++++++++++++++++++++++
 tools/perf/util/sample-raw.c                   |   2 +
 tools/perf/util/sample-raw.h                   |   2 +
 6 files changed, 166 insertions(+)

diff --git a/tools/arch/alpha/include/uapi/asm/perf_event.h b/tools/arch/alpha/include/uapi/asm/perf_event.h
new file mode 100644
index 000000000000..0cb7d6f3cb15
--- /dev/null
+++ b/tools/arch/alpha/include/uapi/asm/perf_event.h
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
index 000000000000..22cf95be93e3
--- /dev/null
+++ b/tools/perf/util/alpha-sample-raw.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Alpha specific. Provide textual annotation for ProfileMe raw sample data.
+ */
+
+#include <stdio.h>
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
+static bool is_profileme_sample(struct evlist *evlist, union perf_event *event,
+				struct perf_sample *sample)
+{
+	const struct alpha_profileme_sample *pm = sample->raw_data;
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
+	return pm->version >= ALPHA_PROFILEME_SAMPLE_VERSION;
+}
+
+void evlist__alpha_sample_raw(struct evlist *evlist, union perf_event *event,
+			      struct perf_sample *sample)
+{
+	const struct alpha_profileme_sample *pm;
+	unsigned long long i_stat, ctl, pmpc;
+
+	if (event->header.type != PERF_RECORD_SAMPLE ||
+	    !is_profileme_sample(evlist, event, sample))
+		return;
+
+	pm = sample->raw_data;
+	i_stat = pm->i_stat;
+	ctl = pm->pctr_ctl;
+	pmpc = pm->pmpc;
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

