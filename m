From: cgel.zte@gmail.com
Subject: [PATCH] alpha: replace NR_SYSCALLS by NR_syscalls
Date: Tue, 29 Mar 2022 02:57:38 +0000
Message-ID: <20220329025737.2375176-1-yang.yang29@zte.com.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2doMNH7ifB03QblJV2sV07sq+r0A6Mdk0Jlzv/ArvaY=;
        b=AUeM4C6NBE4EMZ2lTC/kkzSz9gJLIrJRpFA4SgUEtFR6sht/NzF1n4U3bovPj4bOQD
         dIC7H2cgVqJj17X6kuoInrEyZvmkCrKYw7F7H79NWkwh1dfYG3/ZjGexG2viAFTCXaST
         z3pdNxSnlPBdVtNod0v+QYyAYzJZK4VAJKp0Iweyi1RP2AbkQgOO40/C1kJW+D63lIJE
         0kTvsA8iW7gKdpP/lj9l12Gy9jQ8wiCbtEsr55TEluNv6xP6mLJ0q+TRm8/JAf1PeSQX
         Vg0Fg626qCPmg8jE/SgETQiJ/VDwoJkgijLpIyzEVucRBPu0tqlELTDX76M3NZsoMhfl
         j/bQ==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, firoz.khan@linaro.org, ematsumiya@suse.de
Cc: rostedt@goodmis.org, mingo@redhat.com, yang.yang29@zte.com.cn, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

From: Yang Yang <yang.yang29@zte.com.cn>

Reference to other arch likes x86_64 or arm64 to do this replacement.
To solve compile error when using NR_syscalls in kernel[1].

[1] https://lore.kernel.org/all/202203270449.WBYQF9X3-lkp@intel.com/

Signed-off-by: Yang Yang <yang.yang29@zte.com.cn>
---
 arch/alpha/include/asm/unistd.h | 2 +-
 arch/alpha/kernel/entry.S       | 4 ++--
 kernel/trace/trace.h            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/include/asm/unistd.h b/arch/alpha/include/asm/unistd.h
index 986f5da9b7d8..caabd92ea709 100644
--- a/arch/alpha/include/asm/unistd.h
+++ b/arch/alpha/include/asm/unistd.h
@@ -4,7 +4,7 @@
 
 #include <uapi/asm/unistd.h>
 
-#define NR_SYSCALLS	__NR_syscalls
+#define NR_syscalls	__NR_syscalls
 
 #define __ARCH_WANT_NEW_STAT
 #define __ARCH_WANT_OLD_READDIR
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index e227f3a29a43..966400b925a5 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -454,7 +454,7 @@ entSys:
 	SAVE_ALL
 	lda	$8, 0x3fff
 	bic	$sp, $8, $8
-	lda	$4, NR_SYSCALLS($31)
+	lda	$4, NR_syscalls($31)
 	stq	$16, SP_OFF+24($sp)
 	lda	$5, sys_call_table
 	lda	$27, sys_ni_syscall
@@ -585,7 +585,7 @@ strace:
 	ldq	$21, 88($sp)
 
 	/* get the system call pointer.. */
-	lda	$1, NR_SYSCALLS($31)
+	lda	$1, NR_syscalls($31)
 	lda	$2, sys_call_table
 	lda	$27, sys_ni_syscall
 	cmpult	$0, $1, $1
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 07d990270e2a..7ad8324db192 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -25,7 +25,7 @@
 #include "pid_list.h"
 
 #ifdef CONFIG_FTRACE_SYSCALLS
-#include <asm/unistd.h>		/* For NR_SYSCALLS	     */
+#include <asm/unistd.h>		/* For NR_syscalls	     */
 #include <asm/syscall.h>	/* some archs define it here */
 #endif
 
-- 
2.25.1

