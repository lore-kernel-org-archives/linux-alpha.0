Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818171;
	b=lTXCuG+ZoL79z38pMuMInrLs33xGOE/iZoIy6B7N5IQAwru00GcUd3DH7uZ5vuaftblX
	 4psktkLvuyOE+iHsnmNLsmaIib9KU2u5r/xPHUecNONo1GshTY0E1ADoiae2B/n2Z1YrU
	 m4VvoOWIg2sDrSV8awBz3AOpH1ULLsHIYLwrF+UnjiLPQY+4d/A78PJAtLv+82IdF92yA
	 b9FLQpodrdE0TGjw4H0lFTjxgdMeRSR4vCjToDHk+q5V59v7IjW0rpC4Ko28vBuz5mVTO
	 6kI1b+k4aV1yJiMm4dGCN7h+BdhzNlvNtHRMoIRni2OHkDM/TzUZx5I0EW9KDtk075g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=yqpx/mpDeXMZXHlMMGG8fT7M3snzQ/eaSZH/S7I+jLw=;
	b=jaFDJXtUYY+VmadyOhNggOCvtOE9I3m2sfM9aW0JdHbyZJfFpEeZYfxKI0bw4PY0wclp
	 Q+AJM0V91ihiPU8Folo651f7xMDefsIZHvbqBoWiDijdRHUUzcAGF4qmP147/qlMnUMCA
	 tunzGzFJ88jR/CAY/ci/wTJzRpHk9SFNqi40oHMsEFR4rlWcDxefDJpYBMaxzQ/kycdcl
	 9Yq9o7Heosevjt6ENEDrFL1PQR+CiyVd42RkDzCvuTeCAN8WZ3YgvA9s3XwsRrxR/rOp9
	 objaz4gMmIWGTnZITcXLrPBSCewVojeq0EHfTKQXXuhG0UBe55tUT167MDtSwdm3ZHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBcvN3bX;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778EC6083600
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 18:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 778EC6083600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBcvN3bX
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b0a921ee46so10485687b3.2
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 10:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818170; x=1794422970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqpx/mpDeXMZXHlMMGG8fT7M3snzQ/eaSZH/S7I+jLw=;
        b=TBcvN3bXAtfwxVhcDIjc0RC/pX42zn6EaoVCD84MEzTO9LjZOK+EVZ++2sEVgjYu0H
         epp+4/B5E5wZSc704IMncCP9lZa02Vr4XWgqs2bPcF5UBV4+KI+VSZUIFuanYTx28y9C
         TLlCvsTK9p34Q8Zm5Pvp8Z1YHVvMQca5O2qji3kwMOy8Z3ywh4XFsrb492G0yEX67vM4
         3CQA6B7vBVvRLbZtfjbzwnThhfc6j7lSV0a+ZmmbQCH5T0EXSpqWHB6rASCGIctZZR5C
         GL08OMePQxiZwA1QIimhGY3G//Vj5Zu9joAZDTuqbyN3BfeCMOvUtZxib0gVA7tX+nm7
         g/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818170; x=1794422970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqpx/mpDeXMZXHlMMGG8fT7M3snzQ/eaSZH/S7I+jLw=;
        b=oHppvV12r/eTr8ms517UfOiuucf7sRS7OK+lcJSvXx7c17axmey+FpL9RAEy4WBFbC
         xDFc2YZWuge23DVyXnZW4yH3Xvu+bdezLyX96Geohy/1nwGxUBPHoPESSmtF511V2+UC
         mIlnTFTYYtGjsvlLiffS6V6+VV8HwmjVF4vZtKQVdj59BRYk8CcB4Ry/o7v4Gs5mwvJy
         s4LkHS1k5GShEid0oJ6rb7AdZI7RacDw8P16p6nQjr0dniiHiCfQA3Cqkk++xpH1YLAs
         gDcC4bGD/2CCO9YVwX0WydgVX/KpJ6fuX8TPTwCztDYnuT+8yuv1ML63ZPvG8V5KXgDz
         J+ew==
X-Gm-Message-State: APuU4Z8jCbiaF797g89K5Fx7SyVyNwN4yyxiCpASNKfqJV3N4C6otTVU
	91LYAxmjOCfzaui6qpBIHA0H1vbz9chic10CtnuHtRHc5CGJo9fnRCTB
