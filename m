From: Kirill Tkhai <ktkhai@virtuozzo.com>
Subject: [PATCH 3/7] alpha: Add __down_read_killable()
Date: Mon, 19 Jun 2017 21:02:39 +0300
Message-ID: <149789535907.9059.6602375201918019383.stgit@localhost.localdomain>
References: <149789463636.9059.16943955939303454611.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NDDABxQyVRluyvhcNbYxOHQ3lWiIJOAmITXnYGp8EvQ=;
 b=K50g2BJPKl3xJDEEm2OKuQ9tVA31lE7V01JfY9L8ivyTXuUxwXW4PyP+bMXGI3TFjHAqELNsg2yzy96CMfLuQq+UeO31506nV9f7uDeFuVAMu9dICdmW37IlueqxbwpY8t9zbQYBnKnKDYGI3KAxfTEf8xiUPL6unpSyPbp9+qI=
In-Reply-To: <149789463636.9059.16943955939303454611.stgit@localhost.localdomain>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-ia64@vger.kernel.org, avagin@virtuozzo.com, peterz@infradead.org, heiko.carstens@de.ibm.com, hpa@zytor.com, gorcunov@virtuozzo.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, mingo@redhat.com, mattst88@gmail.com, fenghua.yu@intel.com, arnd@arndb.de, ktkhai@virtuozzo.com, ink@jurassic.park.msu.ru, tglx@linutronix.de, rth@twiddle.net, tony.luck@intel.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, schwidefsky@de.ibm.com, davem@davemloft.net

Similar to __down_write_killable(), and read killable primitive.

Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
---
 arch/alpha/include/asm/rwsem.h |   18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/rwsem.h b/arch/alpha/include/asm/rwsem.h
index 77873d0ad293..7118bd090085 100644
--- a/arch/alpha/include/asm/rwsem.h
+++ b/arch/alpha/include/asm/rwsem.h
@@ -21,7 +21,7 @@
 #define RWSEM_ACTIVE_READ_BIAS		RWSEM_ACTIVE_BIAS
 #define RWSEM_ACTIVE_WRITE_BIAS		(RWSEM_WAITING_BIAS + RWSEM_ACTIVE_BIAS)
 
-static inline void __down_read(struct rw_semaphore *sem)
+static inline int ___down_read(struct rw_semaphore *sem)
 {
 	long oldcount;
 #ifndef	CONFIG_SMP
@@ -41,10 +41,24 @@ static inline void __down_read(struct rw_semaphore *sem)
 	:"=&r" (oldcount), "=m" (sem->count), "=&r" (temp)
 	:"Ir" (RWSEM_ACTIVE_READ_BIAS), "m" (sem->count) : "memory");
 #endif
-	if (unlikely(oldcount < 0))
+	return (oldcount < 0);
+}
+
+static inline void __down_read(struct rw_semaphore *sem)
+{
+	if (unlikely(___down_read(sem)))
 		rwsem_down_read_failed(sem);
 }
 
+static inline int __down_read_killable(struct rw_semaphore *sem)
+{
+	if (unlikely(___down_read(sem)))
+		if (IS_ERR(rwsem_down_read_failed_killable(sem)))
+			return -EINTR;
+
+	return 0;
+}
+
 /*
  * trylock for reading -- returns 1 if successful, 0 if contention
  */

