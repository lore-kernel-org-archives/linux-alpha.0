Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210978;
	b=Ts7O5Z2vQWyVq6xa8mrNJlTruSPDI028EaI6IEc0aQdKZT9NE16wY29J2V5NDOztNKo8
	 IHukXsgU4FyqfB2eoUu7ogOPbZqpi+ThlB1KiY1R8MLx1BJDJ0Z3XNCABMPTRJJtVhJR7
	 3X3zlQFnu6JaYDLFp3bwUiR/FwQ2rQVwH1X2S0E5JWBp14Jyq5VFlP40OriwO85CtdvPh
	 9kRJFzRlrl1zAAbfEEGsn8bTu4AUL+jekU4qpg7m0gRRMoAXMIFK0KC3kM/mA4snzWl65
	 a7D6c+Uci7L+wWXLmbhvQsQMW0+DeHVKK+bvOsmQTWx4BericLB4sJo3Mh15tbQCr1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=615A56KQSKwDjQwBeP1BUSDjG/OPw+Q52l+yGTWeJr0=;
	b=alsFmqm5ZoFskZELz4ewyKc23MYVUAIcmyCXFANhsLuF5FNSH0BEoF/U97rTX1Gjrf+4
	 2SDx0SgIen5oKh6Sdj5SIxq64hjtYrpCpUjt7PPmUSbGQtPcvtNKEcS/Qq75N/su636/J
	 4J5AeSdIezs0Ky9F11mRf/31pbwZ+uTlt6Uer4oGaYexr/Gq1Zir0O+BMm0EWM34I78uH
	 +3LkyT01K9UcuLQyZflmTlasHEFHCuvbOnVCK6OoqWoNUX/xMspDEsinG/0CTb5JUBlTx
	 AjfPPEFAbH9Bo3RKRq6U1vIFYh+613Lfd9bQYrVhikBeOAfXCQsYDLvQuvnO7Iw3L9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EiGMNNv7;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0F0606A321
	for <linux-alpha@vger.kernel.org>; Wed, 28 Oct 2026 18:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE0F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EiGMNNv7
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ac8a2ac52bso16340897b3.0
        for <linux-alpha@vger.kernel.org>; Wed, 28 Oct 2026 11:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793210977; x=1793815777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=615A56KQSKwDjQwBeP1BUSDjG/OPw+Q52l+yGTWeJr0=;
        b=EiGMNNv78/LYWQ7TUORqJQuyq2hnoCm4P3xFc74HXIcDq33ouVeqwJkGpU99gnEeNb
         3GmgFCuSJcoHn4Zkp6FmJgNiUUPdpkz6oKCKxfN5RW6ZTg+BoWV5+/+iGa5LyUZIJYbA
         xNWyW15goIby+K11/vB6ZcWdSyc88uN0iIYSEliOPDpxe8NU7wKi5mpCam3K0T2pJqr0
         INTRkYbCj6AzDsqii1hvIK8D/U8MYlvtbG/rFXjTKeJP/6fY60/XuiOtuY85YBB3s7z6
         QiZ5zYvykjeSqBgVTBVzK4Nl0JfIqQMTwxQ20glhQiy645x47+fNOZSmoLrLn2FIU5Sx
         iAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793210977; x=1793815777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=615A56KQSKwDjQwBeP1BUSDjG/OPw+Q52l+yGTWeJr0=;
        b=MFmacrIxhSxvkIASmS/Oi983gJtdn92r3LrOnxq+oivt1xJAHFmZ98lZMF5M8HOGC5
         LpRHK6MOtXZrvs9jzPqHIbnp1cwxOsTWqpKVFSmM09Yifxx7hC65PemA3f5zgX/RZ+m6
         PFLIynYlDWZ3RNEci4dortw95QRAhfVnlrFZuI5IeiL8Zs63snot/WKydItORCDn/JkQ
         YQZQggnFkJo4900cO3jST31q6RwTf0XfJMIr2BXhlFPJ4HRLtEHiuxV/89yzd5jJxKbP
         v+THDqOrxjwUslFMmxXBU3e3tWQSRomgP8zczoXk5sxlSdQgcfIeTCiRV2joigGSNBMv
         ebkg==
X-Gm-Message-State: AFq9FYKhUe9nfmbvtKkdnTT3OqG11nBVGCcsKSHAlORT+Px/0MLRO1XD
	fRu2Z3qRmIob6Jl1RZG5TWJV71RHKQrszjRZago6JHb5ZRAlrY63w9W4
