From: Uros Bizjak <ubizjak@gmail.com>
Subject: [PATCH 08/10] locking/generic: Wire up local{,64}_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:26 +0100
Message-ID: <20230305205628.27385-9-ubizjak@gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXoBl7+op9aWSq5Dkg0e/fVhHu4Qq2D4107mPK7NLLs=;
        b=NXbVUoifiR5f9wJbmip3eWTWXYXEwmyaIdEBNnfCyRdyAk7zaaXRY0sYnfJRGWuLAS
         g8x59fLsFLmo5M3Ik3s/tk1KKBZCczl1Fgw42WTZOWS04DzPYnwi4w55o7h+c+eVefjA
         yGaHfjFFSAxNqbiQZpqt3i+u6y2V2BkU7O67/5ecoxTFpwzclUj8SQCgKdL2w7dE53dA
         5xMBuutmSq1NOS9h1Fdt7g9A/4eDJZHogsS6RiAAuXcSEX6dnzhJIQ7F1HTmc/YOQoP6
         jsa1rwU2ODNFy+VyW2rjw0v/ilyUvuIGQPs1yrtAiQeKZDT2jOBr7m4vLNyVajzwbMKC
         dB9A==
In-Reply-To: <20230305205628.27385-1-ubizjak@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Arnd Bergmann <arnd@arndb.de>

Implement generic support for local{,64}_try_cmpxchg.

Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 include/asm-generic/local.h   | 1 +
 include/asm-generic/local64.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/asm-generic/local.h b/include/asm-generic/local.h
index fca7f1d84818..7f97018df66f 100644
--- a/include/asm-generic/local.h
+++ b/include/asm-generic/local.h
@@ -42,6 +42,7 @@ typedef struct
 #define local_inc_return(l) atomic_long_inc_return(&(l)->a)
 
 #define local_cmpxchg(l, o, n) atomic_long_cmpxchg((&(l)->a), (o), (n))
+#define local_try_cmpxchg(l, po, n) atomic_long_try_cmpxchg((&(l)->a), (po), (n))
 #define local_xchg(l, n) atomic_long_xchg((&(l)->a), (n))
 #define local_add_unless(l, _a, u) atomic_long_add_unless((&(l)->a), (_a), (u))
 #define local_inc_not_zero(l) atomic_long_inc_not_zero(&(l)->a)
diff --git a/include/asm-generic/local64.h b/include/asm-generic/local64.h
index 765be0b7d883..54b91e93ae76 100644
--- a/include/asm-generic/local64.h
+++ b/include/asm-generic/local64.h
@@ -43,6 +43,7 @@ typedef struct {
 #define local64_inc_return(l)	local_inc_return(&(l)->a)
 
 #define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
+#define local64_try_cmpxchg(l, po, n) local_try_cmpxchg((&(l)->a), (po), (n))
 #define local64_xchg(l, n)	local_xchg((&(l)->a), (n))
 #define local64_add_unless(l, _a, u) local_add_unless((&(l)->a), (_a), (u))
 #define local64_inc_not_zero(l)	local_inc_not_zero(&(l)->a)
@@ -81,6 +82,7 @@ typedef struct {
 #define local64_inc_return(l)	atomic64_inc_return(&(l)->a)
 
 #define local64_cmpxchg(l, o, n) atomic64_cmpxchg((&(l)->a), (o), (n))
+#define local64_try_cmpxchg(l, po, n) atomic64_try_cmpxchg((&(l)->a), (po), (n))
 #define local64_xchg(l, n)	atomic64_xchg((&(l)->a), (n))
 #define local64_add_unless(l, _a, u) atomic64_add_unless((&(l)->a), (_a), (u))
 #define local64_inc_not_zero(l)	atomic64_inc_not_zero(&(l)->a)
-- 
2.39.2

