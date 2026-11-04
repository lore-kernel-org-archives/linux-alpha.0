Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818156;
	b=m111FRbgfbH3CElAldgg1oc9mauEHueG9JRk1OGiu36inJF5SzB6oShIaxf6rOl4N8AW
	 2grwMNzNWZW9r/Z6YMNh99S0H3VrDnVgPWyQZowLqL0vxaiNyDPu9F09X8oqLIVIO2dQu
	 5HPB1LJYNtWfwExrwvE00/ZNrZ8fHr5Xtsd97kTxyYVthoIdkapqi/Uj3KxFml4ZmvN7S
	 pVEwQag+vwKVfBhil/Ly91ViqkQJUmGwVLsiaMZLAHw+w1m7lH+A/yr+SYY1uMx2KujU1
	 d+8WQPbd9NNb9uA0CdHLSy9iDJa6h0ND64R2hc7fY20UqtlPk4SoWM3BRzdMN7iNqbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=t/6UJdmTXHa5CFtPmZ35mg3YaxIUiqdjrGgBWpPFHWo=;
	b=TYDbXQY2Zs0ZgMDyUYi/Qn/dH5FFfVx47Dv7P4to68i7QIHepWKQUuHGEchYCbMp74LP
	 BDR85I2QfMcqWCyyN+qoGoDL70cmnwHE9dlGgPGrdDqRC81/fmPCjvbXhgFYQhJpExjF1
	 fGSn5KnYARmvrMd/a5RvS7M4uoksh42gxqy29a9Ifw4wThGgxI8sydFiYwRPBHrX5VSfN
	 PooRGr0uYm5+wwbWUntOEp7BSfdT62d9fiUeH0tSEf2nxkHWoOh8kionLUmOm9jp6nGwj
	 g0sdMh4IKmpVB80Rvg9DWl3ybs2rTF7C//cqbK0N+rZKh/Ys/qMls5iZeijnAHEOYAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mrr0ksDP;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB344606D820
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 18:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB344606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mrr0ksDP
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0d126f631so11532917b3.2
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 10:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818155; x=1794422955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/6UJdmTXHa5CFtPmZ35mg3YaxIUiqdjrGgBWpPFHWo=;
        b=Mrr0ksDP79GRmhE+NSytNllRHQddie1qCX/qCdauyOszsQxpNAfOe6hSgYPqC8pSP5
         6kaKBVyy2TOg+H3WfbgO8zR+akkuuKJfvfv+akCm2I3jwzhKAUzeRCQve9BLNwKI1Afk
         A5WPcpysj84im93WrlXI7HKTfU/n67a0U2o7tAX1RpPTB9sPFozFw9q+bVwcqpqD4Lsn
         AydXeqyM/csh+L8kppKKqP+cYZqmo3bGjvUOyQqrpvt+kft//t0HPeQXNf+54Qx/qcZv
         sAWEpXld29UhikCKwfJ1fZytDZNotnVlB9RJ0AQpkU8tZFHbr+0pmUbjGtog3400E5n8
         Vr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818155; x=1794422955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/6UJdmTXHa5CFtPmZ35mg3YaxIUiqdjrGgBWpPFHWo=;
        b=NYoNRSPpZSjzcDoPIv9qSoSlAAyO7B8e6BYhMs8n+wOIOu29GJoekFQjuoYskwmj4C
         xc3VyC5bXhtbWpRLj33Yhe/nbWBDNwwEqwldRQPX7eXCsl/cBq2xetEXH6zxHUNmjCnm
         x9QRRsQOGDt81lqQkWcKa1x8pXuyI05ucE2d+2RdtynozW9JPCqOFNHDEzKge1BbkAdR
         fFNBVelCiwvkBRlCLa+bzAV2sw70THnlJCAU+K7ObHXJDAFQlsxZ5rOqcQsiW3OXW0fE
         S1fRBeu8TZpA80iQLuYGVM2tGq537YsXy+6p7m3rBzpMNUI/7ncFlbHNer5ZVCLWuwwG
         lA/w==
X-Gm-Message-State: APuU4Z8E7ostF4eiC2JCmxBlHDW6tHUCyt95DdAkqt2GV9XQjJsCys4y
	4dSn+YQSKI7rPAS++EaFkQAAMSoCbjr+QofDNMsdX5ZmnI7NfMzK6Yt+
X-Gm-Gg: AYBFou11HK4/k8e0LHjPLIWAf14nXOKUBjuh6OnDgv67Z5Fk6BeifHaKI4SfaNUJ+0t
	uFRVAUuyrNGuHxb1cnXMtQtuwXrr1z1gPBanuhe5XeEPbKp8sC/ThLTyincHbqIKlL9XDKij06v
	hLYEpRKEujBjZOqvSi7KPMUbJdw04/Lc6VBraklGO/UyDTCCElz3G68ydPAYDN+8HXcixCY2m5p
	gpNEY78FRzsj0WTQH53K2s5j1lGLeVk4wPigtb53wWoE3MbzATN6yHobq631mtNIKkTqziZlQbf
	91sG2G6QIpgDqBN5wUd/r2yVJ2PdpZgzerTdPU/9hhGs3+mIharfubsa+SWml6vdeiLf6KQs+sZ
	whWYGu5+Vmkl6hX+4orCj72Lm9uyE+Xwsvd+B5zUnDWrDMHrDJXCZDLeal+QtV4f6vnJ4RWZWUv
	2j35LOd2O30mcLe9rIOzXJjEQuutzDS0T3sN4Xg2/jwMwL7XmscBYSMSQlJzILPBrcKNYnS4+Hb
	ai/0P4lVhL0CYHU08DH1BJg6PJgeS8RUHzwzMS1ki0VL6WMRZ4vTBPFNiqC5QxCy+g/cjZW8TMO
	U5qz0/OQvqzNL74SSBrRc84jGooZRZBh3G75ZvqnVpiQHDhJxcHBqlfLb4lrXgDMJ5NmoAqs/Ca
	KxxR4IeAbNw==
X-Received: by 2002:a05:690c:e010:20b0:8b3:2352:cc8e with SMTP id 00721157ae682-8b32352d394mr7107647b3.59.1793818154602;
        Wed, 04 Nov 2026 10:49:14 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3097117b3sm24456457b3.1.2026.11.04.10.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:13 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 04 Nov 2026 13:49:09 -0500
Subject: [PATCH v6 02/13] alpha/perf: add sysfs format and event attributes
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
Message-Id: <20261104-alpha-profileme-v6-2-63362e9290a3@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=nsB8jInGhmdIwF4AteMUmNQCWwgxX1qv6DhmPNtskC4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe16n8cxBhnnZH3cbnpkZGiP+Or88KnnhuOcsZkuPV1
 NFoM4mh4yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK65asHI8Jnh9uUtKZ
 t2zNgbqVChL6fm0//z7DLO1zfuBDwKXXur8izD/wSrg+5cQRfmF7S0Vua2H3P8cobvawHzMcG3d
 QvL/vvEsQIA
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

