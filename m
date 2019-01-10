From: Andrew Murray <andrew.murray@arm.com>
Subject: [PATCH v5 12/12] perf/core: remove unused perf_flags
Date: Thu, 10 Jan 2019 13:53:34 +0000
Message-ID: <1547128414-50693-13-git-send-email-andrew.murray@arm.com>
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

Now that perf_flags is not used we remove it.

Signed-off-by: Andrew Murray <andrew.murray@arm.com>
---
 include/uapi/linux/perf_event.h       | 2 --
 tools/include/uapi/linux/perf_event.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 9de8780..ea19b5d 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -445,8 +445,6 @@ struct perf_event_query_bpf {
 	__u32	ids[0];
 };
 
-#define perf_flags(attr)	(*(&(attr)->read_format + 1))
-
 /*
  * Ioctls that can be done on a perf event fd:
  */
diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index 9de8780..ea19b5d 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -445,8 +445,6 @@ struct perf_event_query_bpf {
 	__u32	ids[0];
 };
 
-#define perf_flags(attr)	(*(&(attr)->read_format + 1))
-
 /*
  * Ioctls that can be done on a perf event fd:
  */
-- 
2.7.4

