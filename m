From: Will Deacon <will@kernel.org>
Subject: [PATCH 03/13] READ_ONCE: Allow __READ_ONCE_SIZE cases to be overridden by the architecture
Date: Fri,  8 Nov 2019 17:01:10 +0000
Message-ID: <20191108170120.22331-4-will@kernel.org>
References: <20191108170120.22331-1-will@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573232499;
        bh=kzlgTQkG1R1MYvXiLB+EEi+LR7BxeVnjf/aJMUBqADw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VviKsmgq2Tt9rr+MDGQITpsAKGIPvYSnn9a1+KfqrGSBXH1Uj7H7EVsR3P9RoFLRH
         9VjGBZorIo9ijF2ERfJULRCDiDnSR39b39roKT4YooZqYfrBhM7dQWWId5lFyMSnod
         +RnYKmJxOvs9aNXG866OWneGK5uStUPHhLMIHYaQ=
In-Reply-To: <20191108170120.22331-1-will@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Will Deacon <will@kernel.org>, Yunjae Lee <lyj7694@gmail.com>, SeongJae Park <sj38.park@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Josh Triplett <josh@joshtriplett.org>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth@twiddle.net>, Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>, Boqun Feng <boqun.feng@gmail.com>, linux-alpha@vger.kernel.org, virtualization@lists.linux-foundation.org

The meat and potatoes of 'READ_ONCE()' is defined by the
'__READ_ONCE_SIZE()' macro, which uses volatile casts in an attempt to
avoid tearing of byte, halfword, word and double-word accesses. Allow
this to be overridden by the architecture code in the case that things
like memory barriers are also required.

Signed-off-by: Will Deacon <will@kernel.org>
---
 include/asm-generic/rwonce.h | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
index abf326634ecd..2c2ac0948c94 100644
--- a/include/asm-generic/rwonce.h
+++ b/include/asm-generic/rwonce.h
@@ -33,13 +33,29 @@
 
 #include <asm/barrier.h>
 
+#ifndef __read_once_size_1
+#define __read_once_size_1(p)	(*(volatile __u8 *)(p))
+#endif
+
+#ifndef __read_once_size_2
+#define __read_once_size_2(p)	(*(volatile __u16 *)(p))
+#endif
+
+#ifndef __read_once_size_4
+#define __read_once_size_4(p)	(*(volatile __u32 *)(p))
+#endif
+
+#ifndef __read_once_size_8
+#define __read_once_size_8(p)	(*(volatile __u64 *)(p))
+#endif
+
 #define __READ_ONCE_SIZE						\
 ({									\
 	switch (size) {							\
-	case 1: *(__u8 *)res = *(volatile __u8 *)p; break;		\
-	case 2: *(__u16 *)res = *(volatile __u16 *)p; break;		\
-	case 4: *(__u32 *)res = *(volatile __u32 *)p; break;		\
-	case 8: *(__u64 *)res = *(volatile __u64 *)p; break;		\
+	case 1: *(__u8 *)res = __read_once_size_1(p); break;		\
+	case 2: *(__u16 *)res = __read_once_size_2(p); break;		\
+	case 4: *(__u32 *)res = __read_once_size_4(p); break;		\
+	case 8: *(__u64 *)res = __read_once_size_8(p); break;		\
 	default:							\
 		barrier();						\
 		__builtin_memcpy((void *)res, (const void *)p, size);	\
@@ -59,6 +75,10 @@ void __read_once_size_nocheck(const volatile void *p, void *res, int size)
 	__READ_ONCE_SIZE;
 }
 
+#undef __read_once_size_1
+#undef __read_once_size_2
+#undef __read_once_size_4
+#undef __read_once_size_8
 #undef __READ_ONCE_SIZE
 
 static __always_inline void __write_once_size(volatile void *p, void *res, int size)
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

