Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333045;
	b=UIAIMeVqGjnBAAsvk2KOIGtgEFxBYpG4ZuhN9SQ0Rd+aFXJPARe+cOI+sC7k8NxulbnJ
	 57AF6E5xo2QgbeonXHdNm4eDKfqAxJpRDxRd/kMp+OJUFM1WjZBK10NwaxdyatIfBeOyy
	 M0EsrK67R3yVptxS2phBYVW5GitgWUt19BoPaetO513S9uG4phvlywZnoBb7iJX/rj6SC
	 NcCk9U9e5ht9oTJGF6AZI4/I+EDa9M1nvgooWnCVWWcc4nk7bUInWoxkQSb5/oPTP6+gL
	 ucM8DvEX9yH7Scp0nGjW8c4nTZCpN+5vGYyZ4jzt7khrWdD1Al9MbKLDgyyMT6xm6xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=8JGmzBUB1ieFXJKy/CxNfd2X1JHTYzvohjQ9M74SDtI=;
	b=jCFPY6k4p+JHQgbA9TPJggNAPIzAWzVSxO1kHz7xp3BgZffm8A00Uq9LF1Y7LA/WPqYe
	 VDrbiVfkEplfe5RHhL5e3QeVkTkPuCeXrk6EMzGNeNPor9t4W3g9awMfbxnKM+EdI9iSA
	 Ma2kH5bm6aXrOSDFHSQ+L+h5dYK1mR0rknbLBP3sdE5MLNzjLgEtA9TapmtHZ61jL3CqM
	 e59fOhPTVNSDaY1i3S7E/ppIzW2ykHQc844rXOaKCWKrTpvxVQrnHqhVnExiaLnuxS4/Q
	 ApPXY62Taw4uceZjykteELIAsZvBaWKJVDEb6X39RD1gR/VaOlk0m5mID3F2fpy86rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUeX8hNE;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20684606A327
	for <linux-alpha@vger.kernel.org>; Fri, 30 Oct 2026 04:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20684606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUeX8hNE
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b125371596so11561247b3.0
        for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2026 21:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333044; x=1793937844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JGmzBUB1ieFXJKy/CxNfd2X1JHTYzvohjQ9M74SDtI=;
        b=oUeX8hNEFlszWHqeZFFJ07oNfpJ8o+iaQfi8sU5+RQ0eAVwcOeOy4Gn9pTeIbsuX6/
         8+46kGCOC23qKX3jgEKWVKH7BOFmHPuHT79Qqo7bDNBZvghVUOxf5kYXmAfWqTHtSWvg
         FcwHJjepkeXrgJiEMg95a/uweLdSZOO4oKsgrRRNY55FznKp6idfwEnLUUQZim9ib+aD
         RsyoQ27/NqCTkSuCgBuVzgPW1y42OI2RUeaN9qWvQ8kbHlthJ7Bg+iS247pQAylxp2NL
         ea3Kf8hCkw8sXqW08207zW3g5CbKp3mD+ofzrbnBv3oyF+L9V820N62lTbA8goV/OLfH
         u23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333044; x=1793937844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JGmzBUB1ieFXJKy/CxNfd2X1JHTYzvohjQ9M74SDtI=;
        b=rsGL5XTlmquZpQpJhk9FlRZlOPqWJEK37DZ44UwhklJFMtMedh/jS4VYUwACngkG3g
         2+39QDzIkePldANXNIkZmrhQMbjfuzxW5gKt0HYdYcOWdVgBU4ShprmxeYQH3QkJf2Gk
         EH8O3S/NFL0wzw/hk/eG9Vt/mU6PDan19cUgAz3rGbvJAV1ZnnnzMHuWYvTGbVb6yRVm
         eql6m6Z9tKq8XDHg1fW2w4Cigb1VnyyctdyH4X6LDZUNSED4iTLGy09jF9PAnbm6rYze
         7gWFJ8CLZXqSoCqzdMGtKLYCTuN33BzYIgx2VztPOJYTsz4oCTg6ISpQdoaCjCul1WFK
         gL7w==
X-Gm-Message-State: AFq9FYIiP7AWiejtxtX8RUKT3z1c2wMQGIFOI/+Is4KgYuIJj6VTT9fN
	11+tyt8YsOC4akthTPMaYI5RxDwDjnxP7fMjzDFcG0w9P2lCIyn37txd
X-Gm-Gg: AYBFou0HH9qO+MCeB0Kuo0334LLUca5EFTyLPpUNxvrZAOydVVjfeoS3leyvQgqoNsA
	ossK+2ZypbfgWEkSaiu/qMH8ew1GaH2WvXvG1/llJ74MskOfz/HYVKIE+tlbDmwfRfMEXiADg+d
	BQqH9Plv+4DhAdrkeV6htniAn1HyANqCmV5QBzeyXccskkYAodKeJftkAaRLntEEsZUsSqL/b9j
	QZjUiPnTsWaExPlqEp60P/bmRmWWQOBVb+i9zhNj7aX70hOi03ekfDm8EYDCcnwY4tlGwVsRVFP
	Kk6pdBr5ZeIBdw6ljOk4nbb4dF/JkZjJ+uf5Nmoiib73MKc+t0RMkx/NckZJHgo9zEMkefCFQ6H
	PaFTKXu0liz1XBsYJsKXO6I12p6lp6dHxKCGR0X1ayRo7cS/Lp10MlpbmnZQbA0d26PWbdy0XjK
	M8nUc066wedxEP6vmcOWhEScEV3faeYMZ25a5379ghNG/jz2b3eNe5camfVZay/FOugVUOXDKA8
	nOqbh6uUWcy2LfXo/NGh4OTfrRQl0e+I7zCqYlcy4j4YezLmv4EmanhQWDJt9FzzJ6yzGVJzt2r
	ouvuVbaygXyx6/hovfe2yRy/eCN8SLmpB2wY+i6qhhe72xulCS1Sttj45BT7gS7DFeJ40tILx9j
	H+B0JGWHENQ==
X-Received: by 2002:a05:690e:dc8:b0:678:fa71:2ff0 with SMTP id 956f58d0204a3-67a8d4d24b6mr3128247d50.38.1793333044059;
        Thu, 29 Oct 2026 21:04:04 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67ba756be52sm296744d50.21.2026.10.29.21.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:04:03 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 30 Oct 2026 00:03:59 -0400
Subject: [PATCH v2 1/5] alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the
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
Message-Id: <20261030-alpha-profileme-v2-1-c702f1c65272@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=449u5jI6TVHJ3jSiAT+AZJsNh6aRV24147OMwgzJp9U=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKeiOtvbdtflBS3ydQ66N+y5L7E2Lz09y/lxdr8D91O0
 3HfceZcx0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFwzZzkjw+kKhbTSmw
 s2uuW036rgui17X6V415rb7uen3Dm62P4AYyzD/6R+4TXpou+WF3Tu056/5urh51tussxIfjGnq
 1fV5YDoUi4A
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

