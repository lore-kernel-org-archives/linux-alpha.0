Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939431;
	b=NOQOgL2kEKUbSmPvdQFmsi609UkgKumS/1GZJdM3mXZIHdqEDhEKZMFQkipBpk3dnQDv
	 Hka2m7IAypbif8iaH6MB2jlNyWrlgXiQnFEsURIMnCtzWIOve1oJnuOM/AjBQT4s57ovu
	 61WWeVQmzWudo3cNlEa1O4SZ/DZDd473tqA4qjEaqWDVKPLz2gTrVyJuHkXfaUp6YsFQc
	 2lZ1Wba8helJK5cNUCodvMKZOoc+CaZrQthC3xuJM1PIJQ7PIWG62jc1e7aIbtWGywkMq
	 bCFfE6gI4xD5Y3IQfMSQT3oMsKP+tvU/GUszTat5M9EzucI81minkaM7GguotK2Hx5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=l9FfNcYVQqBj1OaIcv9GJuMGud6+OOiFH5MqJ1VwAOI=;
	b=ELGGbvFUFsqk8OJVW29LylmrNsT43WTBjIe422ITYiHqBlhBpuRdYdOYxk/AYmcDCwcD
	 zTkZyJiCGtnbM99knLPwbc2AjU5L9hq0Effn98nJCpy1V5WF5VfmFfIddnJ+fZIDK4Rwr
	 FiReupcmEuVSpbd4/uxK4E/877QTlqDl5TsST0DVYSyqapy1WH29Sjli6BXp5CiJhy/dd
	 +I/J/+mi7yOF2U619psqdda4dyQCt1V+pNoaJNy1sSuPRN9zM9U79Pc6mzwHoP4fGBoO7
	 bwaaJ+zjjZirEi+jca6O3QX55qDb6rFte7KVTBOQ/0g7kHxtcpHnm9aE0Fm+Pa7Gn7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=maQRfi8d;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0299606A335
	for <linux-alpha@vger.kernel.org>; Fri,  6 Nov 2026 04:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0299606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=maQRfi8d
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b32bbd39d5so937567b3.3
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2026 20:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939430; x=1794544230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l9FfNcYVQqBj1OaIcv9GJuMGud6+OOiFH5MqJ1VwAOI=;
        b=maQRfi8dTvCJ4SDIG50ec6x7qj5P2kQOrFggAQuLC7NiykPOscxAT2lnG9oKwNoZp+
         pLZe6X4gL4wJf5UB83AXJ6XXcOrP+YQd2GuMc8HTRvGDVTtIM84q22s/VTA/dbJCZ4X1
         VW59dD7gdct4AZ4fcs54FfSdb+tO9S/Gl0DFp29UMwukVPY2mUQ6mj3rKwpD/1xPPoNL
         nOe0VuQFCCaTJsoYuO30qTY+e6SPwGlD4ysQ8QBRd6ihgRO3IMi/XaYJt1ttV7XmPolQ
         xQVJCMs1MRnZSP8ggvBVHmjoHUExirqtJ5K/ZLoViY3tO4kbI5L5vaqbrzReObpfgWwt
         DIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939430; x=1794544230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9FfNcYVQqBj1OaIcv9GJuMGud6+OOiFH5MqJ1VwAOI=;
        b=HAQ5jFXZkcpW7WlMKgwb6g4wRVlkboRWKG8UiZFv8qx42a8+EQsQV6CWgrx36oFdrY
         zVejXNZH6duwzg6nZYmFRZN6QM1rc67wvxM5wuCImN3fPXbrhIWJ3OStx/W/O+3W7l/2
         4hofSAzFgB5j3/w2lf9j5d+uQLE5ELg/9jhX8WTkOrsCkNNPftNJPZiXTKxzO9wYZAJ1
         bvWKSMauC1U2Z0e79fbUvNHV46uoBuFW+PTUh74ZcofSpjzFCy5HK3Stu+zyjOMakiH5
         TkVH96YcdLs8wEnoqGxkR972PsdElu6sxW+rmlVtT2HVAfmrY01WY+PlGDj4Cva0hfPd
         lGTw==
