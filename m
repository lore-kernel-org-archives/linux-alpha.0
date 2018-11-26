From: Andrew Murray <andrew.murray@arm.com>
Subject: [PATCH v2 01/20] perf/doc: update design.txt for exclude_{host|guest} flags
Date: Mon, 26 Nov 2018 11:12:17 +0000
Message-ID: <1543230756-15319-2-git-send-email-andrew.murray@arm.com>
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

Update design.txt to reflect the presence of the exclude_host
and exclude_guest perf flags.

Signed-off-by: Andrew Murray <andrew.murray@arm.com>
---
 tools/perf/design.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/perf/design.txt b/tools/perf/design.txt
index a28dca2..5b2b23b 100644
--- a/tools/perf/design.txt
+++ b/tools/perf/design.txt
@@ -222,6 +222,10 @@ The 'exclude_user', 'exclude_kernel' and 'exclude_hv' bits provide a
 way to request that counting of events be restricted to times when the
 CPU is in user, kernel and/or hypervisor mode.
 
+Furthermore the 'exclude_host' and 'exclude_guest' bits provide a way
+to request counting of events restricted to guest and host contexts when
+using KVM virtualisation.
+
 The 'mmap' and 'munmap' bits allow recording of PROT_EXEC mmap/munmap
 operations, these can be used to relate userspace IP addresses to actual
 code, even after the mapping (or even the whole process) is gone,
-- 
2.7.4

