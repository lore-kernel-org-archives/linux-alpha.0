From: Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH] alpha: extend memset16 to EV6 optimised routines
Date: Wed,  3 Jan 2018 21:58:00 +1300
Message-ID: <20180103085800.2343-1-mcree@orcon.net.nz>
References: <677c9cbb-3568-e942-ae78-cb891f87e207@gmx.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <677c9cbb-3568-e942-ae78-cb891f87e207@gmx.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dennis Luehring <dl.soluz@gmx.net>
Cc: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Michael Cree <mcree@orcon.net.nz>

Commit 92ce4c3ea7c4, "alpha: add support for memset16", renamed
the function memsetw() to be memset16() but neglected to do this for
the EV6 optimised version, thus when building a kernel optimised
for EV6 (or later) link errors result.  This extends the memset16
support to EV6.

Signed-off-by: Michael Cree <mcree@orcon.net.nz>
---
 arch/alpha/lib/ev6-memset.S | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/lib/ev6-memset.S b/arch/alpha/lib/ev6-memset.S
index 316a99aa9efe..1cfcfbbea6f0 100644
--- a/arch/alpha/lib/ev6-memset.S
+++ b/arch/alpha/lib/ev6-memset.S
@@ -18,7 +18,7 @@
  * The algorithm for the leading and trailing quadwords remains the same,
  * however the loop has been unrolled to enable better memory throughput,
  * and the code has been replicated for each of the entry points: __memset
- * and __memsetw to permit better scheduling to eliminate the stalling
+ * and __memset16 to permit better scheduling to eliminate the stalling
  * encountered during the mask replication.
  * A future enhancement might be to put in a byte store loop for really
  * small (say < 32 bytes) memset()s.  Whether or not that change would be
@@ -34,7 +34,7 @@
 	.globl memset
 	.globl __memset
 	.globl ___memset
-	.globl __memsetw
+	.globl __memset16
 	.globl __constant_c_memset
 
 	.ent ___memset
@@ -415,9 +415,9 @@ end:
 	 * to mask stalls.  Note that entry point names also had to change
 	 */
 	.align 5
-	.ent __memsetw
+	.ent __memset16
 
-__memsetw:
+__memset16:
 	.frame $30,0,$26,0
 	.prologue 0
 
@@ -596,8 +596,8 @@ end_w:
 	nop
 	ret $31,($26),1		# L0 :
 
-	.end __memsetw
-	EXPORT_SYMBOL(__memsetw)
+	.end __memset16
+	EXPORT_SYMBOL(__memset16)
 
 memset = ___memset
 __memset = ___memset
-- 
2.11.0

