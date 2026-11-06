Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939433;
	b=Zm1JfEqJoRgM1QAaMjibhNSANJYhEyR6vHWov5HTb1IpSZVPawKlwtEON9VeGL9awyzD
	 qhgPHNKL0/5B/mdVu+pJZGWSio9DrKAGNdiJe9anlU1mKbgugkwbneZ42N3pKqBkxRjRV
	 9by7UtvbBfQB84bYnpZ7h5LwwjHQGg0LuxJrwDGybTkiVV3G7/jbLx4dTENQ3JddcL1Lt
	 AzlVZIw+XszQffyP8nZA0DskyKi+m8jUqeThawxW6eFqDfSxqOLUHSwkAWM+Y2i1ZT/vC
	 No/JJWuT22UmlzRvyNhoRRnvHqftwL/gSk8Uz6h7l4P6kTR07wlJGvc9+4ywyVanRbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=LzJY0luqtloZAAaphnX+RabnxBRYxAVQ9ITyuOF3u2o=;
	b=P1+jM976RCRXn1ofpyxY8tD7gPyd2kgk0O0RpVJ9esEu3rv9l6eWIz4BkJLpVcxiPxKU
	 tALhRZnJ0Wz9kXf9HZ9w2Gi0wJeAllNG8Tgd+annSby6LUYdGvP1qi1vCJTV0Zs59WnWu
	 9YMUf2qLE3HinJ9PiA4iaJjPDIQ1iJoxWAyBakQcafGIa++8QlvNtEQolLaz2kgy+yT2h
	 i/fPO6GHna2l5SW+NTfAc7QL9yecVl8IK7bsFM36Jnn+KUJlz50tOTrX6fnhu/PrY/Jlj
	 /NmuNYX2a/XcQLbbVNlocKFv+pfw34J1tI/43noR7l+QXdiuiD83hMu1LQfLiKMb+GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EHCN5P+4;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D87E606A33B
	for <linux-alpha@vger.kernel.org>; Fri,  6 Nov 2026 04:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D87E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EHCN5P+4
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b31ca7e0bcso1334077b3.0
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2026 20:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939432; x=1794544232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LzJY0luqtloZAAaphnX+RabnxBRYxAVQ9ITyuOF3u2o=;
        b=EHCN5P+4rOJf7GuzzLmYedYlU3EjEU0PyQVmKqXVypZ7Tu1nSgPC1FmEnPXTdlAayy
         UpB9YSnx1Ib5mBwvuRVh/oOzlxoTTwE/aMd6ulZySy/NugzBd6X1vRkdyDXIV4kXwxIm
         cXJ2/2B9u2e2p7u8xNbN+OJ3Q8obyq2i/Klt/TgivKRe8AA4djkjxAjd6gENB3gLZ0X+
         tjh32wI37EsuoRYA4nZf3HkTDz+4FKCeJIqPHvHO3ALJTKuuup0+/Q1FA+aI+N+8nIYP
         ryhvbkt+U5SmnP3FDzWPHkCZYqM95CvUWVNAJGC7V9RQiUIQPZY6tBBc9C9t25RJoqLt
         Loyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939432; x=1794544232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzJY0luqtloZAAaphnX+RabnxBRYxAVQ9ITyuOF3u2o=;
        b=kXA0y/Fr5w1lZiO+pXbNdWPepry/4X4df/fODm/0HxOUt/bcXfUCZ8m5IjpWdRHIxt
         rMtO1OnfLKh7f//H+IgzNuCmyrDuG2m0U/U3amgfNWSZ3r4uhbVblTNugA2zxlggHK7Z
         Ei4dtZdrMO5qW9JCLKNqwVVNEc2OJ/2886CD3txQcvooKyDe8AXVhqpdN1wROtUK0vBa
         t+3S/z9mP6+hmAiiM0MzhfkhYEik4rDxDY5HCREMFZ8xrw6h/qhZa90pIpgwS+Uqz8lg
         b0Dz8hLY3xprDr/esp/g/viqiF94nQjmwJdd0gRPcPSydtyPFByS9wNX0v+txrLDE5AR
         awOQ==
