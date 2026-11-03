Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793674921;
	b=RgA2TALhCSKItYh1OUHD+1N0Sq9O9GhkTVT+XD7KG/bMBPbrZsOOftcF7c5eAJ+N5VTs
	 Fk1TUCirSE5zw7uxBYZoseNZB4yz/EWDVE9W68Dwyj80dD0ng5xn9ObY6CaQAgqt4LwDf
	 afHvOYNhWx9+kg5q/fxOiEd4YupIzYVZ94z9brn+Vst5W9dXFrHXxL+gu9/S7WkeO/RyI
	 OBJKQoSQgGhkont8VUdR4vkCzJNuxzdmRDQgglFttGciQnJNz28AM4hMlYWjjw7qadRqa
	 4XUKmUZKiAFhjL7W+RIeVkMmEoy12jtc7rOwIWhDI2IrgyblIclrKMANojAdNEwSAoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
	b=3TGHrMD1rfkVOR1kd+tJR/f+8zEb5RffN2K2cnc1eewGXmFWU+TfZCECP+mHP30cS3AL
	 K1CQYcgTZeaH2VvmqVBjBszHIZDRhyo3d0yq4t+E3HTUQUPrDNLhhzSTxdpCfpk6CIbyU
	 volb/IJj6pDMLT2l7ReU3reSmzd8XS2Hv3NDfEuyNudoxgDZ+a/YoqOkA9z4RUCMvpDyF
	 5iCCHYnSkvaabSCSNQduYiyIMzlCI0+RSuRvox4susFdQiHBmlHCy/z1eS1Pg1dl1evIA
	 XELuvF2cD/tx07OEDfFetlxyEob3Ijm36Ni+Y5ojspSbyc6y+UhOZhAVGNG26MNuCSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOYl4ogd;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AF5606A339
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 03:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6AF5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOYl4ogd
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-677af43eed4so2794925d50.0
        for <linux-alpha@vger.kernel.org>; Mon, 02 Nov 2026 19:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674920; x=1794279720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
        b=TOYl4ogdb19rrTANhULj+eFN1j5OWn/vev6rwdTNBzNkBSfH8SmL0aFxsrTDTjvKM5
         Ql5a14gxo2XfSne196JqzBJyTiOAUOlvPY6Jy3vG7jagqQWoWK4dhDF77N4cJE1TWmdt
         eQAEmWFjRzle3VIt+5an5Vgv2U9cTcMXnJ6epIOUBnLYrWNWZ0WNYs0listXU+3PbrIv
         Q91rbui3HqYJpn2WCbQVNIAyP9K7PWsGtSa4FwvLNiVUH7QaIO8BQ4KbcjKc7lqtkWAD
         MxXbiC5NRK9I+/W4tSciCrrhTchsjw4x6cp7V4/syYSI362SA8AnxHN6hNs8OXPfQh9D
         jUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674920; x=1794279720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
        b=gS4FkjrS/n/0bwZpS5a/6kUOt7yO7lTxWQi4HGqn1M6fr9wLvOmjkwH0xtyf+/3GWS
         PuU9SG0sSOcN/wNhCPpwjIX2su4seodKRdCJDTCAXNLVpC3J05Y4PbSyrFw1iqj1Ym/l
         /PiJqgyvkAofHWw/keA91ESrwehuSMrxLMkFqUf9heVcfflv8ygzS6EvCrx9gmiUc9GD
         mtR1bceflmv+1upP0OT7+UDVWKPfX7Ih9ttk7AvoFPPRL57tNUVSO+gqd1vtUCxMy6f/
         FlggXpN/8lJyICtBYWlX+njpBnYfVuZ7JUmNRxUctWwAflV0ssicquokxEb5WcnZ8Fj0
         o9Zw==
X-Gm-Message-State: APuU4Z9Egks5EIExlp0p2WYcaLJmoo4jMSR/0ZICr8EfL9my0xOfIUmW
	6UiH/qpNLkyvnHqSNyvlmJoDpfIC5p3kZEH2RfI/adRKOsAFhgQzG+w8
