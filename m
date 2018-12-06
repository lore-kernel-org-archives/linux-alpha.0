From: Andrew Murray <andrew.murray@arm.com>
Subject: [PATCH v3 07/12] drivers/perf: perf/core: use PERF_PMU_CAP_NO_EXCLUDE for exclude incapable PMUs
Date: Thu,  6 Dec 2018 16:47:24 +0000
Message-ID: <1544114849-47266-8-git-send-email-andrew.murray@arm.com>
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

Signed-off-by: Andrew Murray <andrew.murray@arm.com>
---
 drivers/perf/arm-cci.c                        | 10 +---------
 drivers/perf/arm-ccn.c                        |  6 ++----
 drivers/perf/arm_dsu_pmu.c                    |  9 ++-------
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c |  1 +
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  |  1 +
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c  |  1 +
 drivers/perf/hisilicon/hisi_uncore_pmu.c      |  9 ---------
 7 files changed, 8 insertions(+), 29 deletions(-)

diff --git a/drivers/perf/arm-cci.c b/drivers/perf/arm-cci.c
index 1bfeb16..bfd03e0 100644
--- a/drivers/perf/arm-cci.c
+++ b/drivers/perf/arm-cci.c
@@ -1327,15 +1327,6 @@ static int cci_pmu_event_init(struct perf_event *event)
 	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
 		return -EOPNOTSUPP;
 
-	/* We have no filtering of any kind */
-	if (event->attr.exclude_user	||
-	    event->attr.exclude_kernel	||
-	    event->attr.exclude_hv	||
-	    event->attr.exclude_idle	||
-	    event->attr.exclude_host	||
-	    event->attr.exclude_guest)
-		return -EINVAL;
-
 	/*
 	 * Following the example set by other "uncore" PMUs, we accept any CPU
 	 * and rewrite its affinity dynamically rather than having perf core
@@ -1433,6 +1424,7 @@ static int cci_pmu_init(struct cci_pmu *cci_pmu, struct platform_device *pdev)
 		.stop		= cci_pmu_stop,
 		.read		= pmu_read,
 		.attr_groups	= pmu_attr_groups,
+		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 	};
 
 	cci_pmu->plat_device = pdev;
diff --git a/drivers/perf/arm-ccn.c b/drivers/perf/arm-ccn.c
index 7dd850e..2ae7602 100644
--- a/drivers/perf/arm-ccn.c
+++ b/drivers/perf/arm-ccn.c
@@ -741,10 +741,7 @@ static int arm_ccn_pmu_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 	}
 
-	if (has_branch_stack(event) || event->attr.exclude_user ||
-			event->attr.exclude_kernel || event->attr.exclude_hv ||
-			event->attr.exclude_idle || event->attr.exclude_host ||
-			event->attr.exclude_guest) {
+	if (has_branch_stack(event)) {
 		dev_dbg(ccn->dev, "Can't exclude execution levels!\n");
 		return -EINVAL;
 	}
@@ -1290,6 +1287,7 @@ static int arm_ccn_pmu_init(struct arm_ccn *ccn)
 		.read = arm_ccn_pmu_event_read,
 		.pmu_enable = arm_ccn_pmu_enable,
 		.pmu_disable = arm_ccn_pmu_disable,
+		.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
 	};
 
 	/* No overflow interrupt? Have to use a timer instead. */
diff --git a/drivers/perf/arm_dsu_pmu.c b/drivers/perf/arm_dsu_pmu.c
index 660cb8a..5851de5 100644
--- a/drivers/perf/arm_dsu_pmu.c
+++ b/drivers/perf/arm_dsu_pmu.c
@@ -562,13 +562,7 @@ static int dsu_pmu_event_init(struct perf_event *event)
 		return -EINVAL;
 	}
 
-	if (has_branch_stack(event) ||
-	    event->attr.exclude_user ||
-	    event->attr.exclude_kernel ||
-	    event->attr.exclude_hv ||
-	    event->attr.exclude_idle ||
-	    event->attr.exclude_host ||
-	    event->attr.exclude_guest) {
+	if (has_branch_stack(event)) {
 		dev_dbg(dsu_pmu->pmu.dev, "Can't support filtering\n");
 		return -EINVAL;
 	}
@@ -735,6 +729,7 @@ static int dsu_pmu_device_probe(struct platform_device *pdev)
 		.read		= dsu_pmu_read,
 
 		.attr_groups	= dsu_pmu_attr_groups,
+		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 	};
 
 	rc = perf_pmu_register(&dsu_pmu->pmu, name, -1);
diff --git a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
index 1b10ea0..296fef8 100644
--- a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
@@ -396,6 +396,7 @@ static int hisi_ddrc_pmu_probe(struct platform_device *pdev)
 		.stop		= hisi_uncore_pmu_stop,
 		.read		= hisi_uncore_pmu_read,
 		.attr_groups	= hisi_ddrc_pmu_attr_groups,
+		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 	};
 
 	ret = perf_pmu_register(&ddrc_pmu->pmu, name, -1);
diff --git a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
index 443906e..2553a84 100644
--- a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
@@ -407,6 +407,7 @@ static int hisi_hha_pmu_probe(struct platform_device *pdev)
 		.stop		= hisi_uncore_pmu_stop,
 		.read		= hisi_uncore_pmu_read,
 		.attr_groups	= hisi_hha_pmu_attr_groups,
+		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 	};
 
 	ret = perf_pmu_register(&hha_pmu->pmu, name, -1);
diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
index 0bde5d9..cf1cc34 100644
--- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
@@ -397,6 +397,7 @@ static int hisi_l3c_pmu_probe(struct platform_device *pdev)
 		.stop		= hisi_uncore_pmu_stop,
 		.read		= hisi_uncore_pmu_read,
 		.attr_groups	= hisi_l3c_pmu_attr_groups,
+		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 	};
 
 	ret = perf_pmu_register(&l3c_pmu->pmu, name, -1);
diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index 9efd241..f028cbc 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -142,15 +142,6 @@ int hisi_uncore_pmu_event_init(struct perf_event *event)
 	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
 		return -EOPNOTSUPP;
 
-	/* counters do not have these bits */
-	if (event->attr.exclude_user	||
-	    event->attr.exclude_kernel	||
-	    event->attr.exclude_host	||
-	    event->attr.exclude_guest	||
-	    event->attr.exclude_hv	||
-	    event->attr.exclude_idle)
-		return -EINVAL;
-
 	/*
 	 *  The uncore counters not specific to any CPU, so cannot
 	 *  support per-task
-- 
2.7.4