X-Gm-Message-State: APuU4Z/kj1FXJ+3xPE4PH+fafyEzzfAhEa6j5AGDQ77+tlnH0g/Hgh6l
	QVuRYFAZFHIiW2MzPrS4AgQh8T2niR/dS/XAW7/96ojtQzlqfMCL8ipi
X-Gm-Gg: AYBFou0VypT7i99u7OmdDvvRx2x81LOUKk/78dgLa74f5JhejgpEtVfMftf5s9QY9E3
	gYy8tCEBP3cvKKqlSs157I8P7g68djI5oT/wa4RKpDjwdVXoBXEIM/s3h3zwZ+etEAiUBQsR0OC
	8sVIiR9AHdnfgv4YeGCR/0/vSzFNalbRcDMueF8xD4tjV5ehKQgcq43bbCRBEh/2Bdm8EJAkevO
	4OOUwCGZjBuKBPPV6cVNIzfCnKLpE0AJrAw39zQ998hliBmoZ2tUawGO/TBktdjGoR2eN/WGVTV
	SrETcxps56mR2J7WjURmgJFtiUtNZQu6BZnPaHatoVUVCmOt8JBNFFr3DytWB8mUFcXg+Nhow5r
	jbI78tY3PXhX7KyNXsdPyr5EZQoqeGUsKa6F3WW/2kwob4H18W0jF6H2jRqfph9XVSnL8FHTjYX
	mNEQooycMOufwHzF/GBvPfbFNMI571ApeyQLuEkOaHWM9Yu/XKzvg9PAoilcZloi9+sGL1L6dgq
	EBAhMq+OBp+BwFfYL4kMaUL4lmiwjrTt3ucq1p9O9ke3/O9pXFbKsoDOk7D/kEmJuwybwI+d59d
	JshNTHsc9WIJcZgd7X6EQvN6MLrJdbQcAiCqr3FnCNkSqSVQHORHptehWCdEda8AieGO0MJCqFA
	Zb+n4X1iNeg==
X-Received: by 2002:a05:690c:386:b0:8b3:3f94:1645 with SMTP id 00721157ae682-8b341ac80fdmr7767697b3.43.1793939432259;
        Thu, 05 Nov 2026 20:30:32 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f8394b9sm11023307b3.31.2026.11.05.20.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:30:31 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 05 Nov 2026 23:30:23 -0500
Subject: [PATCH v7 04/14] alpha/perf: clear PERF_HES_UPTODATE when an event
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
Message-Id: <20261105-alpha-profileme-v7-4-c474e892abb0@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=aHNgrfFP2CuVv56lCB6mGHIF7R/cw7eOFv2YpF7NsVo=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLeht/1XJTCMunMcZsVfR6Mq5WeLKtI9BTIcfvRdWhHu
 qT38fM/Oz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaak2sYGVZX88QfbT
 ZoKvCauDTCYdnRELb5FfsOR1dXb6nlrzAvOcXwPzaycYtPTY/VcVe1xlkWs4vmFVq8y57GUS888
 ZFLWicHJwA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

alpha_pmu_add() sets PERF_HES_UPTODATE and maybe_change_configuration()
then programs and enables the counter, but nothing clears the flag until
the first alpha_pmu_start(). In that window alpha_pmu_stop() with
PERF_EF_UPDATE skips the count update, because the flag claims the count
is current. Since the next reload rewrites the counter, everything
counted since the event was added is lost.

perf_adjust_freq_unthr_events() does this on the first tick after an
event in frequency mode is scheduled in, which is the default for perf
record, and it then sees no count to adjust the period with.

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
index 2a00c4b86223..13108510d16e 100644
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

