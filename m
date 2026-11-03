Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738272;
	b=iCf5hndXBIfjmpa0AOVJogqdaPZjgvEr36EWvMDh8QLdITQL6phWj1JpNnxvTnx0qKPz
	 90K8NfOBwHzSFfyNJzuMF8X7L+QobvflmM8gelHUrktiFUtAqf7GS7ON89Watcf1vSgFc
	 AIVBLfXKAGdajiNluTt01Wg6kCyTsJhBa9GGpJ960MckKZsbYGaK1BIWLCiXgTqjZU4ec
	 MM/8K0du4B42NFgXT6iNlF/dIxR78x+Ohs2frLFTvp39xjs6I8V+ndd7JjWPrIT9gesLE
	 s2gNz/AdY1IXnCEz71ILRdkqiZ08Q0fKkshszM8W4jeb7NsUiK52iw0oJGdR06DC9Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=wD/NZSLJ74kt14rOW8j6I2FfMavh9La/ykqKbtBHt/Q=;
	b=qOjNF90mtF8urZqOqlp89sqps2gSRnMu9hnSTZU+gw6yg3NxXhE04QT558V4iqChHwtb
	 agG11Y0zNOtdJoUNT1N6KrUUde1kj/EDEBJTsQ42yfEjRHbBDMTRDT5od1MrlATRx7dq4
	 SvwqXGm7tN/RTwiLIUipDHneIz8o+DLOSgUz1X8TpAVUkod5JioprfeVupugp0zoI5PO5
	 IBSX43+yKWfOVzHMCASPZeWIf0PBm7SvFl6Y6G909YxuzHvXYeD4wzZsAFCUeix1pzCdS
	 oE6Z1zHERr1+acfXYxTQSVfJiV9z4RbHZtkW6fqE8od5Yn3UKKAHFtLivDzWXg2iXVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KxPi6lEa;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D295A606EE93
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 20:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D295A606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KxPi6lEa
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ab43af5e97so14887667b3.1
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 12:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738271; x=1794343071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wD/NZSLJ74kt14rOW8j6I2FfMavh9La/ykqKbtBHt/Q=;
        b=KxPi6lEaLKPjN0PkSLsBp671nblr+VHDn3O8T8vQFj5Mj4Kyv0Jk5av4BW6aXr5QDy
         3aoEf0tOd1mO/x4rgXfdRsqsl0YOsE8ZGUpnm+to/7KS9rmsdNkmmtKBR7yXrN7Thipr
         qele+TWK1YYJMs7WX9frI9uKqLd2+IsaqOU911V8Q/H6MJXBz2mF9UawvRraVcIl37UE
         ETthRJpBw6cJZPaVNuWZ7ySdBJrdTGF6KQsOvZWdtTeLySPz6molhz/lG9U3j3FXU0iT
         J0dw3pQ+Fy76fa8Ma6COZsbJAwfcfe4pkkHamOnKOGc6Xom7m6XH+AcfzF0XOooyqok0
         vnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738271; x=1794343071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wD/NZSLJ74kt14rOW8j6I2FfMavh9La/ykqKbtBHt/Q=;
        b=KW4vcH2qZxJNfnpWQurvgx4kbcPDQ5LJA+gFqo55WbLGItrvjSLhfPwSaeypmBXPAe
         u/+OX0fU0QJC31Dy7ZIfo8dCYSggXe9NZnWTy4CQRwGDINPe8EjMA10vzJfYBta7Nh2m
         QoRYL1hKaFyOn0itQbDxnmyuYyyh0+WNSBHQprqMjTeCyToYGdbb/IVvp4i7IeymcmfG
         XopX36OdezlE7NEsmb0UKLuQNsNyU8mcvWYLA5+YmpvEH+EGUuLAT3gmv2cE7/4rdwwk
         wcabh7ihocrYelSz3ZQI/ecr6zdEE0/EUWMd3h4FmlAh1s6CutzB97Kah/u26zzDll4c
         WrGA==
X-Gm-Message-State: APuU4Z+bN7fnc3kAmANhZJff3JBmiqy8kGDfWgbRwnXeihr7+g7Y/mwP
	38Och9K8HOdHEIo6eU0uZAauHRiqgjkuf9i2MX7EYHq3ogxa9aNG2VZVhXtQUw==
