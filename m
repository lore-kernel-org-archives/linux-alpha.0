Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939428;
	b=o1jfHdfGweah5dsncXt1w6W2IECa+6iPz3xigfIxXVIpNGoYUk/PYnB0cauOXK1Ph/Qe
	 oMel5ItpjwDgiKhtvdPf73aUrZQNQ2VDO6sBTA6Su7M863/CMI2CtAEUjddRaepuZ5CQg
	 Y3jDJ2nhRj/SdbXdtLoIM9irM4fw0CK4VcTP4Xafu+Hy8QnJxklzx29g+J3WDGAW/IH3y
	 Bgnpx3acdG8AXnt1f2US9dZr72OXeBMzbnIZSftuoBKmOqfmOm7rGD2mLxGpFhZYlgt1R
	 0+rXUaTO39Oboh9dW8tLZuw20tVYMyXT8PWhDMtKepgXT4vKkKPwGTMjsUemL55CIpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Qt2QOAvUUzC5pKhzoyVXfMO/Dg4eKNL7eiN9hGzgYQs=;
	b=k/wrZ5KORClS/Zb5/dQZYXzq6fTW/9O/Tmu7tV+0rkLha97GD9PKRhnUER/3KVfasPAw
	 uOUyMgVnTJwEA1CPt6SsEvPMUQlEFS3BpgAFKbEVFAumLZI3Uu/NElZJPs2tuLUEQ82BE
	 Y39+Upz2Cl2WzbGx3V/mjnf+KPudbTxkll2S7QICHToDN/s6yb72TwMA+9IHlrVle5yRL
	 V7XzglBc7+yi56MArmpBBWJhwm2fUE3sdQMpTy77KzThLtoQWFcR18hcck1lh2YnjletV
	 jmcrYW9Jj6Od09QUzYbi2rVt9e5U1E6jFsEnJSc2smWI2+OcrhHMTa84UrR3Apdk9kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="z7/EZw5A";
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC41606A334
	for <linux-alpha@vger.kernel.org>; Fri,  6 Nov 2026 04:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DC41606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7/EZw5A
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0d126f631so1310967b3.2
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2026 20:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939426; x=1794544226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qt2QOAvUUzC5pKhzoyVXfMO/Dg4eKNL7eiN9hGzgYQs=;
        b=z7/EZw5AeVSjyj2cUbL9QD/44z13s26wWkZjAYPzcHCBGltU0DnS9GYSkbSv74D+M4
         LmGMcEzxGU8EVmBKoTuXNdX9WfmvG5arn6lhES2REFtnoUzgFMzvM4mAOd0dKRjt+tOi
         FA9Qb3O3Y8/fQRgCSvqjsNRNr6YTAgiL5tyKnfva5W+igW8Op4V9ljRR6Zbg00Be6ir/
         VLw3z+08clxBY+ShwiFkM4W6/0Ljlehevjp/0agWuWtEl0w09dlpniRBRvmVpmPpe+WP
         GQaTwOX7nBwBauUz7dNKxvDkp9o1tSD0nNm6xlV6IfSCtNoh0oVVx74rlXK69merKSxf
         to9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939426; x=1794544226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qt2QOAvUUzC5pKhzoyVXfMO/Dg4eKNL7eiN9hGzgYQs=;
        b=tSxL58zLT0wuarpzTQ7pNobj50UBM+cb6WJu6+h/gF0eUcT3WiStAsZWNV0cwH2rxU
         C+AFAadUw2Qk3XF1FGslXrE9uhYOxoMfFLnrHICBfpT8rqhUqcIGjsxEpS992S4Us62q
         y8ZgZl2OKFMGdlPs/e8dICGUEhfpJH9m4LJxycGd/Pwpy0HKslmi6O+Uje8V0P/AvS5e
         6GRxR32TpIykCJWI0EvKsjk2x91lJxvgqTd6Qr96oQJ0s0+pradiQ87HpfK+19nq0I99
         ZbccAOsUO3SVzMxItTvjhWS8+Rhd6/JBRGhEKdOCOTjoSnXcQzF+ZQoBXetA+2xEE/4o
         3cYA==
X-Gm-Message-State: APuU4Z+XCbP0OWrMgEyenFHire1FAoDEnzZU2KT29mvqqe4mqLwT6ROM
	r2KUk2KcLpcyhZvVHCacuVr1aufGnyASzxNmDLnOKhWUb7N/4KkMJzZj
