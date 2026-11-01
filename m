Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561290;
	b=rUbmjvSsfv32E1s72P9sGtPFlxQP9hME37l6BGTOeHiadkj11A83mgoMog7A4U7eq+dF
	 nYQLWbd97Ks3OTg8gVkfkRUHvXXwfz7f3A3avjYaL0KHZTvR8qx5tt/FFyMqmvzHqN7Es
	 Q2Mp/+LxSUOiID+VJO1qJ+85F73O5WMkCOv5vIICqO3UxVEAVQ7nx0WU6thMQ2YBFIt1v
	 XizfkHA5ROfngQ5ILSeUwBSR+4KNTORgr33F2JbiiGUsISAEVcm32eLUj3+R0IsorAop7
	 GOZy35olMYqSpphIT8hc4R6g5OHEF/Jta7X7GJozZ9L6cnHHtd3kU7kmbmN7IzURPcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
	b=0zdLgNwUN/gOFJTP8FoqLtkuBNStEdH5Vc1Clveo2at1clWFWd85O+4FomGQI2dRwr6s
	 I/2Pq6vPG8vHdSlopWUECUGmRIRIwJahguOb7+RTPACZ7trL8e9HqFmOTXwFQ2Ls1Y88c
	 SW7r4QgngiVKzk9HXioK8HRxmOtM6E2+p5cI9vzxnOtnaHgwtu3x9VEkS47FZAE9cn5vE
	 9rdRRgDwNV7yejkBQHrpY7sn5netiI0nxyv5ye3LH0QrwuT4R2HNNdA/V8zkQJ9wxR1yJ
	 HET4l/7ksyhL2Me1govzrPDJC8ssdSUciCxbbTItRGWTE/Nxr8HT/kGREfEG8UCv2oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zURuGlF3;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F50606A332
	for <linux-alpha@vger.kernel.org>; Sun,  1 Nov 2026 19:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7F50606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zURuGlF3
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ac8a2ac52bso25328287b3.0
        for <linux-alpha@vger.kernel.org>; Sun, 01 Nov 2026 11:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561289; x=1794166089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
        b=zURuGlF3OtPn5UpMJ+6asPaxDlkTRbDA7ljsjyUXB1Yo/YFqsJnbEYE2GbjrSFmrWB
         I+0mb9kQ/0NyVhqI7mvyPjLDr14oJ8M6z3fJP91m4kkB8s0b0wLBg8GRj8uNg+cQ+Yfy
         VUtRdWKf6OieVWAFe5q2OQ0hqZz9DF/AMioIERCIfSc+5qsKPKIijbs/q2WhEfeys6U5
         oBi9bJhK32N+vsi3POW9jiTvVFAM273zSW8sWULLRLGzz8I6WdzNadGTBot6XjLgPVYn
         xo1+TvtSThzXInTtIVd2Yj9IXO7R8e6QexbSD6iO49jgRBpntLSlgbd/HYPbIYLMkYsT
         Hkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561289; x=1794166089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
        b=xuMVKnwmgS9vFw1YM0k8017/PHxapRIvwUVlfEPgZoGRhQqb10l3v6XQKLEXUK4+wb
         5X42yHqfKVEMou2cXo8CJKPq6Z71BxEOMDxSwsE2W/TgoeL5Y0gmXVn+tHtMZkHey4aR
         68gTSGk3meNB1PytdqDMChO6g44vRJ4jKPDsKYeTV6N6kDYGaLnluPO053ouOEBKYd4b
         45z7XRy1cvL+m8zQHmGW8tzJtZGElr3k3Ogcviv1euzaZ4wWIL6EDUmz6mCxQuKyWdk7
         yOp4x6c5CkNwFuwO4caMZtILELHASEE45MmaXx1ZVRPUxyMB8Drc7mrQJinN1ouhqFR8
         5jUg==
X-Gm-Message-State: APuU4Z/qCA3OzxrFNBQN7CsNLaAPMxweKF9hJosQPQRx4aHdNaxaTXRY
	VcPLn+SDucukJkM6tz9OlCGcLyq3AYymjaPaQmSdQ56co1S52HtvT42H
X-Gm-Gg: AYBFou2iZfPSbbY/SqGqXDghuRt4x9gZ6toOdSsLa4O3duW+V2uaGbE3fSpEK9oBrbU
	E0z+59Y28WhjHyNMVupgkHCRC45S9aYKUK2+d8CDspK5VCuMBfiSi5kqLJvnXcjbtX1b/9MhDDj
	5e1KoZiwcEfUzKuSbVE22NAVv3b/Gpt+1qEruwYD7K85ZPQzT54lVtKeiZeios5DDpfGZ3Ja1kC
	IrgjFKV1TRsV0AF4zyo+cO0cfe7WSBaBxTUktGIbzpoy9vtsvN1yInZmYDPZMdjxY0PbiUU0/kt
	WGwKc8ytmU3iPdAZ6eSTcau/FIZuVGuCxgJiVf3ZSs2vjlNK9FEG4y1zHB1CKtfBEOj6fIlC2aq
	jO/ARrhSWrjX9DRmahgI/0WVFJGIR5unjT/yvU5eYLLrC8X2qkXRTAgKhO9ffYkIDdJzW5ufNzr
	CLr48t1YclX+mxsf9pku97na6x5R/1rBBOL71lT8BpOOtXMS0iO6QWUNJddSmv0pvr4g+i6rj6b
	WXSjP0xAcDXwWljipuq9sTAfldlW6fHCXG2TLIJns7j6rfrQ6tgUyl6bcWTcSJtQojYhuKcfH0i
	ARe2D6dss3ZXuudSDXyUdLlRyYQa6ePoVcs/uEOxBa9u+fB2dIIMBgwA+vsJDTic1XtlVJnrZA+
	2lmeqM8qZwQ==
X-Received: by 2002:a05:690c:f90:b0:8ab:3b98:5a30 with SMTP id 00721157ae682-8b1c68babdfmr78540977b3.33.1793561288626;
        Sun, 01 Nov 2026 11:28:08 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b71240bcsm39775747b3.9.2026.11.01.11.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:28:08 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 01 Nov 2026 14:28:04 -0500
Subject: [PATCH v3 1/7] alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the
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
Message-Id: <20261101-alpha-profileme-v3-1-92d511b5a044@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=IGfq8dWu2iMEFoz3MC34tYu6sOJyy2DqaUpgqZ45fio=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKeTzo6UdA79u0Xl57CUwccHAWMwo8+Nik+4rVVyT5Vs
 DpF/OeRjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnG3oGR4YRDa1naVf
 Zzz9eJcRUyhLqsfxRmm1K61F7qd+WbsOzm+wz/TBsnPDzUoxCYHX3W1/j9TcsrEQvXLilY0Scke
 eemwVpXdgA=
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

