Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793674924;
	b=fKoYp797M+P0If3ERqEkuJHbU29lR+b5W2OdCAZ5Pwev499WRMnLEN9mw9ZDGAuwHHIC
	 Bsta8LW+QkakKCv2i7mkJH+0U6rn1yePYEDXvgA0uuv7JdM7zU7S7JSb0Xw7HuYo80//5
	 Ekqf4qxfGGRsCI5UIms3wuIeSWk7R9l7YLkgA0BBvBbBov9EAqyXn9pOlwdyfER85iF9a
	 EZk1xdat18Mrh5DIqbcP/gM4nyeL1HUaHnCwrHUVmezMb12R/Jk8CkZCVu/bqGlPX5dVC
	 6VhbJ3fNp2nTJ7/guSOAuq2gYbOmPgaoPaygsPi1x4Fgbig7Ot3k/q8nw+JwTKmAdtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=t/6UJdmTXHa5CFtPmZ35mg3YaxIUiqdjrGgBWpPFHWo=;
	b=ScF/ZaYIvBXTMPu9bs1tSUGi4WACpzirrTRHkYpLP9EMHHTN8BhC0kzvbhHbNH4xFbM7
	 mzAI1Llt9EpTB45GAXOV0FhbqDjjjOOBDTLiFh3mfB1d3ApVAEpuXFWqlRu3MoZP/NZJk
	 JaPQVJybJOwxPfwITNTGtjyEXrDQIEhQuF9wtMDROAye0d5f82sfxd8Iy64lvBSCT9n6A
	 L9aoT8AD6SDmyIBKsXjK9zwG/RS7Zocswsbu0x+NFVgBdp5bxkNkdxz6gkBdR4zqo2Qnj
	 lLJDB8fihRGTswUImOjYoH+D2+wLcb/mpmQhRQukbEkvssSOcojnwoEp88TXsqsHsMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cI+YxjPw;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAD4606A327
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 03:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FAD4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cI+YxjPw
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0d63f60bcso30004027b3.3
        for <linux-alpha@vger.kernel.org>; Mon, 02 Nov 2026 19:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674923; x=1794279723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/6UJdmTXHa5CFtPmZ35mg3YaxIUiqdjrGgBWpPFHWo=;
        b=cI+YxjPwQPj2Xf957E27Wp+XxIb4yChJzZbZYX8kq66xhBbz2plXjwmpFC12zqpmfh
         MP/ezqfYqBKNlIsQGumTNE+dbj/6fzo9edXGzgN0553QGo0wVdzQuKBRwRMeE1a74/tu
         KrWYNk1IrRxg6P53t7d0isgAi05mboS8HzHK373q/1hrqJc7zo4eo6gKScKmBf9emJWM
         utHAbg2rQjHfMwJN6gbuMQAQnYcfdl0aaJrS7Pa1JKT+5QkzOMNMmGaWwSHAJpmhiavC
         fOZ79BsVJcEqKWr86o0a/Xh8kcIHLPCPizWBrQLQqkmmfRPqmmuKKooS1bkZ/2prHxtj
         qiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674923; x=1794279723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/6UJdmTXHa5CFtPmZ35mg3YaxIUiqdjrGgBWpPFHWo=;
        b=ABb06I+ZQ2G52oTtMuBUOha3ZgOCCasK1cCs5EiyOD0qYYoqWbwP5kzR6dlatxh0Xj
         52jxRcGxzklASJQ2DtbPzo0Fk1rlIMO7i45Hpd0lTmV2HSeTeRsrr0ODzkXpOvVf75yz
         LaewwpCaPusAn7SOcWXGgPZgZ3umve6K0g2jQ9dnMcafc3ABKXFGPwqxdnjP1ILp5WUD
         qRCxu1tg8U89q8NlkiK29yk19AUN7C5yGO0o0G01dJ+3bgpgGyLuc4642VLfvhZEZomv
         HkToJu8GD6b7Uv/TGjDFamvzXVLFrcA2eCYw1mSoiGVqB9ZnEB/cxXWFXsKKtHTaiCxh
         wrIA==