X-Gm-Gg: AYBFou06FG0odTfCfRkHNf1kd1S9U5aE+a9yan1m18pAYXstQSKlg+fZXoOhLc+ESZ5
	+HvGBlTdYDoz3cY8SukbrFIUM7Fd7vvf6xvLLsq2IPjSXhDseHSG6rLBAJKna/IBx/2iogcyUKk
	xTXJ9cKlH0tDEEo4dftzEWlaZfCtQ3jqG7kOg8XAO+btjtAGIr3NxEzIoxzJQoMq8uB7646TqXf
	n7RXr4vZWT9+asUWZHrHVq3t8U+PQ237PLHPtJa47kG1RC5nk0nYkI/xcn3iuDtJv8TW3IlQCeH
	LiSKXd7GJ5S0paEeidJ8WgGogIZmqkOX6wmHxwX5vCFtR7s792BRoSRxfEVa16OvibGlFk9FADs
	LSTfiWeOTqmq04aMkE9Kt34VAvPxhr4Jihljl9SVLZRfWmV8dfg52UZJHiPJM+VEZlGU/papQtc
	6nyo0a1unN8dDLaULB0MqAOUn2cgqm8j5JwoT3CYenUmuBZHFeRYGtSU3Ja/73149+TvNPsH6Jg
	thJAIap15EM2uAXuognlNZ/JzmRiLOLFUyPpYNKeGNpOS9slX73M7XE9tJxXa6Nf8U3HsLU/SKV
	msEWRVWNn1wyGvuy7zzmj8utDBA9GgGaE7v8E8tFC7U1EnlYuAR2xar6P4cixarc7ST/MKFvKni
	mBu5hknP4uDLjqkOI1c08DxEdb3Tr7Ds=
X-Received: by 2002:a05:690c:24c:b0:8b0:eb6d:d887 with SMTP id 00721157ae682-8b341aca2f3mr7043577b3.56.1793939426105;
        Thu, 05 Nov 2026 20:30:26 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f8880d2sm11071467b3.42.2026.11.05.20.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:30:24 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 05 Nov 2026 23:30:20 -0500
Subject: [PATCH v7 01/14] alpha/perf: do not update an event that has no
 counter in alpha_pmu_del()
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
Message-Id: <20261105-alpha-profileme-v7-1-c474e892abb0@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2190; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=wxDmak7Q7QkYBMgHY3pFYg+88iHC+WUm5Tmzae9wpsE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLeht8Jm32lm3vV6tfmAj6b/q5+sqv+hVDBvdl/PzdPW
 K/zxXR6WcdHFgYxLoaZYooscesVWWa17Vjqc1r6F8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Zwhk6BjFQ+T0GDQyi4tLU4t00wqKHPLySxJLMvPzivXyC1LzCtIL9NIy00oyMvKLilOBRujlpZa
 Yujq6GRkamFg6Wpg5WTiamjg7Oxk6uTk6Ors6GVmamxg4WzqauFqaM3BxCsBc43eIkeHnunnM95
 Msnhrc/PNt4YNb9hZWpRdEExk+qp9xllD7XGjNyHDKuTn+SAVL5bFcDrnvHZpFR49GfrCxcN60M
 beSfZGZOBcA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

alpha_pmu_add() puts a new event on the list with current_idx set to
PMC_NO_INDEX, and alpha_pmu_enable() assigns the counter later, through
maybe_change_configuration(). Alpha has no group transaction callbacks,
so the core schedules a group with the PMU disabled for the whole
group. When a sibling does not fit, for example because the counters
are multiplexed between groups, group_sched_in() rolls back the events
it already added by calling alpha_pmu_del() on them, before the PMU is
enabled again.

alpha_pmu_del() then passes idx == -1 to alpha_perf_event_update(),
which indexes pmc_count_shift[], pmc_count_mask[] and pmc_max_period[]
at -1, and it clears bit -1 of idx_mask, an undefined shift. On the
EV67 PMU the entries before each array happen to make the computed
delta zero, so the event's count survives, but only by luck of the
struct layout.

The event was never on a counter, so there is no count to absorb and no
counter to turn off. Only remove it from the list.

Fixes: 979f867191f8 ("alpha: implement HW performance events on the EV67 and later CPUs")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index a3eaab094ece..f77abeeb25b8 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -506,11 +506,17 @@ static void alpha_pmu_del(struct perf_event *event, int flags)
 					cpuc->current_idx[j];
 			}
 
-			/* Absorb the final count and turn off the event. */
-			alpha_perf_event_update(event, hwc, idx, 0);
-			perf_event_update_userpage(event);
+			/*
+			 * Absorb the final count and turn off the event,
+			 * unless a failed group schedule rolled it back
+			 * before it was given a counter.
+			 */
+			if (idx != PMC_NO_INDEX) {
+				alpha_perf_event_update(event, hwc, idx, 0);
+				perf_event_update_userpage(event);
 
-			cpuc->idx_mask &= ~(1UL<<idx);
+				cpuc->idx_mask &= ~(1UL<<idx);
+			}
 			cpuc->n_events--;
 			break;
 		}

-- 
2.55.0