X-Gm-Gg: AYBFou11X5boVIHqsULOV+UL04qGbeKi6rK9fmZekFgKhzkAzybE4cdpj9yi/QxyK7H
	4ZCw/UnLi+wAmjvqNtailpFBXl4ZG6hF0z2qfcsAglClAR6XEQfcW4HeQNVTQzXQRGHofRpI8zQ
	2OboTKPEIW9nJUnYwmaPvCJ3TP1Ys9l03+eh0FwKCrADnu0Le34ztqwAFCDWk8KJYeQzJlgGGxF
	QQbz90lDMj8SM3koOGV6KFz3IEMH6Bg+DGGV/f0EChMDnQ+YngV3z9W0R/EvgBVoq+ye2sAUbTW
	Ix54wrgqug9P3u+f3DNM84Jgotz9BJCNboRFxUNAufLUenHDbE+1O7hjQoNvZWQTxv9sDPCrDTY
	vF3/ZrZ/FynX3qllDUW1nSUN3BPKVRxKuumm9IeE+LKDkyH/KRAJQnDzVtWBbcwC+Nbjbun7DYu
	LvsDOBIiNZFs1mVdLRRtIYH3y6Ji9ifdasaqESIWdsZBCBIDv/aW4/JpLWDTKrtzYQrEmR3EzM7
	xJtLsC3KE81Z3qi7Is765mEXUvlOALGAUbEj2log4ZJyUC4hhwZ3q6OcaUHGrnxXqGGuQhYoM+4
	Tm+qbaVn9ZPv3H5I/nTHygzZ59fE1Jc6P7MkmZYprBB6shVVbJBxTwoH9R3KlzxIRWZXlXOGj9Y
	2/RJ/G0oljA==
X-Received: by 2002:a05:690e:4399:b0:679:cc49:55cb with SMTP id 956f58d0204a3-67ba50628f4mr7001226d50.99.1793674919694;
        Mon, 02 Nov 2026 19:01:59 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf26d91asm6227179d50.5.2026.11.02.19.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:01:59 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 02 Nov 2026 22:01:56 -0500
Subject: [PATCH v4 1/7] alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the
 logging options call
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
Message-Id: <20261102-alpha-profileme-v4-1-61e00f5e1da8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=IGfq8dWu2iMEFoz3MC34tYu6sOJyy2DqaUpgqZ45fio=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe+i2WrHbee/vB7LPJ3dovXkyYGH9pM2v+5y8RCbOS6
 +78TMqx6fjIwiDGxTBTTJElbr0iy6y2HUt9Tkv/gpnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DIEMHaN4iJweg0ZmcXFpapFuWkGRQ15+SWJJZn5esV5+QWpeQXqBXlpmWklGRn5RcSrQCL281BJ
 TV0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0tzBi5OAZhr9ncwMqzbOam3NY
 QnSNto4YqX7Gv50+z9XT1+d77n2RbjUPy/JJqRod9QW0rOu3GC6uxDX1e81rd2bPrH/DwnbOpHc
 fmnLBtd2AE=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

alpha_pmu_enable() passes EV67_PCTR_MODE_AGGREGATE to
PERFMON_CMD_LOGGING_OPTIONS. That constant is the counting mode bit for
PCTR_CTL, which belongs in the PERFMON_CMD_DESIRED_EVENTS argument. The
logging options call takes a flag in bit 0 where 0 means "count all
processes". It works only because EV67_PCTR_MODE_AGGREGATE happens to be
0.

Table E-18 of the Alpha Architecture Reference Manual gives bit 0 the
opposite sense, but the PALcode in the ES40 and ES47 firmware agrees
with the above: it sets I_CTL[SPCE], which enables counting for all
processes, unless bit 0 is set. Linux never sets the PME bit in the
PCB, so if 0 meant "selected processes only", nothing would be counted.

Add a name for that argument and pass it instead. No functional change.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/wrperfmon.h | 2 ++
 arch/alpha/kernel/perf_event.c     | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/wrperfmon.h b/arch/alpha/include/asm/wrperfmon.h
index c97b82a1f7db..1fa9bc813263 100644
--- a/arch/alpha/include/asm/wrperfmon.h
+++ b/arch/alpha/include/asm/wrperfmon.h
@@ -23,6 +23,8 @@
 #define PERFMON_CMD_I_STAT 8
 #define PERFMON_CMD_PMPC 9
 
+/* PERFMON_CMD_LOGGING_OPTIONS arguments */
+#define PERFMON_CMD_LOGGING_ALL 0
 
 /* EV5/EV56/PCA56 Counters */
 #define EV5_PCTR_0 (1UL<<0)
diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index a3eaab094ece..2d9383425357 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -728,7 +728,7 @@ static void alpha_pmu_enable(struct pmu *pmu)
 		maybe_change_configuration(cpuc);
 
 		/* Start counting the desired events. */
-		wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, EV67_PCTR_MODE_AGGREGATE);
+		wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, PERFMON_CMD_LOGGING_ALL);
 		wrperfmon(PERFMON_CMD_DESIRED_EVENTS, cpuc->config);
 		wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
 	}

-- 
2.55.0

