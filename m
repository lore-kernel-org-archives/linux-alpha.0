Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561301;
	b=NXo72H0aNSdf3K/0yF5IKq24zjBYPfItPZaTAc6OI1mXKaCT8j33MNJqaPKBUbaFc7gf
	 g0p8byvg9AbgJ7yYjCRIPFHP3dC66mGi1wWSKzc2v6PfelqsTV1rxha99rEUhgvhZwwZ6
	 JrCXOngDqReZveelPqLt2afHR2AktdrBH0suHqs9XQ32D05RxUJzd6QqaA6a+ORwo+ouQ
	 Ck/GRi2N4zNRO+M0JzL9nzKiBCFaUdZ/rg4SUg1ywR8eMSj4FQG4AOAWI0IRNHIXHdsje
	 NWbWlH+HmTaAMWbE45PiQKW4WJ4OfThF9Xjs5k8263CAoZwii1mhKyGPv9AGII7Co1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=0r3yUZYAMoAv8gYB8pqaaXRfwu3+kjfroYDJFcnOW1Q=;
	b=c/NKnbUTlH0/QB/q4Dfy72aML3IPzhO1zrrYrKS1v3xnS0kUOpgGm54KMXtzxSs7rdDG
	 J9T3AfIDt+mpvP3RWYUpdQcwbKy2vPM3QIsEqQFb0Sp52M6cYb5Be4jb5w3GO+K79zKeH
	 hZ5cjopCrdzUBNOOcCDZE7vHRRwZnwkqjx0dPRkmxZGDYnr+gQo3Ln9oWss4/hxFy5Xd+
	 4kr3UqWKmVljw8oJZT6cd0xV06948XuVn7wIk+n3PIc47mmQQuBwVw6HRkerYya4dhWaR
	 wbhXupQsaV9kQyK7ABbG4zJojB6qHM2turTFq5vbD76QdyFgUimyfe4VH+++YLEg1YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dGBODuVT;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BA060A261C
	for <linux-alpha@vger.kernel.org>; Sun,  1 Nov 2026 19:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88BA060A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dGBODuVT
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b0dba37a7fso19214077b3.0
        for <linux-alpha@vger.kernel.org>; Sun, 01 Nov 2026 11:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561300; x=1794166100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0r3yUZYAMoAv8gYB8pqaaXRfwu3+kjfroYDJFcnOW1Q=;
        b=dGBODuVTMqjdgfE1oRa/OU9+NoH8QL8EVlF9P0v5i5Q6nlUiwMch68V6tMMxjm3cQf
         MRLGfFyuOAdP3wkhJE+KhS1HZDHILa2KdRkC9uInnOR8kQBIcQRbNsrux7JSgKHGo9xg
         7ASjCtc6qtsqxa2fHeADvSC845q/xIlN0NGMenuzmaX7zmjq8VY5uMl5yB7+C4+yE2d/
         SAu6DrLc+7F/ug0qbMZNOraMT8C3pkokeXOkZSa6/jqnmWln0nc2zYhqFiev0prJPETS
         DPaIJ0dWZP/vZ76p5n6R/zoIRg3FxlTYgAU/GgarhHTFZ4RJRGnpQi2SXlklcpEkChNS
         IxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561300; x=1794166100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0r3yUZYAMoAv8gYB8pqaaXRfwu3+kjfroYDJFcnOW1Q=;
        b=Q8mpg+E5MghSLDsGlsHMGxT0chVQ73E1+7YUXr9QnOmeBpKrHrzM9DBiTf6pZURC7Y
         eWuT3L7NB4RL715e+kx67nDh4id8ZxNY3kB6nHM3v7IyKbuhCTKihY140btqGsNclP2U
         quS7+iw+rRSsh6l1PnvX7+UZJ7agbBH1rOcwbMaVb2W1n4rJK3n7AgDs1nLl72KMt0dG
         nUiyM21hF+MmNjos45qVkEgeA2KQRWC6jNSEeDW+OKKTBBWruE0LnwZLD3uGvp/HuYe8
         ogRQqEAVWbHepacEabIVzIdlxmV5II/XLJ4Da0eI3Oag1RHyUHrAO8jSYcYlTZQLIlCl
         62QQ==