X-Gm-Message-State: APuU4Z8NBcIuYMNaXdHHe0OIwUxDQ80YSCap4J77MvaX2Ry88EdLmVJM
	CBR1+h24kBLjESkavlSSNYK2kHDh9tXTPD5VAuGv+aNtry2j2X4YYNqP
X-Gm-Gg: AYBFou1eLyeaLrprgh5c3lg3JahcCjG845AcYVN/mzdPAdFF2mFUrtG23lGImZ0VasM
	6LQBHuZ88HTCRFwvEVQvKwzcYUas2FIEqyVj/3hsVkw7eBupG3CXb0HVL8ZHW66iUf/KjNSGX2b
	FllZRe6wRYA2KXYijwSxqDmrbdQsosrOehmDDxOMSkmGn5/W60+mKWI+5KiQ11i6qm1KAqS4z6n
	oEUmlOZK9AlfbFJY1r9o6hLlnm3qedPsDyxvfTSOseax1hvQr1zm4NDXUcE9MlNiX5vxPnSOFHi
	soPLR4LSQSiywyigHKiT9WqV+Ou6iiVVRO3bdt+KRbW+FC69AcL4ZnF3do49m+BBhuvsnuDwVeB
	kZ45EyJZw/+E1nHkPIMyEUWiTLTwGP41pHjhzKTdi4IyFQCWawJm2ixFg3nTCF4IECQEzs8zjxN
	Z1OsE9s8te1ZwzkyRZYCwmEMOlPyPJyEwFesMeDUL+jD5pV7vbctvxlYgZLkJtqSbHAA2kXp+2S
	OMIpRYLHeo8Q0WXirG7Iz60giNdKlZM/fj0OoT5cFTbMxk/l1Y0mc+jJEapCmFqC4CZ/sw7vBbs
	8GMJcPjazUDudfgMQQF+40G5QdE2BHY0/x1aZE3s8QL2UDpebDfGbdcymgUK7MzrE7jFIvlY6uJ
	nA5S75mSIig==
X-Received: by 2002:a05:690c:c4e5:b0:8b0:8b34:ede3 with SMTP id 00721157ae682-8b2b6594f0cmr82898097b3.3.1793674923045;
        Mon, 02 Nov 2026 19:02:03 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b704d699sm64247177b3.5.2026.11.02.19.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:02:01 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 02 Nov 2026 22:01:57 -0500
Subject: [PATCH v4 2/7] alpha/perf: add sysfs format and event attributes
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
Message-Id: <20261102-alpha-profileme-v4-2-61e00f5e1da8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=nsB8jInGhmdIwF4AteMUmNQCWwgxX1qv6DhmPNtskC4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe+i3+9Pn5Wi+fGY8PTw9ZJ53Dva5N4K2M/4clx5bbX
 TVbo/HtXcdHFgYxLoaZYooscesVWWa17Vjqc1r6F8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Zwhk6BjFQ+T0GDQyi4tLU4t00wqKHPLySxJLMvPzivXyC1LzCtIL9NIy00oyMvKLilOBRujlpZa
 Yujq6GRkamFg6Wpg5WTiamjg7Oxk6uTk6Ors6GVmamxg4WzqauFqaM3BxCsBcw/2RkaF3GeNkHf
 3nx1Vu8z0/WbnvyqtzdnNfaZUkvT7EWje/+4oEw/+shSW67a+jnQ/O+C7WMf0xc1hXDVsIk3N+t
 cKdxRlvJ3ABAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha PMU registers with no attribute groups, so the perf tool has no
way to learn the raw config layout, and the PMU's own events can only be
named as raw hex numbers.

Describe the event field in format/event and export aliases for the four
EV67 event types. mbox-replay has no generic hardware event, and can now
be named as cpu/mbox-replay/.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
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

