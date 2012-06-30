From: Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH] alpha: Wire up cross memory attach syscalls
Date: Sat, 30 Jun 2012 13:30:47 +1200
Message-ID: <1341019847-5295-1-git-send-email-mcree@orcon.net.nz>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org

Add sys_process_vm_readv and sys_process_vm_writev to Alpha.

Signed-off-by: Michael Cree <mcree@orcon.net.nz>
---
 arch/alpha/include/asm/unistd.h |    4 +++-
 arch/alpha/kernel/systbls.S     |    2 ++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/include/asm/unistd.h b/arch/alpha/include/asm/unistd.h
index d1f23b7..d0fb026 100644
--- a/arch/alpha/include/asm/unistd.h
+++ b/arch/alpha/include/asm/unistd.h
@@ -465,10 +465,12 @@
 #define __NR_setns			501
 #define __NR_accept4			502
 #define __NR_sendmmsg			503
+#define __NR_process_vm_readv		504
+#define __NR_process_vm_writev		505
 
 #ifdef __KERNEL__
 
-#define NR_SYSCALLS			504
+#define NR_SYSCALLS			506
 
 #define __ARCH_WANT_IPC_PARSE_VERSION
 #define __ARCH_WANT_OLD_READDIR
diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
index 0cfffdc..2ac6b45 100644
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@ -522,6 +522,8 @@ sys_call_table:
 	.quad sys_setns
 	.quad sys_accept4
 	.quad sys_sendmmsg
+	.quad sys_process_vm_readv
+	.quad sys_process_vm_writev		/* 505 */
 
 	.size sys_call_table, . - sys_call_table
 	.type sys_call_table, @object
-- 
1.7.4.3

