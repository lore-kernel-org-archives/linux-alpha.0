From: Andrew Murray <andrew.murray@arm.com>
Subject: [PATCH v3 08/12] drivers/perf: perf/core: use PERF_PMU_CAP_NO_EXCLUDE for exclude incapable PMUs
Date: Thu,  6 Dec 2018 16:47:25 +0000
Message-ID: <1544114849-47266-9-git-send-email-andrew.murray@arm.com>
References: <1544114849-47266-1-git-send-email-andrew.murray@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544114849-47266-1-git-send-email-andrew.murray@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Russell King <linux@armlinux.org.uk>, suzuki.poulose@arm.com, robin.murphy@arm.com, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org

For drivers that do not support context exclusion let's advertise the
PERF_PMU_CAP_NO_EXCLUDE capability. This ensures that perf will
prevent us from handling events where any exclusion flags are set.
Let's also remove the now unnecessary check for exclusion flags.

This change means that qcom_{l2|l3}_pmu will now also indicate that
they do not support exclude_{host|guest} and that xgene_pmu does
not also support exclude_idle and exclude_hv.

Note that for qcom_l2_pmu we now implictly return -EINVAL instead
of -EOPNOTSUPP. This change will result in the perf userspace
utility retrying the perf_event_open system call with fallback
event attributes that do not fail.

Signed-off-by: Andrew Murray <andrew.murray@arm.com>
---
 drivers/perf/qcom_l2_pmu.c | 9 +--------
 drivers/perf/qcom_l3_pmu.c | 8 +-------
 drivers/perf/xgene_pmu.c   | 6 +-----
 3 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/perf/qcom_l2_pmu.c b/drivers/perf/qcom_l2_pmu.c
index 842135c..091b4d7 100644
--- a/drivers/perf/qcom_l2_pmu.c
+++ b/drivers/perf/qcom_l2_pmu.c
@@ -509,14 +509,6 @@ static int l2_cache_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 	}
 
-	/* We cannot filter accurately so we just don't allow it. */
-	if (event->attr.exclude_user || event->attr.exclude_kernel ||
-	    event->attr.exclude_hv || event->attr.exclude_idle) {
-		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-				    "Can't exclude execution levels\n");
-		return -EOPNOTSUPP;
-	}
-
 	if (((L2_EVT_GROUP(event->attr.config) > L2_EVT_GROUP_MAX) ||
 	     ((event->attr.config & ~L2_EVT_MASK) != 0)) &&
 	    (event->attr.config != L2CYCLE_CTR_RAW_CODE)) {
@@ -982,6 +974,7 @@ static int l2_cache_pmu_probe(struct platform_device *pdev)
 		.stop		= l2_cache_event_stop,
 		.read		= l2_cache_event_read,
 		.attr_groups	= l2_cache_pmu_attr_grps,
+		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 	};
 
 	l2cache_pmu->num_counters = get_num_counters();
diff --git a/drivers/perf/qcom_l3_pmu.c b/drivers/perf/qcom_l3_pmu.c
index 2dc63d6..5d70646 100644
--- a/drivers/perf/qcom_l3_pmu.c
+++ b/drivers/perf/qcom_l3_pmu.c
@@ -495,13 +495,6 @@ static int qcom_l3_cache__event_init(struct perf_event *event)
 		return -ENOENT;
 
 	/*
-	 * There are no per-counter mode filters in the PMU.
-	 */
-	if (event->attr.exclude_user || event->attr.exclude_kernel ||
-	    event->attr.exclude_hv || event->attr.exclude_idle)
-		return -EINVAL;
-
-	/*
 	 * Sampling not supported since these events are not core-attributable.
 	 */
 	if (hwc->sample_period)
@@ -777,6 +770,7 @@ static int qcom_l3_cache_pmu_probe(struct platform_device *pdev)
 		.read		= qcom_l3_cache__event_read,
 
 		.attr_groups	= qcom_l3_cache_pmu_attr_grps,
+		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 	};
 
 	memrc = platform_get_resource(pdev, IORESOURCE_MEM, 0);
diff --git a/drivers/perf/xgene_pmu.c b/drivers/perf/xgene_pmu.c
index 0e31f13..dad6169 100644
--- a/drivers/perf/xgene_pmu.c
+++ b/drivers/perf/xgene_pmu.c
@@ -914,11 +914,6 @@ static int xgene_perf_event_init(struct perf_event *event)
 	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
 		return -EINVAL;
 
-	/* SOC counters do not have usr/os/guest/host bits */
-	if (event->attr.exclude_user || event->attr.exclude_kernel ||
-	    event->attr.exclude_host || event->attr.exclude_guest)
-		return -EINVAL;
-
 	if (event->cpu < 0)
 		return -EINVAL;
 	/*
@@ -1133,6 +1128,7 @@ static int xgene_init_perf(struct xgene_pmu_dev *pmu_dev, char *name)
 		.start		= xgene_perf_start,
 		.stop		= xgene_perf_stop,
 		.read		= xgene_perf_read,
+		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 	};
 
 	/* Hardware counter init */
-- 
2.7.4

