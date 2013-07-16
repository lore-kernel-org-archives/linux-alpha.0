From: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 4/7] alpha: Improve atomic_add_unless
Date: Tue, 16 Jul 2013 10:04:37 -0700
Message-ID: <1373994280-12047-5-git-send-email-rth@twiddle.net>
References: <1373994280-12047-1-git-send-email-rth@twiddle.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=Qk/CchhZjHXeXRNMSNHmkbR/qe7CpXkMt0RKgvp9KjY=;
        b=ke/5p4LPiMac+WpWN3B915fIj3a9vh2R+BbchPeqIj/re7HI41mkSl9k8//6Xr+AQs
         14dqagGCI716UHhJhsfxIu5nqYWxSuGRdtU+IpV+k1sEEDcFRd+/6LoS96wi51gRZc/X
         2jMNuAP6Durw2sTLAuJhSgqdUxKIxHMhrnnob5mU2FE5AIjo3L/VunubmjKxEeuWLt4o
         rE597cwWZjlbivfsDxOY6ue09ZtpL1rL9xsnPCVu9/99HBuCPBkApWLYiMp3guAfFZRz
         QoTeH1HS6p3qOMQkBVLuC15I1Qk1Umm1wP1VIF9vyP6EFDoER8ucTMZHNv7JajPHkNQh
         1+NA==
In-Reply-To: <1373994280-12047-1-git-send-email-rth@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

Use ll/sc loops instead of C loops around cmpxchg.
Update the atomic64_add_unless block comment to match the code.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/alpha/include/asm/atomic.h | 60 +++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 23 deletions(-)

diff --git a/arch/alpha/include/asm/atomic.h b/arch/alpha/include/asm/atomic.h
index c2cbe4f..0dc18fc 100644
--- a/arch/alpha/include/asm/atomic.h
+++ b/arch/alpha/include/asm/atomic.h
@@ -186,17 +186,24 @@ static __inline__ long atomic64_sub_return(long i, atomic64_t * v)
  */
 static __inline__ int __atomic_add_unless(atomic_t *v, int a, int u)
 {
-	int c, old;
-	c = atomic_read(v);
-	for (;;) {
-		if (unlikely(c == (u)))
-			break;
-		old = atomic_cmpxchg((v), c, c + (a));
-		if (likely(old == c))
-			break;
-		c = old;
-	}
-	return c;
+	int c, new, old;
+	smp_mb();
+	__asm__ __volatile__(
+	"1:	ldl_l	%[old],%[mem]\n"
+	"	cmpeq	%[old],%[u],%[c]\n"
+	"	addl	%[old],%[a],%[new]\n"
+	"	bne	%[c],2f\n"
+	"	stl_c	%[new],%[mem]\n"
+	"	beq	%[new],3f\n"
+	"2:\n"
+	".subsection 2\n"
+	"3:	br	1b\n"
+	".previous"
+	: [old] "=&r"(old), [new] "=&r"(new), [c] "=&r"(c)
+	: [mem] "m"(*v), [a] "rI"(a), [u] "rI"((long)u)
+	: "memory");
+	smp_mb();
+	return old;
 }
 
 
@@ -207,21 +214,28 @@ static __inline__ int __atomic_add_unless(atomic_t *v, int a, int u)
  * @u: ...unless v is equal to u.
  *
  * Atomically adds @a to @v, so long as it was not @u.
- * Returns the old value of @v.
+ * Returns true iff @v was not @u.
  */
 static __inline__ int atomic64_add_unless(atomic64_t *v, long a, long u)
 {
-	long c, old;
-	c = atomic64_read(v);
-	for (;;) {
-		if (unlikely(c == (u)))
-			break;
-		old = atomic64_cmpxchg((v), c, c + (a));
-		if (likely(old == c))
-			break;
-		c = old;
-	}
-	return c != (u);
+	long c, tmp;
+	smp_mb();
+	__asm__ __volatile__(
+	"1:	ldq_l	%[tmp],%[mem]\n"
+	"	cmpeq	%[tmp],%[u],%[c]\n"
+	"	addq	%[tmp],%[a],%[tmp]\n"
+	"	bne	%[c],2f\n"
+	"	stq_c	%[tmp],%[mem]\n"
+	"	beq	%[tmp],3f\n"
+	"2:\n"
+	".subsection 2\n"
+	"3:	br	1b\n"
+	".previous"
+	: [tmp] "=&r"(tmp), [c] "=&r"(c)
+	: [mem] "m"(*v), [a] "rI"(a), [u] "rI"(u)
+	: "memory");
+	smp_mb();
+	return !c;
 }
 
 #define atomic64_inc_not_zero(v) atomic64_add_unless((v), 1, 0)
-- 
1.8.1.4