X-Gm-Gg: AYBFou2vVtSk8E8itWFsqw6U2q4R005sE0T5rqw6vGKwlowul0o92wUdookrdXoUJyY
	RzKw/QdfpGqPgflsKp5f0u15zoLpeKL3oElk3o8flJmhBLTdKmX9R1O+hwE/fgHDuWwN2Yx5GIS
	ChxKDWqsV0v5xbO30z5OFF+GpilOQzxufdyQUAxmpfBhogUmkz7CzMBnpoSA0BIGusI1AMocRhl
	dCkNs/dI20nYIAS1hEk6BXXmCsVes7O1DapBcQyPqFDX8voUIg8HndDSCbFQ2Se4Yh/VcpU4p/W
	WvyhbN+sJ/5vjWlaahoSLYvUIFPrMhYYRW0XXBdYD8gnAkBmbC8u+q6hZcX0FwDuBq64/IPKJqt
	vNobACv0dMmaHbh5kikhkcS/iuypSnn5ShXI6fXMmK4jydW+y2NgWlsQEC+GKuHAcgl1YvJ//qx
	s9FwBJYsTpc4CPEHLUB063HLpj9hWJY2pNXJNXBgT+V8omaJ3DWbqwU0KHlJVj0fn/UFJa1IVyz
	nVgq5hI6bHI3HT4OON8tioIJ9k4HRC4/u5Tge1f8Q9hbZcyWMeidDRjdkHJnq7sg5XhBXVXXsMm
	bqf2Z+9BjnYK/nJoqUfr0G/zArsDGiFdeBkYPM6iENQLMWTWvNFaVEqCJStOi6I7NWhVDs0g2RE
	li2pjUxl5g/5U5fbD7TiHGfl/ZWNtub4=
X-Received: by 2002:a05:690c:698a:b0:8b0:a30a:7f31 with SMTP id 00721157ae682-8b2b679ba96mr91098437b3.29.1793738270783;
        Tue, 03 Nov 2026 12:37:50 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3099ae415sm4581697b3.35.2026.11.03.12.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:37:50 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 03 Nov 2026 15:37:41 -0500
Subject: [PATCH v5 08/11] alpha/perf: report the ProfileMe window count as
 the sample weight
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
Message-Id: <20261103-alpha-profileme-v5-8-bbe3937fbf3a@gmail.com>
References: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
In-Reply-To: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2519; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=jH61n0n9TnfpjaJzceHF3PJ4Sc8GPXtvT2ygGVuAD3w=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJeufHFB3oyKExvn//k9xezZw9+vvH+GH3AuGFXaAp3p
 wzTqXtNHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHNN4DZGhhVuh5Y1vT
 7DUlwd9dN4yqf9FedeGJk1dfV/vBJ/z0mZ24Hhf4VZ9wZzp3B37hK5fVr/vrssPSO8fc40qRu5X
 tp1pkxv+QE=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

What PCTR1 counted during the ProfileMe window, the inum retire delay for
cycles:p or the window length for instructions:p, is only available in
the PERF_SAMPLE_RAW data.

Report it in var1_dw of the sample weight, which the weight and
local_weight sort keys read. It is 20 bits, so it fits. As Alpha is
little-endian, this is also the right value for plain PERF_SAMPLE_WEIGHT,
which is what perf record -W asks for. Samples that fall back to the
interrupted PC get no weight, as it belongs to a different instruction.

Suggested-by: Ian Rogers <irogers@google.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 6c74f67ad341..c2c367b51617 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -1030,7 +1030,7 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 	struct perf_raw_record raw;
 	struct perf_sample_data data;
 	struct pt_regs *pm_regs;
-	bool pc_only = false;
+	bool pc_only = false, exact = true;
 	unsigned long pctr_ctl, i_stat, pmpc, ovr, pc, saved_pc, saved_ps;
 
 	pctr_ctl = wrperfmon(PERFMON_CMD_READ, 0);
@@ -1077,6 +1077,7 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 	pc = pmpc & EV67_PMPC_PC_MASK;
 	if (pmpc & EV67_PMPC_PAL) {
 		pc = regs->pc;
+		exact = false;
 	} else if (pc < TASK_SIZE && !user_mode(regs)) {
 		if (is_user_task(current)) {
 			pc_only = true;
@@ -1086,6 +1087,7 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 			pm_regs->ps = 8;
 		} else {
 			pc = regs->pc;
+			exact = false;
 		}
 	} else if (pc >= TASK_SIZE && user_mode(regs)) {
 		pm_regs = this_cpu_ptr(&alpha_profileme_regs);
@@ -1119,6 +1121,15 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 	};
 	perf_sample_save_raw_data(&data, event, &raw);
 
+	/* The count belongs to the profiled instruction, not the interrupted PC. */
+	if (exact && (event->attr.sample_type & PERF_SAMPLE_WEIGHT_TYPE)) {
+		/* perf_sample_data_init() does not clear it. */
+		data.weight.full = 0;
+		data.weight.var1_dw = (pctr_ctl >> EV67_PCTR_1_COUNT_SHIFT) &
+				      EV67_PCTR_1_COUNT_MASK;
+		data.sample_flags |= PERF_SAMPLE_WEIGHT_TYPE;
+	}
+
 	if (!alpha_perf_event_set_period(event, hwc, 0))
 		return;
 

-- 
2.55.0

