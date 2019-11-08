From: Will Deacon <will@kernel.org>
Subject: [PATCH 11/13] powerpc: Remove comment about read_barrier_depends()
Date: Fri,  8 Nov 2019 17:01:18 +0000
Message-ID: <20191108170120.22331-12-will@kernel.org>
References: <20191108170120.22331-1-will@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573232527;
        bh=dnuSHKk7lBrxAxBfjV7hvEQGOx7aSEIznlzXJ2SQVLc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KSdT8i3QURvpf2I2Os8SAoKePQMYbKR4j1cF7TIeljKwh2dS3VmpPzQMQf8Ee0M6h
         cYe5VWTfoAz846+pZsLaxRL5m65SQtATx95g7vtc7Guxlc5mHWNFLLo++ZQjC1aF64
         yN901m+lZa15BCD6xtqKpgCKX99SZrfqbl7C8HJI=
In-Reply-To: <20191108170120.22331-1-will@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Will Deacon <will@kernel.org>, Yunjae Lee <lyj7694@gmail.com>, SeongJae Park <sj38.park@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Josh Triplett <josh@joshtriplett.org>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth@twiddle.net>, Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>, Boqun Feng <boqun.feng@gmail.com>, linux-alpha@vger.kernel.org, virtualization@lists.linux-foundation.org

'read_barrier_depends()' doesn't exist anymore so stop talking about it.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/powerpc/include/asm/barrier.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
index fbe8df433019..123adcefd40f 100644
--- a/arch/powerpc/include/asm/barrier.h
+++ b/arch/powerpc/include/asm/barrier.h
@@ -18,8 +18,6 @@
  * mb() prevents loads and stores being reordered across this point.
  * rmb() prevents loads being reordered across this point.
  * wmb() prevents stores being reordered across this point.
- * read_barrier_depends() prevents data-dependent loads being reordered
- *	across this point (nop on PPC).
  *
  * *mb() variants without smp_ prefix must order all types of memory
  * operations with one another. sync is the only instruction sufficient
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