X-Gm-Gg: AYBFou29hWkfgx/veAfIXyvuwFSoPJIBd/6NRXkOb/RrQHcU8WbOQTeuPc4j6a0Kz1S
	FoHGC/JNXOFs7zsVKIvlVeWikZv9oHpfckj62+dD+KKUwxlH5l83dZr6us9lnZ4MQvHBSnC//pC
	c8emOsgwX/EZ4t0fay4qAWDFkFzlCcb1IiBrz3qxJZw3iU/tXXk8QpgDeIJDMYKTSPlCrbpBSV1
	4cOtDjovu+W3DcfLaxDyOL9sjrDPW7emXkCBhhb4tRq/dv4hDpENPydmHnDvgLRPpA9WrRV2/Ux
	A6yUP8C/XGkhMiT6GJUY3fBLgtYc8U+xxJ92Ijf4zD7yXY8oyofhUiK0FiTEdbnP/9sqK56vMMK
	yOpHP8pTMKqkd2HB1M4PbVqxazrtBn/ScmS7AybQ6rptTIm7Pk99NEkfRBEuq3U8shs1zTYuxF5
	re06kLnKGoj8+yEHQEzawGZMbENPYzEvBuKRppbRe6B5ksi+Rk6kHIuav252Umh09qRudNSDmga
	LKxoFeGAxuCdgVzuJPhCcMRiTviJBEPffy0H+sGlOj9K2yJBQQJBdIzwLM/CMG9fQc2zv8cXf1S
	m/bdfq3DrYXrGKfj/oXkk+dcv+fAtg+1qRfbYXUm3f8yU1Y+pbCNki8V8YRufz0f3pLIIiBPYZ3
	X3M847BVPLw==
X-Received: by 2002:a05:690c:e0dc:10b0:8b2:aea2:64c5 with SMTP id 00721157ae682-8b2b67a4c2dmr71395087b3.96.1793818170428;
        Wed, 04 Nov 2026 10:49:30 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee28e4e1sm1983347d50.17.2026.11.04.10.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:29 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 04 Nov 2026 13:49:19 -0500
Subject: [PATCH v6 12/13] alpha/perf: sample only retired instructions for
 precise events
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
Message-Id: <20261104-alpha-profileme-v6-12-63362e9290a3@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=dXinNQWRSOHUF7W4/7e5c+VGWyfWHZj2yb6aCe5eh9I=;
 b=kA0DAAoWrOspdAyaTpcByyZiAGrrfiWhrdh1ohcZkL3nl5+bqVxZIQ6Hu94iqr9FHGv6llraq
 ojxBAAWCgCZFiEEXq8hBJqGuKVMyxv6rOspdAyaTpcFAmrrfiUbFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9wZW5wZ3AuZmlmdGhob3J
 zZW1hbi5uZXQ1RUFGMjEwNDlBODZCOEE1NENDQjFCRkFBQ0VCMjk3NDBDOUE0RTk3AAoJEKzrKX
 QMmk6XxhgA/0Y0ha3Nl0y6k33nwxDP4L3wVWh6lAWbgaQRyd3mXDqfAQDnDfnx3+h6FfO9gLlXj
 IESk2GyTMmJxMsvAjrGdXOgCQ==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

ProfileMe samples include instructions killed on a wrong path, which
show up as hot spots in perf report although they did no work. On an
EV7 loop with a randomly mispredicted branch, 19% of the samples were
killed before being mapped and another 48% later.

PEBS and AMD IBS op samples are of retired instructions only, so make
precise_ip imply the retired filter, unless filters are given. The
profileme bit still selects every sample. With cycles:p, both kinds of
killed sample went to 0%.

DTB miss samples, whose instruction is aborted, are then dropped too:
cycles:p reports DTB hits only, and the misses need cpu/cycles,trapped/p.

The kept samples carry the full period, as do those AMD IBS keeps when
its swfilt discards others. So in frequency mode the sample rate, and
the event count perf report estimates from the periods, fall by the
share of killed instructions: to about a third on that loop.

Suggested-by: Ian Rogers <irogers@google.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 32a8b5c98381..7e34eac0ea47 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -837,6 +837,11 @@ static int __hw_perf_event_init(struct perf_event *event)
 	if (attr->config1 && !profileme)
 		return -EINVAL;
 	hwc->config = attr->config1;
+	/* As with PEBS, precise samples are of retired instructions. */
+	if (attr->precise_ip && !attr->config1 &&
+	    !(attr->type == PERF_TYPE_RAW &&
+	      (attr->config & ALPHA_PERF_CONFIG_PROFILEME)))
+		hwc->config = ALPHA_PERF_CONFIG1_RETIRED;
 
 	if (attr->type == PERF_TYPE_RAW &&
 	    (attr->config & ALPHA_PERF_CONFIG_RANDOMIZE)) {

-- 
2.55.0

