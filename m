Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818168;
	b=14d8YxmVoniFwg1eRCyjpsLKVt6j8rOfo7WbPtzwIY2Q/q7sBVognvawhWHxHCKe6V5q
	 FECIAgPrSbz+oMlhNCrbwQD0FKFRfNnjuwyi8246BjjMOpWEUKNeKCh7ohU10s9TCmtw0
	 OEkKgozTagRWG3Ke45GepaWo13ehWWkMb3yWOyzarcIS9jU2Gsc7irySgHwHX/ucP0p3z
	 oSoEWHzEAY17MoJXo2Wx0/dROSOUeC6JoPLRZXdlUX/yokq94C6ysUdQPtNZ/ISytbM1I
	 O+yDj1iFiBgbwGGlGEal1niOlgbcYfTG+MRc51A/aO1P4MokXios+ckVFUqHdO35BjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=0xA1nzke1axFk20N+g0eZRM7/Oalpco/d1jENf6Frus=;
	b=n5X1VxvPDuvhQGG2T9I7v3FXLc/P/w54SJSVojSMLflmhRk0E/S4qaQJXzf3EJan/pnj
	 PSo1Ix2h2zenZ32GN7+yOfmPENinGN9Rv6BVIfJnh7eYSRtvAmbqabNqr8CFqOk8o+II2
	 CSQmA2FttB2QMxTLt7UsRbanzCbfySr1PStViBgw7tHIj0fLPDHDIBBgtUxcIpiLdnnm1
	 bMD+c9QsDWd0VGCqBNtw2uwfHFHy/4x4SfDl33NW+vA9s9yYYYI/PczYFQ/eFi9/PJbmU
	 4gEI7N+0GxZLxnywkl/BViEEfyVK4aEfnDAFIWgAJh6tw/abSbAKPyroO+QRhQKN/Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TruuIUZ3;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CB3606D809
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 18:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12CB3606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TruuIUZ3
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b30477a320so9348737b3.1
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 10:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818166; x=1794422966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xA1nzke1axFk20N+g0eZRM7/Oalpco/d1jENf6Frus=;
        b=TruuIUZ3C5roWxeoqwyUG8NrdbU5aQ6iVV/aIMZsE4iJrZaM3bx1NtWD7njSSJ6nLi
         E2PLhyFoBfb2Ou93r01Gd9icP6EFmEAjMcwOyNUiagLM9OTytL+DqIR9m3shMOWoFlZJ
         zaYwZlKLDl1lzNjZTUDliYubasxsfC8EfGDjygCCWccus4d/K4YkhVGR88OW4ZsHPXpq
         9yHQf8PLVqrRG/22SbbZnarWpuI0H2v7jefjMEaQX7mw+lGfqloa8M5681CFfhII4j8d
         PNvmSYITfAWuWQddEkLFlZDg5vsjaRosdsM20NvMsFpLKOl55tbLACrA3MGFHvpZf6S1
         qCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818166; x=1794422966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xA1nzke1axFk20N+g0eZRM7/Oalpco/d1jENf6Frus=;
        b=NDHMxbrddQHs/kyGFI+v0+lrPvhPUmzeEWAQ8RIcBjJkGBnGbuRRv8kirytWm/kj4X
         R0xUbbnUrpfAfKLHxGjA8uoCMnll/ESZjhNONygypWWUrjx9Tfq/RyYb1ujjyhkAt4m1
         ZHG7rDLxAY2tI/vEbDff1lOvABsEFvAkD+C1V19LpO9X85c8alQS/5ktSGn+qu+9qmbu
         D4RE5qaHXhI8Mqbr/q4tmELAQ3eVIKJMafsqdkgbMwedo0AQgcg5AHkZJg+89Ddn0Poy
         fZVHQu8ZxAS6Nfv2FLufcPlz9u6/SbiifWEyIj/aBUtv3Iqa7TYBWbMJ1KAvgENcc5Wn
         8kOg==
X-Gm-Message-State: APuU4Z9EG5uruvvEyG4UIv8Mr7ldH3e4ouZgUVW6bDCS8Pv7Hf4iVW1L
	30/tiKUQYkRpnwYo5YqIkGQ2JwexrRu5WYwaTGuc7Hd36JNOTh+y/NTR