X-Gm-Gg: AYBFou34X4XpgqE10/Y7tb0eOi7gN64cVCftS9o8vG06PbchEgXETsJd2vS1BuuO//z
	uFd8Ljv8PN1svEUylAp9XvuJI2609/tENigWJftgCIKAqmpFd3DsmWmVkVkdHNMxV4p1RKNG3rZ
	piOuQ4+gIUEEjNrcbtob0EwE8x/WVI7dSLJ7n8cTvId8DXQqNPxOXeKLd4829RsMz+TJc0+Jbwj
	dzIRdxTUiXUTsstOjN+z8Eos+fVnebtdmZztQwYEqOPpA/i/SESLYL93HCq0178mWFpSQT1uuRa
	viHmgflD5FaNLtINURzH1zlnL82LYdNDt8vewvTNRjhIkPM6wT1BsIdxaQi1lJUl81ecJFoE6Mr
	qzdIyZu42oQCd16gqISqi0Kg2MWFkBxJQzlq02JSuJDtDE2YE73HR7wyn2XEQerwUQ+o3jrheA2
	Wz4acekW3+q6gbdwujCJkuOFy6yjpETht41L8iLUIk3YwEVDk2DmksqHDoz2phsq+ETZ0YVinX6
	6TheRrstSWDLXNZarNOCm1oaBfbbZfJk/K3Uq/wzNgT35nh+mGqrlVrL0rBvgm88bHZ1UPmsHBo
	Y2BSozmp+pLIT2NP6Bydxg3d6K9OhSk9W0gs3hM+eWnJYI6CxU3784lxmJMtsHgOaZCI8s0/YYn
	xEfFTupMv5A==
X-Received: by 2002:a05:690c:887:b0:8b0:d9c9:3fc2 with SMTP id 00721157ae682-8b1c6692decmr2300237b3.10.1793210976484;
        Wed, 28 Oct 2026 11:09:36 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e57d131sm33112337b3.20.2026.10.28.11.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:09:35 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 28 Oct 2026 14:09:31 -0400
Subject: [PATCH 2/5] alpha/perf: add sysfs format and event attributes
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
Message-Id: <20261028-alpha-profileme-v1-2-d44b52bf2500@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2254; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=aXohGVuQ+3QGlwkw4lcu5MBGEFw0RN4GyCwS/v4JVPY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIeWUWpnvvqb9MS7/3JemdO2actXXO+r10uoXvgZeoJ6
 3svFnd/6vjIwiDGxTBTTJElbr0iy6y2HUt9Tkv/gpnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DIEMHaN4iJweg0ZmcXFpapFuWkGRQ15+SWJJZn5esV5+QWpeQXqBXlpmWklGRn5RcSrQCL281BJ
 TV0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0tzBi5OAZhrhHoY/peaPYr+s2
 GVWOrNL7FnP14S01v/+defPpec8NPPuS7x/nrB8L9yxYLSZ2qXl1pHfbayW8eaUGzXKbL89O5QK
 SkJqb0OjNwA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha PMU registers with no attribute groups, so the perf tool has no
way to learn the raw config layout, and the PMU's own events can only be
named as raw hex numbers.

Describe the event field in format/event and export aliases for the four
EV67 event types. mbox-replay has no generic hardware event, and can now
be named as cpu/mbox-replay/.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 2d9383425357..70840c05d39b 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -212,6 +212,44 @@ static int ev67_raw_event_valid(u64 config)
 };
 
 
+PMU_FORMAT_ATTR(event, "config:0-7");
+
+static struct attribute *ev67_format_attrs[] = {
+	&format_attr_event.attr,
+	NULL,
+};
+
+static const struct attribute_group ev67_format_group = {
+	.name = "format",
+	.attrs = ev67_format_attrs,
+};
+
+/* Values must match enum ev67_pmc_event_type. */
+PMU_EVENT_ATTR_STRING(cycles, ev67_event_cycles, "event=0x01");
+PMU_EVENT_ATTR_STRING(instructions, ev67_event_instructions, "event=0x02");
+PMU_EVENT_ATTR_STRING(bcache-misses, ev67_event_bcache_misses, "event=0x03");
+PMU_EVENT_ATTR_STRING(mbox-replay, ev67_event_mbox_replay, "event=0x04");
+
+static struct attribute *ev67_event_attrs[] = {
+	&ev67_event_cycles.attr.attr,
+	&ev67_event_instructions.attr.attr,
+	&ev67_event_bcache_misses.attr.attr,
+	&ev67_event_mbox_replay.attr.attr,
+	NULL,
+};
+
+static const struct attribute_group ev67_events_group = {
+	.name = "events",
+	.attrs = ev67_event_attrs,
+};
+
+static const struct attribute_group *ev67_attr_groups[] = {
+	&ev67_format_group,
+	&ev67_events_group,
+	NULL,
+};
+
+
 static const struct alpha_pmu_t ev67_pmu = {
 	.event_map = ev67_perfmon_event_map,
 	.max_events = ARRAY_SIZE(ev67_perfmon_event_map),
@@ -761,6 +799,7 @@ static struct pmu pmu = {
 	.start		= alpha_pmu_start,
 	.stop		= alpha_pmu_stop,
 	.read		= alpha_pmu_read,
+	.attr_groups	= ev67_attr_groups,
 	.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 };
 

-- 
2.55.0

