From: Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH 1/2] alpha: Wire up accept4 syscall.
Date: Mon, 26 Sep 2011 22:20:48 +1300
Message-ID: <1317028849-13198-2-git-send-email-mcree@orcon.net.nz>
References: <1317028849-13198-1-git-send-email-mcree@orcon.net.nz>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1317028849-13198-1-git-send-email-mcree@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

Somehow wiring up the accept4 syscall on Alpha was missed long ago.
This commit rectifies that oversight.

Signed-off-by: Michael Cree <mcree@orcon.net.nz>
---
 arch/alpha/include/asm/unistd.h |    3 ++-
 arch/alpha/kernel/systbls.S     |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/include/asm/unistd.h b/arch/alpha/include/asm/unistd.h
index 4ac48a0..1fbfd64 100644
--- a/arch/alpha/include/asm/unistd.h
+++ b/arch/alpha/include/asm/unistd.h
@@ -457,10 +457,11 @@
 #define __NR_clock_adjtime		499
 #define __NR_syncfs			500
 #define __NR_setns			501
+#define __NR_accept4			502
 
 #ifdef __KERNEL__
 
-#define NR_SYSCALLS			502
+#define NR_SYSCALLS			503
 
 #define __ARCH_WANT_IPC_PARSE_VERSION
 #define __ARCH_WANT_OLD_READDIR
diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
index b9c28f3..b24574f 100644
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@ -520,6 +520,7 @@ sys_call_table:
 	.quad sys_clock_adjtime
 	.quad sys_syncfs			/* 500 */
 	.quad sys_setns
+	.quad sys_accept4
 
 	.size sys_call_table, . - sys_call_table
 	.type sys_call_table, @object
-- 
1.7.4.3

