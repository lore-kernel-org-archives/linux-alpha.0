Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333047;
	b=34tYchBtpeyRXLZ+Id3IwmDryDJDmC5L1LgvEVs7spQ3K/qUL+GaN2voPFQMb8+1M+6o
	 0E8g2RgeHKM+yWR8L/Ck2/urVk2NvXmhXcv8OUYNJ/4uo1XSp2R+cotEXnUn/cmjynm7K
	 LDCUAdfDHxBfdOPnJMJmer3qbCNjdMfhlS/iLzikFEzJ0w4kj6/SOtFb94ZkGNyGcOPQR
	 OJj+JsPYpzTnbOmctsqzjMUWtYuxkCNIta0TUacQVt0FlHMhef/KEVpLMSHX3JfzwnPIf
	 QNztOYrBqNbRE7CcgpILc/uWrTvV8gTvLEKk2XaKaVd5nrzbnB3GeRz3kjbaCfnNWWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=615A56KQSKwDjQwBeP1BUSDjG/OPw+Q52l+yGTWeJr0=;
	b=t2OI62gxg8H3QGHEjSC7UUP9LncCrqkWCCqSTf7KpxWkZmRHzFOn4tv2bHifIi4O9lj2
	 vUIWlcUjiYJxsZuO/g7FIwM6IhdZG8UOHxK/+qfyRz3In/sKELK8ffyS1IBi3AavEsPeh
	 Qmd6b9bwvNe1x2eQCBphd8EA50kfbup8oS9m4RHt7PSY0VIhve9LitEnHEku7iigGU90X
	 rprh6Cauf0ypnNaQ4eNptg6f5AoaAI/8WgEQn8oh/HESD0nzq/Yl1JcbfZaUCJ6Dfqrva
	 qmloqJ7VUfiITrXh7exNnY9nN9Pu3keSVL5SMAjwXj1AeCUfl0j9MIpMhOmXjhg05PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z9Q+e2bd;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7252606A32A
	for <linux-alpha@vger.kernel.org>; Fri, 30 Oct 2026 04:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7252606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z9Q+e2bd
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-679a2b5fe87so204603d50.3
        for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2026 21:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333046; x=1793937846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=615A56KQSKwDjQwBeP1BUSDjG/OPw+Q52l+yGTWeJr0=;
        b=z9Q+e2bdVF1oOGa/Lj/sMU5hnxveiPBPIaoeBiGBdpaFr8uyw5G5Hwbvt7ZfTjcaN8
         niaGrbZIseIox+EkrmhSRwv6Zq1stHhm/jZ1bbyxNikypnXFPpHbgMmJfx5GI8zTbN6D
         lYI9b1x0Kn3tuVEnHJ4VkkCjHmYdVThbYSVkzv1l4nZ/K6d0L8PBVJs4+5fC9jpGgR9+
         gHh35jtiYtl9Qer459PljTiOa2YP2JMEVkq8Rx9mXZAWCFWi1fuqzD0NRwhAqkjoc8ed
         VzzUjQzt+45z++8ev6SMWQzjonir7EnEk/EG9igOGBSjUcLgiu6Wk2gIRnyzX103nZtY
         RvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333046; x=1793937846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=615A56KQSKwDjQwBeP1BUSDjG/OPw+Q52l+yGTWeJr0=;
        b=jhvJV+5H5KaOQ1biUDSHXEuwhTsvPEt/+R8BrUDrXX/akOB5t+ksb4aO23Cs5P/3Iv
         9XSfO2BpFUHX4du/3MA+D38XjtbYTka93kjoUFh+/kddWZZJ2PFvPyOCOf7wNb6rTId5
         QgHLoaUx7AJX3DkRMSXgRM6d9/CwaZyIueiZV6VNB1ebUYY7VUQMM+YLg2y0BLvN7/Wx
         XiUapENY1pDzH88wteAqJBfVMgLbGAuFWiPBsTEyz7xal7UzNsFMSc/NKF5y8bfGnGY0
         IMPBYJYnF1UfNpY0j8s0QJ4x1zP9eUvqUl2HmdT71NtEOAVtH51VZGciblNmDMwzrJDq
         URMg==
X-Gm-Message-State: AFq9FYLuUeR5hNM3Xdc+PL0Aql0DvkxPVlYh7D9fATthLLbd4UiSGB6E
	exDRqTxCfpiuOeex+qvBY43CmfAhvpqhZrx53PULmYKI3ucfHuNynUxP
X-Gm-Gg: AYBFou3PxZ9644Bqdd9VZe57I8UpccMS7xNoxni+r+PVP8JwANi1z98SueTDOUfbLT1
	OcueM5aCYB8MgJR/8LlaeVVNVYcNlfIVkSMZLL9P+Wj52ZbHgt9S+Ae9w7UnlR45ntkdpwlxS45
	WT9SF7VPsqXynon93w82lf3JAd5sCS615Dxd5dYkzI03KTsjQ46Mvb7jLGL0L+wWnCunbuilcXW
	dEzwUVvGkFamSY9alZyqrotskYu0UaCfQMhm0FdRbsgahaibB+zdguT+9YXeDOrtjpgC465GDAj
	G43hevFHDSvZ8lITyPtQVttGGVLiQaoUkgyJTgNav7mXjNnfXm4vnmZZGL2IrcmuxpHfdO796Vb
	ioZMS8jCcxFJWAPae9w2+KX+ip3NTFxGgpxuCyNWJ5AZ5216+QNNOL97UVd/sdca6au/EnRZlnA
	12/b405tUfNx8N/3Xrv3FX3aoEgxGC8GMfuOjo0CODAKlKES8NSxx4MEuEa7P7eJ1zl8Q1gfkU/
	n/PRal50N6t6MmhXSUxuJw6Px1qSwKBVWfxX2S161nhf6pHk4dF/MvaTPXvEI7BB7fX4Ve+cWW2
	WZlCYobYv+hWTkIG3AjDyX6aI5cN53RzoWy7TYTHQpnqn3M/pHs7g7GuO+n0crbd+lTAEbeX3Ib
	00fJssoNMiQ==
X-Received: by 2002:a05:690e:4553:20b0:679:b69a:99c4 with SMTP id 956f58d0204a3-67ba4c90a51mr451158d50.9.1793333045725;
        Thu, 29 Oct 2026 21:04:05 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67ba74e8dacsm320747d50.10.2026.10.29.21.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:04:05 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 30 Oct 2026 00:04:00 -0400
Subject: [PATCH v2 2/5] alpha/perf: add sysfs format and event attributes
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
Message-Id: <20261030-alpha-profileme-v2-2-c702f1c65272@gmail.com>
References: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com>
In-Reply-To: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com>
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
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKeiOtbz9hurFbKEjH1qaqb4AoJEd8s3+nXBVetnPcs3
 6kmcN2qjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmAw8jw7Q1x6Kz9k
 092Jq4v19XvP+pDVMG6yLp6n8JXxhjNjBx1jL8ZmvZtPG9/YEpsazTtPVcQzROlcSztt1cnVcw/
 UCC+oTvnAA=
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

