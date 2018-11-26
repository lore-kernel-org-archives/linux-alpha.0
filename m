From: Andrew Murray <andrew.murray@arm.com>
Subject: [PATCH v2 05/20] alpha: perf/core: remove unnecessary checks for exclusion
Date: Mon, 26 Nov 2018 11:12:21 +0000
Message-ID: <1543230756-15319-6-git-send-email-andrew.murray@arm.com>
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

As the Alpha PMU doesn't support context exclusion we do not
advertise the PERF_PMU_CAP_EXCLUDE capability. This ensures that
perf will prevent us from handling events where any exclusion
flags are set. Let's remove the now unnecessary check for
exclusion flags.

This change means that __hw_perf_event_init will now also
indicate that it doesn't support exclude_host and exclude_guest and
will now implicitly return -EINVAL instead of -EPERM. This is likely
more desirable as -EPERM will result in a kernel.perf_event_paranoid
related warning from the perf userspace utility.

Signed-off-by: Andrew Murray <andrew.murray@arm.com>
---
 arch/alpha/kernel/perf_event.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 5613aa37..5c17077 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -630,12 +630,6 @@ static int __hw_perf_event_init(struct perf_event *event)
 		return ev;
 	}
 
-	/* The EV67 does not support mode exclusion */
-	if (attr->exclude_kernel || attr->exclude_user
-			|| attr->exclude_hv || attr->exclude_idle) {
-		return -EPERM;
-	}
-
 	/*
 	 * We place the event type in event_base here and leave calculation
 	 * of the codes to programme the PMU for alpha_pmu_enable() because
-- 
2.7.4

