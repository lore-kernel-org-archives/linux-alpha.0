Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939429;
	b=BTcwH9FXn9OhF+V0GAzpcVql43EfPzTAE6CW8+WgeSePN6gD31/cY5TOhgL07pAgLn6u
	 9xVrFOJdXcYPawjHlIGLxgiXyUb6+MpHgy9sY/iW3n/k0ghb7RHGasok0uhDxO2yqL+ty
	 kzT8NnP79pya42VukuXjiXpm9V7/44EmOKQZoEjnlL1Eqkv8sSXRf11q6AKVX/O7MeP6o
	 3c4y9jK0+yJsnMQ1Q1pVL7gunyfs8aSCFeAyF/x/4af+I7U47L/i6ODmWJYcMv+G8pj+L
	 zcgl1hjVHbX83jUax2xEnUiAVW1XAGM3GItTBEguNKvEDWJdGyLs+jz3GBrg7gIq0mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=7G6ubWNxEJnm/5usRwRUK4RV0GJVedj8s47HCFOXdQA=;
	b=daILef720YbS1TZVBRHQfZ8IxorRPAh5OXteHx1iK0v0sV1CX5o3mIV7UPpUpMvYXs12
	 cBIPy/jK5bm2ppOyAfVPDO5LYTt7dAmygdqGpw1CSYYQ4+J4VLWclSrdJnUfSFi2x1/rk
	 ZJtTHPTOh7SAp0sTtCsrUHhEcTkwlbyqdRqj3Tx/8zkIKaNYRs6s9rtVCUJLQqbFWwFIi
	 b86PD05nxxfZInKfv4syZjNOMfVogHFLX2Hg0/Qwk49WOnTmF1oRj/mzGMqIl/sP1FE81
	 3ezmFXqZnJ6oXPt1I1xJSVvDeO2VJI1+p8IVDP5ax51AfT92bt/wHxvNwF6ccha2PNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LxBReIVM;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167BA606A330
	for <linux-alpha@vger.kernel.org>; Fri,  6 Nov 2026 04:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 167BA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LxBReIVM
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67bf3c6654fso224041d50.1
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2026 20:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939428; x=1794544228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7G6ubWNxEJnm/5usRwRUK4RV0GJVedj8s47HCFOXdQA=;
        b=LxBReIVMNpmlU/klkL+H0PKfZ/be2sJv4OxjMB6EfEEZjCNETRMsb28aLoX1Ve4FIQ
         DgYlQStQ0k6zWe/2wWO4rpWIq85UcsMJ+Smo2KG41zbeN3pewgdqs4dOXBKkjAVwuTlx
         cxrBUZDXT5EA3FnOi8SmU6vLED1numPmREWy5Hwr0l8rfegQWdkrZ7fHWf0c5VEPucT5
         s/yWWUdMKGkPlvFx66eKxnZIXcaUTKIgYlipbKlrOmhWRbvxWlcODf7nG/MHBPYgfC9T
         s4rq5SHvp5YonkkUh3N2sFOcj8QklxYIlJnLhMQj/0eAmkqZRo4TOaB1iyK6b3kStICn
         8B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939428; x=1794544228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7G6ubWNxEJnm/5usRwRUK4RV0GJVedj8s47HCFOXdQA=;
        b=GFdtUxV9gDUR44q++d+8niOEn7f0lEPSS/GKgEsjs/cikZdj+WPSF25kDE11URUElU
         PUvXYntslRhggMvhiJ016XXldb/wAtGq2aLclA6IhckRfVTZVSzxfGpEbRtPwQXsKaw6
         zHEXMwxlAOc88Se8eubXwsJQMS8X6GVFBHXqsxSzJs6D4WhIdHoxxP2eJ/Y4Bzi/yJsr
         33G5J3wbeaWlDey7wfWycjpAooWZLruHFz4lMlbhThwrglDeMzoCzRbEVHryRyX54L93
         FtoRmvariCve+1m2KxTW5DP3XzmsExGqTPL55+yP044zydKWs83V6ir9hglQIwxoK6t3
         7klA==
