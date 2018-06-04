From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1.5/5] alpha: atomic: provide asm for the fastpath for
 _atomic_dec_and_lock_irqsave
Date: Mon, 4 Jun 2018 12:27:57 +0200
Message-ID: <20180604102757.h46feymcfdydl4nz@linutronix.de>
References: <20180504154533.8833-1-bigeasy@linutronix.de>
 <20180504154533.8833-2-bigeasy@linutronix.de>
 <20180604102559.2ynbassthjzva62l@linutronix.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180604102559.2ynbassthjzva62l@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Anna-Maria Gleixner <anna-maria@linutronix.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

I just looked at Alpha's atomic_dec_and_lock assembly and did something
that should work for atomic_dec_and_lock_irqsave. I think it works but I
would prefer for someone from the Alpha-Camp to ack this before it goes
in. It is not critical because the non-optimized version should work.

Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/alpha/lib/dec_and_lock.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/arch/alpha/lib/dec_and_lock.c b/arch/alpha/lib/dec_and_lock.c
index 069fef7372dc..d29ba1de4f68 100644
--- a/arch/alpha/lib/dec_and_lock.c
+++ b/arch/alpha/lib/dec_and_lock.c
@@ -32,6 +32,28 @@ _atomic_dec_and_lock:				\n\
 	.previous				\n\
 	.end _atomic_dec_and_lock");
 
+  asm (".text					\n\
+	.global _atomic_dec_and_lock_irqsave	\n\
+	.ent _atomic_dec_and_lock_irqsave	\n\
+	.align	4				\n\
+_atomic_dec_and_lock_irqsave:			\n\
+	.prologue 0				\n\
+1:	ldl_l	$1, 0($16)			\n\
+	subl	$1, 1, $1			\n\
+	beq	$1, 2f				\n\
+	stl_c	$1, 0($16)			\n\
+	beq	$1, 4f				\n\
+	mb					\n\
+	clr	$0				\n\
+	ret					\n\
+2:	br	$29, 3f				\n\
+3:	ldgp	$29, 0($29)			\n\
+	br	$atomic_dec_and_lock_irqsave1..ng	\n\
+	.subsection 2				\n\
+4:	br	1b				\n\
+	.previous				\n\
+	.end _atomic_dec_and_lock_irqsave");
+
 static int __used atomic_dec_and_lock_1(atomic_t *atomic, spinlock_t *lock)
 {
 	/* Slow path */
@@ -43,14 +65,11 @@ static int __used atomic_dec_and_lock_1(atomic_t *atomic, spinlock_t *lock)
 }
 EXPORT_SYMBOL(_atomic_dec_and_lock);
 
-int _atomic_dec_and_lock_irqsave(atomic_t *atomic, spinlock_t *lock,
-				 unsigned long *flags)
+static int __used atomic_dec_and_lock_irqsave1(atomic_t *atomic,
+					       spinlock_t *lock,
+					       unsigned long *flags)
 {
-	/* Subtract 1 from counter unless that drops it to 0 (ie. it was 1) */
-	if (atomic_add_unless(atomic, -1, 1))
-		return 0;
-
-	/* Otherwise do it the slow way */
+	/* Slow way */
 	spin_lock_irqsave(lock, *flags);
 	if (atomic_dec_and_test(atomic))
 		return 1;
-- 
2.17.1

