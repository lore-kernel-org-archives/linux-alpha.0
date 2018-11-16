From: Andrew Murray <andrew.murray@arm.com>
Subject: [PATCH 06/10] alpha: perf/core: generalise event exclusion checking with perf macro
Date: Fri, 16 Nov 2018 10:24:09 +0000
Message-ID: <1542363853-13849-7-git-send-email-andrew.murray@arm.com>
References: <1542363853-13849-1-git-send-email-andrew.murray@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542363853-13849-1-git-send-email-andrew.murray@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, x86@kernel.org
Cc: linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Replace checking of perf event exclusion flags with perf macro.

This is a functional change as __hw_perf_event_init will now indicate
that it doesn't support exclude_host and exclude_guest event flags.

Signed-off-by: Andrew Murray <andrew.murray@arm.com>
---
 arch/alpha/kernel/perf_event.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 5613aa37..36f98ee 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -631,10 +631,8 @@ static int __hw_perf_event_init(struct perf_event *event)
 	}
 
 	/* The EV67 does not support mode exclusion */
-	if (attr->exclude_kernel || attr->exclude_user
-			|| attr->exclude_hv || attr->exclude_idle) {
+	if (event_has_exclude_flags(event))
 		return -EPERM;
-	}
 
 	/*
 	 * We place the event type in event_base here and leave calculation
-- 
2.7.4

