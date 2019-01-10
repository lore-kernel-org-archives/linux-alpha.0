From: Andrew Murray <andrew.murray@arm.com>
Subject: [PATCH v5 09/12] powerpc: perf/core: use PERF_PMU_CAP_NO_EXCLUDE for exclude incapable PMUs
Date: Thu, 10 Jan 2019 13:53:31 +0000
Message-ID: <1547128414-50693-10-git-send-email-andrew.murray@arm.com>
References: <1547128414-50693-1-git-send-email-andrew.murray@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547128414-50693-1-git-send-email-andrew.murray@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Russell King <linux@armlinux.org.uk>, suzuki.poulose@arm.com, robin.murphy@arm.com, Michael Ellerman <mpe@ellerman.id.au>
Cc: x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org

For PowerPC PMUs that do not support context exclusion let's
advertise the PERF_PMU_CAP_NO_EXCLUDE capability. This ensures that
perf will prevent us from handling events where any exclusion flags
are set. Let's also remove the now unnecessary check for exclusion
flags.

Signed-off-by: Andrew Murray <andrew.murray@arm.com>
Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/perf/hv-24x7.c | 10 +---------
 arch/powerpc/perf/hv-gpci.c | 10 +---------
 arch/powerpc/perf/imc-pmu.c | 19 +------------------
 3 files changed, 3 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index 72238ee..d2b8e60 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -1306,15 +1306,6 @@ static int h_24x7_event_init(struct perf_event *event)
 		return -EINVAL;
 	}
 
-	/* unsupported modes and filters */
-	if (event->attr.exclude_user   ||
-	    event->attr.exclude_kernel ||
-	    event->attr.exclude_hv     ||
-	    event->attr.exclude_idle   ||
-	    event->attr.exclude_host   ||
-	    event->attr.exclude_guest)
-		return -EINVAL;
-
 	/* no branch sampling */
 	if (has_branch_stack(event))
 		return -EOPNOTSUPP;
@@ -1577,6 +1568,7 @@ static struct pmu h_24x7_pmu = {
 	.start_txn   = h_24x7_event_start_txn,
 	.commit_txn  = h_24x7_event_commit_txn,
 	.cancel_txn  = h_24x7_event_cancel_txn,
+	.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
 };
 
 static int hv_24x7_init(void)
diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index 43fabb3..735e77b 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -232,15 +232,6 @@ static int h_gpci_event_init(struct perf_event *event)
 		return -EINVAL;
 	}
 
-	/* unsupported modes and filters */
-	if (event->attr.exclude_user   ||
-	    event->attr.exclude_kernel ||
-	    event->attr.exclude_hv     ||
-	    event->attr.exclude_idle   ||
-	    event->attr.exclude_host   ||
-	    event->attr.exclude_guest)
-		return -EINVAL;
-
 	/* no branch sampling */
 	if (has_branch_stack(event))
 		return -EOPNOTSUPP;
@@ -285,6 +276,7 @@ static struct pmu h_gpci_pmu = {
 	.start       = h_gpci_event_start,
 	.stop        = h_gpci_event_stop,
 	.read        = h_gpci_event_update,
+	.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
 };
 
 static int hv_gpci_init(void)
diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index f292a3f..b1c37cc 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -473,15 +473,6 @@ static int nest_imc_event_init(struct perf_event *event)
 	if (event->hw.sample_period)
 		return -EINVAL;
 
-	/* unsupported modes and filters */
-	if (event->attr.exclude_user   ||
-	    event->attr.exclude_kernel ||
-	    event->attr.exclude_hv     ||
-	    event->attr.exclude_idle   ||
-	    event->attr.exclude_host   ||
-	    event->attr.exclude_guest)
-		return -EINVAL;
-
 	if (event->cpu < 0)
 		return -EINVAL;
 
@@ -748,15 +739,6 @@ static int core_imc_event_init(struct perf_event *event)
 	if (event->hw.sample_period)
 		return -EINVAL;
 
-	/* unsupported modes and filters */
-	if (event->attr.exclude_user   ||
-	    event->attr.exclude_kernel ||
-	    event->attr.exclude_hv     ||
-	    event->attr.exclude_idle   ||
-	    event->attr.exclude_host   ||
-	    event->attr.exclude_guest)
-		return -EINVAL;
-
 	if (event->cpu < 0)
 		return -EINVAL;
 
@@ -1069,6 +1051,7 @@ static int update_pmu_ops(struct imc_pmu *pmu)
 	pmu->pmu.stop = imc_event_stop;
 	pmu->pmu.read = imc_event_update;
 	pmu->pmu.attr_groups = pmu->attr_groups;
+	pmu->pmu.capabilities = PERF_PMU_CAP_NO_EXCLUDE;
 	pmu->attr_groups[IMC_FORMAT_ATTR] = &imc_format_group;
 
 	switch (pmu->domain) {
-- 
2.7.4

