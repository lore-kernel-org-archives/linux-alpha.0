Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793674926;
	b=znTb0JKjC+er0dYXNWoTXc4cEp7NM1UKZl8ssv8ZpVwy+pauysrkfv+Y0gbyLxKcVXGB
	 sZPMzEY3VkxtIrDHML0waUwgQCng0ijcPLZLOuU7WEZISs129p1hJvqsMTu/xP02wIlrB
	 uDuNNRRgsM/6iQULZB1AJJ8+29FD10m7U3r9T8RRF3CchyE9Q/URYq/JT3nAJ7ITJkyQh
	 2ycxNW1e1zRBRjNGdKQGpHUm/cZtjm/UyfeHIidE9E+M0dmy4dDEICmDI5xyVy0hPAJ2N
	 v6zvGmmsDCOcZWbkPt61ARhQL/YAkyNWgyl53BqjKUV02XH3ZE8Sbnknahu6XMdfhgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=vUuHLakRNbr4esv7p2rM0pJWyo4Q85EyExt4ND+SVOs=;
	b=DTo7kEsmov1WZLKN+EdIubDNoa7ZYP9Lgl9RZ/7a9dJV3IuA7XDc1Ac3mltcm14lFSgh
	 c2T2itLU5FoYm5z6/BYwsDady305AK6LksGC0FUfYdgBDWcIn0WExrPwyJFdnIooYeXuz
	 wjNE1yqftEqCBAcqNGKKvBUyFr89Y8QK1ffKuzWeV98mhUAUrDRtbJfaaTM+rHPTBYViC
	 uyXyqS1rmQaqbH5RyYbAyvblqMvEd4JETFkbN/g2ohRKCWm8gPPFRDXE4dJO/mgly+Tw8
	 aDkcbgB0R9vGTJnWdMWQdAjva3cTMo5Wz0/IGsrecAbxukhMP0ZRHoDQUAl0OcqSGug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eLpUGb3w;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6562606A32F
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 03:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6562606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eLpUGb3w
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8acda240937so29550937b3.3
        for <linux-alpha@vger.kernel.org>; Mon, 02 Nov 2026 19:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674925; x=1794279725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUuHLakRNbr4esv7p2rM0pJWyo4Q85EyExt4ND+SVOs=;
        b=eLpUGb3wHXq8jxNH7vL6gAs00FArBPuaRRkm5Sr48oa0dd9zv1ziVP/slzkuD1xTYe
         yzS0l2ThjCIcy9ixhRQdSYXyCdw0Nwg3IZs8PDd2saGimBMkA7D5Tdy/FTehIGK3QwOq
         H2utf5BCXKNR3eo4TG5QDmUGQm/ihRBFLp5DtC9Ua7LbLeYNZxLl//qULqjZ/w8BbfUi
         wK1lVk5UYVTbGEM2w9lZCal19mcOyKUKvBj6jhjCrUweHfmx6iQN5oCMMHSFFBhmOT3E
         9q003PTeYOpI+V4ILAzgH0kCJDHccmYFzOKfZhLhS6e9DjfNeg70Gmn+BjM+vU1LfCHH
         6O4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674925; x=1794279725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUuHLakRNbr4esv7p2rM0pJWyo4Q85EyExt4ND+SVOs=;
        b=nBcK3S26CQ48so8X2w1OeD1WNVKb/pT0cx0C/+aSuSbzeF6CYCDR1elTONsU9s3sTq
         dLbYrhjaMry6xx3wAl2ITdc05baOJ28vGfCJ7uS7ldGBaeJ245KgiJ7NU363FBoPQHFu
         7Lot8eyPL0FUVK5j4RxcYv7U7RGllytaYBe4Ux/RxkCR3ztwmgE+1gHQdi8Jhk+HgaGH
         1SdjL2YSBnTnCTuXPfIhwTDK0429a7aYV85c5fSFk20MEFgC7MAKsVkZUBJGJ5FJJPeD
         q3FWNvdd/5+uxU+G++IVxA57D7MwAq4jU6kl4cGjADV+UPvdr5Ul51WqQ4RzH00iKZeK
         D7fQ==
X-Gm-Message-State: APuU4Z99G2/CK1sS0teEOdUtRZBtE9tTnyzO49ib+aE+uKD6CZJbXaVd
	uUSK8dvPIyiuZkEbEPbe/rKPnBLQKJHNh0WhiMMp/oVnJPAkITpyDGIx
X-Gm-Gg: AYBFou3ewpXLxq5WRJrJ1IFJv4QixL2XQKGrD6YKEaHny5T5NyenFWxemz9uM7JsDVC
	RbChDrZTohN57xpWP+GVfEoTr5xv10xffbjiiYb2mGuyqkgEwJnbWIrQ6TpDoc8BEtbJOd9Fa+8
	65Ne1I2mrJz3ZWCU8IsXWlWNvDH5VPr3c1sqDZnrIk9peFfai7jMoLx0acpgvsSw1bzTyzsUSX7
	L3jshbgoOQlc8u1Ul8BkkVrCKJ7R1wGmnl1FmHzTAKQvu1sDRaUVd9n/4qnfzudWfRFepDmVOkD
	2GoBq6UmZVsbyX9BSyyKLYYdcEvzUdkhFmWDpZiMEBpRc93GLbYSVCR2+7zwPJvJ7YSy+/RoRuU
	aFTHcYAtK6EvTyEXc1yWSANcNjXq5akJ1/AP6CueTrz6LI1FXrzf/D95f1nmoZ63etsuCUiYP/d
	xa9ZFzoH36Mc40Zy3MND5zDLKyCKjkjBhs61m/Y0xl9+S/i0Jsbtr9W9xTc4FuHP62kqxoCNoxZ
	gIjnk/IaAvyVpJxa6XvimWz7l9ACaBdkCF6fm1oN0w11EgpzbrWBTHqCifoaHrq54Sb/W6ToooZ
	cBB7WAyifjRezs7xXtldC3c+WLZ7lM5dhqo+xIZ5ZRKllVKhHGl0RRvwR6/uu6MP+nnEzp19XbV
	3VC6RjcO/KQ==
X-Received: by 2002:a05:690c:f8b:b0:8b1:8d69:1b20 with SMTP id 00721157ae682-8b2b65b31a0mr75897497b3.8.1793674924743;
        Mon, 02 Nov 2026 19:02:04 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714cb1csm64619807b3.18.2026.11.02.19.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:02:03 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 02 Nov 2026 22:01:58 -0500
Subject: [PATCH v4 3/7] alpha/perf: clear PERF_HES_UPTODATE when an event
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
Message-Id: <20261102-alpha-profileme-v4-3-61e00f5e1da8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=bEa6cnf/NHGbPsC7PL/IhVePDwjtE880lWDMA14mV8w=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe+i3WWGyUo7tsxyabVSaWdT90Tzg1T45PbovYtcm/L
 L7ihFpxx0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFwjuZyRYesSi4krsp
 s1n682DhcPf/HLL/nh87oMyzNcFU+aHrB5n2RkWKXTK77y1NHAA+oJvv48PnMfbqxxTJqid+P6T
 sOG7/z7WQA=
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

