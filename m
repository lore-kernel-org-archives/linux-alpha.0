Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939460;
	b=5nLN26lMqIOPsyKXDEsrRIpWpW4cGJcI4B2S1Ka4j/yox29g5PTLBlYBmDAGd3kd7lhb
	 VYml7cPi22OLjSeJqqJdpkzvl7Kfaw4hayRHwu0CGTqrcCuZ0iFKtEhXt1RwUV0J8SbHA
	 jMD2UjwFnjMW62FXmckRyuOyjGCeG+F2p7ZrapxPxGlOAVPVbe71UWmLLWIvJzQqm4Lzn
	 Oiz4SMKFZdBl+5kWXCfEZPMMQv1+hQzsgF1KoS8SfIvXdDRoDNmj0NMxA0OdhNkw9HZ23
	 6B9tjTVbKHxu/Yn1KkA3XChgr0sqQojxBXYmeqC4wzPzu26NDVWWtt3FQLAI0USnGmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=MsPW5K9wIVWLH8zTIi0shO9heiIb/dOsSeBuo+Lhef0=;
	b=kBVZNCgTZJraoKzVsK7d4KB5wSksIVc8XF58slA9X3IEiMlrHUd7r00cAYpp6LmsW4Ih
	 UY7dUwmhK0ZR2ri6Yzk32uMogmzRB+yi+0gM+xrz6wnhUu9nnqNCyoP37HiDy8QLr4z09
	 sJ2uNiWQVuqOgG1rMRfLIj2tjoC3g5PNSg1sbAd124Yng8tEeCytOc/8aw9jTG0SShUiu
	 IwQ3KvfUoinph9HWUDIReFMf8U/4CjSpvUMA+F3GKKGh4pdZCTA+rvyK1HFRXQdMRQddG
	 ord34FHEDqtjp2j0yPin3zdbxbW7/3eBBFlSXUIJunZqWO4V6NISMHJzlQ3a2LNqxPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7MECB70;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B73606A33D
	for <linux-alpha@vger.kernel.org>; Fri,  6 Nov 2026 04:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1B73606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7MECB70
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b300713befso1069507b3.1
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2026 20:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939459; x=1794544259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsPW5K9wIVWLH8zTIi0shO9heiIb/dOsSeBuo+Lhef0=;
        b=L7MECB70DwWz713BM4+LuzQwCxLCy9bzNYAZNX1OrN3ke5g9nymLp+njHxZmAVJqrY
         xKX/ePAjXg9VJRi1cqPn8GEUjgleL7axnNyCdpNA1zAkgrsKxkpB8lwZ/EmTZcH/b4x3
         tibbLBFjD/+HLO2+tniKIzPpGSDbYtPjncsKH8sBFn/Q20zw1AIBn2vyjSP0xIjyhWoM
         ++9bzBQpgg4kh1/KdufEK8okI/UcS65elEi0pyu9KEQNELEG8cFLW110LVzTnZEBv3wd
         z1mScfxNSqHhMXEVnziBiWdRdYwsn7OffxB1rNqdji6CoUOZ2R5+2eyWBCcASxwzaxTd
         om0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939459; x=1794544259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsPW5K9wIVWLH8zTIi0shO9heiIb/dOsSeBuo+Lhef0=;
        b=gEstQ4MODpNhN6grSt1orNKWOa3gZ6Glb+qeVaNDxiBaQIgkeepLXn/OR/u+9yT6zX
         GP1PNjIP/UlvYdpM6gSQTIOAMYnZH8mDVkRDsrNra+hyq5YgKCH0ZQSuoKH7UOfSxnWL
         biGHufGwJR9uwu0MnpGevGTutIr7XCUl/+I1670qGTJDinvpwPnhUsAQZDa3ReRr0JBg
         LohgQ/2ZWjcA8N+t3F7+TmFo03jHyfzLtzA4S3u99t/nwkHwIGDjNuBonokr50lvABLd
         gtS334B63Qu33mdyWGEaZXIrCJlWK8jx1suqffoG38+8AL8oy+/rgpIuORgfW2vfEMht
         Dvug==
X-Gm-Message-State: APuU4Z83viiVxfEP7JTFJu2IeRwa3Misnn7KatY86LllbdYWYWqQ+9nY
	WfirJY9qwzAqBccp74XtTLqMvKy495Xs/I160rUiA1rpH23VoVrXQ19U
