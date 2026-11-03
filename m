Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738263;
	b=bTGhBNCZW2N/SB5rthiuDrkuWQDGDGZzwu3QOIrQor+YxvOBFgfJvNBRp4fS392cQcDx
	 2+eII4XK/xJf5KuVI6GH5zc36IFm5bzOL7jD3VdWLWKjdLFNGmJZCAIyL+8rGwfzo59bH
	 KDsGHQN6tIGVau5be7oUqAxUDHkbl6WZnQ9Ia5jwPxcS4kBYsBcJnend/y05f0UoVVbyg
	 4vmiMzjiAXxy8jiUkkRfeA6/+MhtkUHT9IjfArsq2PLWPFTVaNnLfBQp+ITneLdkYSlmX
	 XHH5nbiqzkCg4XlS00HDgANpQcue0I4ZjR5PqT5HxQsHbYF4EQXuRnNTZ+33vQqzAsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=lhZd1t2G7AvaovzNOMLu3cKSuGjs5Nw8pSZMOe80P/A=;
	b=M7s60/OvyXGNlYcAsqHTq7ujo9MUfYwCqxz2pbBVXh3lPcSPEk2AzKFalf8xMp+jbCWT
	 MouuWG/QZQu6fdOl+Qb3Bn7cIoYiL/CXCC52Np8Kxuwgv+awR4+z/CigVQm3pIVE3JNzo
	 4kHJggJzRzFC9q+Q2NfPBGovFa3CvIsbqwZxxhaJKuqapDFa+U2x+W6DS9HZ/fADRgPLg
	 zewmCuMAvMwr5ecMp5H+C5q27kaNTXFkuGRk65uwh4FSvJrxau62AO7dr5Lq4Ny8Uxxaj
	 w64oTv6I8ZF+lvVLway3c/T26osNpjNs4DtcGZJydpY4cSKKq0tZqthse2qTQZoDl5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qoj7xcDo;
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F9C606D805
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 20:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77F9C606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qoj7xcDo
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67be9601f48so2664d50.2
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 12:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738262; x=1794343062; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhZd1t2G7AvaovzNOMLu3cKSuGjs5Nw8pSZMOe80P/A=;
        b=qoj7xcDoVGs+ZdC3++ZqYU4+l7V3xK/w98SopOz6krhVhmGa9+f/nuFXj0mld3Bxd0
         GoifG0tIXHQq3CNj2luySPbPfbtBEkgaVAU7ER7rhLIbzmQ/grJCYSLNW4Sqf6GqgeJm
         GH82O0TH6mgKfd09VO/9VDCJItAxDLSeWM51pxR37UMUYf4hUimrTiBzW36wFR5ouK7Y
         Zjzi6l69PDpvRSw26Fkg3J4d2jqLhsuYyK/9eGjsAdiH1ss5vokMAngJMUQsgacnwZ74
         7495G6X0GrHt7gAb2OU9+AGsQIO6rcGAmRkOlXsUt5E1YUm/12nonJjYNwf3zPMfkghU
         TBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738262; x=1794343062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhZd1t2G7AvaovzNOMLu3cKSuGjs5Nw8pSZMOe80P/A=;
        b=deZyPT2RW2EBhLRTBxnGpmBREQK7eDvEK/ziFf7DB9xKW/k/irAWM/cFIeIyKk8c/C
         blFuRKpLg9zEaX8v4jbxN5+OeuGNW3dE/ZRwQLl5V+JRanFEomKy1xKO+6IsS2MlDKON
         m2yNt+6xcM0vEDzTCpxd433l5JcpE/u1hsTUSMRyzRubkquT7LvffLEMQ5/jADEI5RSY
         vXkSpSyE304cst3TJ09n+OqoTlYPchm5GViTwc8/o8rCVg1sXc9UuugG/PdRmt0+L/+L
         RBHjwOeStrAOeMKA3CFWFciz/wMwmuPo+4RXJZVOavuR9xXK/wu55Q3TsILR7JJCfk3Y
         Mllg==
X-Gm-Message-State: APuU4Z+0bQxt4MzVFBmbVrUfcFZCn0coD4SiX8+3OMDb7B9ZkN/dKUaY
	1gDMQyC9anF3ql14EkPp0WExMJDhHEvOL49O3RXT3BVL+t2NWXj8u4N0HCF1FA==
X-Gm-Gg: AYBFou2cH8EbAbW6brHBZnDKazmyC4BhWQe5DAlJ1uAxO/btzmNqh5hDYpUlQd2kRdJ
	olwgMaWlbKKjLQY/Mck+aIhWtDj0G+2to98DytYW9XAz3vBYdxP2duIBHMxN3OcMJf0JFkyntQ+
	EsQ+fbMz6FuEvzD9jklp/mcdp5EloSukzoUYZp5epG4JbLSOOH9ylOgjTERlpqHptaVZUTTbjqE
	PvzHoPOzr86q49FC2ntKOIDX+m9FqD7o/MMAUD0XUJtNi+hpIsAGzZkuLrlfrY6oV1JqOysrFzT
	YJGZH6OJe2AIxGiRh+j3x7frCuzauBCfJYS8w43+VYf9nRbcrxIKhESuXoc+OHYiY5b/KFjdWE3
	imEUjApV8GiHZJbNmPP+44z2N15AlAVe6kVueoJe2YyO3qUp1AQtV+gBb0qvc63oFGZ7Hqzox+y
	Aodwl/16fhBQO4LlGqPtllHG0EaUUppc6iS45rUhqadLcj1d6OMwNfHwS+pi/Gj+02Sl0FYoKuX
	qhvOEW005cWCqOyPYjhayOiE3m7ENpgaZWJtEO1AfsvtRbrf5PSTYcLF4+vkReAC67lOBJ7LRl+
	PJLDojOr4g8qzHhFeg6Mkzz5Db+zG71GAIaSB5f+mGX0DMP6zM+5Tg1XGvJ4s64ELAtpsF0PRLx
	5HWoF5euXSA==
X-Received: by 2002:a05:690e:144e:b0:677:d9d8:d927 with SMTP id 956f58d0204a3-67ba4f9c349mr11752027d50.74.1793738262448;
        Tue, 03 Nov 2026 12:37:42 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee202bc4sm153422d50.4.2026.11.03.12.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:37:41 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 03 Nov 2026 15:37:36 -0500
Subject: [PATCH v5 03/11] alpha/perf: clear PERF_HES_UPTODATE when an event
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
Message-Id: <20261103-alpha-profileme-v5-3-bbe3937fbf3a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=wZUlbKAGrvoUbANrdNAR0BiYRrf0cYY8VBhZDQukJto=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJeufF5rNflmjeZq13KZiJz2MnFz+YfL6669GD+315Rn
 cxXFf1XOz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaat5MY/jvNaj25pc
 Eg1VXqZfy+aeaCc69t3yXduEz2ed2ar0XWe/4zMjTzeCrWm04473+s5yX3oq55RjU1dmtyarebH
 9R12WR4jRsA
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

