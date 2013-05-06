From: Will Deacon <will.deacon@arm.com>
Subject: [PATCH] alpha: spinlock: don't perform memory access in locked critical section
Date: Mon,  6 May 2013 21:01:05 +0100
Message-ID: <1367870465-23948-1-git-send-email-will.deacon@arm.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

The Alpha Architecture Reference Manual states that any memory access
performed between an LD_xL and a STx_C instruction may cause the
store-conditional to fail unconditionally and, as such, `no useful
program should do this'.

Linux is a useful program, so fix up the Alpha spinlock implementation
to use logical operations rather than load-address instructions for
generating immediates.

Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Signed-off-by: Will Deacon <will.deacon@arm.com>
---
 arch/alpha/include/asm/spinlock.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/include/asm/spinlock.h b/arch/alpha/include/asm/spinlock.h
index 3bba21e..0c357cd 100644
--- a/arch/alpha/include/asm/spinlock.h
+++ b/arch/alpha/include/asm/spinlock.h
@@ -29,7 +29,7 @@ static inline void arch_spin_lock(arch_spinlock_t * lock)
 	__asm__ __volatile__(
 	"1:	ldl_l	%0,%1\n"
 	"	bne	%0,2f\n"
-	"	lda	%0,1\n"
+	"	mov	1,%0\n"
 	"	stl_c	%0,%1\n"
 	"	beq	%0,2f\n"
 	"	mb\n"
@@ -86,7 +86,7 @@ static inline void arch_write_lock(arch_rwlock_t *lock)
 	__asm__ __volatile__(
 	"1:	ldl_l	%1,%0\n"
 	"	bne	%1,6f\n"
-	"	lda	%1,1\n"
+	"	mov	1,%1\n"
 	"	stl_c	%1,%0\n"
 	"	beq	%1,6f\n"
 	"	mb\n"
@@ -106,7 +106,7 @@ static inline int arch_read_trylock(arch_rwlock_t * lock)
 
 	__asm__ __volatile__(
 	"1:	ldl_l	%1,%0\n"
-	"	lda	%2,0\n"
+	"	mov	0,%2\n"
 	"	blbs	%1,2f\n"
 	"	subl	%1,2,%2\n"
 	"	stl_c	%2,%0\n"
@@ -128,9 +128,9 @@ static inline int arch_write_trylock(arch_rwlock_t * lock)
 
 	__asm__ __volatile__(
 	"1:	ldl_l	%1,%0\n"
-	"	lda	%2,0\n"
+	"	mov	0,%2\n"
 	"	bne	%1,2f\n"
-	"	lda	%2,1\n"
+	"	mov	1,%2\n"
 	"	stl_c	%2,%0\n"
 	"	beq	%2,6f\n"
 	"2:	mb\n"
-- 
1.8.2.2