X-Gm-Gg: AYBFou1OA66V+WrqYlxTFl6GLs0JwKjc4iRIpOVyUdWwDyCcoIqwUs0ToABnm/O/iVS
	dpnim4m8aY6OQTuK/uhv+80xrueOhnp0LlNN9F5f7kGdY/zDD7i+2tWUuE4/Eo8kpVhBlJNLUl6
	2mO62dcFbLSS7DFiEiMmVvB32reqcLwAvHlyyfsV/laUb96QElv8y6GXqEFw7W8Fyt95lsauJkM
	xyM4yfF3/7LOzPSPL54L0KGdyR/5TPrTBzAjjVZq7hSJqAyPsxaoz3J0xRt83WRABsWmMqO/pht
	GVetkF9PEyk4E+9+R797Jca/LUwSCr+j+WRHDqMoJGl4YsrWJvP8reRCYN1iUvF2BqOKY3UorwF
	9XUz5cgHFmrs0XMNFwTPFu5+I7i1BD1XB9htfNwpZvT3XpswAq9IAk67RWcuJlwC9x6zTbEoFGQ
	LkWulNhLGzZ7L50OoKRE9QW1b/6CU1FY7e2qGzqeakh11AT+AfOcZdzw+ZLxissDDgn3c7R5BXN
	u4YEMOc+mtFdfG7LaTFWivoawTWT+NNPpaxF6Q8ApeqaBCAhd2SfUQw1H7RUsE22ij8toVFPueo
	tJAbkschqSCqpISeVru5ws5E/z9Qm1q0Hiuxuu6fbwnf/ego4ZNoB9evpp8YxttyPOUBmFGOsok
	tj90wIjx0Vg==
X-Received: by 2002:a05:690c:1a:b0:8b1:69b4:b56b with SMTP id 00721157ae682-8b3417dc562mr8895757b3.8.1793939458803;
        Thu, 05 Nov 2026 20:30:58 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f316csm11175647b3.1.2026.11.05.20.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:30:58 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 05 Nov 2026 23:30:32 -0500
Subject: [PATCH v7 13/14] alpha/perf: sample only retired instructions for
 precise events
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
Message-Id: <20261105-alpha-profileme-v7-13-c474e892abb0@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1972; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=t93WYO3sOCggQKfxs++3pirdoJx+OAS0XM5ZjaMNX24=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLeht896KoZ+IpRhsUx27gy/vJ861/P2atlbvTnpP09a
 JkfkOnR8ZGFQYyLYaaYIkvcekWWWW07lvqclv4FM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 Ahk6RvEQOT0Gjczi4tLUIt20giKHvPySxJLM/LxivfyC1LyC9AK9tMy0koyM/KLiVKARenmpJaa
 ujm5GhgYmlo4WZk4WjqYmzs5Ohk5ujo7Ork5GluYmBs6WjiauluYMXJwCMNcc6mJkuBgoJn5i2f
 wF/nNO3ds1vX3D3DuMNw5XvJkl4ZFSN9ezVY2R4eTnpOV7l6ZMElzdPY+196F15bsVf1dqHJj7r
 Cds3Z47a9kB
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

ProfileMe samples include instructions killed on a wrong path, which
show up as hot spots in perf report although they did no work. On an
EV7 loop with a randomly mispredicted branch, 19% of the samples were
killed before being mapped and another 48% later.

PEBS and AMD IBS op samples are of retired instructions only, so make
precise_ip imply the retired filter, unless filters are given. The
profileme bit still selects every sample. With cycles:p, both kinds of
killed sample went to 0%.

DTB miss samples, whose instruction is aborted, are then dropped too:
cycles:p reports DTB hits only, and the misses need cpu/cycles,trapped/p.

The kept samples carry the full period, as do those AMD IBS keeps when
its swfilt discards others. So in frequency mode the sample rate, and
the event count perf report estimates from the periods, fall by the
share of killed instructions: to about a third on that loop.

Suggested-by: Ian Rogers <irogers@google.com>
Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 332ff19ffd95..aa6ec2161ec4 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -849,6 +849,11 @@ static int __hw_perf_event_init(struct perf_event *event)
 	if (attr->config1 && !profileme)
 		return -EINVAL;
 	hwc->config = attr->config1;
+	/* As with PEBS, precise samples are of retired instructions. */
+	if (attr->precise_ip && !attr->config1 &&
+	    !(attr->type == PERF_TYPE_RAW &&
+	      (attr->config & ALPHA_PERF_CONFIG_PROFILEME)))
+		hwc->config = ALPHA_PERF_CONFIG1_RETIRED;
 
 	if (attr->type == PERF_TYPE_RAW &&
 	    (attr->config & ALPHA_PERF_CONFIG_RANDOMIZE)) {

-- 
2.55.0

