From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: select CONFIG_ARCH_USE_CMPXCHG_LOCKREF.
Date: Tue,  4 Aug 2015 14:35:05 -0700
Message-ID: <1438724105-26892-1-git-send-email-mattst88@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=m/Qcjot9Ya25+DZ3+syobu3uyElT9ztD6F2Gaj0IbeE=;
        b=rACuJyS7zTLDxTd93H2LA7sHV0de4kq7S52SNFbb+7pJk880eqIDsWXLZBdfKqlSgt
         YsX4qs4dJMUOf3Txc6qQJowEXj+2o56IeE960TBH6Dha5FVSkrl8UHOcHl8OP7I75ul2
         K0jNSLtE7ii2eHYL7NCmelnnzTgySyyZkTn4cEBKjYs9dV8OHsOzXuSybCX2Fx4a/RdA
         pvok88uUucFD9YYhGLz1/k9NGhHs/Kz7mIUloY6OnSlNvX+UPErhtJMnerKfKYeeI4DF
         GDVc4Zac5BgzmqeiW7oyTcXWxi1eM784Y1LwTpeLT5Cvawi/4Zd4JRP1yGZKWICJO4QJ
         nJPQ==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

On Alpha we have spinlocks that are 32b in size and an efficient
cmpxchg64 implementation, so we qualify to make use of cmpxchg backed
lockrefs. Select the ARCH_USE_CMPXCHG_LOCKREF Kconfig symbol and provide
a trivial implementation of arch_spin_value_unlocked to satisfy the
lockref code.

Using Linus' simple testcase from
http://article.gmane.org/gmane.linux.file-systems/77466 on a dual CPU
ES47 system I see around an 8% gain:

    N       Min       Max    Median       Avg      Stddev
x  30   6194580   6295654   6272504   6272514   17694.232
+  30   6731164   6786334   6767982   6764274   13738.863
Difference at 95.0% confidence
        491760 +/- 8188.17
        7.83992% +/- 0.130541%
        (Student's t, pooled s = 15840.5)

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig                | 1 +
 arch/alpha/include/asm/spinlock.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index bf9e9d3..f515a4d 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -3,6 +3,7 @@ config ALPHA
 	default y
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
+	select ARCH_USE_CMPXCHG_LOCKREF
 	select HAVE_AOUT
 	select HAVE_IDE
 	select HAVE_OPROFILE
diff --git a/arch/alpha/include/asm/spinlock.h b/arch/alpha/include/asm/spinlock.h
index 37b570d..fed9c6f 100644
--- a/arch/alpha/include/asm/spinlock.h
+++ b/arch/alpha/include/asm/spinlock.h
@@ -16,6 +16,11 @@
 #define arch_spin_unlock_wait(x) \
 		do { cpu_relax(); } while ((x)->lock)
 
+static inline int arch_spin_value_unlocked(arch_spinlock_t lock)
+{
+        return lock.lock == 0;
+}
+
 static inline void arch_spin_unlock(arch_spinlock_t * lock)
 {
 	mb();
-- 
2.3.6

