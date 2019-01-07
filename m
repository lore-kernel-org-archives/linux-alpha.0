From: Andrew Murray <andrew.murray@arm.com>
Subject: [PATCH v4 13/13] drivers/perf: use PERF_PMU_CAP_NO_EXCLUDE for Cavium TX2 PMU
Date: Mon,  7 Jan 2019 16:27:30 +0000
Message-ID: <1546878450-20341-14-git-send-email-andrew.murray@arm.com>
References: <1546878450-20341-1-git-send-email-andrew.murray@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546878450-20341-1-git-send-email-andrew.murray@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Russell King <linux@armlinux.org.uk>, suzuki.poulose@arm.com, robin.murphy@arm.com, Michael Ellerman <mpe@ellerman.id.au>
Cc: x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org

The Cavium ThunderX2 UNCORE PMU driver doesn't support any event
filtering. Let's advertise the PERF_PMU_CAP_NO_EXCLUDE capability to
simplify the code.

Signed-off-by: Andrew Murray <andrew.murray@arm.com>
---
 drivers/perf/thunderx2_pmu.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/perf/thunderx2_pmu.c b/drivers/perf/thunderx2_pmu.c
index c9a1701..43d76c8 100644
--- a/drivers/perf/thunderx2_pmu.c
+++ b/drivers/perf/thunderx2_pmu.c
@@ -424,15 +424,6 @@ static int tx2_uncore_event_init(struct perf_event *event)
 	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
 		return -EINVAL;
 
-	/* We have no filtering of any kind */
-	if (event->attr.exclude_user	||
-	    event->attr.exclude_kernel	||
-	    event->attr.exclude_hv	||
-	    event->attr.exclude_idle	||
-	    event->attr.exclude_host	||
-	    event->attr.exclude_guest)
-		return -EINVAL;
-
 	if (event->cpu < 0)
 		return -EINVAL;
 
@@ -572,6 +563,7 @@ static int tx2_uncore_pmu_register(
 		.start		= tx2_uncore_event_start,
 		.stop		= tx2_uncore_event_stop,
 		.read		= tx2_uncore_event_read,
+		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 	};
 
 	tx2_pmu->pmu.name = devm_kasprintf(dev, GFP_KERNEL,
-- 
2.7.4

