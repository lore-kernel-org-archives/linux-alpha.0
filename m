Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818157;
	b=j/lci7/NdOUQmWQSNLVqJxvzsAW6NqEQAMoU15scFvhKNDxQNLCQlljpwzPwBzfCGros
	 bhyXXlK6PMj2q25wqmi/2yGsUx6fXk81EzFHK9qnG9XhCnleRREDcHR05DDEPHnbdPTwQ
	 But57zG0ANjPyl0ZMSxilOdM0sJczUEfTHBlfO1XREViJSkYd/PXd3qY9ftGU8kN0EBso
	 y4+C+CLSo9NIUUeMxd0okr9bsIcRboYjN0r9DDaIlXnkmBp1hsGYHqi1/+MbVqSmJxL3D
	 xJiFIp32DyW+zoYCOFJMOv7MLI67HdnW6FuxSknC0mRDSUVQ/616FMUlKdTvM+o03Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=lhZd1t2G7AvaovzNOMLu3cKSuGjs5Nw8pSZMOe80P/A=;
	b=XrfOFJAlZ9liuWfaPdbj0mIcd5G6bCb7CsjtceNWeG1xnvvcS3Mzy45JOoZomNY0uiiC
	 YzshMUIcBfDYHZRcFrPNDBJ2FFiEmlGQzTnONz0jviL4KAM/gfyI3yCjpemtoJnGsQK1b
	 fiA/AXrKoTGWp3i2zRMAerhskecjiNXjHrN0Y25eU4X8JJSfT2cruX373DWu3rVAE+hXf
	 yDycRqZMfHJz5o6Hn03aQ6NbJnFjCF8leGuj/chmAUgigji8OSywJ0/PXpHSL75pguFyr
	 gNV9SLKvG/czaa4Sl8m81ZG5ZDl6aPpxYA4pHmeezxzrxIFZE4nHV/dXcSRUTqLIH8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oedZ7HaY;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09819606D825
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 18:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09819606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oedZ7HaY
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b30cbfa628so12897117b3.0
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 10:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818156; x=1794422956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhZd1t2G7AvaovzNOMLu3cKSuGjs5Nw8pSZMOe80P/A=;
        b=oedZ7HaY0yKhCqbH78FFEJ5a8z+oN3kaY0BpcEyEVA3Jh4UhTYIiibsrYyA/5cv4YI
         +wjV6lkJZYz6PVlyFv9vljdcPNgpkOmP4TL4Yg9LY7gwflGOAfvatB5uIA0z73ivH2q4
         dZ66HRjgcAEZP21eqTEFSe1hcTen2dA1SBvQ7iETF3QtPr5M/nep2V13a+sj+qHHisMd
         saUkiaNDCg1UL3+ZhH4I2zOdZyo4yMH0JdTE0hhfCbbHVMrdFcL3HhSR+W71wjLzFyYf
         MWaaH+5SSOEBBI+XwOMcqOG3qczQaA0WabJofULkBUtigOB6QyTxVQoCoC1Vk5mQSLYo
         QFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818156; x=1794422956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhZd1t2G7AvaovzNOMLu3cKSuGjs5Nw8pSZMOe80P/A=;
        b=gCQanRgRZYv+vr2xXFyU7mDj116EaJCgMHBQEIwAHUUJTTWB41ByY30KX8ojkbEoxa
         2JnppAUBnJ+FoI0kWVOgghNqx6/1LbzbRn5NK04AahKjbyPQ0mhzeH6XAcwqCDlKkSYu
         U3/0lDqNbDe+ymcSwXF2xBqVKTAuY+DSCKL2kqdVirWasFHbLzj1wYJ+xacY7ufj8Gin
         uyZRQ2wldtpVOFCAfcmT5v8kVRIrKkGCOo37oDSf/TNGlvUhL2bbpqaNHIyfvsOdKMt1
         SdxUNbEQzgXvrE2gLkg8lPiX9QvCT8dMcfxGFYQpl8odOsM0EL91dHBv0jtLMzs7xtPS
         d4Mg==
X-Gm-Message-State: APuU4Z9Jc+emeYH+bN5Gl8H+ktEVn1msR7ttJRVZI/jiEm0phWOHg2+o
	8a7WCzQfbYNnNQsB4kZxj+FHX1heKMO+QyhB/1DhdR/60OtIVoiCCPWO
