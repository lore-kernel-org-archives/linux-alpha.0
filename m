From: Will Deacon <will@kernel.org>
Subject: [PATCH 08/13] locking/barriers: Remove definitions for [smp_]read_barrier_depends()
Date: Fri,  8 Nov 2019 17:01:15 +0000
Message-ID: <20191108170120.22331-9-will@kernel.org>
References: <20191108170120.22331-1-will@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573232517;
        bh=TGLqDVac68mvf/WbG83M5yme7mDwFa4WdUlKKdhy5x0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qlhI/we2Irq3NDViFLm9ozqF9YrV/0VR2W+CFGc0A8vNcDHROki/mpP89a/qG36+i
         IYQuiiidDWzlPxvhWUOgwDXqYXSPGXY6pTKSAuH8r6WkEVetuHuRrRNhrEEwMFxNcV
         Ri5A53vHOddu4c5TwrAqHa4LarO/cbe9jKi+rH4E=
In-Reply-To: <20191108170120.22331-1-will@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Will Deacon <will@kernel.org>, Yunjae Lee <lyj7694@gmail.com>, SeongJae Park <sj38.park@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Josh Triplett <josh@joshtriplett.org>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth@twiddle.net>, Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>, Boqun Feng <boqun.feng@gmail.com>, linux-alpha@vger.kernel.org, virtualization@lists.linux-foundation.org

There are no remaining users of '[smp_]read_barrier_depends()', so
remove it from the generic implementation of 'barrier.h'.

Signed-off-by: Will Deacon <will@kernel.org>
---
 include/asm-generic/barrier.h | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
index 85b28eb80b11..4b2a60f738b2 100644
--- a/include/asm-generic/barrier.h
+++ b/include/asm-generic/barrier.h
@@ -46,10 +46,6 @@
 #define dma_wmb()	wmb()
 #endif
 
-#ifndef read_barrier_depends
-#define read_barrier_depends()		do { } while (0)
-#endif
-
 #ifndef __smp_mb
 #define __smp_mb()	mb()
 #endif
@@ -62,10 +58,6 @@
 #define __smp_wmb()	wmb()
 #endif
 
-#ifndef __smp_read_barrier_depends
-#define __smp_read_barrier_depends()	read_barrier_depends()
-#endif
-
 #ifdef CONFIG_SMP
 
 #ifndef smp_mb
@@ -80,10 +72,6 @@
 #define smp_wmb()	__smp_wmb()
 #endif
 
-#ifndef smp_read_barrier_depends
-#define smp_read_barrier_depends()	__smp_read_barrier_depends()
-#endif
-
 #else	/* !CONFIG_SMP */
 
 #ifndef smp_mb
@@ -98,10 +86,6 @@
 #define smp_wmb()	barrier()
 #endif
 
-#ifndef smp_read_barrier_depends
-#define smp_read_barrier_depends()	do { } while (0)
-#endif
-
 #endif	/* CONFIG_SMP */
 
 #ifndef __smp_store_mb
@@ -196,7 +180,6 @@ do {									\
 #define virt_mb() __smp_mb()
 #define virt_rmb() __smp_rmb()
 #define virt_wmb() __smp_wmb()
-#define virt_read_barrier_depends() __smp_read_barrier_depends()
 #define virt_store_mb(var, value) __smp_store_mb(var, value)
 #define virt_mb__before_atomic() __smp_mb__before_atomic()
 #define virt_mb__after_atomic()	__smp_mb__after_atomic()
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

