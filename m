From: Andrew Murray <andrew.murray@arm.com>
Subject: [PATCH v2 02/20] perf/core: add function to test for event exclusion flags
Date: Mon, 26 Nov 2018 11:12:18 +0000
Message-ID: <1543230756-15319-3-git-send-email-andrew.murray@arm.com>
References: <1543230756-15319-1-git-send-email-andrew.murray@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543230756-15319-1-git-send-email-andrew.murray@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, "David S . Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-s390@vger.kernel.org, linux-mips@linux-mips.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org

Add a function that tests if any of the perf event exclusion flags
are set on a given event.

Signed-off-by: Andrew Murray <andrew.murray@arm.com>
---
 include/linux/perf_event.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 53c500f..b2e806f 100644
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

