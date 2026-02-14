Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70C92FA0DB
	for <linux-alpha@vger.kernel.org>; Sat, 14 Feb 2026 15:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771084156; cv=none; b=E/6Om5jh4Zd665Jn7AL1csx7tQdAmnE3hlN9vv81Tu34zXrXFAl7wz2cEgfzB6EC5O5cU9slz0RkhylEWzPN9y/w8yuuAv3+0KUyCWP3WWVuIMeeJbIzrZT0PGCcx42ZwBhP8Z9L4KOLStxXR+JYlVSnj6x1UFY0RZLEKBPsTRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771084156; c=relaxed/simple;
	bh=gO5XKTbGTCNX9F2kGpffpU86Ne6W69soNa7yYuB8rEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kMbmvwhwDxD1A3OPFH7SqnQffjrf5+XpLcmra4RJXvV7Es8fuzBOP1V+cDUKvPwH/7RK9iXSB+sSxxO28HMMSaB38ZH0d6hsUHreZEKnt9LKUEgptdWbwuHiRJNbauVF04UuMhQtP6GNqet0zHHrWQXWlGVjajDmYuJ4ac4OLpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sv6vb/59; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sv6vb/59"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a7b47a5460so21949435ad.1
        for <linux-alpha@vger.kernel.org>; Sat, 14 Feb 2026 07:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771084155; x=1771688955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HQ3C3N6ai9LWpoELJlhPWsjarYjJZBYa3nbCsM7NzMU=;
        b=Sv6vb/59YzoiaGR2IEoxp8iVLRJhDhLlxqlKiRZlzzQnH6Nj6zBVHjeDJN6YqQaLtO
         BH0acrkXTwH4pK7r6QPIuOBSy/+aPlKnqP4QGFbPUhje0X0tL2BHkb0rfiv1deRDdCQL
         QkvNOYUfy+fViNlFJth8CCu1yMlvRBaDlk9+qgRNiv2nZe4IE4KxfCEq2dfYmkaBWMIL
         CR10Ex3ZbJhzTg1mkKK8Gmr9+ASEeEDHKYAa7hcAChNG6j1jQElD/nUbroV0VRQRm5Km
         ZzO3YwQPb51Cr35F1jGTrGscGGnyqnnS4qf7VaC5CnTART5BMyfVAkeeeedZ8HM9PmlT
         t7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771084155; x=1771688955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQ3C3N6ai9LWpoELJlhPWsjarYjJZBYa3nbCsM7NzMU=;
        b=v2wUjuFvhZgVLY6Y6R5nwaOA6Xc8VI+48u4vIViSbq/9o1m1y+cSAiX6Wt78ac6bMF
         H34nSntZKNtgh7tgBvslwn7PpjR9d+dnwSXbtas5FDoAu7v6vvp+P7WcTk81BBbo4R4h
         52jIlF8/TYOexaUX86n/jeaI8D71aCh/ftPXjSIUpEvwTZTC62vnOZwv9d+wIphKugLk
         R+veevtND+cFR7UThRa6PF6cW3b1VbAxZWKqM/z8EAaNcxEQCokBQ7rHrnaU+tfKjLMX
         5G2GCIPoEjEOs9gG0xrOL56Nas6AOJt0xpgW8ei+RKEfBHKzvjQrfnTS1YMsgLcIEyNx
         v2Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWD0hy4Qa2dMCJNhabUkTvKfRpkqmX6+iMULkGtGL/Dv/ueuTCvxirlPr15UqawlH/Axbv19iDRFVxdPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrGZxIe/SrVl/RKk5IwMeqj/r6f/8SFcXFB2uH/PsijfhnCgXE
	wrrJ+kPR1/dhrO27NRgCRUaAxIhSd+0yMAf5lKSGtT/OdUH2u8Jjlgbv
