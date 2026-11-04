Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818154;
	b=bEreOtPCgahB2iySoYbHZL1BiBFI9nsP81BfNYzO5BfdQUR0GkaQ0g/R3M+jkeECj2zC
	 yuP83utVOb7aSh+Q/ik9RPtxDxYS9yIfdNOTILksQpYo7I77mrLNEqrIzt63squAh2rXR
	 fveS55vrSwMJ0duN2/aAN3Ubj+buQN/8aXkL9E6WlqzK/8Se9evZYHnnZmtzDIrCTVN3b
	 VFugwPbR/CmEwufHRUr5rUY7l4bNmcaKRghtUydjbk9HbUM1YfRqdTtQDsXSxft1gar0/
	 NBbk5J6Si8YkZK3XmyHVwCBGjjOZrM0Y0ckhQE00y90iU6yPrUmHY0VrDm8Qk1TpS4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
	b=hk0f7996GtA0juMnrG2vjCLxc3DhLmcFIsxLb0ARSt7Mn8/MTv1MOncw6IT8s+0knnF8
	 suc3pGifU+4EB2vbH90DkRDWqcEPwdy8+4wDjkhAo66CdWOK9eJT196TDKk9cVzTX1+cu
	 eFK0daZ6qFM72PBg2xG9V8lq0JM8wu0TvRS2ySbt+Xcpxt1WT2AJ/snkvjklz5x5ldCgC
	 zbI81O4madtWGaxiV5RFN+1EpFnDPnM1uNDpl1gTNrYYHI3IKMAwpwwnUepiVd+Hmxryh
	 p3DIS1W7JuJXnri4evDFWXV5krv24rja4SrluQQhM5UEymdKM+6PL7p5Ic8SYBcbdwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QggkXGn2;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A08606A33B
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 18:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A08606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QggkXGn2
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0d126f631so11532527b3.2
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 10:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818153; x=1794422953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
        b=QggkXGn2YSOj5IlaB5fj+scgrNojhUaAHCje/PSEvA2S+LDNHOnMUe14nhEy5POFwA
         NE4Mldy6SLOhm57tiM4I0ffTXHu6Dj3WPOz7rRf9t0ofYcmwxV1aJ5EG/dIAdCItvG9G
         wOxDJ/Y3gE85VIYdjfVhbPZFV++u7HptcKBqHUQh0obvpdaru98Utel8jrO0/cn8TjbU
         PXO1QeBzGr8cI4SO+VgAhk81qTMfDGLmyrdnwL8vexIycN/nIbBuN9H+0QRTMGEqKZyV
         o6zXQIoIbXHphZWmfXgYAH7vx2EcF6ttfiDsash0+oHIMVn7pfGlMkflWKpUVA9cy8Za
         aJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818153; x=1794422953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
        b=EzFZ6yS6J2ViXB5HEs9R8Q5NVI2Z1BsCeVCJ0yB0J7DlAtoCTPVydxw8mu45yQGC/R
         7YdQkZkH2rFx59LmEhFpZU8QVF34aYa2BxZXdt7AYT7ms0PQBeb3iXEL2JOdPEIw7e/S
         dULOY1npJJpdeE3/PGBC9a2SA1Ljf/xC3JTxOOAv4y4idsrLo7oq9i4HrcrN3TS8abHr
         LvEty6XFp4frqWq36YGtJDDlfgXXhrbCyvZeU4e0lCDkkcA26Cjp2/11VEL53bAML+hn
         frKQl4F0h/laNMl8llSPwBSCuKozG5K1HAoa1UEZLOHX0QwHaP4jrz65FJYofpwtfrCk
         745A==
X-Gm-Message-State: APuU4Z91e897wHG74jcgj7U+ZLyVPTl2AL4k0mUTCV1Mg8QhA7Xk7z1S
	aA4Nb+Df4is1DGp2XuBKKRlV9LAW44iq4UlZ16lCJU/5IljSSepQFeIx
X-Gm-Gg: AYBFou2hXivswI8cgIeHz+/rFArQnnYJXVw3ratBpPASDniwcryjS3seeDmhBsYaSjH
	Umx0NvDFaDE/QKQTO5r2EEjUAanWGy/AOSR8ms3oppmpoil+HHiGKzQXuX3fbnMPBvgCVmz3oQU
	rv5jzaRIGlWplqAnZTq4CATb9kI+w/2G6fVJB/IHJGUDf5kPbAbN4eFNSVHL3mfJZ935fkzkGnC
	v5qFRYiirxU6PYj0ma0KaoBJ09J8PtpC59dvZpBe37bDp2WWJ3E/iO0FS2Uy0W6Ib2+dZ6CM61X
	2XJN3dKOY+TFm8ZPnYs5Wmj7uJMc5sOgdWJ61mkvIM2G0GzJvHopZCgUHh/nrMRxanGh6ZwhqkM
	wXXzf/mw0TASLQiXnbuWb0hpyTODEDg3achKAvMzh4nsV/EMOVJRnlQC/Sdb51VybgHXcoC98U/
	mgFWOW+DUuF+N9izLSaQ23o3gyxKZmfSzIJZsZFMH84WRFg+qdTlw/BlOD0SssnmwybrOxgAlAS
	8EweAVkTdayyXaR8uPNf/KK3bKcSeuHSKBFaEKbS8k6Vb3twI3LfNht1GNCAOhqbr8HO/QWAUwA
	gPXGx06+43GDrgurlUOtYLvRLFJj4DpfnR/6gOl610Z3pd8JwqNjUED0ESyBzDfJWPNuFeZin56
	ib1MQ2s3K2Q==
X-Received: by 2002:a05:690c:38b:b0:8ab:3b40:9175 with SMTP id 00721157ae682-8b2b67ba2a9mr119934617b3.66.1793818152689;
        Wed, 04 Nov 2026 10:49:12 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3098c28e0sm24623157b3.10.2026.11.04.10.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:11 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 04 Nov 2026 13:49:08 -0500
Subject: [PATCH v6 01/13] alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the
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
Message-Id: <20261104-alpha-profileme-v6-1-63362e9290a3@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=IGfq8dWu2iMEFoz3MC34tYu6sOJyy2DqaUpgqZ45fio=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe16lcvRmg/U74dVjIvrJYdXEe5dA0y5AzplZhhT8LH
 ym0Lyvr+MjCIMbFMFNMkSVuvSLLrLYdS31OS/+CmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 gQwdo3iInB6DRmZxcWlqkW5aQZFDXn5JYklmfl6xXn5Bal5BeoFeWmZaSUZGflFxKtAIvbzUElN
 XRzcjQwMTS0cLMycLR1MTZ2cnQyc3R0dnVycjS3MTA2dLRxNXS3MGLk4BmGuWqTL8D4yMiA5t3H
 5w5ryvzTMWs0fZ3J3K83+2v+NK06iv6z6sO8DI8OSjQ/O5RWdYxQV/7Wg5b6N/7CFnCPei5Er7j
 xOqToto8QIA
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