X-Gm-Message-State: APuU4Z9UvFnWuf/Aaq6HUZgTCdf1NY9Z+R0u4FNDAYl4rA/8ma3CPUlJ
	WolKuvcWU849FltlQfR0WGAcpR+9PlVM1HlhoqPhOXWpwZ/c4lswhBiY
X-Gm-Gg: AYBFou2ly9iFkuX/7J/7NqDsOH1Fs4CoJ3Yd3s9rZ1a8lKInoZHt8xn0LusDimoBRxN
	NmGDC61Lnizpu0VFyCRO0obzWWvXAYJp9kEd3wcAkAZ+T+bmXk4L/4uPMzYiQ2Urjor2LXFF4hZ
	SVmCAiwZkPflyPuLv7TD1ORl4L9JhpiVvqx/Blymn1i1g2HAZFRs/JnYAeKc04y07Mc+4IZuHJu
	AV7u/ejYzwLAujNwwLEyenpkDEpghVuR1kZf8U4zGTcwzhzz66BtLBU2YzQ/Q7XUfu5x8aRAjRn
	HCB4dIckV88lHAc5jnX2KCuzNxpKwaSCoPqmp2J5FW6tnd7kxEBQ38DOYgYZaRrd0oYWrkuiAV6
	RcdFX0Dyu5PYdgOmHZzMtScy+fPi2ssLZ/I0c8+Zj9KzhExFTZPtx2yZqc8uqQMmiq20unwlpIq
	A375Ts7hNGwtSchNAuCb/4+JaYH8BjX0n1gKOdPE0i/Kvn4HM68Wj22DdvQ1iFFGbI+lJp5zoTN
	IVIY2z+CxCitNE4atNNsF4OJhhsubhadK8XHP1/wVrgmiopmb1E4FzVOVK6uC82wJdJOZVw3sGC
	bzd8RAu27Hsq7AkjCK2mH8tgcUopT1VmYfQPREsxsrM5wylQxY0XazI87zXKty5dVLCQL4Qc79o
	HiksdmzXGzGixX3+JQYSlBHBV0PmGeLQ=
X-Received: by 2002:a53:b407:0:b0:679:8f04:229f with SMTP id 956f58d0204a3-67ba5058fffmr3603785d50.161.1793561300395;
        Sun, 01 Nov 2026 11:28:20 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b704e62esm40700517b3.3.2026.11.01.11.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:28:18 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 01 Nov 2026 14:28:09 -0500
Subject: [PATCH v3 6/7] alpha/perf: attach ProfileMe status as
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
Message-Id: <20261101-alpha-profileme-v3-6-92d511b5a044@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4982; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=OmXQMd3w1MENTUR3kM0+E6xHkv5n6Mmuqmd3Mvb0SnE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKeTzoq28OwYf90h+3aTt2ecbecFHoY9tk/LO2s8rYsf
 6/gw8HY8ZGFQYyLYaaYIkvcekWWWW07lvqclv4FM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 Ahk6RvEQOT0Gjczi4tLUIt20giKHvPySxJLM/LxivfyC1LyC9AK9tMy0koyM/KLiVKARenmpJaa
 ujm5GhgYmlo4WZk4WjqYmzs5Ohk5ujo7Ork5GluYmBs6WjiauluYMXJwCMNe4FzH8r+2edXMln8
 QGtY7VM+r9Ls2YuHTixHXF6xn35cYXK67Y3sHIcPfYxu2KJlvzORuncvvPPbq47eiZ632VK5pCB
 dU319rYsQEA
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
index f55ddab7478e..a816a18036b7 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -974,11 +974,14 @@ static void alpha_perf_event_profileme(struct perf_event *event,
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
 
@@ -1015,8 +1018,8 @@ static void alpha_perf_event_profileme(struct perf_event *event,
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
@@ -1048,6 +1051,19 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 	else if (!user_mode(regs) && in_entry_save_code(regs->pc))
 		alpha_profileme_drop_regs(event, &data, PERF_SAMPLE_REGS_USER);
 
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