X-Gm-Message-State: APuU4Z8pIMyGTTavEWglDRuPFHbuBB7PZRypJ/gYm/qmSuAlfEbCJvDQ
	a25eY7lbqIbAkX+UMROQ9Y0Z328Le8Akq8G3ar/274SvQkPu3IZg68uN
X-Gm-Gg: AYBFou2/Wbosr9Ul/M/hFiGNULCdBPIb9y2EEkhiNL4ndEkoSV2JzPam7P6U/SZPDE7
	omkcUtgnxzS2B7sp2VUMbz+1fb32NsOYaWixGy7yDxT372GcVpAHtU++PDrL/vFGzYc3VXcOdS5
	5OZdkgEL6bh19oXh3qwyh7IC53pp2utuRFuheNsmD1wGVOlBaW2rOA9NXmssKXdxLiUhPMdx+vl
	kpe6Nv4K5784Kn0LPaqew9CtJcYawlH/k6/3MBmNwNHB5BnGQljF3KFd9qYXpfQnQ8qI5vSXArY
	LM8I4kIKFyg6+DZhQs7QhqLT5Pb9WatFtNs4yEk4l6HsGfihNBLqJZZElch+8/2nlGI6V8G2uBN
	PZphB3PpSoe2gZeu2o0M/BIAeYuvXCY5WH7Dp8GYA+O+/Hs+SrAfTsMr5xoIrBMtNMEx/iCykje
	avOmP1Qp0APfRNxj9f1Ft5Ix5JDNiI1mnQ4bsKE//wQkyOvdbGExmfk1LJv15wudGcR1ESyKJXf
	KMMdcqpSfgaPTnI3RSXX08I8zk6m2QZ9dWUfPutKIWTQt3KzbhLX9vLOHHEZFs5HCSFXBaBKI9F
	DgvKo+6SdMicGX4eY8vGXBhpgqbpqR5V0VhELJ0sDvJ6U0M7BWoRRiyjG77IMci8STSc9vxM0CG
	8zjkgxhHJCA==
X-Received: by 2002:a53:d9ca:0:b0:679:f885:cc16 with SMTP id 956f58d0204a3-67c14442d1emr555370d50.83.1793939427978;
        Thu, 05 Nov 2026 20:30:27 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c135de73csm1164634d50.18.2026.11.05.20.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:30:27 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 05 Nov 2026 23:30:21 -0500
Subject: [PATCH v7 02/14] alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the
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
Message-Id: <20261105-alpha-profileme-v7-2-c474e892abb0@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=55HbKGU8JmFCdaXO+TdbP25wCaTvQMNhrLfu9ImNY30=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLeht+JfOuxdt/+L2WP56SUS2kkXjR7yvL9xPXbNutPN
 TUtb3pzuuMjC4MYF8NMMUWWuPWKLLPadiz1OS39C2YOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MwQydIziIXJ6DBqZxcWlqUW6aQVFDnn5JYklmfl5xXr5Bal5BekFemmZaSUZGflFxalAI/TyUkt
 MXR3djAwNTCwdLcycLBxNTZydnQyd3BwdnV2djCzNTQycLR1NXC3NGbg4BWCusZNjZJj6+V2twO
 yji+6ZPzkWfCYpT9LRM8NpxcvrIS2B1ikZTVMYGe789OB9ZLDPJ7IqcGO4UvHZiV+fX/4cULmi7
 K1qTFXaWhYA
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

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
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
index f77abeeb25b8..bb0692e93748 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -734,7 +734,7 @@ static void alpha_pmu_enable(struct pmu *pmu)
 		maybe_change_configuration(cpuc);
 
 		/* Start counting the desired events. */
-		wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, EV67_PCTR_MODE_AGGREGATE);
+		wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, PERFMON_CMD_LOGGING_ALL);
 		wrperfmon(PERFMON_CMD_DESIRED_EVENTS, cpuc->config);
 		wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
 	}

-- 
2.55.0