X-Gm-Gg: AYBFou1I5ItdSafARpbj/WV9NtC3YCJyup+HiqclI+qh2cGJ614FR1R2YwpmP4AEN/e
	IHCO2Uwnog2+m9XRDJn2D1YIh9V41L6/7HaSEUpmGYd9ZRJje8swyfjkkcWB85Od8QNfxW9TH0R
	bL1sDjzVso7ykcd4hMcY/P+/YPvPsHbuvZVNkVuyqMEu+rSjYGkrFuWWvSW4b10gMWXlntwCmIb
	hMRgwqaoRAthhDDbvxsTT+BVuZ47U4DTnP3JxSdZPB+xbyrE43nKQRjTBAgvMgS3XzUJXIKH0tv
	F1REQ0kKFtbv+Myf7BGGszUm/X4s99Ez4/5Y57j051OOn8UI/XnTdS2puDjEviG7FTtWwDoCrQZ
	ahgueuPg7FTFPXBtiQSeth+PniBsz6RH5cJnWz/d4W22DOor1OolMtDCCnHTM7zVlsgBGlxmrIF
	XiI3XhkOx9A/K2O3i+A5srhcCbOqyPExkaz+ZNg/0Hdq8K4QeQ1Lpt671pwZAoxAL1ECO5XmhOu
	5AMrdTmzFkbeIooA3mEDeD7C5k/8sq46TnNnUNAfs+Ngv4E68RQ4PAhZRKQSr2GRGAw5Nj3Em++
	n3iDFPoxsLKCVSlB8R8xOfxOqk/EJoO+Be/rH717JPBrZ3qRJgqeeKZNqXOweGskOgdIYGB0t4K
	PU8dyGTyYCFU=
X-Received: by 2002:a05:690c:698a:b0:8b3:1c7c:1b51 with SMTP id 00721157ae682-8b31c7c1d7bmr10775137b3.46.1793818156014;
        Wed, 04 Nov 2026 10:49:16 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3099920b3sm24300167b3.31.2026.11.04.10.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:15 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 04 Nov 2026 13:49:10 -0500
Subject: [PATCH v6 03/13] alpha/perf: clear PERF_HES_UPTODATE when an event
 starts counting
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
Message-Id: <20261104-alpha-profileme-v6-3-63362e9290a3@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=wZUlbKAGrvoUbANrdNAR0BiYRrf0cYY8VBhZDQukJto=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe16k0q2z11DlnPeHFKiah9dc8mz5v/7Mwq68oUOoZ3
 8aLTs/qOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaZYcZ/uc5fpdz/F
 pm9P1qWtPEj8cqb+5YJOBQaCfLuYxd/t3dZWIMf2U+SUtrsqRc3bj3eu7i27Nr2/qsrMz3fEzq2
 pZ93OluKCMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

alpha_pmu_add() sets PERF_HES_UPTODATE and maybe_change_configuration()
then programs and enables the counter, but nothing clears the flag until
the first alpha_pmu_start(). In that window alpha_pmu_stop() with
PERF_EF_UPDATE skips the count update, because the flag claims the count
is current. Since the next reload rewrites the counter, everything
counted since the event was added is lost.

perf_adjust_freq_unthr_events() does this on the first tick
after an event in frequency mode is scheduled in, which is the default
for perf record, and it then sees no count to adjust the period with.

Clear the flag where the event starts counting. alpha_pmu_add() cannot
do it, since the event is not programmed until the PMU is enabled, and
stopping it before then must not read the counter.

Fixes: a4eaf7f14675 ("perf: Rework the PMU methods")
Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 70840c05d39b..ecec78c355cd 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -456,8 +456,11 @@ static void maybe_change_configuration(struct cpu_hw_events *cpuc)
 			cpuc->current_idx[j] = idx;
 		}
 
-		if (!(hwc->state & PERF_HES_STOPPED))
+		if (!(hwc->state & PERF_HES_STOPPED)) {
+			/* The counter is live, so hwc->prev_count will go stale. */
+			hwc->state &= ~PERF_HES_UPTODATE;
 			cpuc->idx_mask |= (1<<cpuc->current_idx[j]);
+		}
 	}
 	cpuc->config = cpuc->event[0]->hw.config_base;
 }

-- 
2.55.0

