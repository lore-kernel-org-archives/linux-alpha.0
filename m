From: Will Deacon <will@kernel.org>
Subject: [PATCH 06/13] READ_ONCE: Remove smp_read_barrier_depends() invocation
Date: Fri,  8 Nov 2019 17:01:13 +0000
Message-ID: <20191108170120.22331-7-will@kernel.org>
References: <20191108170120.22331-1-will@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573232509;
        bh=QmHkYOpw1KGgzE2tChTjH11DwvScC47O6EYYkdjmNZY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oiUzlVfUY9/EMo4arLdR3YvvgWtVrcBioNWxyo4tDqVikPDfd/hMfuNPavpmeFf5b
         fiotcwLuwgXiNdGNjLCGDs4cH4YGNrU4D2GdrgLklRE5kQEyEWDKv6ShvlqifQtJp8
         C/qEBtT80YOw5LyKOpZZ03WsFbgZ4XIOvxTT9/+E=
In-Reply-To: <20191108170120.22331-1-will@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Will Deacon <will@kernel.org>, Yunjae Lee <lyj7694@gmail.com>, SeongJae Park <sj38.park@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Josh Triplett <josh@joshtriplett.org>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth@twiddle.net>, Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>, Boqun Feng <boqun.feng@gmail.com>, linux-alpha@vger.kernel.org, virtualization@lists.linux-foundation.org

Alpha overrides '__read_once_size_n()' directly, so there's no need to
use 'smp_read_barrier_depends()' in the core code.

Signed-off-by: Will Deacon <will@kernel.org>
---
 include/asm-generic/rwonce.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
index 2c2ac0948c94..2e3289268a89 100644
--- a/include/asm-generic/rwonce.h
+++ b/include/asm-generic/rwonce.h
@@ -102,7 +102,6 @@ static __always_inline void __write_once_size(volatile void *p, void *res, int s
 		__read_once_size(&(x), __u.__c, sizeof(x));		\
 	else								\
 		__read_once_size_nocheck(&(x), __u.__c, sizeof(x));	\
-	smp_read_barrier_depends(); /* Enforce dependency ordering from x */ \
 	__u.__val;							\
 })
 #define READ_ONCE(x) __READ_ONCE(x, 1)
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