X-Gm-Gg: AYBFou3XF8ZjM51LERb0suV4+S7p+5J8zIiffhaEIl3FBex0zsy+Fek1y7ca9iS4fD2
	35KRexUosp3okT0qNE70I4wqrhQ+OI9VdtWSussYD46LpJxIQ/OisFn48obKQoqM8OWzEvI5k+Q
	IqgIHPgl4YN7RdydkTvNi8zbtQIa5wlu5v2PWihv6bW5u8pQFZZ9nkANi7uUb7XvxsDpA9ntVWp
	PL5DU3nndpv4IoSpc21vw0BczUSvy2v7n69TmXdandZ70f7jPcqXIXZNOSHg+XpOoSqgd7iMGEr
	ne288lDpi64KpyjR/r3kKleQGycQfrjIqLgb5TjKJbPgM2lWX7CLpyX6Dl5wBiDuLnwEVuUlgi3
	iFY1+CegCRZ2LNBdTi+dFZIYkmgBYOEQjokurzYRkqH9a+dUUQNSREwtD48omFjxUUnYvCAsrJP
	kOW74QHdOxdeaVkFb8Jdpa4o7RL2w3LOH60QXA9eXsNNOdbgrIkYCYORJp015a3pYbJ3WuSEIs5
	MjDXLMOwnVjpJFIV/Xym4Ty1ZfoejaqlwG1hIT6dgk9jO6rkcdo6qWGsuAF9WMZVHJ1vZJuoh0w
	oQrWrlYbC/1h3gFTK7ULcYuD32O6URAnKgTO5xoazpMRWiNNjZyQZEWr7z+KLha3A3TZSYUdUvW
	OQBvnoSxxz/Nzb4k/EwiA1tymn0+IZE4=
X-Received: by 2002:a05:690c:ec6:b0:8b0:f1c0:60b8 with SMTP id 00721157ae682-8b2b67d0b17mr92106777b3.64.1793818165983;
        Wed, 04 Nov 2026 10:49:25 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3098c313esm24660157b3.15.2026.11.04.10.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:25 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 04 Nov 2026 13:49:16 -0500
Subject: [PATCH v6 09/13] alpha/perf: report the ProfileMe window count as
 the sample weight
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
Message-Id: <20261104-alpha-profileme-v6-9-63362e9290a3@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2519; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=/4EgoGj15UgMHZVbNtflEWxIUyBJ/kuaOxUdsmo8m0w=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe16lGL9xx9Ng8pZiqqMXzipkVaysPR7286a6/9IZKX
 +tD2z7Tjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLkmbi8jw+xy1nI9rf
 8b70+ZfmzBRf2V7Le2BfoZ/rBpE9cRkxVsLGVk2K/gbLTtW8yc6ezONqE87DebXOanv7mgq/5Az
 GKp15Q0ZgA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

What PCTR1 counted during the ProfileMe window, the inum retire delay for
cycles:p or the window length for instructions:p, is only available in
the PERF_SAMPLE_RAW data.

Report it in var1_dw of the sample weight, which the weight and
local_weight sort keys read. It is 20 bits, so it fits. As Alpha is
little-endian, this is also the right value for plain PERF_SAMPLE_WEIGHT,
which is what perf record -W asks for. Samples that fall back to the
interrupted PC get no weight, as it belongs to a different instruction.

Suggested-by: Ian Rogers <irogers@google.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index b33677cc23ca..c9ab40ff76ad 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -1068,7 +1068,7 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 	struct perf_raw_record raw;
 	struct perf_sample_data data;
 	struct pt_regs *pm_regs;
-	bool pc_only = false;
+	bool pc_only = false, exact = true;
 	unsigned long pctr_ctl, i_stat, pmpc, ovr, pc, saved_pc, saved_ps;
 
 	pctr_ctl = wrperfmon(PERFMON_CMD_READ, 0);
@@ -1115,6 +1115,7 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 	pc = pmpc & EV67_PMPC_PC_MASK;
 	if (pmpc & EV67_PMPC_PAL) {
 		pc = regs->pc;
+		exact = false;
 	} else if (pc < TASK_SIZE && !user_mode(regs)) {
 		if (is_user_task(current)) {
 			pc_only = true;
@@ -1124,6 +1125,7 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 			pm_regs->ps = 8;
 		} else {
 			pc = regs->pc;
+			exact = false;
 		}
 	} else if (pc >= TASK_SIZE && user_mode(regs)) {
 		pm_regs = this_cpu_ptr(&alpha_profileme_regs);
@@ -1157,6 +1159,15 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 	};
 	perf_sample_save_raw_data(&data, event, &raw);
 
+	/* The count belongs to the profiled instruction, not the interrupted PC. */
+	if (exact && (event->attr.sample_type & PERF_SAMPLE_WEIGHT_TYPE)) {
+		/* perf_sample_data_init() does not clear it. */
+		data.weight.full = 0;
+		data.weight.var1_dw = (pctr_ctl >> EV67_PCTR_1_COUNT_SHIFT) &
+				      EV67_PCTR_1_COUNT_MASK;
+		data.sample_flags |= PERF_SAMPLE_WEIGHT_TYPE;
+	}
+
 	if (!alpha_perf_event_set_period(event, hwc, 0))
 		return;
 

-- 
2.55.0

