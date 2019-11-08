From: Will Deacon <will@kernel.org>
Subject: [PATCH 02/13] READ_ONCE: Undefine internal __READ_ONCE_SIZE macro after use
Date: Fri,  8 Nov 2019 17:01:09 +0000
Message-ID: <20191108170120.22331-3-will@kernel.org>
References: <20191108170120.22331-1-will@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573232495;
        bh=8576erlpBEecdBZLwaAf1hANQyRlAVg5w9VzhgYn1N4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mQPLKMFTmKtUZrfE3t7fIwnKcTB8Q4GrSwDBG6Plp2pjYB/4SEURJMylIYjxap80C
         9jQhqVE8V7fknpdFh1PU4i5Wri22OGwEnaDY7uqEqHlzbj3LH2qi1A5wN473to2iaS
         xhDH1bVxYwWCkKi2t5TgPxVPltHPTMheMiRG/sTQ=
In-Reply-To: <20191108170120.22331-1-will@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Will Deacon <will@kernel.org>, Yunjae Lee <lyj7694@gmail.com>, SeongJae Park <sj38.park@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Josh Triplett <josh@joshtriplett.org>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth@twiddle.net>, Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>, Boqun Feng <boqun.feng@gmail.com>, linux-alpha@vger.kernel.org, virtualization@lists.linux-foundation.org

The '__READ_ONCE_SIZE()' macro is only used as part of building
'READ_ONCE()', so undefine it once we don't need it anymore.

Signed-off-by: Will Deacon <will@kernel.org>
---
 include/asm-generic/rwonce.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
index d189455ae038..abf326634ecd 100644
--- a/include/asm-generic/rwonce.h
+++ b/include/asm-generic/rwonce.h
@@ -59,6 +59,8 @@ void __read_once_size_nocheck(const volatile void *p, void *res, int size)
 	__READ_ONCE_SIZE;
 }
 
+#undef __READ_ONCE_SIZE
+
 static __always_inline void __write_once_size(volatile void *p, void *res, int size)
 {
 	switch (size) {
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

