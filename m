From: Manik Raina <manik@cisco.com>
Subject: [PATCH]: 2.5.30 : __builtin_expect() cleanups in alpha code (rwsem.h)
Date: Mon, 5 Aug 2002 15:43:39 +0530 (IST)
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <Pine.GSO.4.44.0208051542170.21895-100000@cbin2-view1.cisco.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, torvalds@transmeta.com
Cc: linux-kernel@vger.kernel.org

Resending with diffs inline ... please apply ..
diffs are straightforward. Should patch with "patch -p1"



--- linux-2.5.30/include/asm-alpha/rwsem.h~	Fri Aug  2 02:46:35 2002
+++ linux-2.5.30/include/asm-alpha/rwsem.h	Mon Aug  5 15:34:59 2002
@@ -80,13 +80,13 @@
 	".subsection 2\n"
 	"2:	br	1b\n"
 	".previous"
 	:"=&r" (oldcount), "=m" (sem->count), "=&r" (temp)
 	:"Ir" (RWSEM_ACTIVE_READ_BIAS), "m" (sem->count) : "memory");
 #endif
-	if (__builtin_expect(oldcount < 0, 0))
+	if (unlikely(oldcount < 0))
 		rwsem_down_read_failed(sem);
 }

 static inline void __down_write(struct rw_semaphore *sem)
 {
 	long oldcount;
@@ -104,13 +104,13 @@
 	".subsection 2\n"
 	"2:	br	1b\n"
 	".previous"
 	:"=&r" (oldcount), "=m" (sem->count), "=&r" (temp)
 	:"Ir" (RWSEM_ACTIVE_WRITE_BIAS), "m" (sem->count) : "memory");
 #endif
-	if (__builtin_expect(oldcount, 0))
+	if (unlikely(oldcount))
 		rwsem_down_write_failed(sem);
 }

 static inline void __up_read(struct rw_semaphore *sem)
 {
 	long oldcount;
@@ -128,13 +128,13 @@
 	".subsection 2\n"
 	"2:	br	1b\n"
 	".previous"
 	:"=&r" (oldcount), "=m" (sem->count), "=&r" (temp)
 	:"Ir" (RWSEM_ACTIVE_READ_BIAS), "m" (sem->count) : "memory");
 #endif
-	if (__builtin_expect(oldcount < 0, 0))
+	if (unlikely(oldcount < 0))
 		if ((int)oldcount - RWSEM_ACTIVE_READ_BIAS == 0)
 			rwsem_wake(sem);
 }

 static inline void __up_write(struct rw_semaphore *sem)
 {
@@ -154,13 +154,13 @@
 	".subsection 2\n"
 	"2:	br	1b\n"
 	".previous"
 	:"=&r" (count), "=m" (sem->count), "=&r" (temp)
 	:"Ir" (RWSEM_ACTIVE_WRITE_BIAS), "m" (sem->count) : "memory");
 #endif
-	if (__builtin_expect(count, 0))
+	if (unlikely(count))
 		if ((int)count == 0)
 			rwsem_wake(sem);
 }

 static inline void rwsem_atomic_add(long val, struct rw_semaphore *sem)
 {

