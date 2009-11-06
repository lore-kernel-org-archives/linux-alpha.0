From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 11/16] alpha: Replace old style lock initializer
Date: Fri, 06 Nov 2009 22:41:56 -0000
Message-ID: <20091106223806.852003848@linutronix.de>
References: <20091106223547.784916750@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-replace-old-style-lock-init.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org

SPIN_LOCK_UNLOCKED is deprecated. Use __SPIN_LOCK_UNLOCKED instead.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Richard Henderson <rth@twiddle.net>
Cc: linux-alpha@vger.kernel.org
---
 arch/alpha/include/asm/rwsem.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6/arch/alpha/include/asm/rwsem.h
===================================================================
--- linux-2.6.orig/arch/alpha/include/asm/rwsem.h
+++ linux-2.6/arch/alpha/include/asm/rwsem.h
@@ -39,7 +39,7 @@ struct rw_semaphore {
 };
 
 #define __RWSEM_INITIALIZER(name) \
-	{ RWSEM_UNLOCKED_VALUE, SPIN_LOCK_UNLOCKED, \
+	{ RWSEM_UNLOCKED_VALUE, __SPIN_LOCK_UNLOCKED((name).wait_lock),	\
 	LIST_HEAD_INIT((name).wait_list) }
 
 #define DECLARE_RWSEM(name) \


