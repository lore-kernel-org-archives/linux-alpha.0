From: cgel.zte@gmail.com
Subject: [PATCH] arch/alpha/kernel: remove redundant err variable
Date: Mon, 10 Jan 2022 01:29:54 +0000
Message-ID: <20220110012954.644059-1-chi.minghao@zte.com.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ahpX94c8GUmfMJh8inkb4fyYhi5rbgrtZUmtlm080A=;
        b=AMdHRjEu3M3oKR3yjUIESyRG3UvvqvBAJ7DvqBXZDISAN0v+P/+JTHBh6oNPYoqDGt
         HQ+eFIS19fCTk6gQiCa7FrVjv6UwrVyVF5tv1Esab7KoIDf2GE7feL7vHTmIzrnKpzGZ
         +E786/7Y3PCTejwLnubmdfyeYc6+LhdRFAfDJf4dO7nQMIF1EbDlOjcgVOKpTbNcjz3z
         JM1W7awIiV3V4SCE16ibbmQHilc+RozkLTUGS2BXe1xIujiCHYsR82q2TA4XjBKzMo8z
         eEdYhiWSVV9kbtg4BpTwvPB56mifFozQ/LAgXMk/07gAZNn6JgYePMw8Sf4h+UK2eXyT
         oU2Q==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: peterz@infradead.org
Cc: mingo@redhat.com, acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>, CGEL ZTE <cgel.zte@gmail.com>

From: Minghao Chi <chi.minghao@zte.com.cn>

Return value from __hw_perf_event_init() directly instead
of taking this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index efcf7321701b..ccdb508c1516 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -689,8 +689,6 @@ static int __hw_perf_event_init(struct perf_event *event)
  */
 static int alpha_pmu_event_init(struct perf_event *event)
 {
-	int err;
-
 	/* does not support taken branch sampling */
 	if (has_branch_stack(event))
 		return -EOPNOTSUPP;
@@ -709,9 +707,7 @@ static int alpha_pmu_event_init(struct perf_event *event)
 		return -ENODEV;
 
 	/* Do the real initialisation work. */
-	err = __hw_perf_event_init(event);
-
-	return err;
+	return __hw_perf_event_init(event);
 }
 
 /*
-- 
2.25.1

