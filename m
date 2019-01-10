From: Andrew Murray <andrew.murray@arm.com>
Subject: [PATCH v5 02/12] perf/core: add function to test for event exclusion flags
Date: Thu, 10 Jan 2019 13:53:24 +0000
Message-ID: <1547128414-50693-3-git-send-email-andrew.murray@arm.com>
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

Add a function that tests if any of the perf event exclusion flags
are set on a given event.

Signed-off-by: Andrew Murray <andrew.murray@arm.com>
---
 include/linux/perf_event.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 1d5c551..54a78d2 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1004,6 +1004,15 @@ perf_event__output_id_sample(struct perf_event *event,
 extern void
 perf_log_lost_samples(struct perf_event *event, u64 lost);
 
+static inline bool event_has_any_exclude_flag(struct perf_event *event)
+{
+	struct perf_event_attr *attr = &event->attr;
+
+	return attr->exclude_idle || attr->exclude_user ||
+	       attr->exclude_kernel || attr->exclude_hv ||
+	       attr->exclude_guest || attr->exclude_host;
+}
+
 static inline bool is_sampling_event(struct perf_event *event)
 {
 	return event->attr.sample_period != 0;
-- 
2.7.4

