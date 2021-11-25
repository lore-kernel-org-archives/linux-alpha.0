From: Denis Kirjanov <kda@linux-powerpc.org>
Subject: [PATCH] alpha: signal: drop DEBUG_SIG print statements
Date: Thu, 25 Nov 2021 16:27:59 +0300
Message-ID: <20211125132759.16212-1-kda@linux-powerpc.org>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-powerpc-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id;
        bh=aSUF9oXETjDoDDLltfRKWNT8EucdXZILjenFDT8AYDA=;
        b=gWAmT6cCMkmGGaC4S+d292wYYIftHaMXJMyMoJQ3WVYusc8GfA8iID3axlalSlaGuC
         7MNbIltYsqGh3k2f+gRXYR20keJkwTcSEtHzziTKKEABcH8ugGUYUIwq0z7A8YeEo6Gw
         aCxqTCjJWZBOImibTgcX34q6zd/9ow7LNj9pongrpUF1QjvaXSZqginEbPJDCDNA8Enz
         96A03KVuCT2ZmHyh2vrvgL5N3ix3mQOpo3UR3G1szhoXZ6gAR9SM16GsjSnVRH5McASu
         2LYbU5mLWYmd3tMbQAGJ1TzPrC7mwNFf9TfzE4GGnJHJIIOUzXAEL2+cA+la/M4Nqgk1
         Tq6A==
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

Drop compile-based legacy debug print statements

Signed-off-by: Denis Kirjanov <kda@linux-powerpc.org>
---
 arch/alpha/kernel/signal.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index bc077babafab..d5849d6181b6 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -31,8 +31,6 @@
 #include "proto.h"
 
 
-#define DEBUG_SIG 0
-
 #define _BLOCKABLE (~(sigmask(SIGKILL) | sigmask(SIGSTOP)))
 
 asmlinkage void ret_from_sys_call(void);
@@ -362,10 +360,6 @@ setup_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs)
 	regs->r18 = (unsigned long) &frame->sc;	/* a2: sigcontext pointer */
 	wrusp((unsigned long) frame);
 	
-#if DEBUG_SIG
-	printk("SIG deliver (%s:%d): sp=%p pc=%p ra=%p\n",
-		current->comm, current->pid, frame, regs->pc, regs->r26);
-#endif
 	return 0;
 }
 
@@ -416,11 +410,6 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs)
 	regs->r18 = (unsigned long) &frame->uc;	  /* a2: ucontext pointer */
 	wrusp((unsigned long) frame);
 
-#if DEBUG_SIG
-	printk("SIG deliver (%s:%d): sp=%p pc=%p ra=%p\n",
-		current->comm, current->pid, frame, regs->pc, regs->r26);
-#endif
-
 	return 0;
 }
 
-- 
2.16.4

