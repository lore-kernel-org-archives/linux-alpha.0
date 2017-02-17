From: Joe Perches <joe@perches.com>
Subject: [PATCH 01/35] alpha: Convert remaining uses of pr_warning to pr_warn
Date: Thu, 16 Feb 2017 23:11:14 -0800
Message-ID: <49dcdd7d61ed1c486eacacad70b5cf26472e2aa1.1487314666.git.joe@perches.com>
References: <cover.1487314666.git.joe@perches.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1487314666.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

To enable eventual removal of pr_warning

This makes pr_warn use consistent for arch/alpha

Prior to this patch, there were 2 uses of pr_warning and
0 uses of pr_warn in arch/alpha

Signed-off-by: Joe Perches <joe@perches.com>
---
 arch/alpha/kernel/perf_event.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 5c218aa3f3df..06c118ab640b 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -828,7 +828,7 @@ static void alpha_perf_event_irq_handler(unsigned long la_ptr,
 	if (unlikely(la_ptr >= alpha_pmu->num_pmcs)) {
 		/* This should never occur! */
 		irq_err_count++;
-		pr_warning("PMI: silly index %ld\n", la_ptr);
+		pr_warn("PMI: silly index %ld\n", la_ptr);
 		wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
 		return;
 	}
@@ -851,7 +851,7 @@ static void alpha_perf_event_irq_handler(unsigned long la_ptr,
 	if (unlikely(!event)) {
 		/* This should never occur! */
 		irq_err_count++;
-		pr_warning("PMI: No event at index %d!\n", idx);
+		pr_warn("PMI: No event at index %d!\n", idx);
 		wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
 		return;
 	}
-- 
2.10.0.rc2.1.g053435c

