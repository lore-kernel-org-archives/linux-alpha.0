Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738276;
	b=Lp74kji8SfsNvio8PMFZPx+HwSwKt1iXmL+GDl3TW7YnCAFVW8jMI5xVKoCRIoFWsdMB
	 Gpm3NU0WuaAa4irBiHGCKmSet0+kl4JH29+su0CIRL9ZDZHt8gtGQ7qpbkKclmrvCZDek
	 CiDHtZtZMdVb9Ou8E64oXEh+ae8pwmb1UomjYhXjTUFApJo+qQUKi6di/CyDrPJwIcIIt
	 Aca2oppYx0JdwjQQq6tlm5wbrUlU0Hu2s3UJLkApIiSST800SivQJ38xOhO7A/eI9WeRC
	 vGFuhopCvYwsF5ovXhWaHiphPefcaZx4aKz3yymC9ogoPg7DEogGtPz/ud7Id+26Mlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=LnnXxzKAtyL33rBzDInbJu9ukQjb7gHbfl0z0zsb55U=;
	b=Xl3njTkbYeKpLmkS5Bv7/L49EO/3ucHGJX2oYYEHl6LNHdHsFOIryiON5kruJUdMEfiw
	 tvCsqV63iNVTAz3mOg2GnXZtwH7mW7RUcyly5+U7ccJpjQC/DylEcU71YfHYMfOOppUho
	 SafofNMmCLg3IWVrbwUxoIUUJTgRTLw0xa1odeh/xWtXK9BiXOdgl5ZFTpxvTZ9nQF21g
	 3gEhaSjnzWycbfTMPjmSFdScNRXjq/G+ZoBiNzrZvhSaR1yADFaZ3zzWop9xLoDe/NPw1
	 EumLrYT8vDW0AGT6dWIqDlubSTI/uSEVQvHTAnEua9TjgDhi6FxRa0UWXUrVMOAl9rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpOqorIK;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3A0606A333
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 20:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B3A0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpOqorIK
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b300713befso104517b3.1
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 12:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738275; x=1794343075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnnXxzKAtyL33rBzDInbJu9ukQjb7gHbfl0z0zsb55U=;
        b=CpOqorIK9GCerjKACiSe45Y5HoEFDz6mcFUuRcFrqqpfGThEefTr/dsteDSiDIDmh5
         dMUQPBxVmnhb8ZvAaYNtKCSb6zuAo3r0zNXfdKJUJqUAuBBopmDWlCcr1xEH1s/yb9wy
         V9cTDVnOCrolCa38xP9QSnr3fPtBAEPZlGbZohPr7WdYtqOUse4R4iQQBM825MCuXvBR
         G7PYJ9mFafyCEWAMGdlhG9BIBu0sayHHVx6a13nnJvAEZ44fc9OYgtCRTZbZcSu8zVA7
         YxinKrbGC2G2ycx4G0z+Xn2Rw7ezG1u+umz/X/yvr3AaFIAuYyT2N9dUMxtXbux/OeXH
         Y3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738275; x=1794343075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnnXxzKAtyL33rBzDInbJu9ukQjb7gHbfl0z0zsb55U=;
        b=0HkpC9town66NEECZgtvUe4MYyEfJxkPRn810i5G63jedKmf7cYVTm75JnRWo9wWBT
         43qY5hoa3ohBYQNXtRm9Y4I5DmSTiB8CXM+QHjjNz/7iUzel/2+vJkqLBqUvpk8Uyzyl
         HnqJRvAdgHCwP8QgE6AopdeHWWwVzh12AGeNVZF/4zP/3frSvyZw2nzdV863L+gTnnom
         2qT2J5t/YgSiiOo31TMsKzkBH5MikvURBi5DHXR8Zfbd2cKk7vvWmK6mlzQ1WpF1BMHY
         BbuBZ5tT9GwETPboJpxb0bcpxLcr2YJaTendOtpCnMQmE23eJhMv30+1UgoulmeFD8vo
         mPsw==
X-Gm-Message-State: APuU4Z8MeltytTwouBIdfYE5fcEvbJ4Iy7ovecYI07SelOiSwaMawXA/
	EB1e9b2DAC7o4/akHGD6I1F1pIQhnq72mOji8E8dZpSb9sEKKZyZ3EnMfP6LXg==
X-Gm-Gg: AYBFou1zSvcG6r5i/QFGH2ELP5vn/pwgGp2Ti8tI+5pwFBi5MnUjlldDHJtAX+0mIH2
	6ugV1P0HO6RNXpcimEAnffuzKNSq3MVu2pQacSxxuHptdLVJlLLcfvsC5dZR53mhfrb5Ku+6juZ
	VQIgBaXdhX/PptnmNEF9/GGLgHSVspXVtvZhVsrej5iOb0BnV3qiYigYHb4N7NU1a2TrAzJ1wP/
	IDQaJ6TAyQ0JhAfS22+rBl/95Fj+lYPXsL7O1PdqU3UBmevYN28a4cOOkdJ5/ZPpkAs9I6mbWPP
	gybzzpUbygOLwin0OgG2oB1NTU009m6j4zV4l3/uBcr+UDSrq2xGoxzyrWlbWL4JhMXLcQ6BKC/
	AMBe/ZQkp4IevunLgEYwQV7jH20x+odJoDfbxUViRR5IACDG4NhkLOlCHH8BR/1PEBhm4uycgqq
	qOt4KACh6yyWhoA1bC5h1koVSXHa9xZNVq0IuKSe8iaPKop7RHznUcOkRDOjx7InvNem3NQ4h2u
	tmVjX7+VlRRbLQdxLSOzereFvhj7qsVv9pGv7XR/mCPSC9XmDwYlnkLTeSct3xiVZOSQuwZi6S8
	wvt9WGhd5eDZBfOP/ZL0LsLaz7SqBX++RE594LfSaKNMLv5u3IU1ZIF0XL7IhTWE0PjL+Iajwh7
	qvDqFzeawBw==
X-Received: by 2002:a05:690c:e3c4:b0:8b1:901:b9ee with SMTP id 00721157ae682-8b2b66ced27mr105221827b3.13.1793738275325;
        Tue, 03 Nov 2026 12:37:55 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30992b0aasm4710137b3.17.2026.11.03.12.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:37:54 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 03 Nov 2026 15:37:44 -0500
Subject: [PATCH v5 11/11] alpha/perf: sample only retired instructions for
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
Message-Id: <20261103-alpha-profileme-v5-11-bbe3937fbf3a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=CuA3WhUURsXwQIW0gkFRSbJkBWkVnkSIwyFkyFPC6gI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJeufGf09o+49Gias1NPsuuzbly+Zk1r27+tZ6a8sWBp
 Sn98TwBHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHPNtJmMDHeU6rfPlV
 2yKv5c24mpXJfOOG6cGv2+RLertEH/QoV9+yaG/5mFny68XGTU+qmipWfO2ROTWoLNTy9TdLw9r
 /dFQ8XvDZwA
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
their data source now needs cpu/cycles,trapped/p.

Suggested-by: Ian Rogers <irogers@google.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index bed671fe726d..c108b5488a50 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -825,6 +825,11 @@ static int __hw_perf_event_init(struct perf_event *event)
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

