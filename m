From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 1/9] alpha: Replace deprecated spinlock initialization
Date: Sun, 23 Jan 2011 15:16:52 -0000
Message-ID: <20110123143836.940494132@linutronix.de>
References: <20110123143631.392446736@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline;
	filename=alpha-replace-deprecated-spinlock-initialization.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org

SPIN_LOCK_UNLOCK is deprecated. Use the lockdep capable variant
instead.

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