X-Gm-Gg: AZuq6aK6IOXeVNMCi9D3RHeGBU6J3rPEiVLYOX9pmjwBT9hB9l/Zs0qP6zTX3wXnxcs
	n4m206zWKbNyMYqkGd8NB5ONSoe3f0zqSBELqAqwYeris2WwUxA9bEsDANeLFGzS1t76e2WVlAp
	meuvI/66Sj0EVqB/gvqYB7MPSVWw2td/V1DcN8U6hojUyJuTSlBc1BsOOu+uOqWUifkUHSc8j5E
	LI7CFVkFXcXxRHsjr06USvpZIZ7buFcigju9e36u4neSy9+UntezxYdAQFMDHna3tQnv2+EV/AG
	Bd8CY0rhvsDk8eM1DESeR0KhgFC7tdrVcxzhsl6absUR2olFTSMyRfjIaAdVkTr11Axc4IR4fTo
	OSjTVsgGQfozTqu0X0a7DiiPB2nt1y6eBKwMS/+DpF19Z7oFUPh1T+ShYT61D2khwwDd+JKxc7j
	7QZjY/0kPKkfiDJeD8Bn9VlO1iT1S8byFObKu30Ly9D+1eKDreBwA=
X-Received: by 2002:a17:902:ce11:b0:2aa:d320:e965 with SMTP id d9443c01a7336-2ac97593e35mr28414925ad.21.1771084155016;
        Sat, 14 Feb 2026 07:49:15 -0800 (PST)
Received: from localhost.localdomain ([202.161.55.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6f9c5bsm24662435ad.15.2026.02.14.07.49.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Feb 2026 07:49:14 -0800 (PST)
From: Yunbo Lyu <yunbolv@gmail.com>
X-Google-Original-From: Yunbo Lyu <yunbolyu@smu.edu.sg>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	richard.henderson@linaro.org,
	mattst88@gmail.com
Cc: mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	julia.lawall@inria.fr,
	ratnadiraw@smu.edu.sg,
	xutong.ma@inria.fr,
	kexinsun@smail.nju.edu.cn,
	Yunbo Lyu <yunbolyu@smu.edu.sg>
Subject: [PATCH] alpha/perf: Clean up stale comments referencing old hw_perf_* APIs
Date: Sat, 14 Feb 2026 23:49:04 +0800
Message-ID: <20260214154904.37655-1-yunbolyu@smu.edu.sg>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two outdated comments in arch/alpha/kernel/perf_event.c referred to
functions from the deprecated hw_perf_* APIs that were removed more
than a decade ago:

1. hw_perf_disable():
   This was superseded by per-PMU disable APIs such as
   alpha_pmu_disable(), after commit 33696fc0d141 ("perf: Per PMU
   disable"). The comment has been updated to reflect the correct
   function name.

2. hw_perf_group_sched_in():
   This function was removed in commit a13c3afd9b62 ("perf, sparc:
   Implement group scheduling transactional APIs"). The corresponding
   comment mentioning it has been removed. The if (n_ev == 0) check in
   alpha_check_constraints() has also been removed, as this condition is
   never true. The alpha_check_constraints() function is only called
   from two places:

   - alpha_pmu_add(), which calls alpha_check_constraints() with
     n0 + 1, where n0 is the number of existing events (>= 0).
   - __hw_perf_event_init(), which calls it with n + 1, where n is the
     number of events in the group (>= 0).

   In both cases, the n_ev argument is guaranteed to be at least 1.
   Therefore, the check is redundant.

No functional changes; comments and dead code cleanup.

Fixes: 33696fc0d141 ("perf: Per PMU disable")
Fixes: a13c3afd9b62 ("perf, sparc: Implement group scheduling transactional APIs")

Signed-off-by: Yunbo Lyu <yunbolyu@smu.edu.sg>
---
 arch/alpha/kernel/perf_event.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index a3eaab094ece..2f57626ffcfb 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -35,7 +35,7 @@ struct cpu_hw_events {
 	int			enabled;
 	/* Number of events scheduled; also number entries valid in arrays below. */
 	int			n_events;
-	/* Number events added since last hw_perf_disable(). */
+	/* Number of events added since last alpha_pmu_disable(). */
 	int			n_added;
 	/* Events currently scheduled. */
 	struct perf_event	*event[MAX_HWEVENTS];
@@ -372,10 +372,6 @@ static int alpha_check_constraints(struct perf_event **events,
 				   unsigned long *evtypes, int n_ev)
 {
 
-	/* No HW events is possible from hw_perf_group_sched_in(). */
-	if (n_ev == 0)
-		return 0;
-
 	if (n_ev > alpha_pmu->num_pmcs)
 		return -1;
 
-- 
2.25.1