X-Gm-Message-State: APuU4Z9LZZfgwnFvFoBt0OWzwslepBl9Uynhm5pnqqBvWUNyheD+a+cq
	T8tJsOK7AX1Sc+CAe31IiW6S5BHiXiWAVvXzHT7Vx+Q9v3nWrbPh+d2X
X-Gm-Gg: AYBFou3CK9tMFqdL3nr1PxJUHd7IHfeaIWD9uo8NbZPOWxCURN783nNDFqv4cUzQ2QU
	5WAVwnz4CRO2Rie3plt9+3thdKDCFx8YqcDbWoERE21wUm07d3EMpvF81SOH1SO41IY988aBu5D
	3MHD0cuFeZMbBRrlGPD/mVUhMLUu1TUtAPMA+tFqqGx4kUDTAVHpcbC1EDzeBcfyjFi7Vcorz4J
	x1RkC/Ua/euI+uaJvuz96YB/3cTDMDAInhZNhemxTwMIrfmflWY0i3+x3oOy8ONxb8/cmekyXqx
	m56YG03oYyI/XPcdZnXS+jdvLelz2MuS0WiD8Zj2cmCLcW7+8ATBa1Me5kOIVCyJJ2gk7Fxjqo7
	GdENteZDwo8dmB3GFHOhc+kgmHp/D66GcimxRCnsAoLh9Nr8Urq+qEuoI2r4c29ikyn9NbvRhVa
	dnm837pgEK0ZGuMp/pIwI3MlDzxYg1is2anAnxi2aMXwwpG/ZdJLrFq6GGySZ8/vjRfbHfL1H5L
	rUz/Bl9CIEZtpkQrp5gB7jF85YeQcnEFnJxuOkFQw0V5ypNLiGflVaurB2q3Dz0DHxq5qWKR7HZ
	oGaMTCn7fvM/Y5sW4IIhJi69PdH8jpZ4U2+SL2/F5B4OQ7lU+8p/yeXKkN92TkHzJxOz4cAy9Aq
	6GmAr8E2TAA==
X-Received: by 2002:a05:690c:d8a:b0:8b0:a4c4:1b16 with SMTP id 00721157ae682-8b3417b00e5mr8467667b3.1.1793939429778;
        Thu, 05 Nov 2026 20:30:29 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f2e0fsm11446517b3.4.2026.11.05.20.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:30:29 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 05 Nov 2026 23:30:22 -0500
Subject: [PATCH v7 03/14] alpha/perf: add sysfs format and event attributes
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
Message-Id: <20261105-alpha-profileme-v7-3-c474e892abb0@gmail.com>
References: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
In-Reply-To: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Michael Cree <mcree@orcon.net.nz>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=DYl5daD4UHTnU+7rIRm7Di6fwnbZDZlkODIauQebLPE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLeht/ZkaA5YYH/w8QFzr+6/i9PP39G4fFu3rCbpjIZQ
 fyWio9fdHxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1H74xMjQdnrHRKV
 2qXXWHzpEzM+sDvuxN//3/U7zp2uK4m/GxwSWMDMsTMz9+v9d6xC8wc9W62B3qVopFpsEfnyROZ
 Tsuxfn0OAsA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha PMU registers with no attribute groups, so the perf tool has no
way to learn the raw config layout, and the PMU's own events can only be
named as raw hex numbers.

Describe the event field in format/event and export aliases for the four
EV67 event types. mbox-replay has no generic hardware event, and can now
be named as cpu/mbox-replay/.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index bb0692e93748..2a00c4b86223 100644
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
@@ -767,6 +805,7 @@ static struct pmu pmu = {
 	.start		= alpha_pmu_start,
 	.stop		= alpha_pmu_stop,
 	.read		= alpha_pmu_read,
+	.attr_groups	= ev67_attr_groups,
 	.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 };
 

-- 
2.55.0

